import { useCallback, useEffect, useRef, useState } from 'react';
import { supabase, STORAGE_BUCKET } from '../lib/supabase';

export interface PolaroidImage {
  id: number;
  imageUrl: string;
  caption: string | null;
  photoDate: string | null;
}

const MAX_TO_CACHE = 100;

// Module-level state to persist across component re-renders
let availableIds: number[] = [];
let usedIds = new Set<number>();
let idsLoaded = false;
let loadPromise: Promise<void> | null = null;

async function loadAvailableIds(): Promise<void> {
  if (!supabase) return;
  if (idsLoaded) return;
  if (loadPromise) return loadPromise;

  loadPromise = (async () => {
    const { data, error } = await supabase
      .from('polaroids')
      .select('id')
      .limit(MAX_TO_CACHE);

    if (!error && data) {
      availableIds = data.map(row => row.id);
      idsLoaded = true;
    }
  })();

  return loadPromise;
}

function pickRandomId(): number | null {
  const unused = availableIds.filter(id => !usedIds.has(id));

  if (unused.length === 0) {
    usedIds.clear();
    if (availableIds.length === 0) return null;
    const id = availableIds[Math.floor(Math.random() * availableIds.length)];
    usedIds.add(id);
    return id;
  }

  const id = unused[Math.floor(Math.random() * unused.length)];
  usedIds.add(id);
  return id;
}

async function fetchPolaroidById(id: number): Promise<PolaroidImage | null> {
  if (!supabase) return null;

  const { data, error } = await supabase
    .from('polaroids')
    .select('*')
    .eq('id', id)
    .single();

  if (error || !data) return null;

  const { data: urlData } = supabase.storage
    .from(STORAGE_BUCKET)
    .getPublicUrl(data.image_path);

  return {
    id: data.id,
    imageUrl: urlData.publicUrl,
    caption: data.caption,
    photoDate: data.photo_date,
  };
}

export function usePolaroidImages() {
  const [isReady, setIsReady] = useState(idsLoaded);
  const [hasImages, setHasImages] = useState(availableIds.length > 0);

  useEffect(() => {
    if (!supabase) {
      setIsReady(true);
      return;
    }

    loadAvailableIds().then(() => {
      setIsReady(true);
      setHasImages(availableIds.length > 0);
    });
  }, []);

  const getRandomImage = useCallback(async (): Promise<PolaroidImage | null> => {
    if (!supabase || !isReady) return null;

    const id = pickRandomId();
    if (id === null) return null;

    return fetchPolaroidById(id);
  }, [isReady]);

  return {
    isReady,
    hasImages,
    getRandomImage,
  };
}

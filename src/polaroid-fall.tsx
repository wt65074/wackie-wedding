import React, { useState, useCallback, useEffect, useRef } from 'react';

interface SwayResult {
  x: number;
  rotation: number;
}

interface PolaroidData {
  id: number;
  image: string;
  startX: number;
  startY: number;
  finalX: number;
  finalY: number;
  finalRotation: number;
  initialRotateX: number;
  initialRotateY: number;
  initialRotateZ: number;
  windOffset: number;
  duration: number;
  createdAt: number;
  decayTime: number;
  fadeDuration: number;
}

interface PolaroidProps extends PolaroidData {
  onFadeComplete: (id: number) => void;
}

// Generate colorful abstract SVG patterns as data URIs
function generateRandomImage(): string {
  const colors: string[][] = [
    ['#FF6B6B', '#4ECDC4', '#45B7D1'],
    ['#96CEB4', '#FFEAA7', '#DDA0DD'],
    ['#6C5CE7', '#A29BFE', '#FD79A8'],
    ['#00B894', '#00CEC9', '#81ECEC'],
    ['#E17055', '#FDCB6E', '#F8B500'],
    ['#2D3436', '#636E72', '#B2BEC3'],
    ['#D63031', '#E84393', '#FD79A8'],
    ['#0984E3', '#74B9FF', '#A29BFE'],
  ];

  const palette = colors[Math.floor(Math.random() * colors.length)];
  const shapes: string[] = [];

  // Add random circles and rectangles
  for (let i = 0; i < 5; i++) {
    const color = palette[Math.floor(Math.random() * palette.length)];
    const opacity = 0.6 + Math.random() * 0.4;

    if (Math.random() > 0.5) {
      const cx = Math.random() * 300;
      const cy = Math.random() * 300;
      const r = 30 + Math.random() * 80;
      shapes.push(`<circle cx="${cx}" cy="${cy}" r="${r}" fill="${color}" opacity="${opacity}"/>`);
    } else {
      const x = Math.random() * 200;
      const y = Math.random() * 200;
      const w = 50 + Math.random() * 100;
      const h = 50 + Math.random() * 100;
      const rotate = Math.random() * 360;
      shapes.push(`<rect x="${x}" y="${y}" width="${w}" height="${h}" fill="${color}" opacity="${opacity}" transform="rotate(${rotate} ${x + w/2} ${y + h/2})"/>`);
    }
  }

  const svg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 300">
    <rect width="300" height="300" fill="${palette[0]}22"/>
    ${shapes.join('')}
  </svg>`;

  return `data:image/svg+xml,${encodeURIComponent(svg)}`;
}

// Gaussian random using Box-Muller transform
function gaussianRandom(mean: number, stdDev: number): number {
  const u1 = Math.random();
  const u2 = Math.random();
  const z = Math.sqrt(-2 * Math.log(u1)) * Math.cos(2 * Math.PI * u2);
  return mean + z * stdDev;
}

export default function PolaroidFall(): React.ReactElement {
  const [polaroids, setPolaroids] = useState<PolaroidData[]>([]);
  const [, setNextId] = useState<number>(0);
  const nextIdRef = useRef<number>(0);

  const addPolaroid = useCallback((clickX: number, clickY: number): void => {
    const viewportWidth = window.innerWidth;
    const viewportHeight = window.innerHeight;

    const randomImage = generateRandomImage();

    // Landing position - use rejection sampling to reduce center probability
    const viewportCenterX = viewportWidth / 2;
    const viewportCenterY = viewportHeight / 2;
    const centerAvoidanceRadius = 250; // area to probabilistically avoid

    // Try to find a landing spot, with probability decreasing near center
    let finalX: number;
    let finalY: number;
    let attempts = 0;
    const maxAttempts = 10;

    do {
      // Generate candidate position with gaussian distribution around click
      const spread = 120;
      finalX = gaussianRandom(clickX, spread) - 72;
      finalY = gaussianRandom(clickY, spread) - 90;

      // Calculate distance from center
      const distFromCenterX = finalX + 72 - viewportCenterX;
      const distFromCenterY = finalY + 90 - viewportCenterY;
      const distFromCenter = Math.sqrt(distFromCenterX * distFromCenterX + distFromCenterY * distFromCenterY);

      // Probability of accepting this position increases with distance from center
      // At center: ~10% chance, at edge of avoidance zone: ~90% chance, beyond: 100%
      const acceptProbability = distFromCenter >= centerAvoidanceRadius
        ? 1
        : 0.1 + 0.8 * (distFromCenter / centerAvoidanceRadius);

      if (Math.random() < acceptProbability) {
        break;
      }

      attempts++;
    } while (attempts < maxAttempts);

    // Clamp to keep polaroids on screen
    finalX = Math.max(20, Math.min(viewportWidth - 164, finalX));
    finalY = Math.max(20, Math.min(viewportHeight - 200, finalY));

    const finalRotation = (Math.random() - 0.5) * 30;

    // Center on click - offset by half the polaroid size (144px wide, ~180px tall)
    // Also account for initial scale of 2.2
    const polaroidWidth = 144;
    const polaroidHeight = 180;
    const initialScale = 2.2;
    const startX = clickX - (polaroidWidth * initialScale) / 2;
    const startY = clickY - (polaroidHeight * initialScale) / 2;

    // Random initial rotations for more organic entry
    const initialRotateX = -15 - Math.random() * 15; // -15 to -30
    const initialRotateY = (Math.random() - 0.5) * 40; // -20 to 20
    const initialRotateZ = (Math.random() - 0.5) * 50; // -25 to 25

    // Wind drift - random horizontal sway
    const windOffset = (Math.random() - 0.5) * 100;

    // Decay time - gaussian around 10 seconds, plus 2 second fade
    const decayTime = gaussianRandom(10000, 2000);
    const fadeDuration = 2000;

    const currentId = nextIdRef.current;
    nextIdRef.current += 1;

    const newPolaroid: PolaroidData = {
      id: currentId,
      image: randomImage,
      startX,
      startY,
      finalX,
      finalY,
      finalRotation,
      initialRotateX,
      initialRotateY,
      initialRotateZ,
      windOffset,
      duration: 1300 + Math.random() * 300,
      createdAt: Date.now(),
      decayTime,
      fadeDuration,
    };

    setPolaroids(prev => [...prev, newPolaroid]);
    setNextId(currentId + 1);
  }, []);

  const handleClick = useCallback((e: React.MouseEvent<HTMLDivElement>): void => {
    addPolaroid(e.clientX, e.clientY);
  }, [addPolaroid]);

  // Auto-drop polaroids every 10 seconds
  useEffect(() => {
    const interval = setInterval(() => {
      const viewportWidth = window.innerWidth;
      const viewportHeight = window.innerHeight;
      const randomX = Math.random() * viewportWidth;
      const randomY = Math.random() * viewportHeight;
      addPolaroid(randomX, randomY);
    }, 5000);

    return () => clearInterval(interval);
  }, [addPolaroid]);

  // Remove polaroid when it finishes fading
  const removePolaroid = useCallback((id: number): void => {
    setPolaroids(prev => prev.filter(p => p.id !== id));
  }, []);

  return (
    <div
      onClick={handleClick}
      style={{
        width: '100vw',
        height: '100vh',
        background: '#FAF9F7',
        overflow: 'hidden',
        cursor: 'pointer',
        position: 'relative',
      }}
    >
      <div style={{
        position: 'absolute',
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        textAlign: 'center',
        color: '#E8A87C',
        pointerEvents: 'none',
        zIndex: 0,
      }}>
        <p style={{
          fontSize: '6rem',
          fontFamily: '"Fraunces", Georgia, serif',
          fontWeight: 400,
          margin: 0,
          whiteSpace: 'nowrap',
          //textShadow: '0 1px 1px rgba(255,255,255,0.5), 0 -1px 1px rgba(0,0,0,0.08)',
        }}>
          Coming Soon
        </p>
      </div>

      {polaroids.map((polaroid) => (
        <Polaroid key={polaroid.id} {...polaroid} onFadeComplete={removePolaroid} />
      ))}
    </div>
  );
}

// Gentle easing - slower start and end, like floating
function easeInOutSine(t: number): number {
  return -(Math.cos(Math.PI * t) - 1) / 2;
}

// For the swaying motion - uses seeded randomness for organic movement
function createSwayFunction(seed: number): (t: number) => SwayResult {
  // Create pseudo-random offsets for this polaroid
  const offsets: number[] = [
    (seed * 7.13) % (Math.PI * 2),
    (seed * 11.47) % (Math.PI * 2),
    (seed * 5.89) % (Math.PI * 2),
  ];

  return (t: number): SwayResult => {
    // Gentle sine waves for floating feel
    const x = Math.sin(t * 1.2 + offsets[0]) * 18 +
              Math.sin(t * 0.7 + offsets[1]) * 12;

    const rotation = Math.sin(t * 0.9 + offsets[2]) * 7;

    return { x, rotation };
  };
}

function Polaroid({
  image,
  startX,
  startY,
  finalX,
  finalY,
  finalRotation,
  initialRotateX,
  initialRotateY,
  initialRotateZ,
  windOffset,
  duration,
  id,
  createdAt,
  decayTime,
  fadeDuration,
  onFadeComplete
}: PolaroidProps): React.ReactElement {
  const rafRef = useRef<number | null>(null);
  const swayFn = useRef<(t: number) => SwayResult>(createSwayFunction(id));
  const hasCalledFadeComplete = useRef<boolean>(false);
  const onFadeCompleteRef = useRef<(id: number) => void>(onFadeComplete);
  const elementRef = useRef<HTMLDivElement | null>(null);

  // Keep callback ref updated
  useEffect(() => {
    onFadeCompleteRef.current = onFadeComplete;
  }, [onFadeComplete]);

  useEffect(() => {
    const animationStart = performance.now();

    const animate = (timestamp: number): void => {
      const elapsed = timestamp - animationStart;
      const progress = Math.min(elapsed / duration, 1);
      const eased = easeInOutSine(progress);

      // Get organic sway values
      const sway = swayFn.current(progress * Math.PI * 2);

      // Interpolate all values smoothly with wind effect
      const x = startX + (finalX - startX) * eased + sway.x + windOffset * eased;
      const y = startY + (finalY - startY) * eased;
      const scale = 2.2 + (1 - 2.2) * eased;
      const rotateX = initialRotateX * (1 - eased);
      const rotateY = initialRotateY * (1 - eased);
      const rotateZ = initialRotateZ + (finalRotation - initialRotateZ) * eased + sway.rotation;
      const shadowVal = eased;

      // Calculate fade out based on wall clock time
      const age = Date.now() - createdAt;
      let opacity = 1;
      if (age > decayTime) {
        const fadeProgress = (age - decayTime) / fadeDuration;
        opacity = Math.max(0, 1 - fadeProgress);
      }

      // Direct DOM manipulation for smoother animation
      if (elementRef.current) {
        elementRef.current.style.transform = `
          translate(${x}px, ${y}px)
          scale(${scale})
          rotateX(${rotateX}deg)
          rotateY(${rotateY}deg)
          rotateZ(${rotateZ}deg)
        `;
        elementRef.current.style.boxShadow = `
          0 ${4 * shadowVal}px ${12 * shadowVal}px rgba(0,0,0,${0.06 * shadowVal}),
          0 ${1 * shadowVal}px ${3 * shadowVal}px rgba(0,0,0,${0.04 * shadowVal})
        `;
        elementRef.current.style.opacity = String(opacity);
      }

      // Check if fully faded
      if (opacity <= 0) {
        if (!hasCalledFadeComplete.current) {
          hasCalledFadeComplete.current = true;
          onFadeCompleteRef.current(id);
        }
        return;
      }

      rafRef.current = requestAnimationFrame(animate);
    };

    // Start immediately
    rafRef.current = requestAnimationFrame(animate);

    return () => {
      if (rafRef.current) {
        cancelAnimationFrame(rafRef.current);
      }
    };
  }, []); // Empty deps - run once on mount

  // Initial transform matching animation start (progress = 0)
  const initialSway = swayFn.current(0);
  const initialTransform = `
    translate(${startX + initialSway.x}px, ${startY}px)
    scale(2.2)
    rotateX(${initialRotateX}deg)
    rotateY(${initialRotateY}deg)
    rotateZ(${initialRotateZ + initialSway.rotation}deg)
  `;

  return (
    <div
      ref={elementRef}
      style={{
        position: 'absolute',
        left: 0,
        top: 0,
        width: '144px',
        padding: '10px 10px 36px 10px',
        background: 'linear-gradient(145deg, #FFFFFE 0%, #FFFCF8 100%)',
        transform: initialTransform,
        boxShadow: '0 0 0 rgba(0,0,0,0), 0 0 0 rgba(0,0,0,0)',
        opacity: 1,
        zIndex: id + 1,
        borderRadius: '2px',
        transformOrigin: 'center center',
        willChange: 'transform, opacity, box-shadow',
      }}
    >
      <div style={{
        width: '100%',
        aspectRatio: '1',
        background: '#e8e8e8',
        overflow: 'hidden',
        position: 'relative',
      }}>
        <img
          src={image}
          alt="Polaroid"
          style={{
            width: '100%',
            height: '100%',
            objectFit: 'cover',
            display: 'block',
          }}
        />
        <div style={{
          position: 'absolute',
          inset: 0,
          background: 'linear-gradient(180deg, rgba(255,255,255,0.15) 0%, transparent 30%, rgba(0,0,0,0.08) 100%)',
          pointerEvents: 'none',
        }} />
      </div>

      <div style={{
        position: 'absolute',
        bottom: '0',
        left: '0',
        right: '0',
        height: '36px',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
      }}>
        <span style={{
          fontFamily: 'Georgia, serif',
          fontStyle: 'italic',
          fontSize: '11px',
          color: '#666',
          whiteSpace: 'nowrap',
        }}>
          {new Date().toLocaleDateString('en-US', { month: 'short', year: '2-digit' })}
        </span>
      </div>

      <div style={{
        position: 'absolute',
        inset: 0,
        background: 'linear-gradient(135deg, rgba(255,255,255,0.3) 0%, transparent 50%, rgba(0,0,0,0.02) 100%)',
        pointerEvents: 'none',
        borderRadius: '2px',
      }} />
    </div>
  );
}

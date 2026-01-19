SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict fGxafQD4rohjaiGeok9wto4ZiNhPoT2OeV8egommpuolPwJO6lUgK7o1hhZ9d77

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: polaroids; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."polaroids" ("id", "image_path", "caption", "photo_date", "created_at") VALUES
	(27, '652ADCCB-C279-47D3-A2B0-743544456798.jpeg', NULL, '2019-12-10', '2026-01-15 19:31:31.0188+00'),
	(28, '77274C94-2A91-4712-88F7-826B480DE085IMG_3489.jpeg', NULL, '2025-08-14', '2026-01-15 19:31:31.071545+00'),
	(29, 'DSC00597.jpeg', NULL, '2025-04-09', '2026-01-15 19:31:31.137786+00'),
	(30, 'DSC05017.jpeg', NULL, '2025-11-15', '2026-01-15 19:31:31.193901+00'),
	(31, 'IMG_0040.jpeg', NULL, '2022-01-08', '2026-01-15 19:31:31.256315+00'),
	(32, 'IMG_0077.jpeg', NULL, '2020-04-30', '2026-01-15 19:31:31.620616+00'),
	(33, 'IMG_0095.jpeg', NULL, '2025-09-20', '2026-01-15 19:31:31.745617+00'),
	(34, 'IMG_0278.jpeg', NULL, '2020-11-08', '2026-01-15 19:31:31.811113+00'),
	(35, 'IMG_0613.jpeg', NULL, '2021-04-10', '2026-01-15 19:31:31.87369+00'),
	(36, 'IMG_0700.jpeg', NULL, '2023-06-21', '2026-01-15 19:31:31.931307+00'),
	(37, 'IMG_0808.jpeg', NULL, '2025-01-20', '2026-01-15 19:31:31.988263+00'),
	(38, 'IMG_0982.jpeg', NULL, '2021-04-10', '2026-01-15 19:31:32.045492+00'),
	(39, 'IMG_1133.jpeg', NULL, '2022-09-03', '2026-01-15 19:31:32.103366+00'),
	(40, 'IMG_1326.jpeg', NULL, '2022-10-08', '2026-01-15 19:31:32.160426+00'),
	(41, 'IMG_1445.jpeg', NULL, '2022-10-15', '2026-01-15 19:31:32.225652+00'),
	(42, 'IMG_1710.jpeg', NULL, '2022-10-29', '2026-01-15 19:31:32.291871+00'),
	(43, 'IMG_1717.jpeg', NULL, '2025-11-15', '2026-01-15 19:31:32.35137+00'),
	(44, 'IMG_2035.jpeg', NULL, '2023-07-23', '2026-01-15 19:31:32.407482+00'),
	(45, 'IMG_2056.jpeg', NULL, '2023-07-23', '2026-01-15 19:31:32.466308+00'),
	(46, 'IMG_2720.jpeg', NULL, '2021-08-22', '2026-01-15 19:31:32.52147+00'),
	(47, 'IMG_3211.jpeg', NULL, '2023-07-28', '2026-01-15 19:31:32.579752+00'),
	(48, 'IMG_3681.jpeg', NULL, '2025-09-27', '2026-01-15 19:31:32.639669+00'),
	(49, 'IMG_4496.jpeg', NULL, '2022-01-14', '2026-01-15 19:31:32.695688+00'),
	(50, 'IMG_9099.jpeg', NULL, '2023-11-08', '2026-01-15 19:31:32.749549+00'),
	(51, 'IMG_9293.jpeg', NULL, '2022-01-14', '2026-01-15 19:31:32.814903+00');


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: security_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."security_questions" ("id", "question", "answer", "created_at") OVERRIDING SYSTEM VALUE VALUES
	(1, 'What is Jackie''s beloved Yorkie''s name?', 'Rory', '2026-01-19 21:05:50.965554+00'),
	(2, 'What is Will''s legendary black lab''s first name?', 'Winston', '2026-01-19 21:06:13.568986+00'),
	(3, 'Jackie''s soccer number is', '28', '2026-01-19 21:07:13.170578+00'),
	(4, 'True or False. Will was once called the best pass rusher on Hopkins Football.', 'True', '2026-01-19 21:07:44.597193+00'),
	(5, 'Jackie and Will''s favorite NFL team', 'Chargers', '2026-01-19 21:08:32.314978+00'),
	(6, 'Jackies parent''s nickname for Will', 'Wild Willy', '2026-01-19 21:09:04.381009+00'),
	(7, 'What is Rae''s last name?', 'Sanchini', '2026-01-19 21:30:01.223441+00'),
	(8, 'What is Will''s middle name?', 'Sanchini', '2026-01-19 21:30:15.61998+00'),
	(9, 'What is Jackie''s middle name?', 'Alaine', '2026-01-19 21:30:27.748882+00'),
	(10, 'What school did Will and Jackie go to?', 'Johns Hopkins', '2026-01-19 21:30:46.018691+00');


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id", "type") VALUES
	('polaroids', 'polaroids', NULL, '2026-01-15 18:46:54.641627+00', '2026-01-15 18:46:54.641627+00', true, false, NULL, '{image/*}', NULL, 'STANDARD');


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata", "level") VALUES
	('7abee90c-bc0c-469c-9f0a-6b98e68dc435', 'polaroids', '77274C94-2A91-4712-88F7-826B480DE085IMG_3489.jpeg', NULL, '2026-01-15 19:02:21.842461+00', '2026-01-15 19:02:21.842461+00', '2026-01-15 19:02:21.842461+00', '{"eTag": "\"e29ab41b463d9e7209bae93c02e5d87e-1\"", "size": 1246688, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:22.000Z", "contentLength": 1246688, "httpStatusCode": 200}', 'd8ed7dae-9aec-440a-bcc5-90db6d883c75', NULL, NULL, 1),
	('8b1f48dc-72c7-4d50-b491-7ce06b0c192a', 'polaroids', 'IMG_3681.jpeg', NULL, '2026-01-15 19:02:21.867198+00', '2026-01-15 19:02:21.867198+00', '2026-01-15 19:02:21.867198+00', '{"eTag": "\"0e3ecbae14420115a7c8be273b2bfdf3-1\"", "size": 525023, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:22.000Z", "contentLength": 525023, "httpStatusCode": 200}', 'b312a25d-02e0-47ff-8705-e72e84550fad', NULL, NULL, 1),
	('939f2e79-92bc-4bd9-831b-f50836ea7a75', 'polaroids', 'IMG_9099.jpeg', NULL, '2026-01-15 19:02:21.872472+00', '2026-01-15 19:02:21.872472+00', '2026-01-15 19:02:21.872472+00', '{"eTag": "\"0e9fa66558c988a82e81f3e1fba7cfd1-1\"", "size": 1761237, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:22.000Z", "contentLength": 1761237, "httpStatusCode": 200}', '3107bdae-368b-4d0c-a150-b1f37816c1fe', NULL, NULL, 1),
	('6ae151fa-190f-41cd-a5d9-94f10e66f53a', 'polaroids', 'IMG_3211.jpeg', NULL, '2026-01-15 19:02:21.876314+00', '2026-01-15 19:02:21.876314+00', '2026-01-15 19:02:21.876314+00', '{"eTag": "\"19545ba8deac0371d6ed11424fb312f8-1\"", "size": 1226432, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:22.000Z", "contentLength": 1226432, "httpStatusCode": 200}', 'd08fc4b5-771a-44c2-96fc-f84d9bc3b63d', NULL, NULL, 1),
	('9b6fd621-6e8f-41c9-8693-c0bc1aeb4b6b', 'polaroids', 'IMG_0095.jpeg', NULL, '2026-01-15 19:02:21.971898+00', '2026-01-15 19:02:21.971898+00', '2026-01-15 19:02:21.971898+00', '{"eTag": "\"498655ead142799751ea9259c82c0375-1\"", "size": 1929369, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:22.000Z", "contentLength": 1929369, "httpStatusCode": 200}', 'ab0f8a96-560b-45cd-87ee-4edcf4e0477f', NULL, NULL, 1),
	('9dff5922-7ef9-4cf2-ab17-348bc040242c', 'polaroids', 'IMG_1717.jpeg', NULL, '2026-01-15 19:02:21.985758+00', '2026-01-15 19:02:21.985758+00', '2026-01-15 19:02:21.985758+00', '{"eTag": "\"1d14cbfb39b5f8a52ed153b0196e413b-1\"", "size": 1457864, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:22.000Z", "contentLength": 1457864, "httpStatusCode": 200}', '7d147c9b-a77b-4eb9-a403-102774bedbda', NULL, NULL, 1),
	('b35cbf96-7f18-454b-b755-29ebd9ba7595', 'polaroids', 'IMG_2056.jpeg', NULL, '2026-01-15 19:02:22.09789+00', '2026-01-15 19:02:22.09789+00', '2026-01-15 19:02:22.09789+00', '{"eTag": "\"c646d420ea115557b7a5276a624811c4-1\"", "size": 2007886, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:22.000Z", "contentLength": 2007886, "httpStatusCode": 200}', '52943c53-1996-4d2d-bd1e-62ffe1fbff81', NULL, NULL, 1),
	('2e0228fc-1c25-4962-b0c1-ab299ae322f5', 'polaroids', 'DSC05017.jpeg', NULL, '2026-01-15 19:02:22.319318+00', '2026-01-15 19:02:22.319318+00', '2026-01-15 19:02:22.319318+00', '{"eTag": "\"031b57da1ca0db46440aa129f70ff278-1\"", "size": 963829, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:22.000Z", "contentLength": 963829, "httpStatusCode": 200}', '905b84e6-1298-4aac-8b8e-ad13833a8570', NULL, NULL, 1),
	('269a736e-935c-4106-8093-a454d945ea9c', 'polaroids', 'IMG_0808.jpeg', NULL, '2026-01-15 19:02:22.563929+00', '2026-01-15 19:02:22.563929+00', '2026-01-15 19:02:22.563929+00', '{"eTag": "\"50afb19769b3ebcc98afca32a2fbdc5c-1\"", "size": 1703238, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:23.000Z", "contentLength": 1703238, "httpStatusCode": 200}', 'c51cf695-a24f-49f8-acfd-455217cbc9e5', NULL, NULL, 1),
	('9e5cb8f9-c95f-4fe5-861f-d7f6b9fdc670', 'polaroids', 'IMG_2035.jpeg', NULL, '2026-01-15 19:02:22.82231+00', '2026-01-15 19:02:22.82231+00', '2026-01-15 19:02:22.82231+00', '{"eTag": "\"5d1396b545d8e3fbc01fccb0aade30cb-1\"", "size": 1929153, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:23.000Z", "contentLength": 1929153, "httpStatusCode": 200}', '9424a2b6-e2d1-4678-b869-b9e2148be3f5', NULL, NULL, 1),
	('f4201140-9f71-452f-bd04-69c3b110bcd3', 'polaroids', 'IMG_0982.jpeg', NULL, '2026-01-15 19:02:23.8441+00', '2026-01-15 19:02:23.8441+00', '2026-01-15 19:02:23.8441+00', '{"eTag": "\"7d5650326f13e194dc3c58181437d0bd-1\"", "size": 1477761, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:24.000Z", "contentLength": 1477761, "httpStatusCode": 200}', 'f03b9feb-13f2-4101-aa35-27bc2dfab8c3', NULL, NULL, 1),
	('a74f359b-d460-4ab5-b389-552250b6b53a', 'polaroids', 'IMG_1710.jpeg', NULL, '2026-01-15 19:02:23.849235+00', '2026-01-15 19:02:23.849235+00', '2026-01-15 19:02:23.849235+00', '{"eTag": "\"c93d6f9d067cb38bb11457d0d42e71b8-1\"", "size": 1111715, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:24.000Z", "contentLength": 1111715, "httpStatusCode": 200}', '7b3816d7-7893-4961-a31e-006a4c4ef517', NULL, NULL, 1),
	('8a8b6b1d-32b6-41ea-9ecc-a44c6d078be5', 'polaroids', 'IMG_1445.jpeg', NULL, '2026-01-15 19:02:23.907047+00', '2026-01-15 19:02:23.907047+00', '2026-01-15 19:02:23.907047+00', '{"eTag": "\"dd41623a3e30116e528e31a1bedce613-1\"", "size": 1603987, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:24.000Z", "contentLength": 1603987, "httpStatusCode": 200}', 'f026b15a-7a14-4450-9c26-a05a084f481c', NULL, NULL, 1),
	('61757e3f-3061-428a-a146-1a35f828e95d', 'polaroids', 'IMG_1326.jpeg', NULL, '2026-01-15 19:02:23.933004+00', '2026-01-15 19:02:23.933004+00', '2026-01-15 19:02:23.933004+00', '{"eTag": "\"3cf2341d11e40d29e7047a0bde6d3045-1\"", "size": 1699231, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:24.000Z", "contentLength": 1699231, "httpStatusCode": 200}', '80223049-209d-45d5-8c97-b8bd9a5bc4c5', NULL, NULL, 1),
	('1072ae32-4cc2-47de-a7ba-51a55446f0c4', 'polaroids', 'IMG_0040.jpeg', NULL, '2026-01-15 19:02:23.947611+00', '2026-01-15 19:02:23.947611+00', '2026-01-15 19:02:23.947611+00', '{"eTag": "\"ba03c90aca751deb3138f663686e49c9-1\"", "size": 1315539, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:24.000Z", "contentLength": 1315539, "httpStatusCode": 200}', '1d1fa2bd-a3ff-45b8-8f44-abec87151581', NULL, NULL, 1),
	('9e4b3178-c72f-4cea-9674-f89fda4aead9', 'polaroids', 'IMG_4496.jpeg', NULL, '2026-01-15 19:02:24.010437+00', '2026-01-15 19:02:24.010437+00', '2026-01-15 19:02:24.010437+00', '{"eTag": "\"67a40a24f016f8220682597dfd406af6-1\"", "size": 1112780, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:24.000Z", "contentLength": 1112780, "httpStatusCode": 200}', 'cf72fd6f-e278-4b36-a95a-4343d5b2a486', NULL, NULL, 1),
	('76c3b302-3e85-4c58-b0fa-a0f3e6b447ef', 'polaroids', 'IMG_9293.jpeg', NULL, '2026-01-15 19:02:24.022102+00', '2026-01-15 19:02:24.022102+00', '2026-01-15 19:02:24.022102+00', '{"eTag": "\"7c943e1fd43ab388fd9afb8c2556b37d-1\"", "size": 1445367, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:24.000Z", "contentLength": 1445367, "httpStatusCode": 200}', '686b7e28-3456-4238-85f0-7bad222886c9', NULL, NULL, 1),
	('1a0481b7-17a0-4953-8795-b88abbb64264', 'polaroids', 'IMG_2720.jpeg', NULL, '2026-01-15 19:02:24.02064+00', '2026-01-15 19:02:24.02064+00', '2026-01-15 19:02:24.02064+00', '{"eTag": "\"0fc077ab811e06a6526c80f552e3c62a-1\"", "size": 1425985, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:24.000Z", "contentLength": 1425985, "httpStatusCode": 200}', 'b3ef2e2d-3a4c-46fc-acca-6d7a6cf09ecb', NULL, NULL, 1),
	('c851865a-9673-40f4-95be-521115e07b1d', 'polaroids', '652ADCCB-C279-47D3-A2B0-743544456798.jpeg', NULL, '2026-01-15 19:02:24.989145+00', '2026-01-15 19:02:24.989145+00', '2026-01-15 19:02:24.989145+00', '{"eTag": "\"c6937892f25131ccf43f00b56353ab46-1\"", "size": 872373, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:25.000Z", "contentLength": 872373, "httpStatusCode": 200}', '0d7ec76b-45bf-4e9e-a6be-f4b2550704d2', NULL, NULL, 1),
	('15d62e4c-a68b-44c2-8fc0-789047c8e392', 'polaroids', 'IMG_0700.jpeg', NULL, '2026-01-15 19:02:24.069669+00', '2026-01-15 19:02:24.069669+00', '2026-01-15 19:02:24.069669+00', '{"eTag": "\"1dfd88693f8dc5b757458835d58e8af0-1\"", "size": 1505513, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:24.000Z", "contentLength": 1505513, "httpStatusCode": 200}', '6e744b71-de74-4d93-b290-43886d59aadf', NULL, NULL, 1),
	('8c809756-6c61-49ed-b2d7-bd0d5e4c31bb', 'polaroids', 'IMG_0077.jpeg', NULL, '2026-01-15 19:02:25.025609+00', '2026-01-15 19:02:25.025609+00', '2026-01-15 19:02:25.025609+00', '{"eTag": "\"04b15e54984edaf236ce0d5aba0bc0c0-1\"", "size": 1066694, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:25.000Z", "contentLength": 1066694, "httpStatusCode": 200}', '90f930cc-14a3-46a6-98a4-64ae495865eb', NULL, NULL, 1),
	('2b89994f-7f9b-4b83-b5f1-12a3b04c9d8f', 'polaroids', 'IMG_1133.jpeg', NULL, '2026-01-15 19:02:24.17432+00', '2026-01-15 19:02:24.17432+00', '2026-01-15 19:02:24.17432+00', '{"eTag": "\"7f88185cf9da67deb2a0d3562e4893a5-1\"", "size": 2799762, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:24.000Z", "contentLength": 2799762, "httpStatusCode": 200}', '833ead84-ca3b-4346-bbfe-7260a3deab2e', NULL, NULL, 1),
	('e89a9d3b-a060-4444-84e1-4b1252bd86a0', 'polaroids', 'IMG_0613.jpeg', NULL, '2026-01-15 19:02:25.03494+00', '2026-01-15 19:02:25.03494+00', '2026-01-15 19:02:25.03494+00', '{"eTag": "\"c59c735415fd994af9a4e3a3157d1933-1\"", "size": 1228559, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:25.000Z", "contentLength": 1228559, "httpStatusCode": 200}', '2ae99862-e516-4a49-be95-97ad769197be', NULL, NULL, 1),
	('0d10e6e0-4846-4ec5-8848-2b5a8dc38fe0', 'polaroids', 'DSC00597.jpeg', NULL, '2026-01-15 19:02:25.045669+00', '2026-01-15 19:02:25.045669+00', '2026-01-15 19:02:25.045669+00', '{"eTag": "\"6dbfb4ac4e0998f62a0e77be0a803841-1\"", "size": 306163, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:25.000Z", "contentLength": 306163, "httpStatusCode": 200}', '45958a8f-9e41-4c6a-a46b-5d0344ebc49c', NULL, NULL, 1),
	('8d863bbe-6ba9-4b56-93a4-54733efd9c30', 'polaroids', 'IMG_0278.jpeg', NULL, '2026-01-15 19:02:24.994857+00', '2026-01-15 19:02:24.994857+00', '2026-01-15 19:02:24.994857+00', '{"eTag": "\"e18022029ad10e0e61e4c2feec34f078-1\"", "size": 1037629, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-15T19:02:25.000Z", "contentLength": 1037629, "httpStatusCode": 200}', '58bb3cd4-5ee0-4217-bec0-c5c2726ce3d7', NULL, NULL, 1);


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."messages_id_seq"', 25, true);


--
-- Name: polaroids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."polaroids_id_seq"', 51, true);


--
-- Name: security_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."security_questions_id_seq"', 10, true);


--
-- PostgreSQL database dump complete
--

-- \unrestrict fGxafQD4rohjaiGeok9wto4ZiNhPoT2OeV8egommpuolPwJO6lUgK7o1hhZ9d77

RESET ALL;

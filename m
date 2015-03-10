Received: from mx1.emlix.com ([88.198.252.230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVLgS-0006qz-GD
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2015 15:03:04 +0000
Received: from mx1.emlix.com (localhost [127.0.0.1])
 by mx1.emlix.com (Postfix) with ESMTP id 9B87423EF21
 for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2015 15:52:29 +0100 (CET)
Received: from mailer.emlix.com (unknown [80.150.94.234])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 8D85A23EE85
 for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2015 15:52:29 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] fix build when WITHOUT_LZO is set
Date: Tue, 10 Mar 2015 15:52:28 +0100
Message-ID: <2204501.a0qztNJuDl@devpool02>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 3019806268ef1a9a483ca2bc35dcf1365415829f Mon Sep 17 00:00:00 2001
From: Rolf Eike Beer <eb@emlix.com>
Date: Tue, 10 Mar 2015 15:20:52 +0100
Subject: [PATCH] fix build when WITHOUT_LZO is set

Make mkfs.ubifs honor the WITHOUT_LZO flag, too.

Fixes this build error:
  mkfs.ubifs/compr.c:27:23: lzo/lzo1x.h: No such file or directory
  mkfs.ubifs/compr.c: In function `lzo_compress':
  mkfs.ubifs/compr.c:92: error: `lzo_uint' undeclared (first use in thi=
s function)
  mkfs.ubifs/compr.c:92: error: (Each undeclared identifier is reported=
 only once
  mkfs.ubifs/compr.c:92: error: for each function it appears in.)
  mkfs.ubifs/compr.c:92: error: syntax error before "len"
  mkfs.ubifs/compr.c:95: error: `len' undeclared (first use in this fun=
ction)
  mkfs.ubifs/compr.c:96: warning: implicit declaration of function `lzo=
1x_999_compress'
  mkfs.ubifs/compr.c:99: error: `LZO_E_OK' undeclared (first use in thi=
s function)
  mkfs.ubifs/compr.c: In function `init_compression':
  mkfs.ubifs/compr.c:201: error: `LZO1X_999_MEM_COMPRESS' undeclared (f=
irst use in this function)

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
---
 Makefile                |  2 +-
 mkfs.ubifs/compr.c      | 15 +++++++++++++++
 mkfs.ubifs/mkfs.ubifs.c | 24 ++++++++++++++++++++----
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index eade234..6209471 100644
--- a/Makefile
+++ b/Makefile
@@ -105,7 +105,7 @@ $(call _mkdep,lib/,libmtd.a)
 obj-mkfs.ubifs =3D crc16.o lpt.o compr.o devtable.o \
 =09hashtable/hashtable.o hashtable/hashtable_itr.o
 LDFLAGS_mkfs.ubifs =3D $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
-LDLIBS_mkfs.ubifs =3D -lz -llzo2 -lm -luuid
+LDLIBS_mkfs.ubifs =3D -lz $(LZOLDLIBS) -lm -luuid
 $(call mkdep,mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
=20
 #
diff --git a/mkfs.ubifs/compr.c b/mkfs.ubifs/compr.c
index 34b2f60..d534f10 100644
--- a/mkfs.ubifs/compr.c
+++ b/mkfs.ubifs/compr.c
@@ -24,7 +24,9 @@
 #include <stdio.h>
 #include <stdint.h>
 #include <string.h>
+#ifndef WITHOUT_LZO
 #include <lzo/lzo1x.h>
+#endif
 #include <linux/types.h>
=20
 #define crc32 __zlib_crc32
@@ -85,6 +87,7 @@ static int zlib_deflate(void *in_buf, size_t in_len, =
void *out_buf,
 =09return 0;
 }
=20
+#ifndef WITHOUT_LZO
 static int lzo_compress(void *in_buf, size_t in_len, void *out_buf,
 =09=09=09size_t *out_len)
 {
@@ -102,6 +105,7 @@ static int lzo_compress(void *in_buf, size_t in_len=
, void *out_buf,
=20
 =09return 0;
 }
+#endif
=20
 static int no_compress(void *in_buf, size_t in_len, void *out_buf,
 =09=09       size_t *out_len)
@@ -113,6 +117,7 @@ static int no_compress(void *in_buf, size_t in_len,=
 void *out_buf,
=20
 static char *zlib_buf;
=20
+#ifndef WITHOUT_LZO
 static int favor_lzo_compress(void *in_buf, size_t in_len, void *out_b=
uf,
 =09=09=09       size_t *out_len, int *type)
 {
@@ -158,6 +163,7 @@ select_zlib:
 =09memcpy(out_buf, zlib_buf, zlib_len);
 =09return 0;
 }
+#endif
=20
 int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *=
out_len,
 =09=09  int type)
@@ -169,6 +175,10 @@ int compress_data(void *in_buf, size_t in_len, voi=
d *out_buf, size_t *out_len,
 =09=09return MKFS_UBIFS_COMPR_NONE;
 =09}
=20
+#ifdef WITHOUT_LZO
+=09{
+=09=09switch (type) {
+#else
 =09if (c->favor_lzo)
 =09=09ret =3D favor_lzo_compress(in_buf, in_len, out_buf, out_len, &ty=
pe);
 =09else {
@@ -176,6 +186,7 @@ int compress_data(void *in_buf, size_t in_len, void=
 *out_buf, size_t *out_len,
 =09=09case MKFS_UBIFS_COMPR_LZO:
 =09=09=09ret =3D lzo_compress(in_buf, in_len, out_buf, out_len);
 =09=09=09break;
+#endif
 =09=09case MKFS_UBIFS_COMPR_ZLIB:
 =09=09=09ret =3D zlib_deflate(in_buf, in_len, out_buf, out_len);
 =09=09=09break;
@@ -197,9 +208,13 @@ int compress_data(void *in_buf, size_t in_len, voi=
d *out_buf, size_t *out_len,
=20
 int init_compression(void)
 {
+#ifdef WITHOUT_LZO
+=09lzo_mem =3D NULL;
+#else
 =09lzo_mem =3D malloc(LZO1X_999_MEM_COMPRESS);
 =09if (!lzo_mem)
 =09=09return -1;
+#endif
=20
 =09zlib_buf =3D malloc(UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR);
 =09if (!zlib_buf) {
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index ca17e2b..24d4f04 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -483,7 +483,11 @@ static int get_options(int argc, char**argv)
 =09c->orph_lebs =3D 1;
 =09c->key_hash =3D key_r5_hash;
 =09c->key_len =3D UBIFS_SK_LEN;
+#ifdef WITHOUT_LZO
+=09c->default_compr =3D UBIFS_COMPR_ZLIB;
+#else
 =09c->default_compr =3D UBIFS_COMPR_LZO;
+#endif
 =09c->favor_percent =3D 20;
 =09c->lsave_cnt =3D 256;
 =09c->leb_size =3D -1;
@@ -594,21 +598,29 @@ static int get_options(int argc, char**argv)
 =09=09=09=09return err_msg("bad key hash");
 =09=09=09break;
 =09=09case 'x':
-=09=09=09if (strcmp(optarg, "favor_lzo") =3D=3D 0)
-=09=09=09=09c->favor_lzo =3D 1;
+=09=09=09if (strcmp(optarg, "none") =3D=3D 0)
+=09=09=09=09c->default_compr =3D UBIFS_COMPR_NONE;
 =09=09=09else if (strcmp(optarg, "zlib") =3D=3D 0)
 =09=09=09=09c->default_compr =3D UBIFS_COMPR_ZLIB;
-=09=09=09else if (strcmp(optarg, "none") =3D=3D 0)
-=09=09=09=09c->default_compr =3D UBIFS_COMPR_NONE;
+#ifndef WITHOUT_LZO
+=09=09=09else if (strcmp(optarg, "favor_lzo") =3D=3D 0)
+=09=09=09=09c->favor_lzo =3D 1;
 =09=09=09else if (strcmp(optarg, "lzo") !=3D 0)
+#else
+=09=09=09else
+#endif
 =09=09=09=09return err_msg("bad compressor name");
 =09=09=09break;
 =09=09case 'X':
+#ifdef WITHOT_LZO
+=09=09=09return err_msg("built without LZO support");
+#else
 =09=09=09c->favor_percent =3D strtol(optarg, &endp, 0);
 =09=09=09if (*endp !=3D '\0' || endp =3D=3D optarg ||
 =09=09=09    c->favor_percent <=3D 0 || c->favor_percent >=3D 100)
 =09=09=09=09return err_msg("bad favor LZO percent '%s'",
 =09=09=09=09=09       optarg);
+#endif
 =09=09=09break;
 =09=09case 'j':
 =09=09=09c->max_bud_bytes =3D get_bytes(optarg);
@@ -1276,7 +1288,11 @@ static int add_file(const char *path_name, struc=
t stat *st, ino_t inum,
 =09=09out_len =3D NODE_BUFFER_SIZE - UBIFS_DATA_NODE_SZ;
 =09=09if (c->default_compr =3D=3D UBIFS_COMPR_NONE &&
 =09=09    (flags & FS_COMPR_FL))
+#ifdef WITHOUT_LZO
+=09=09=09use_compr =3D UBIFS_COMPR_ZLIB;
+#else
 =09=09=09use_compr =3D UBIFS_COMPR_LZO;
+#endif
 =09=09else
 =09=09=09use_compr =3D c->default_compr;
 =09=09compr_type =3D compress_data(buf, bytes_read, &dn->data,
--=20
1.8.4.5


--=20
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
Fon +49 551 30664-0, Fax +49 551 30664-11
Bertha-von-Suttner-Str. 9, 37085 G=F6ttingen, Germany
Sitz der Gesellschaft: G=F6ttingen, Amtsgericht G=F6ttingen HR B 3160
Gesch=E4ftsf=FChrung: Dr. Uwe Kracke, Ust-IdNr.: DE 205 198 055

emlix - smart embedded open source

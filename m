Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUse-00036c-Nz
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 20:56:54 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at, hs@denx.de,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] mkfs.ubifs: Don't compress by default if filesystem is
 encrypted
Date: Wed,  7 Nov 2018 21:56:35 +0100
Message-Id: <20181107205635.16704-1-richard@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Encryption and compression are not friends.
Enable compression in encryption mode only if the user explicitly
sets a compressor.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 35 ++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 5847b352038a..666dfe6231a2 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -504,6 +504,20 @@ static int open_ubi(const char *node)
 	return 0;
 }
=20
+static void select_default_compr(void)
+{
+	if (c->encrypted) {
+		c->default_compr =3D UBIFS_COMPR_NONE;
+		return;
+	}
+
+#ifdef WITHOUT_LZO
+	c->default_compr =3D UBIFS_COMPR_ZLIB;
+#else
+	c->default_compr =3D UBIFS_COMPR_LZO;
+#endif
+}
+
 static int get_options(int argc, char**argv)
 {
 	int opt, i, fscrypt_flags =3D FS_POLICY_FLAGS_PAD_4;
@@ -519,11 +533,6 @@ static int get_options(int argc, char**argv)
 	c->orph_lebs =3D 1;
 	c->key_hash =3D key_r5_hash;
 	c->key_len =3D UBIFS_SK_LEN;
-#ifdef WITHOUT_LZO
-	c->default_compr =3D UBIFS_COMPR_ZLIB;
-#else
-	c->default_compr =3D UBIFS_COMPR_LZO;
-#endif
 	c->favor_percent =3D 20;
 	c->lsave_cnt =3D 256;
 	c->leb_size =3D -1;
@@ -533,6 +542,7 @@ static int get_options(int argc, char**argv)
 	c->log_lebs =3D -1;
 	c->double_hash =3D 0;
 	c->encrypted =3D 0;
+	c->default_compr =3D -1;
=20
 	while (1) {
 		opt =3D getopt_long(argc, argv, optstring, longopts, &i);
@@ -645,12 +655,14 @@ static int get_options(int argc, char**argv)
 			else if (strcmp(optarg, "zlib") =3D=3D 0)
 				c->default_compr =3D UBIFS_COMPR_ZLIB;
 #ifndef WITHOUT_LZO
-			else if (strcmp(optarg, "favor_lzo") =3D=3D 0)
+			else if (strcmp(optarg, "favor_lzo") =3D=3D 0) {
+				c->default_compr =3D UBIFS_COMPR_LZO;
 				c->favor_lzo =3D 1;
-			else if (strcmp(optarg, "lzo") !=3D 0)
-#else
-			else
+			} else if (strcmp(optarg, "lzo") =3D=3D 0) {
+				c->default_compr =3D UBIFS_COMPR_LZO;
+			}
 #endif
+			else
 				return err_msg("bad compressor name");
 			break;
 		case 'X':
@@ -777,6 +789,9 @@ static int get_options(int argc, char**argv)
 #endif
 	}
=20
+	if (c->default_compr =3D=3D -1)
+		select_default_compr();
+
 	if (c->min_io_size =3D=3D -1)
 		return err_msg("min. I/O unit was not specified "
 			       "(use -h for help)");
@@ -1787,7 +1802,7 @@ static int add_file(const char *path_name, struct s=
tat *st, ino_t inum,
 		key_write(&key, &dn->key);
 		out_len =3D NODE_BUFFER_SIZE - UBIFS_DATA_NODE_SZ;
 		if (c->default_compr =3D=3D UBIFS_COMPR_NONE &&
-		    (flags & FS_COMPR_FL))
+		    !c->encrypted && (flags & FS_COMPR_FL))
 #ifdef WITHOUT_LZO
 			use_compr =3D UBIFS_COMPR_ZLIB;
 #else
--=20
2.19.1

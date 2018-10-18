Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9Rv-0004Mn-8c
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:40:56 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 24/42] mkfs.ubifs: Get key descriptor from command line and
 master key from file
Date: Thu, 18 Oct 2018 16:37:00 +0200
Message-Id: <20181018143718.26298-25-richard@nod.at>
In-Reply-To: <20181018143718.26298-1-richard@nod.at>
References: <20181018143718.26298-1-richard@nod.at>
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

From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 131 ++++++++++++++++++++++++----
 1 file changed, 113 insertions(+), 18 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 5be390e93da9..70c306bdf94e 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -217,8 +217,7 @@ static struct inum_mapping **hash_table;
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
=20
-//TODO: add options for double hash and encryption
-static const char *optstring =3D "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:=
j:UQqa";
+static const char *optstring =3D "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:=
j:UQqaK:b:";
=20
 static const struct option longopts[] =3D {
 	{"root",               1, NULL, 'r'},
@@ -244,6 +243,8 @@ static const struct option longopts[] =3D {
 	{"squash-uids" ,       0, NULL, 'U'},
 	{"set-inode-attr",     0, NULL, 'a'},
 	{"selinux",            1, NULL, 's'},
+	{"key",                1, NULL, 'K'},
+	{"key-descriptor",     1, NULL, 'b'},
 	{NULL, 0, NULL, 0}
 };
=20
@@ -288,6 +289,8 @@ static const char *helptext =3D
 "                         added to the image. The attribute will contain=
 the inode\n"
 "                         number the file has in the generated image.\n"
 "-s, --selinux=3DFILE       Selinux context file\n"
+"-K, --key=3DFILE           load an encryption key from a specified file=
.\n"
+"-b, --key-descriptor=3DHEX specify the key descriptor as a hex string.\=
n"
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in Kilob=
ytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
@@ -582,11 +585,87 @@ static void print_fscrypt_master_key_descriptor(str=
uct fscrypt_context *fctx)
 	normsg("");
 }
=20
+static int xdigit(int x)
+{
+	if (isupper(x))
+		return x - 'A' + 0x0A;
+	if (islower(x))
+		return x - 'a' + 0x0A;
+	return x - '0';
+}
+
+static int parse_key_descriptor(const char *desc, __u8 *dst)
+{
+	int i, hi, lo;
+
+	for (i =3D 0; i < FS_KEY_DESCRIPTOR_SIZE; ++i) {
+		if (!desc[i * 2] || !desc[i * 2 + 1]) {
+			err_msg("key descriptor '%s' is too short", desc);
+			return -1;
+		}
+		if (!isxdigit(desc[i * 2]) || !isxdigit(desc[i * 2 + 1])) {
+			err_msg("invalid key descriptor '%s'", desc);
+			return -1;
+		}
+
+		hi =3D xdigit(desc[i * 2]);
+		lo =3D xdigit(desc[i * 2 + 1]);
+
+		dst[i] =3D (hi << 4) | lo;
+	}
+
+	if (desc[i * 2]) {
+		err_msg("key descriptor '%s' is too long", desc);
+		return -1;
+	}
+	return 0;
+}
+
+static int load_master_key(const char *key_file)
+{
+	int kf;
+	ssize_t keysize;
+
+	kf =3D open(key_file, O_RDONLY);
+	if (kf < 0) {
+		sys_errmsg("open '%s'", key_file);
+		return -1;
+	}
+
+	keysize =3D read(kf, fscrypt_masterkey, sizeof(fscrypt_masterkey));
+	if (keysize < 0) {
+		sys_errmsg("read '%s'", key_file);
+		goto fail;
+	}
+	if (keysize =3D=3D 0) {
+		err_msg("loading key from '%s': file is empty", key_file);
+		goto fail;
+	}
+
+	close(kf);
+	return 0;
+fail:
+	close(kf);
+	return -1;
+}
+
 static struct fscrypt_context *init_fscrypt_context(unsigned int flags,
-						void *master_key_descriptor,
-						void *nonce)
+						const char *key_file,
+						const char *key_descriptor)
 {
-	struct fscrypt_context *new_fctx =3D xmalloc(sizeof(*new_fctx));
+	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+	__u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
+	struct fscrypt_context *new_fctx;
+
+	if (parse_key_descriptor(key_descriptor, master_key_descriptor))
+		return NULL;
+
+	if (load_master_key(key_file))
+		return NULL;
+
+	RAND_bytes((void *)nonce, FS_KEY_DERIVATION_NONCE_SIZE);
+
+	new_fctx =3D xmalloc(sizeof(*new_fctx));
=20
 	new_fctx->format =3D FS_ENCRYPTION_CONTEXT_FORMAT_V1;
 	new_fctx->contents_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CBC;
@@ -635,6 +714,7 @@ static int open_ubi(const char *node)
 static int get_options(int argc, char**argv)
 {
 	int opt, i;
+	const char *key_file =3D NULL, *key_desc =3D NULL;
 	const char *tbl_file =3D NULL;
 	struct stat st;
 	char *endp;
@@ -812,6 +892,18 @@ static int get_options(int argc, char**argv)
 				return sys_err_msg("bad file context %s\n",
 								   context);
 			break;
+		case 'K':
+			if (key_file) {
+				return err_msg("key file specified more than once");
+			}
+			key_file =3D optarg;
+			break;
+		case 'b':
+			if (key_desc) {
+				return err_msg("key descriptor specified more than once");
+			}
+			key_desc =3D optarg;
+			break;
 		}
 	}
=20
@@ -830,6 +922,22 @@ static int get_options(int argc, char**argv)
 			c->max_leb_cnt =3D c->vi.rsvd_lebs;
 	}
=20
+	if (key_file || key_desc) {
+		if (!key_file)
+			return err_msg("no key file specified");
+		if (!key_desc)
+			return err_msg("no key descriptor specified");
+
+		c->double_hash =3D 1;
+		c->encrypted =3D 1;
+
+		root_fctx =3D init_fscrypt_context(FS_POLICY_FLAGS_PAD_4,
+						key_file, key_desc);
+		if (!root_fctx)
+			return -1;
+		print_fscrypt_master_key_descriptor(root_fctx);
+	}
+
 	if (c->min_io_size =3D=3D -1)
 		return err_msg("min. I/O unit was not specified "
 			       "(use -h for help)");
@@ -2786,8 +2894,6 @@ static int close_target(void)
  */
 static int init(void)
 {
-	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
-	__u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
 	int err, i, main_lebs, big_lpt =3D 0, sz;
=20
 	c->highest_inum =3D UBIFS_FIRST_INO;
@@ -2829,17 +2935,6 @@ static int init(void)
 	sz =3D sizeof(struct inum_mapping *) * HASH_TABLE_SIZE;
 	hash_table =3D xzalloc(sz);
=20
-	if (c->encrypted) {
-		RAND_bytes((void *)master_key_descriptor,
-				FS_KEY_DESCRIPTOR_SIZE);
-		RAND_bytes((void *)nonce, FS_KEY_DERIVATION_NONCE_SIZE);
-
-		root_fctx =3D init_fscrypt_context(FS_POLICY_FLAGS_PAD_4,
-						master_key_descriptor, nonce);
-		print_fscrypt_master_key_descriptor(root_fctx);
-		c->double_hash =3D 1;
-	}
-
 	err =3D init_compression();
 	if (err)
 		return err;
--=20
2.19.1

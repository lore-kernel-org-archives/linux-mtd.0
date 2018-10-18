Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9S6-0002RT-IN
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:11 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 28/42] mkfs.ubifs: Move fscrypt definitions and functions out
 of mkfs.ubifs.c
Date: Thu, 18 Oct 2018 16:37:04 +0200
Message-Id: <20181018143718.26298-29-richard@nod.at>
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
 ubifs-utils/Makemodule.am           |   2 +
 ubifs-utils/mkfs.ubifs/fscrypt.c    | 256 ++++++++++++++++++++++++
 ubifs-utils/mkfs.ubifs/fscrypt.h    | 112 +++++++++++
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 292 +---------------------------
 4 files changed, 376 insertions(+), 286 deletions(-)
 create mode 100644 ubifs-utils/mkfs.ubifs/fscrypt.c
 create mode 100644 ubifs-utils/mkfs.ubifs/fscrypt.h

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 3dd299dd20cc..5905a2badbb6 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -11,6 +11,7 @@ mkfs_ubifs_SOURCES =3D \
 	ubifs-utils/mkfs.ubifs/lpt.c \
 	ubifs-utils/mkfs.ubifs/compr.c \
 	ubifs-utils/mkfs.ubifs/crypto.c \
+	ubifs-utils/mkfs.ubifs/fscrypt.c \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h \
@@ -30,6 +31,7 @@ UBIFS_HEADER =3D \
 	ubifs-utils/mkfs.ubifs/lpt.h ubifs-utils/mkfs.ubifs/mkfs.ubifs.h \
 	ubifs-utils/mkfs.ubifs/ubifs.h \
 	ubifs-utils/mkfs.ubifs/crypto.h \
+	ubifs-utils/mkfs.ubifs/fscrypt.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h
diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.c b/ubifs-utils/mkfs.ubifs/fs=
crypt.c
new file mode 100644
index 000000000000..68001e1d88f4
--- /dev/null
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.c
@@ -0,0 +1,256 @@
+/*
+ * Copyright (C) 2017 sigma star gmbh
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms of the GNU General Public License version 2 as publis=
hed by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but W=
ITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Richard Weinberger <richard@sigma-star.at>
+ *          David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+ */
+
+#define PROGRAM_NAME "mkfs.ubifs"
+#include "fscrypt.h"
+
+
+static __u8 fscrypt_masterkey[FS_MAX_KEY_SIZE];
+static struct cipher *fscrypt_cipher;
+
+
+unsigned char *calc_fscrypt_subkey(struct fscrypt_context *fctx)
+{
+	int ret;
+	unsigned char *new_key =3D xmalloc(FS_MAX_KEY_SIZE);
+
+	ret =3D derive_key_aes(fctx->nonce, fscrypt_masterkey, FS_MAX_KEY_SIZE,=
 new_key);
+	if (ret < 0) {
+		err_msg("derive_key_aes failed: %i\n", ret);
+
+		free(new_key);
+		new_key =3D NULL;
+	}
+
+	return new_key;
+}
+
+struct fscrypt_context *inherit_fscrypt_context(struct fscrypt_context *=
fctx)
+{
+	struct fscrypt_context *new_fctx =3D NULL;
+
+	if (fctx) {
+		new_fctx =3D xmalloc(sizeof(*new_fctx));
+		new_fctx->format =3D fctx->format;
+		new_fctx->contents_encryption_mode =3D fctx->contents_encryption_mode;
+		new_fctx->filenames_encryption_mode =3D fctx->filenames_encryption_mod=
e;
+		new_fctx->flags =3D fctx->flags;
+		memcpy(new_fctx->master_key_descriptor, fctx->master_key_descriptor,
+		       FS_KEY_DESCRIPTOR_SIZE);
+		RAND_bytes((void *)&new_fctx->nonce, FS_KEY_DERIVATION_NONCE_SIZE);
+	}
+
+	return new_fctx;
+}
+
+void free_fscrypt_context(struct fscrypt_context *fctx)
+{
+	free(fctx);
+}
+
+void print_fscrypt_master_key_descriptor(struct fscrypt_context *fctx)
+{
+	int i;
+
+	normsg_cont("fscrypt master key descriptor: ");
+	for (i =3D 0; i < FS_KEY_DESCRIPTOR_SIZE; i++) {
+		normsg_cont("%02x", fctx->master_key_descriptor[i]);
+	}
+	normsg("");
+}
+
+unsigned int fscrypt_fname_encrypted_size(struct fscrypt_context *fctx,
+					  unsigned int ilen)
+{
+	int padding;
+
+	padding =3D 4 << (fctx->flags & FS_POLICY_FLAGS_PAD_MASK);
+	ilen =3D max_t(unsigned int, ilen, FS_CRYPTO_BLOCK_SIZE);
+	return round_up(ilen, padding);
+}
+
+int encrypt_path(void **outbuf, void *data, unsigned int data_len,
+		unsigned int max_namelen, struct fscrypt_context *fctx)
+{
+	void *inbuf, *crypt_key;
+	unsigned int padding =3D 4 << (fctx->flags & FS_POLICY_FLAGS_PAD_MASK);
+	unsigned int cryptlen;
+	int ret;
+
+	cryptlen =3D max_t(unsigned int, data_len, FS_CRYPTO_BLOCK_SIZE);
+	cryptlen =3D round_up(cryptlen, padding);
+	cryptlen =3D min(cryptlen, max_namelen);
+
+	inbuf =3D xmalloc(cryptlen);
+	/* CTS mode needs a block size aligned buffer */
+	*outbuf =3D xmalloc(round_up(cryptlen, FS_CRYPTO_BLOCK_SIZE));
+
+	memset(inbuf, 0, cryptlen);
+	memcpy(inbuf, data, data_len);
+
+	crypt_key =3D calc_fscrypt_subkey(fctx);
+	if (!crypt_key)
+		return err_msg("could not compute subkey");
+
+	ret =3D fscrypt_cipher->encrypt_fname(inbuf, cryptlen,
+					    crypt_key, *outbuf);
+	if (ret < 0)
+		return err_msg("could not encrypt filename");
+
+	free(crypt_key);
+	free(inbuf);
+	return cryptlen;
+}
+
+int encrypt_data_node(struct fscrypt_context *fctx, unsigned int block_n=
o,
+		      struct ubifs_data_node *dn, size_t length)
+{
+	void *inbuf, *outbuf, *crypt_key;
+	size_t ret, pad_len =3D round_up(length, FS_CRYPTO_BLOCK_SIZE);
+
+	dn->compr_size =3D length;
+
+	inbuf =3D xzalloc(pad_len);
+	outbuf =3D xzalloc(pad_len);
+
+	memcpy(inbuf, &dn->data, length);
+
+	crypt_key =3D calc_fscrypt_subkey(fctx);
+	if (!crypt_key)
+		return err_msg("could not compute subkey");
+
+	ret =3D fscrypt_cipher->encrypt_block(inbuf, pad_len,
+					    crypt_key, block_no,
+					    outbuf);
+	if (ret !=3D pad_len) {
+		return err_msg("encrypt_block returned %zi "
+				"instead of %zi", ret, pad_len);
+	}
+
+	memcpy(&dn->data, outbuf, pad_len);
+
+	free(inbuf);
+	free(outbuf);
+	free(crypt_key);
+	return pad_len;
+}
+
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
+struct fscrypt_context *init_fscrypt_context(const char *cipher_name,
+					     unsigned int flags,
+					     const char *key_file,
+					     const char *key_descriptor)
+{
+	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+	__u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
+	struct fscrypt_context *new_fctx;
+
+	fscrypt_cipher =3D get_cipher(cipher_name);
+
+	if (!fscrypt_cipher) {
+		fprintf(stderr, "Cannot find cipher '%s'\n"
+			"Try `%s --help' for more information\n",
+			cipher_name, PROGRAM_NAME);
+		return NULL;
+	}
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
+
+	new_fctx->format =3D FS_ENCRYPTION_CONTEXT_FORMAT_V1;
+	new_fctx->contents_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CBC;
+	new_fctx->filenames_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CTS;
+	new_fctx->flags =3D flags;
+
+	memcpy(&new_fctx->nonce, nonce, FS_KEY_DERIVATION_NONCE_SIZE);
+	memcpy(&new_fctx->master_key_descriptor, master_key_descriptor,
+		FS_KEY_DESCRIPTOR_SIZE);
+	return new_fctx;
+}
diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.h b/ubifs-utils/mkfs.ubifs/fs=
crypt.h
new file mode 100644
index 000000000000..b6fb6d136e58
--- /dev/null
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.h
@@ -0,0 +1,112 @@
+/*
+ * Copyright (C) 2017 sigma star gmbh
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms of the GNU General Public License version 2 as publis=
hed by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but W=
ITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Richard Weinberger <richard@sigma-star.at>
+ *          David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+ */
+
+#ifndef FSCRYPT_H
+#define FSCRYPT_H
+
+
+#include "mkfs.ubifs.h"
+#include <sys/types.h>
+#include "crypto.h"
+
+
+#ifndef FS_KEY_DESCRIPTOR_SIZE
+#define FS_KEY_DESCRIPTOR_SIZE  8
+#endif
+#define FS_ENCRYPTION_CONTEXT_FORMAT_V1 1
+#define FS_KEY_DERIVATION_NONCE_SIZE	16
+
+#ifndef FS_ENCRYPTION_MODE_AES_128_CBC
+#define FS_ENCRYPTION_MODE_AES_128_CBC 5
+#endif
+
+#ifndef FS_ENCRYPTION_MODE_AES_128_CTS
+#define FS_ENCRYPTION_MODE_AES_128_CTS 6
+#endif
+
+#ifndef FS_POLICY_FLAGS_VALID
+#define FS_POLICY_FLAGS_PAD_4		0x00
+#define FS_POLICY_FLAGS_PAD_8		0x01
+#define FS_POLICY_FLAGS_PAD_16		0x02
+#define FS_POLICY_FLAGS_PAD_32		0x03
+#define FS_POLICY_FLAGS_PAD_MASK	0x03
+#define FS_POLICY_FLAGS_VALID		0x03
+#endif
+
+#define FS_CRYPTO_BLOCK_SIZE	16
+
+/**
+ * Encryption context for inode
+ *
+ * Protector format:
+ *  1 byte: Protector format (1 =3D this version)
+ *  1 byte: File contents encryption mode
+ *  1 byte: File names encryption mode
+ *  1 byte: Flags
+ *  8 bytes: Master Key descriptor
+ *  16 bytes: Encryption Key derivation nonce
+ */
+struct fscrypt_context {
+	__u8 format;
+	__u8 contents_encryption_mode;
+	__u8 filenames_encryption_mode;
+	__u8 flags;
+	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+	__u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
+} __attribute__((packed));
+
+/**
+ * For encrypted symlinks, the ciphertext length is stored at the beginn=
ing
+ * of the string in little-endian format.
+ */
+struct fscrypt_symlink_data {
+	__le16 len;
+	char encrypted_path[1];
+} __attribute__((packed));
+
+
+#ifndef FS_MAX_KEY_SIZE
+#define FS_MAX_KEY_SIZE	64
+#endif
+
+unsigned char *calc_fscrypt_subkey(struct fscrypt_context *fctx);
+
+struct fscrypt_context *inherit_fscrypt_context(struct fscrypt_context *=
fctx);
+
+void free_fscrypt_context(struct fscrypt_context *fctx);
+
+void print_fscrypt_master_key_descriptor(struct fscrypt_context *fctx);
+
+unsigned int fscrypt_fname_encrypted_size(struct fscrypt_context *fctx,
+					  unsigned int ilen);
+
+int encrypt_path(void **outbuf, void *data, unsigned int data_len,
+		 unsigned int max_namelen, struct fscrypt_context *fctx);
+
+int encrypt_data_node(struct fscrypt_context *fctx, unsigned int block_n=
o,
+		      struct ubifs_data_node *dn, size_t length);
+
+struct fscrypt_context *init_fscrypt_context(const char *cipher_name,
+					     unsigned int flags,
+					     const char *key_file,
+					     const char *key_descriptor);
+
+#endif /* FSCRYPT_H */
+
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 707758a42f4f..1710e25b88ee 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -36,6 +36,7 @@
 #endif
=20
 #include "crypto.h"
+#include "fscrypt.h"
=20
 /* Size (prime number) of hash table for link counting */
 #define HASH_TABLE_SIZE 10099
@@ -110,66 +111,6 @@ struct inum_mapping {
 	struct stat st;
 };
=20
-#ifndef FS_KEY_DESCRIPTOR_SIZE
-#define FS_KEY_DESCRIPTOR_SIZE  8
-#endif
-#define FS_ENCRYPTION_CONTEXT_FORMAT_V1 1
-#define FS_KEY_DERIVATION_NONCE_SIZE	16
-
-#ifndef FS_ENCRYPTION_MODE_AES_128_CBC
-#define FS_ENCRYPTION_MODE_AES_128_CBC 5
-#endif
-
-#ifndef FS_ENCRYPTION_MODE_AES_128_CTS
-#define FS_ENCRYPTION_MODE_AES_128_CTS 6
-#endif
-
-#ifndef FS_POLICY_FLAGS_VALID
-#define FS_POLICY_FLAGS_PAD_4		0x00
-#define FS_POLICY_FLAGS_PAD_8		0x01
-#define FS_POLICY_FLAGS_PAD_16		0x02
-#define FS_POLICY_FLAGS_PAD_32		0x03
-#define FS_POLICY_FLAGS_PAD_MASK	0x03
-#define FS_POLICY_FLAGS_VALID		0x03
-#endif
-
-#define FS_CRYPTO_BLOCK_SIZE	16
-
-/**
- * Encryption context for inode
- *
- * Protector format:
- *  1 byte: Protector format (1 =3D this version)
- *  1 byte: File contents encryption mode
- *  1 byte: File names encryption mode
- *  1 byte: Flags
- *  8 bytes: Master Key descriptor
- *  16 bytes: Encryption Key derivation nonce
- */
-struct fscrypt_context {
-	__u8 format;
-	__u8 contents_encryption_mode;
-	__u8 filenames_encryption_mode;
-	__u8 flags;
-	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
-	__u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
-} __attribute__((packed));
-
-/**
- * For encrypted symlinks, the ciphertext length is stored at the beginn=
ing
- * of the string in little-endian format.
- */
-struct fscrypt_symlink_data {
-	__le16 len;
-	char encrypted_path[1];
-} __attribute__((packed));
-
-
-#ifndef FS_MAX_KEY_SIZE
-#define FS_MAX_KEY_SIZE	64
-#endif
-static __u8 fscrypt_masterkey[FS_MAX_KEY_SIZE];
-
 /*
  * Because we copy functions from the kernel, we use a subset of the UBI=
FS
  * file-system description object struct ubifs_info.
@@ -186,7 +127,6 @@ int yes;
 static char *root;
 static int root_len;
 static struct fscrypt_context *root_fctx;
-static struct cipher *fscrypt_cipher;
 static struct stat root_st;
 static char *output;
 static int out_fd;
@@ -541,160 +481,6 @@ static long long get_bytes(const char *str)
=20
 	return bytes;
 }
-
-static unsigned char *calc_fscrypt_subkey(struct fscrypt_context *fctx)
-{
-	int ret;
-	unsigned char *new_key =3D xmalloc(FS_MAX_KEY_SIZE);
-
-	ret =3D derive_key_aes(fctx->nonce, fscrypt_masterkey, FS_MAX_KEY_SIZE,=
 new_key);
-	if (ret < 0) {
-		err_msg("derive_key_aes failed: %i\n", ret);
-
-		free(new_key);
-		new_key =3D NULL;
-	}
-
-	return new_key;
-}
-
-static struct fscrypt_context *inherit_fscrypt_context(struct fscrypt_co=
ntext *fctx)
-{
-	struct fscrypt_context *new_fctx =3D NULL;
-
-	if (fctx) {
-		new_fctx =3D xmalloc(sizeof(*new_fctx));
-		new_fctx->format =3D fctx->format;
-		new_fctx->contents_encryption_mode =3D fctx->contents_encryption_mode;
-		new_fctx->filenames_encryption_mode =3D fctx->filenames_encryption_mod=
e;
-		new_fctx->flags =3D fctx->flags;
-		memcpy(new_fctx->master_key_descriptor, fctx->master_key_descriptor,
-		       FS_KEY_DESCRIPTOR_SIZE);
-		RAND_bytes((void *)&new_fctx->nonce, FS_KEY_DERIVATION_NONCE_SIZE);
-	}
-
-	return new_fctx;
-}
-
-static void free_fscrypt_context(struct fscrypt_context *fctx)
-{
-	free(fctx);
-}
-
-static void print_fscrypt_master_key_descriptor(struct fscrypt_context *=
fctx)
-{
-	int i;
-
-	normsg_cont("fscrypt master key descriptor: ");
-	for (i =3D 0; i < FS_KEY_DESCRIPTOR_SIZE; i++) {
-		normsg_cont("%02x", fctx->master_key_descriptor[i]);
-	}
-	normsg("");
-}
-
-static int xdigit(int x)
-{
-	if (isupper(x))
-		return x - 'A' + 0x0A;
-	if (islower(x))
-		return x - 'a' + 0x0A;
-	return x - '0';
-}
-
-static int parse_key_descriptor(const char *desc, __u8 *dst)
-{
-	int i, hi, lo;
-
-	for (i =3D 0; i < FS_KEY_DESCRIPTOR_SIZE; ++i) {
-		if (!desc[i * 2] || !desc[i * 2 + 1]) {
-			err_msg("key descriptor '%s' is too short", desc);
-			return -1;
-		}
-		if (!isxdigit(desc[i * 2]) || !isxdigit(desc[i * 2 + 1])) {
-			err_msg("invalid key descriptor '%s'", desc);
-			return -1;
-		}
-
-		hi =3D xdigit(desc[i * 2]);
-		lo =3D xdigit(desc[i * 2 + 1]);
-
-		dst[i] =3D (hi << 4) | lo;
-	}
-
-	if (desc[i * 2]) {
-		err_msg("key descriptor '%s' is too long", desc);
-		return -1;
-	}
-	return 0;
-}
-
-static int load_master_key(const char *key_file)
-{
-	int kf;
-	ssize_t keysize;
-
-	kf =3D open(key_file, O_RDONLY);
-	if (kf < 0) {
-		sys_errmsg("open '%s'", key_file);
-		return -1;
-	}
-
-	keysize =3D read(kf, fscrypt_masterkey, sizeof(fscrypt_masterkey));
-	if (keysize < 0) {
-		sys_errmsg("read '%s'", key_file);
-		goto fail;
-	}
-	if (keysize =3D=3D 0) {
-		err_msg("loading key from '%s': file is empty", key_file);
-		goto fail;
-	}
-
-	close(kf);
-	return 0;
-fail:
-	close(kf);
-	return -1;
-}
-
-static struct fscrypt_context *init_fscrypt_context(unsigned int flags,
-						const char *key_file,
-						const char *key_descriptor)
-{
-	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
-	__u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
-	struct fscrypt_context *new_fctx;
-
-	if (parse_key_descriptor(key_descriptor, master_key_descriptor))
-		return NULL;
-
-	if (load_master_key(key_file))
-		return NULL;
-
-	RAND_bytes((void *)nonce, FS_KEY_DERIVATION_NONCE_SIZE);
-
-	new_fctx =3D xmalloc(sizeof(*new_fctx));
-
-	new_fctx->format =3D FS_ENCRYPTION_CONTEXT_FORMAT_V1;
-	new_fctx->contents_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CBC;
-	new_fctx->filenames_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CTS;
-	new_fctx->flags =3D flags;
-
-	memcpy(&new_fctx->nonce, nonce, FS_KEY_DERIVATION_NONCE_SIZE);
-	memcpy(&new_fctx->master_key_descriptor, master_key_descriptor,
-		FS_KEY_DESCRIPTOR_SIZE);
-	return new_fctx;
-}
-
-unsigned int fscrypt_fname_encrypted_size(struct fscrypt_context *fctx, =
unsigned int ilen)
-{
-	int padding;
-
-	padding =3D 4 << (fctx->flags & FS_POLICY_FLAGS_PAD_MASK);
-	ilen =3D max_t(unsigned int, ilen, FS_CRYPTO_BLOCK_SIZE);
-	return round_up(ilen, padding);
-}
-
-
 /**
  * open_ubi - open the UBI volume.
  * @node: name of the UBI volume character device to fetch information a=
bout
@@ -972,19 +758,11 @@ static int get_options(int argc, char**argv)
 		c->double_hash =3D 1;
 		c->encrypted =3D 1;
=20
-		root_fctx =3D init_fscrypt_context(fscrypt_flags,
+		root_fctx =3D init_fscrypt_context(cipher_name, fscrypt_flags,
 						key_file, key_desc);
 		if (!root_fctx)
 			return -1;
=20
-		fscrypt_cipher =3D get_cipher(cipher_name);
-		if (!fscrypt_cipher) {
-			fprintf(stderr, "Cannot find cipher '%s'\n"
-				"Try `%s --help' for more information\n",
-				cipher_name, PROGRAM_NAME);
-			return -1;
-		}
-
 		print_fscrypt_master_key_descriptor(root_fctx);
 	}
=20
@@ -1616,39 +1394,6 @@ static int set_fscrypt_context(struct ubifs_ino_no=
de *host_ino, ino_t inum,
 			 fctx, sizeof(*fctx));
 }
=20
-static int encrypt_path(void **outbuf, void *data, unsigned int data_len=
,
-			unsigned int max_namelen, struct fscrypt_context *fctx)
-{
-	void *inbuf, *crypt_key;
-	unsigned int padding =3D 4 << (fctx->flags & FS_POLICY_FLAGS_PAD_MASK);
-	unsigned int cryptlen;
-	int ret;
-
-	cryptlen =3D max_t(unsigned int, data_len, FS_CRYPTO_BLOCK_SIZE);
-	cryptlen =3D round_up(cryptlen, padding);
-	cryptlen =3D min(cryptlen, max_namelen);
-
-	inbuf =3D xmalloc(cryptlen);
-	/* CTS mode needs a block size aligned buffer */
-	*outbuf =3D xmalloc(round_up(cryptlen, FS_CRYPTO_BLOCK_SIZE));
-
-	memset(inbuf, 0, cryptlen);
-	memcpy(inbuf, data, data_len);
-
-	crypt_key =3D calc_fscrypt_subkey(fctx);
-	if (!crypt_key)
-		return err_msg("could not compute subkey");
-
-	ret =3D fscrypt_cipher->encrypt_fname(inbuf, cryptlen,
-					    crypt_key, *outbuf);
-	if (ret < 0)
-		return err_msg("could not encrypt filename");
-
-	free(crypt_key);
-	free(inbuf);
-	return cryptlen;
-}
-
 static int encrypt_symlink(void *dst, void *data, unsigned int data_len,
 			   struct fscrypt_context *fctx)
 {
@@ -2011,35 +1756,10 @@ static int add_file(const char *path_name, struct=
 stat *st, ino_t inum,
 		if (!fctx) {
 			dn->compr_size =3D 0;
 		} else {
-			void *inbuf, *outbuf, *crypt_key;
-			size_t ret, pad_len =3D round_up(out_len, FS_CRYPTO_BLOCK_SIZE);
-
-			dn->compr_size =3D out_len;
-
-			inbuf =3D xzalloc(pad_len);
-			outbuf =3D xzalloc(pad_len);
-
-			memcpy(inbuf, &dn->data, out_len);
-
-			crypt_key =3D calc_fscrypt_subkey(fctx);
-			if (!crypt_key)
-				return err_msg("could not compute subkey");
-
-			ret =3D fscrypt_cipher->encrypt_block(inbuf, pad_len,
-							    crypt_key, block_no,
-							    outbuf);
-			if (ret !=3D pad_len) {
-				return err_msg("encrypt_block returned %zi "
-						"instead of %zi", ret, pad_len);
-			}
-
-			memcpy(&dn->data, outbuf, pad_len);
-
-			out_len =3D pad_len;
-
-			free(inbuf);
-			free(outbuf);
-			free(crypt_key);
+			ret =3D encrypt_data_node(fctx, block_no, dn, out_len);
+			if (ret < 0)
+				return ret;
+			out_len =3D ret;
 		}
=20
 		dn_len =3D UBIFS_DATA_NODE_SZ + out_len;
--=20
2.19.1

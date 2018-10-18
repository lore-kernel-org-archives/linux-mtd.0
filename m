Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RC-00043T-O3
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:38:20 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 03/42] mkfs.ubifs: Add crypto helper functions
Date: Thu, 18 Oct 2018 16:36:39 +0200
Message-Id: <20181018143718.26298-4-richard@nod.at>
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
 configure.ac                        |   1 +
 ubifs-utils/Makemodule.am           |   4 +-
 ubifs-utils/mkfs.ubifs/crypto.c     | 327 ++++++++++++++++++++++++++++
 ubifs-utils/mkfs.ubifs/crypto.h     |  68 ++++++
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c |   6 +
 5 files changed, 405 insertions(+), 1 deletion(-)
 create mode 100644 ubifs-utils/mkfs.ubifs/crypto.c
 create mode 100644 ubifs-utils/mkfs.ubifs/crypto.h

diff --git a/configure.ac b/configure.ac
index c596eda4a797..346fcbd26328 100644
--- a/configure.ac
+++ b/configure.ac
@@ -115,6 +115,7 @@ AC_ARG_ENABLE([lsmtd],
 	esac],
 	[AM_CONDITIONAL([BUILD_LSMTD], [true])])
=20
+AC_CHECK_HEADER(openssl/rand.h)
=20
 AC_ARG_WITH([jffs],
 	[AS_HELP_STRING([--without-jffs], [Disable jffsX utilities])],
diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 879f91a98045..3dd299dd20cc 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -10,13 +10,14 @@ mkfs_ubifs_SOURCES =3D \
 	ubifs-utils/mkfs.ubifs/crc16.c \
 	ubifs-utils/mkfs.ubifs/lpt.c \
 	ubifs-utils/mkfs.ubifs/compr.c \
+	ubifs-utils/mkfs.ubifs/crypto.c \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable.c \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c \
 	ubifs-utils/mkfs.ubifs/devtable.c
-mkfs_ubifs_LDADD =3D libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(UUID_L=
IBS) $(LIBSELINUX_LIBS) -lm
+mkfs_ubifs_LDADD =3D libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(UUID_L=
IBS) $(LIBSELINUX_LIBS) -lm -lssl -lcrypto
 mkfs_ubifs_CPPFLAGS =3D $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(UU=
ID_CFLAGS) $(LIBSELINUX_CFLAGS)\
 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/mkfs.ubif=
s/
=20
@@ -28,6 +29,7 @@ UBIFS_HEADER =3D \
 	ubifs-utils/mkfs.ubifs/defs.h ubifs-utils/mkfs.ubifs/key.h \
 	ubifs-utils/mkfs.ubifs/lpt.h ubifs-utils/mkfs.ubifs/mkfs.ubifs.h \
 	ubifs-utils/mkfs.ubifs/ubifs.h \
+	ubifs-utils/mkfs.ubifs/crypto.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h
diff --git a/ubifs-utils/mkfs.ubifs/crypto.c b/ubifs-utils/mkfs.ubifs/cry=
pto.c
new file mode 100644
index 000000000000..a20bd56ba3db
--- /dev/null
+++ b/ubifs-utils/mkfs.ubifs/crypto.c
@@ -0,0 +1,327 @@
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
+ * Authors: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+ */
+
+#define PROGRAM_NAME "mkfs.ubifs"
+#include <openssl/evp.h>
+#include <openssl/err.h>
+#include <string.h>
+#include <assert.h>
+
+#include "crypto.h"
+#include "common.h"
+#include "mtd_swab.h"
+
+
+static struct cipher ciphers[] =3D {
+	{
+		.name =3D "AES-128-CBC",
+		.encrypt_block =3D encrypt_block_aes128_cbc,
+		.encrypt_fname =3D encrypt_aes128_cbc_cts,
+	}, {
+		.name =3D "AES-256-XTS",
+		.encrypt_block =3D encrypt_block_aes256_xts,
+		.encrypt_fname =3D encrypt_aes256_cbc_cts,
+	}
+};
+
+
+
+static int do_sha256(const unsigned char *in, size_t len, unsigned char =
*out)
+{
+	unsigned int out_len;
+	EVP_MD_CTX *mdctx =3D EVP_MD_CTX_create();
+
+	if (!mdctx)
+		return -1;
+
+	if (EVP_DigestInit_ex(mdctx, EVP_sha256(), NULL) !=3D 1)
+		return -1;
+
+	if(EVP_DigestUpdate(mdctx, in, len) !=3D 1)
+		return -1;
+
+	if(EVP_DigestFinal_ex(mdctx, out, &out_len) !=3D 1)
+		return -1;
+
+	EVP_MD_CTX_destroy(mdctx);
+
+	return 0;
+}
+
+static int check_iv_key_size(const EVP_CIPHER *cipher, size_t key_len,
+				size_t iv_len)
+{
+	if ((size_t)EVP_CIPHER_key_length(cipher) !=3D key_len) {
+		errmsg("Cipher key length mismatch. Expected %lu, got %d",
+			(unsigned long)key_len, EVP_CIPHER_key_length(cipher));
+		return -1;
+	}
+
+	if (iv_len && (size_t)EVP_CIPHER_iv_length(cipher) !=3D iv_len) {
+		errmsg("Cipher IV length mismatch. Expected %lu, got %d",
+			(unsigned long)iv_len, EVP_CIPHER_key_length(cipher));
+		return -1;
+	}
+
+	return 0;
+}
+
+static ssize_t do_encrypt(const EVP_CIPHER *cipher,
+				const void *plaintext, size_t size,
+				const void *key, size_t key_len,
+				const void *iv, size_t iv_len,
+				void *ciphertext)
+{
+	int ciphertext_len, len;
+	EVP_CIPHER_CTX *ctx;
+
+	if (check_iv_key_size(cipher, key_len, iv_len))
+		return -1;
+
+	if (!(ctx =3D EVP_CIPHER_CTX_new()))
+		goto fail;
+
+	EVP_CIPHER_CTX_set_padding(ctx, 0);
+
+	if (EVP_EncryptInit_ex(ctx, cipher, NULL, key, iv) !=3D 1)
+		goto fail_ctx;
+
+	if (EVP_EncryptUpdate(ctx, ciphertext, &len, plaintext, size) !=3D 1)
+		goto fail_ctx;
+
+	ciphertext_len =3D len;
+
+	EVP_CIPHER_CTX_free(ctx);
+	return ciphertext_len;
+fail_ctx:
+	ERR_print_errors_fp(stderr);
+	EVP_CIPHER_CTX_free(ctx);
+	return -1;
+fail:
+	ERR_print_errors_fp(stderr);
+	return -1;
+}
+
+static size_t gen_essiv_salt(const void *iv, size_t iv_len, const void *=
key, size_t key_len, void *salt)
+{
+	size_t ret;
+	const EVP_CIPHER *cipher;
+	void *sha256 =3D xzalloc(EVP_MD_size(EVP_sha256()));
+
+	cipher =3D EVP_aes_256_ecb();
+	if (!cipher) {
+		errmsg("OpenSSL: Cipher AES-256-ECB is not supported");
+		return -1;
+	}
+
+	if (do_sha256(key, key_len, sha256) !=3D 0) {
+		errmsg("sha256 failed");
+		return -1;
+	}
+
+	ret =3D do_encrypt(cipher, iv, iv_len, sha256, EVP_CIPHER_key_length(ci=
pher), NULL, 0, salt);
+	if (ret !=3D iv_len)
+		errmsg("Unable to compute ESSIV salt, return value %zi instead of %zi"=
, ret, iv_len);
+
+	free(sha256);
+
+	return ret;
+}
+
+
+static ssize_t encrypt_block(const void *plaintext, size_t size,
+			     const void *key, uint64_t block_index,
+			     void *ciphertext, const EVP_CIPHER *cipher)
+{
+	size_t key_len, ret, ivsize;
+	void *essiv_salt, *iv;
+
+	ivsize =3D EVP_CIPHER_iv_length(cipher);
+	key_len =3D EVP_CIPHER_key_length(cipher);
+
+	iv =3D alloca(ivsize);
+	essiv_salt =3D alloca(ivsize);
+
+	memset(iv, 0, ivsize);
+	*((uint64_t *)iv) =3D cpu_to_le64(block_index);
+
+	gen_essiv_salt(iv, ivsize, key, key_len, essiv_salt);
+
+	ret =3D do_encrypt(cipher, plaintext, size, key, key_len,
+			 essiv_salt, ivsize, ciphertext);
+	return ret;
+}
+
+ssize_t encrypt_block_aes128_cbc(const void *plaintext, size_t size,
+				 const void *key, uint64_t block_index,
+				 void *ciphertext)
+{
+	const EVP_CIPHER *cipher =3D EVP_aes_128_cbc();
+
+	if (!cipher) {
+		errmsg("OpenSSL: Cipher AES-128-CBC is not supported");
+		return -1;
+	}
+	return encrypt_block(plaintext, size, key, block_index,
+			     ciphertext, cipher);
+}
+
+ssize_t encrypt_block_aes256_xts(const void *plaintext, size_t size,
+				 const void *key, uint64_t block_index,
+				 void *ciphertext)
+{
+	const EVP_CIPHER *cipher =3D EVP_aes_256_xts();
+
+	if (!cipher) {
+		errmsg("OpenSSL: Cipher AES-256-XTS is not supported");
+		return -1;
+	}
+	return encrypt_block(plaintext, size, key, block_index,
+			     ciphertext, cipher);
+}
+
+static void block_swap(uint8_t *ciphertext, size_t i0, size_t i1,
+			size_t size)
+{
+	uint8_t temp[size], *p0, *p1;
+
+	p0 =3D ciphertext + i0 * size;
+	p1 =3D ciphertext + i1 * size;
+
+	memcpy(temp, p0, size);
+	memcpy(p0, p1, size);
+	memcpy(p1, temp, size);
+}
+
+static ssize_t encrypt_cbc_cts(const void *plaintext, size_t size,
+			       const void *key, void *ciphertext,
+			       const EVP_CIPHER *cipher)
+{
+	size_t diff, padded_size, count, ivsize;
+	uint8_t iv[EVP_MAX_IV_LENGTH], *padded;
+	ssize_t ret, key_len;
+
+	key_len =3D EVP_CIPHER_key_length(cipher);
+	ivsize =3D EVP_CIPHER_iv_length(cipher);
+
+	memset(iv, 0, ivsize);
+
+	diff =3D size % key_len;
+
+	if (diff) {
+		padded_size =3D size - diff + key_len;
+		padded =3D size > 256 ? malloc(padded_size) : alloca(padded_size);
+
+		memcpy(padded, plaintext, size);
+		memset(padded + size, 0, padded_size - size);
+
+		ret =3D do_encrypt(cipher, padded, padded_size, key, key_len,
+				 iv, sizeof(iv), ciphertext);
+
+		if (size > 256)
+			free(padded);
+	} else {
+		ret =3D do_encrypt(cipher, plaintext, size, key, key_len,
+				 iv, sizeof(iv), ciphertext);
+	}
+
+	if (ret < 0)
+		return ret;
+
+	count =3D ret / key_len;
+
+	if (count > 1)
+		block_swap(ciphertext, count - 2, count - 1, key_len);
+
+	return size;
+}
+
+ssize_t encrypt_aes128_cbc_cts(const void *plaintext, size_t size,
+				const void *key, void *ciphertext)
+{
+	const EVP_CIPHER *cipher =3D EVP_aes_128_cbc();
+	if (!cipher) {
+		errmsg("OpenSSL: Cipher AES-128-CBC is not supported");
+		return -1;
+	}
+
+	return encrypt_cbc_cts(plaintext, size, key, ciphertext, cipher);
+}
+
+ssize_t encrypt_aes256_cbc_cts(const void *plaintext, size_t size,
+				const void *key, void *ciphertext)
+{
+	const EVP_CIPHER *cipher =3D EVP_aes_256_cbc();
+	if (!cipher) {
+		errmsg("OpenSSL: Cipher AES-256-CBC is not supported");
+		return -1;
+	}
+
+	return encrypt_cbc_cts(plaintext, size, key, ciphertext, cipher);
+}
+
+ssize_t derive_key_aes(const void *deriving_key, const void *source_key,
+		       void *derived_key)
+{
+	const EVP_CIPHER *cipher;
+	size_t aes_key_len;
+
+	cipher =3D EVP_aes_128_ecb();
+	if (!cipher) {
+		errmsg("OpenSSL: Cipher AES-128-ECB is not supported");
+		return -1;
+	}
+	aes_key_len =3D EVP_CIPHER_key_length(cipher);
+
+	return do_encrypt(cipher, source_key, aes_key_len, deriving_key,
+			  aes_key_len, NULL, 0, derived_key);
+}
+
+int crypto_init(void)
+{
+	ERR_load_crypto_strings();
+	return 0;
+}
+
+void crypto_cleanup(void)
+{
+	EVP_cleanup();
+	ERR_free_strings();
+}
+
+struct cipher *get_cipher(const char *name)
+{
+	size_t i;
+
+	for (i =3D 0; i < sizeof(ciphers) / sizeof(ciphers[0]); ++i) {
+		if (!strcmp(ciphers[i].name, name))
+			return ciphers + i;
+	}
+
+	return NULL;
+}
+
+void list_ciphers(FILE *fp)
+{
+	size_t i;
+
+	for (i =3D 0; i < sizeof(ciphers) / sizeof(ciphers[0]); ++i) {
+		fprintf(fp, "\t%s\n", ciphers[i].name);
+	}
+}
diff --git a/ubifs-utils/mkfs.ubifs/crypto.h b/ubifs-utils/mkfs.ubifs/cry=
pto.h
new file mode 100644
index 000000000000..4e597004ec51
--- /dev/null
+++ b/ubifs-utils/mkfs.ubifs/crypto.h
@@ -0,0 +1,68 @@
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
+ * Authors: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+ */
+
+#ifndef UBIFS_CRYPTO_H
+#define UBIFS_CRYPTO_H
+
+#include <sys/types.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <stdio.h>
+
+
+struct cipher {
+	const char *name;
+
+	ssize_t (*encrypt_block)(const void *plaintext, size_t size,
+				 const void *key, uint64_t block_index,
+				 void *ciphertext);
+
+	ssize_t (*encrypt_fname)(const void *plaintext, size_t size,
+				 const void *key, void *ciphertext);
+};
+
+
+int crypto_init(void);
+
+void crypto_cleanup(void);
+
+ssize_t encrypt_block_aes128_cbc(const void *plaintext, size_t size,
+				 const void *key, uint64_t block_index,
+				 void *ciphertext);
+
+ssize_t encrypt_block_aes256_xts(const void *plaintext, size_t size,
+				 const void *key, uint64_t block_index,
+				 void *ciphertext);
+
+ssize_t encrypt_aes128_cbc_cts(const void *plaintext, size_t size,
+			       const void *key, void *ciphertext);
+
+ssize_t encrypt_aes256_cbc_cts(const void *plaintext, size_t size,
+			       const void *key, void *ciphertext);
+
+ssize_t derive_key_aes(const void *deriving_key, const void *source_key,
+		       void *derived_key);
+
+
+struct cipher *get_cipher(const char *name);
+
+void list_ciphers(FILE *fp);
+
+#endif /* UBIFS_CRYPTO_H */
+
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index c764a237135f..fd6538c6d4e1 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -35,6 +35,8 @@
 #include <selinux/label.h>
 #endif
=20
+#include "crypto.h"
+
 /* Size (prime number) of hash table for link counting */
 #define HASH_TABLE_SIZE 10099
=20
@@ -2625,6 +2627,9 @@ int main(int argc, char *argv[])
 {
 	int err;
=20
+	if (crypto_init())
+		return -1;
+
 	err =3D get_options(argc, argv);
 	if (err)
 		return err;
@@ -2646,5 +2651,6 @@ int main(int argc, char *argv[])
 	if (verbose)
 		printf("Success!\n");
=20
+	crypto_cleanup();
 	return 0;
 }
--=20
2.19.1

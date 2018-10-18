Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9SC-0002Sx-Pq
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 35/42] mkfs.ubifs: Fixup AES-XTS mode
Date: Thu, 18 Oct 2018 16:37:11 +0200
Message-Id: <20181018143718.26298-36-richard@nod.at>
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

In XTS mode we don't need ESSIV, just use the block number
as tweak.
Also apply EVP_EncryptFinal().

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/crypto.c  | 35 +++++++++++++++++++++-----------
 ubifs-utils/mkfs.ubifs/fscrypt.h |  4 ++++
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/crypto.c b/ubifs-utils/mkfs.ubifs/cry=
pto.c
index 7d35ae7473ba..d0f24e1a5f6f 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.c
+++ b/ubifs-utils/mkfs.ubifs/crypto.c
@@ -91,6 +91,13 @@ static ssize_t do_encrypt(const EVP_CIPHER *cipher,
=20
 	ciphertext_len =3D len;
=20
+	if (cipher =3D=3D EVP_aes_256_xts()) {
+		if (EVP_EncryptFinal(ctx, ciphertext + ciphertext_len, &len) !=3D 1)
+			goto fail_ctx;
+
+		ciphertext_len +=3D len;
+	}
+
 	EVP_CIPHER_CTX_free(ctx);
 	return ciphertext_len;
 fail_ctx:
@@ -128,28 +135,32 @@ static size_t gen_essiv_salt(const void *iv, size_t=
 iv_len, const void *key, siz
 	return ret;
 }
=20
-
 static ssize_t encrypt_block(const void *plaintext, size_t size,
 			     const void *key, uint64_t block_index,
 			     void *ciphertext, const EVP_CIPHER *cipher)
 {
-	size_t key_len, ret, ivsize;
-	void *essiv_salt, *iv;
+	size_t key_len, ivsize;
+	void *tweak;
+	struct {
+		uint64_t index;
+		uint8_t padding[FS_IV_SIZE - sizeof(uint64_t)];
+	} iv;
=20
 	ivsize =3D EVP_CIPHER_iv_length(cipher);
 	key_len =3D EVP_CIPHER_key_length(cipher);
=20
-	iv =3D alloca(ivsize);
-	essiv_salt =3D alloca(ivsize);
+	iv.index =3D cpu_to_le64(block_index);
+	memset(iv.padding, 0, sizeof(iv.padding));
=20
-	memset(iv, 0, ivsize);
-	*((uint64_t *)iv) =3D cpu_to_le64(block_index);
-
-	gen_essiv_salt(iv, ivsize, key, key_len, essiv_salt);
+	if (cipher =3D=3D EVP_aes_256_cbc()) {
+		tweak =3D alloca(ivsize);
+		gen_essiv_salt(&iv, FS_IV_SIZE, key, key_len, tweak);
+	} else {
+		tweak =3D &iv;
+	}
=20
-	ret =3D do_encrypt(cipher, plaintext, size, key, key_len,
-			 essiv_salt, ivsize, ciphertext);
-	return ret;
+	return do_encrypt(cipher, plaintext, size, key, key_len, tweak,
+			  ivsize, ciphertext);
 }
=20
 static ssize_t encrypt_block_aes128_cbc(const void *plaintext, size_t si=
ze,
diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.h b/ubifs-utils/mkfs.ubifs/fs=
crypt.h
index e39d7e105fda..e3cfee50290a 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.h
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.h
@@ -93,6 +93,10 @@ struct fscrypt_symlink_data {
 #define FS_MAX_KEY_SIZE	64
 #endif
=20
+#ifndef FS_IV_SIZE
+#define FS_IV_SIZE 16
+#endif
+
 unsigned char *calc_fscrypt_subkey(struct fscrypt_context *fctx);
=20
 struct fscrypt_context *inherit_fscrypt_context(struct fscrypt_context *=
fctx);
--=20
2.19.1

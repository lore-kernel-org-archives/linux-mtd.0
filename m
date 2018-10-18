Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RP-00046u-Qr
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:38:50 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 14/42] mkfs.ubifs: Pass source/dest key len to key derive
 function
Date: Thu, 18 Oct 2018 16:36:50 +0200
Message-Id: <20181018143718.26298-15-richard@nod.at>
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

fscrypto is using the max key lenth (64), so we cannot use the
AES-128-ECB len.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/crypto.c     | 4 ++--
 ubifs-utils/mkfs.ubifs/crypto.h     | 2 +-
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/crypto.c b/ubifs-utils/mkfs.ubifs/cry=
pto.c
index a20bd56ba3db..f249b49b5b59 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.c
+++ b/ubifs-utils/mkfs.ubifs/crypto.c
@@ -277,7 +277,7 @@ ssize_t encrypt_aes256_cbc_cts(const void *plaintext,=
 size_t size,
 }
=20
 ssize_t derive_key_aes(const void *deriving_key, const void *source_key,
-		       void *derived_key)
+		       size_t source_key_len, void *derived_key)
 {
 	const EVP_CIPHER *cipher;
 	size_t aes_key_len;
@@ -289,7 +289,7 @@ ssize_t derive_key_aes(const void *deriving_key, cons=
t void *source_key,
 	}
 	aes_key_len =3D EVP_CIPHER_key_length(cipher);
=20
-	return do_encrypt(cipher, source_key, aes_key_len, deriving_key,
+	return do_encrypt(cipher, source_key, source_key_len, deriving_key,
 			  aes_key_len, NULL, 0, derived_key);
 }
=20
diff --git a/ubifs-utils/mkfs.ubifs/crypto.h b/ubifs-utils/mkfs.ubifs/cry=
pto.h
index 4e597004ec51..5bff70fea29e 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.h
+++ b/ubifs-utils/mkfs.ubifs/crypto.h
@@ -57,7 +57,7 @@ ssize_t encrypt_aes256_cbc_cts(const void *plaintext, s=
ize_t size,
 			       const void *key, void *ciphertext);
=20
 ssize_t derive_key_aes(const void *deriving_key, const void *source_key,
-		       void *derived_key);
+		       size_t source_key_len, void *derived_key);
=20
=20
 struct cipher *get_cipher(const char *name);
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index a43b2a1620b1..c315e36dd3d3 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -526,7 +526,7 @@ static unsigned char *calc_fscrypt_subkey(struct fscr=
ypt_context *fctx)
 	int ret;
 	unsigned char *new_key =3D xmalloc(FS_MAX_KEY_SIZE);
=20
-	ret =3D derive_key_aes(fctx->nonce, fscrypt_masterkey, new_key);
+	ret =3D derive_key_aes(fctx->nonce, fscrypt_masterkey, FS_MAX_KEY_SIZE,=
 new_key);
 	if (ret < 0) {
 		err_msg("derive_key_aes failed: %i\n", ret);
=20
--=20
2.19.1

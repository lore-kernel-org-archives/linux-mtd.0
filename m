Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9SC-0002Rh-Pm
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:15 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 34/42] mkfs.ubifs: Use correct sizes for keys and hash lengths
Date: Thu, 18 Oct 2018 16:37:10 +0200
Message-Id: <20181018143718.26298-35-richard@nod.at>
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

This works currently by chance since the sizes match, but
that might change with different cipher setups.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/crypto.c  | 2 +-
 ubifs-utils/mkfs.ubifs/fscrypt.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/crypto.c b/ubifs-utils/mkfs.ubifs/cry=
pto.c
index ec414531e94a..7d35ae7473ba 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.c
+++ b/ubifs-utils/mkfs.ubifs/crypto.c
@@ -119,7 +119,7 @@ static size_t gen_essiv_salt(const void *iv, size_t i=
v_len, const void *key, siz
 		return -1;
 	}
=20
-	ret =3D do_encrypt(cipher, iv, iv_len, sha256, EVP_CIPHER_key_length(ci=
pher), NULL, 0, salt);
+	ret =3D do_encrypt(cipher, iv, iv_len, sha256, EVP_MD_size(EVP_sha256()=
), NULL, 0, salt);
 	if (ret !=3D iv_len)
 		errmsg("Unable to compute ESSIV salt, return value %zi instead of %zi"=
, ret, iv_len);
=20
diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.c b/ubifs-utils/mkfs.ubifs/fs=
crypt.c
index 2fc0ae8b3509..b9f9acc17c17 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.c
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.c
@@ -31,7 +31,7 @@ unsigned char *calc_fscrypt_subkey(struct fscrypt_conte=
xt *fctx)
 	int ret;
 	unsigned char *new_key =3D xmalloc(FS_MAX_KEY_SIZE);
=20
-	ret =3D derive_key_aes(fctx->nonce, fscrypt_masterkey, FS_MAX_KEY_SIZE,=
 new_key);
+	ret =3D derive_key_aes(fctx->nonce, fscrypt_masterkey, fscrypt_cipher->=
key_length, new_key);
 	if (ret < 0) {
 		err_msg("derive_key_aes failed: %i\n", ret);
=20
@@ -202,7 +202,7 @@ static int load_master_key(const char *key_file, stru=
ct cipher *fsc)
 		return -1;
 	}
=20
-	keysize =3D read(kf, fscrypt_masterkey, sizeof(fscrypt_masterkey));
+	keysize =3D read(kf, fscrypt_masterkey, fsc->key_length);
 	if (keysize < 0) {
 		sys_errmsg("read '%s'", key_file);
 		goto fail;
--=20
2.19.1

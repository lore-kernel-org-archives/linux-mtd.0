Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9SC-0002Ri-Pq
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 33/42] mkfs.ubifs: Enable Cipher selection
Date: Thu, 18 Oct 2018 16:37:09 +0200
Message-Id: <20181018143718.26298-34-richard@nod.at>
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

No longer hard code AES-128-CBC, we support AES-256-XTS too.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/crypto.c  | 7 +++++--
 ubifs-utils/mkfs.ubifs/crypto.h  | 3 +++
 ubifs-utils/mkfs.ubifs/fscrypt.c | 4 ++--
 ubifs-utils/mkfs.ubifs/fscrypt.h | 9 ++++++++-
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/crypto.c b/ubifs-utils/mkfs.ubifs/cry=
pto.c
index 8d113f198bb2..ec414531e94a 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.c
+++ b/ubifs-utils/mkfs.ubifs/crypto.c
@@ -23,9 +23,8 @@
 #include <string.h>
 #include <assert.h>
=20
-#include "crypto.h"
+#include "fscrypt.h"
 #include "common.h"
-#include "mtd_swab.h"
=20
 static int do_sha256(const unsigned char *in, size_t len, unsigned char =
*out)
 {
@@ -284,11 +283,15 @@ static struct cipher ciphers[] =3D {
 		.key_length =3D 16,
 		.encrypt_block =3D encrypt_block_aes128_cbc,
 		.encrypt_fname =3D encrypt_aes128_cbc_cts,
+		.fscrypt_block_mode =3D FS_ENCRYPTION_MODE_AES_128_CBC,
+		.fscrypt_fname_mode =3D FS_ENCRYPTION_MODE_AES_128_CTS,
 	}, {
 		.name =3D "AES-256-XTS",
 		.key_length =3D 64,
 		.encrypt_block =3D encrypt_block_aes256_xts,
 		.encrypt_fname =3D encrypt_aes256_cbc_cts,
+		.fscrypt_block_mode =3D FS_ENCRYPTION_MODE_AES_256_XTS,
+		.fscrypt_fname_mode =3D FS_ENCRYPTION_MODE_AES_256_CTS,
 	}
 };
=20
diff --git a/ubifs-utils/mkfs.ubifs/crypto.h b/ubifs-utils/mkfs.ubifs/cry=
pto.h
index 7fb2d3b8d005..c2631dd0fd89 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.h
+++ b/ubifs-utils/mkfs.ubifs/crypto.h
@@ -36,6 +36,9 @@ struct cipher {
=20
 	ssize_t (*encrypt_fname)(const void *plaintext, size_t size,
 				 const void *key, void *ciphertext);
+
+	unsigned int fscrypt_block_mode;
+	unsigned int fscrypt_fname_mode;
 };
=20
=20
diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.c b/ubifs-utils/mkfs.ubifs/fs=
crypt.c
index 02132e205a35..2fc0ae8b3509 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.c
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.c
@@ -253,8 +253,8 @@ struct fscrypt_context *init_fscrypt_context(const ch=
ar *cipher_name,
 	new_fctx =3D xmalloc(sizeof(*new_fctx));
=20
 	new_fctx->format =3D FS_ENCRYPTION_CONTEXT_FORMAT_V1;
-	new_fctx->contents_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CBC;
-	new_fctx->filenames_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CTS;
+	new_fctx->contents_encryption_mode =3D fscrypt_cipher->fscrypt_block_mo=
de;
+	new_fctx->filenames_encryption_mode =3D fscrypt_cipher->fscrypt_fname_m=
ode;
 	new_fctx->flags =3D flags;
=20
 	memcpy(&new_fctx->nonce, nonce, FS_KEY_DERIVATION_NONCE_SIZE);
diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.h b/ubifs-utils/mkfs.ubifs/fs=
crypt.h
index b6fb6d136e58..e39d7e105fda 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.h
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.h
@@ -26,13 +26,20 @@
 #include <sys/types.h>
 #include "crypto.h"
=20
-
 #ifndef FS_KEY_DESCRIPTOR_SIZE
 #define FS_KEY_DESCRIPTOR_SIZE  8
 #endif
 #define FS_ENCRYPTION_CONTEXT_FORMAT_V1 1
 #define FS_KEY_DERIVATION_NONCE_SIZE	16
=20
+#ifndef FS_ENCRYPTION_MODE_AES_256_XTS
+#define FS_ENCRYPTION_MODE_AES_256_XTS 1
+#endif
+
+#ifndef FS_ENCRYPTION_MODE_AES_256_CTS
+#define FS_ENCRYPTION_MODE_AES_256_CTS 4
+#endif
+
 #ifndef FS_ENCRYPTION_MODE_AES_128_CBC
 #define FS_ENCRYPTION_MODE_AES_128_CBC 5
 #endif
--=20
2.19.1

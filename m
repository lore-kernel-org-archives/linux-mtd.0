Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9Rv-0004N9-8L
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:40:48 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 27/42] mkfs.ubifs: Remove cipher implementations from public
 header
Date: Thu, 18 Oct 2018 16:37:03 +0200
Message-Id: <20181018143718.26298-28-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/crypto.c | 47 +++++++++++++++------------------
 ubifs-utils/mkfs.ubifs/crypto.h | 14 ----------
 2 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/crypto.c b/ubifs-utils/mkfs.ubifs/cry=
pto.c
index f249b49b5b59..f7b51357c04a 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.c
+++ b/ubifs-utils/mkfs.ubifs/crypto.c
@@ -27,21 +27,6 @@
 #include "common.h"
 #include "mtd_swab.h"
=20
-
-static struct cipher ciphers[] =3D {
-	{
-		.name =3D "AES-128-CBC",
-		.encrypt_block =3D encrypt_block_aes128_cbc,
-		.encrypt_fname =3D encrypt_aes128_cbc_cts,
-	}, {
-		.name =3D "AES-256-XTS",
-		.encrypt_block =3D encrypt_block_aes256_xts,
-		.encrypt_fname =3D encrypt_aes256_cbc_cts,
-	}
-};
-
-
-
 static int do_sha256(const unsigned char *in, size_t len, unsigned char =
*out)
 {
 	unsigned int out_len;
@@ -168,9 +153,9 @@ static ssize_t encrypt_block(const void *plaintext, s=
ize_t size,
 	return ret;
 }
=20
-ssize_t encrypt_block_aes128_cbc(const void *plaintext, size_t size,
-				 const void *key, uint64_t block_index,
-				 void *ciphertext)
+static ssize_t encrypt_block_aes128_cbc(const void *plaintext, size_t si=
ze,
+					const void *key, uint64_t block_index,
+					void *ciphertext)
 {
 	const EVP_CIPHER *cipher =3D EVP_aes_128_cbc();
=20
@@ -182,9 +167,9 @@ ssize_t encrypt_block_aes128_cbc(const void *plaintex=
t, size_t size,
 			     ciphertext, cipher);
 }
=20
-ssize_t encrypt_block_aes256_xts(const void *plaintext, size_t size,
-				 const void *key, uint64_t block_index,
-				 void *ciphertext)
+static ssize_t encrypt_block_aes256_xts(const void *plaintext, size_t si=
ze,
+					const void *key, uint64_t block_index,
+					void *ciphertext)
 {
 	const EVP_CIPHER *cipher =3D EVP_aes_256_xts();
=20
@@ -252,8 +237,8 @@ static ssize_t encrypt_cbc_cts(const void *plaintext,=
 size_t size,
 	return size;
 }
=20
-ssize_t encrypt_aes128_cbc_cts(const void *plaintext, size_t size,
-				const void *key, void *ciphertext)
+static ssize_t encrypt_aes128_cbc_cts(const void *plaintext, size_t size=
,
+				      const void *key, void *ciphertext)
 {
 	const EVP_CIPHER *cipher =3D EVP_aes_128_cbc();
 	if (!cipher) {
@@ -264,8 +249,8 @@ ssize_t encrypt_aes128_cbc_cts(const void *plaintext,=
 size_t size,
 	return encrypt_cbc_cts(plaintext, size, key, ciphertext, cipher);
 }
=20
-ssize_t encrypt_aes256_cbc_cts(const void *plaintext, size_t size,
-				const void *key, void *ciphertext)
+static ssize_t encrypt_aes256_cbc_cts(const void *plaintext, size_t size=
,
+				      const void *key, void *ciphertext)
 {
 	const EVP_CIPHER *cipher =3D EVP_aes_256_cbc();
 	if (!cipher) {
@@ -293,6 +278,18 @@ ssize_t derive_key_aes(const void *deriving_key, con=
st void *source_key,
 			  aes_key_len, NULL, 0, derived_key);
 }
=20
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
 int crypto_init(void)
 {
 	ERR_load_crypto_strings();
diff --git a/ubifs-utils/mkfs.ubifs/crypto.h b/ubifs-utils/mkfs.ubifs/cry=
pto.h
index 5bff70fea29e..b6a1e004f46d 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.h
+++ b/ubifs-utils/mkfs.ubifs/crypto.h
@@ -42,20 +42,6 @@ int crypto_init(void);
=20
 void crypto_cleanup(void);
=20
-ssize_t encrypt_block_aes128_cbc(const void *plaintext, size_t size,
-				 const void *key, uint64_t block_index,
-				 void *ciphertext);
-
-ssize_t encrypt_block_aes256_xts(const void *plaintext, size_t size,
-				 const void *key, uint64_t block_index,
-				 void *ciphertext);
-
-ssize_t encrypt_aes128_cbc_cts(const void *plaintext, size_t size,
-			       const void *key, void *ciphertext);
-
-ssize_t encrypt_aes256_cbc_cts(const void *plaintext, size_t size,
-			       const void *key, void *ciphertext);
-
 ssize_t derive_key_aes(const void *deriving_key, const void *source_key,
 		       size_t source_key_len, void *derived_key);
=20
--=20
2.19.1

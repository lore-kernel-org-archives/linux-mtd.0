Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9S6-0002RY-IF
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:08 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 30/42] mkfs.ubifs: Check length of master key
Date: Thu, 18 Oct 2018 16:37:06 +0200
Message-Id: <20181018143718.26298-31-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/crypto.c  | 2 ++
 ubifs-utils/mkfs.ubifs/crypto.h  | 1 +
 ubifs-utils/mkfs.ubifs/fscrypt.c | 9 +++++++--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/crypto.c b/ubifs-utils/mkfs.ubifs/cry=
pto.c
index f7b51357c04a..bd3273767a5b 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.c
+++ b/ubifs-utils/mkfs.ubifs/crypto.c
@@ -281,10 +281,12 @@ ssize_t derive_key_aes(const void *deriving_key, co=
nst void *source_key,
 static struct cipher ciphers[] =3D {
 	{
 		.name =3D "AES-128-CBC",
+		.key_length =3D 16,
 		.encrypt_block =3D encrypt_block_aes128_cbc,
 		.encrypt_fname =3D encrypt_aes128_cbc_cts,
 	}, {
 		.name =3D "AES-256-XTS",
+		.key_length =3D 64,
 		.encrypt_block =3D encrypt_block_aes256_xts,
 		.encrypt_fname =3D encrypt_aes256_cbc_cts,
 	}
diff --git a/ubifs-utils/mkfs.ubifs/crypto.h b/ubifs-utils/mkfs.ubifs/cry=
pto.h
index b6a1e004f46d..7fb2d3b8d005 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.h
+++ b/ubifs-utils/mkfs.ubifs/crypto.h
@@ -28,6 +28,7 @@
=20
 struct cipher {
 	const char *name;
+	unsigned int key_length;
=20
 	ssize_t (*encrypt_block)(const void *plaintext, size_t size,
 				 const void *key, uint64_t block_index,
diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.c b/ubifs-utils/mkfs.ubifs/fs=
crypt.c
index 68001e1d88f4..6d1fa4ba9d3f 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.c
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.c
@@ -188,7 +188,7 @@ static int parse_key_descriptor(const char *desc, __u=
8 *dst)
 	return 0;
 }
=20
-static int load_master_key(const char *key_file)
+static int load_master_key(const char *key_file, struct cipher *fsc)
 {
 	int kf;
 	ssize_t keysize;
@@ -208,6 +208,11 @@ static int load_master_key(const char *key_file)
 		err_msg("loading key from '%s': file is empty", key_file);
 		goto fail;
 	}
+	if (keysize < fsc->key_length) {
+		err_msg("key '%s' is too short (at least %u bytes required)",
+			key_file, fsc->key_length);
+		goto fail;
+	}
=20
 	close(kf);
 	return 0;
@@ -237,7 +242,7 @@ struct fscrypt_context *init_fscrypt_context(const ch=
ar *cipher_name,
 	if (parse_key_descriptor(key_descriptor, master_key_descriptor))
 		return NULL;
=20
-	if (load_master_key(key_file))
+	if (load_master_key(key_file, fscrypt_cipher))
 		return NULL;
=20
 	RAND_bytes((void *)nonce, FS_KEY_DERIVATION_NONCE_SIZE);
--=20
2.19.1

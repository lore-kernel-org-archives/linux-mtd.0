Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9SJ-0005Jl-T4
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:21 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 36/42] mkfs.ubifs: Compute encryption key descriptor
 automatically
Date: Thu, 18 Oct 2018 16:37:12 +0200
Message-Id: <20181018143718.26298-37-richard@nod.at>
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

...if none is given. To be compatible with fscryptctl.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/crypto.c     | 27 ++++++++++++++++++++++++---
 ubifs-utils/mkfs.ubifs/crypto.h     |  1 +
 ubifs-utils/mkfs.ubifs/fscrypt.c    | 11 ++++++++---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c |  2 --
 4 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/crypto.c b/ubifs-utils/mkfs.ubifs/cry=
pto.c
index d0f24e1a5f6f..50a09b53ebfe 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.c
+++ b/ubifs-utils/mkfs.ubifs/crypto.c
@@ -26,7 +26,7 @@
 #include "fscrypt.h"
 #include "common.h"
=20
-static int do_sha256(const unsigned char *in, size_t len, unsigned char =
*out)
+static int do_hash(const EVP_MD *md, const unsigned char *in, size_t len=
, unsigned char *out)
 {
 	unsigned int out_len;
 	EVP_MD_CTX *mdctx =3D EVP_MD_CTX_create();
@@ -34,7 +34,7 @@ static int do_sha256(const unsigned char *in, size_t le=
n, unsigned char *out)
 	if (!mdctx)
 		return -1;
=20
-	if (EVP_DigestInit_ex(mdctx, EVP_sha256(), NULL) !=3D 1)
+	if (EVP_DigestInit_ex(mdctx, md, NULL) !=3D 1)
 		return -1;
=20
 	if(EVP_DigestUpdate(mdctx, in, len) !=3D 1)
@@ -121,7 +121,7 @@ static size_t gen_essiv_salt(const void *iv, size_t i=
v_len, const void *key, siz
 		return -1;
 	}
=20
-	if (do_sha256(key, key_len, sha256) !=3D 0) {
+	if (do_hash(EVP_sha256(), key, key_len, sha256) !=3D 0) {
 		errmsg("sha256 failed");
 		return -1;
 	}
@@ -288,6 +288,27 @@ ssize_t derive_key_aes(const void *deriving_key, con=
st void *source_key,
 			  aes_key_len, NULL, 0, derived_key);
 }
=20
+int derive_key_descriptor(const void *source_key, void *descriptor)
+{
+	int ret =3D -1;
+	void *hash1 =3D xzalloc(EVP_MD_size(EVP_sha512()));
+	void *hash2 =3D xzalloc(EVP_MD_size(EVP_sha512()));
+
+	if (do_hash(EVP_sha512(), source_key, FS_MAX_KEY_SIZE, hash1) !=3D 0)
+		goto out;
+
+	if (do_hash(EVP_sha512(), hash1, EVP_MD_size(EVP_sha512()), hash2) !=3D=
 0)
+		goto out;
+
+	memcpy(descriptor, hash2, FS_KEY_DESCRIPTOR_SIZE);
+
+	ret =3D 0;
+out:
+	free(hash1);
+	free(hash2);
+	return ret;
+}
+
 static struct cipher ciphers[] =3D {
 	{
 		.name =3D "AES-128-CBC",
diff --git a/ubifs-utils/mkfs.ubifs/crypto.h b/ubifs-utils/mkfs.ubifs/cry=
pto.h
index c2631dd0fd89..f275839aa77d 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.h
+++ b/ubifs-utils/mkfs.ubifs/crypto.h
@@ -49,6 +49,7 @@ void crypto_cleanup(void);
 ssize_t derive_key_aes(const void *deriving_key, const void *source_key,
 		       size_t source_key_len, void *derived_key);
=20
+int derive_key_descriptor(const void *source_key, void *descriptor);
=20
 struct cipher *get_cipher(const char *name);
=20
diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.c b/ubifs-utils/mkfs.ubifs/fs=
crypt.c
index b9f9acc17c17..ce6e2fc29ce0 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.c
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.c
@@ -242,12 +242,17 @@ struct fscrypt_context *init_fscrypt_context(const =
char *cipher_name,
 		return NULL;
 	}
=20
-	if (parse_key_descriptor(key_descriptor, master_key_descriptor))
-		return NULL;
-
 	if (load_master_key(key_file, fscrypt_cipher))
 		return NULL;
=20
+	if (!key_descriptor) {
+		if (derive_key_descriptor(fscrypt_masterkey, master_key_descriptor))
+			return NULL;
+	} else {
+		if (parse_key_descriptor(key_descriptor, master_key_descriptor))
+			return NULL;
+	}
+
 	RAND_bytes((void *)nonce, FS_KEY_DERIVATION_NONCE_SIZE);
=20
 	new_fctx =3D xmalloc(sizeof(*new_fctx));
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 9bd15a2f047a..f8d8e52f1bae 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -752,8 +752,6 @@ static int get_options(int argc, char**argv)
 	if (key_file || key_desc) {
 		if (!key_file)
 			return err_msg("no key file specified");
-		if (!key_desc)
-			return err_msg("no key descriptor specified");
=20
 		c->double_hash =3D 1;
 		c->encrypted =3D 1;
--=20
2.19.1

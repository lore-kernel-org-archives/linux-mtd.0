Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9S6-0002Qp-IJ
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:08 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 22/42] mkfs.ubifs: Replace constant values with parameters in
 init_fscrypt_context
Date: Thu, 18 Oct 2018 16:36:58 +0200
Message-Id: <20181018143718.26298-23-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index ae1d26726deb..8be84ca1e99c 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -581,16 +581,20 @@ static void print_fscrypt_master_key_descriptor(str=
uct fscrypt_context *fctx)
 	normsg("");
 }
=20
-static struct fscrypt_context *init_fscrypt_context(void)
+static struct fscrypt_context *init_fscrypt_context(unsigned int flags,
+						void *master_key_descriptor,
+						void *nonce)
 {
 	struct fscrypt_context *new_fctx =3D xmalloc(sizeof(*new_fctx));
=20
 	new_fctx->format =3D FS_ENCRYPTION_CONTEXT_FORMAT_V1;
 	new_fctx->contents_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CBC;
 	new_fctx->filenames_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CTS;
-	new_fctx->flags =3D FS_POLICY_FLAGS_PAD_4;
-	RAND_bytes((void *)&new_fctx->nonce, FS_KEY_DERIVATION_NONCE_SIZE);
+	new_fctx->flags =3D flags;
=20
+	memcpy(&new_fctx->nonce, nonce, FS_KEY_DERIVATION_NONCE_SIZE);
+	memcpy(&new_fctx->master_key_descriptor, master_key_descriptor,
+		FS_KEY_DESCRIPTOR_SIZE);
 	return new_fctx;
 }
=20
@@ -2779,6 +2783,8 @@ static int close_target(void)
  */
 static int init(void)
 {
+	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+	__u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
 	int err, i, main_lebs, big_lpt =3D 0, sz;
=20
 	c->highest_inum =3D UBIFS_FIRST_INO;
@@ -2821,7 +2827,11 @@ static int init(void)
 	hash_table =3D xzalloc(sz);
=20
 	//TODO make this a parameter
-	root_fctx =3D init_fscrypt_context();
+	RAND_bytes((void *)master_key_descriptor, FS_KEY_DESCRIPTOR_SIZE);
+	RAND_bytes((void *)nonce, FS_KEY_DERIVATION_NONCE_SIZE);
+
+	root_fctx =3D init_fscrypt_context(FS_POLICY_FLAGS_PAD_4,
+					master_key_descriptor, nonce);
 	print_fscrypt_master_key_descriptor(root_fctx);
 	c->double_hash =3D 1;
 	c->encrypted =3D 1;
--=20
2.19.1

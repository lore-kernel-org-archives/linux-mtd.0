Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RP-000453-Rz
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:38:50 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 07/42] mkfs.ubifs: Add basic fscrypto functions
Date: Thu, 18 Oct 2018 16:36:43 +0200
Message-Id: <20181018143718.26298-8-richard@nod.at>
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

...maybe we should add them to crypto.c?

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 67 +++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 2649c34cdd68..fc1b0cb1f6cc 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -518,6 +518,73 @@ static long long get_bytes(const char *str)
=20
 	return bytes;
 }
+
+static unsigned char *calc_fscrypt_subkey(struct fscrypt_context *fctx)
+{
+	int ret;
+	unsigned char *new_key =3D xmalloc(FS_MAX_KEY_SIZE);
+
+	ret =3D derive_key_aes(fctx->nonce, fscrypt_masterkey, new_key);
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
+static struct fscrypt_context *inherit_fscrypt_context(struct fscrypt_co=
ntext *fctx)
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
+static void free_fscrypt_context(struct fscrypt_context *fctx)
+{
+	free(fctx);
+}
+
+static void print_fscrypt_master_key_descriptor(struct fscrypt_context *=
fctx)
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
+static struct fscrypt_context *init_fscrypt_context(void)
+{
+	struct fscrypt_context *new_fctx =3D xmalloc(sizeof(*new_fctx));
+
+	new_fctx->format =3D FS_ENCRYPTION_CONTEXT_FORMAT_V1;
+	new_fctx->contents_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CBC;
+	new_fctx->filenames_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CTS;
+	//TODO  accept padding via a parameter
+	new_fctx->flags =3D FS_POLICY_FLAGS_PAD_4;
+	//TODO  accept descriptor via a parameter
+	RAND_bytes((void *)&new_fctx->master_key_descriptor, FS_KEY_DESCRIPTOR_=
SIZE);
+	RAND_bytes((void *)&new_fctx->nonce, FS_KEY_DERIVATION_NONCE_SIZE);
+
+	return new_fctx;
+}
+
 /**
  * open_ubi - open the UBI volume.
  * @node: name of the UBI volume character device to fetch information a=
bout
--=20
2.19.1

Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9SJ-0005Jn-T7
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:20 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 41/42] mkfs.ubifs: Print key descriptor only when generated
Date: Thu, 18 Oct 2018 16:37:17 +0200
Message-Id: <20181018143718.26298-42-richard@nod.at>
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

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/fscrypt.c    | 5 +++--
 ubifs-utils/mkfs.ubifs/fscrypt.h    | 1 -
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.c b/ubifs-utils/mkfs.ubifs/fs=
crypt.c
index 3d4bff618050..6d2b650d626d 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.c
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.c
@@ -65,13 +65,13 @@ void free_fscrypt_context(struct fscrypt_context *fct=
x)
 	free(fctx);
 }
=20
-void print_fscrypt_master_key_descriptor(struct fscrypt_context *fctx)
+static void print_fscrypt_master_key_descriptor(__u8 *master_key_descrip=
tor)
 {
 	int i;
=20
 	normsg_cont("fscrypt master key descriptor: 0x");
 	for (i =3D 0; i < FS_KEY_DESCRIPTOR_SIZE; i++) {
-		printf("%02x", fctx->master_key_descriptor[i]);
+		printf("%02x", master_key_descriptor[i]);
 	}
 	printf("\n");
 }
@@ -248,6 +248,7 @@ struct fscrypt_context *init_fscrypt_context(const ch=
ar *cipher_name,
 	if (!key_descriptor) {
 		if (derive_key_descriptor(fscrypt_masterkey, master_key_descriptor))
 			return NULL;
+		print_fscrypt_master_key_descriptor(master_key_descriptor);
 	} else {
 		if (parse_key_descriptor(key_descriptor, master_key_descriptor))
 			return NULL;
diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.h b/ubifs-utils/mkfs.ubifs/fs=
crypt.h
index 3b717b4359c6..34b799c94c2b 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.h
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.h
@@ -101,7 +101,6 @@ struct fscrypt_symlink_data {
 unsigned char *calc_fscrypt_subkey(struct fscrypt_context *fctx);
 struct fscrypt_context *inherit_fscrypt_context(struct fscrypt_context *=
fctx);
 void free_fscrypt_context(struct fscrypt_context *fctx);
-void print_fscrypt_master_key_descriptor(struct fscrypt_context *fctx);
 unsigned int fscrypt_fname_encrypted_size(struct fscrypt_context *fctx,
 					  unsigned int ilen);
 int encrypt_path(void **outbuf, void *data, unsigned int data_len,
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 7073bf052688..a60d392bbc81 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -772,8 +772,6 @@ static int get_options(int argc, char**argv)
 						key_file, key_desc);
 		if (!root_fctx)
 			return -1;
-
-		print_fscrypt_master_key_descriptor(root_fctx);
 #else
 		return err_msg("mkfs.ubifs was built without crypto support.");
 #endif
--=20
2.19.1

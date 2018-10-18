Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9Rj-0004Dr-BO
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:46 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 15/42] mkfs.ubifs: Add encrypted symlink support
Date: Thu, 18 Oct 2018 16:36:51 +0200
Message-Id: <20181018143718.26298-16-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 75 ++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 7 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index c315e36dd3d3..4ffd8fd51e41 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -155,6 +155,16 @@ struct fscrypt_context {
 	__u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
 } __attribute__((packed));
=20
+/**
+ * For encrypted symlinks, the ciphertext length is stored at the beginn=
ing
+ * of the string in little-endian format.
+ */
+struct fscrypt_symlink_data {
+	__le16 len;
+	char encrypted_path[1];
+} __attribute__((packed));
+
+
 #ifndef FS_MAX_KEY_SIZE
 #define FS_MAX_KEY_SIZE	64
 #endif
@@ -578,15 +588,22 @@ static struct fscrypt_context *init_fscrypt_context=
(void)
 	new_fctx->format =3D FS_ENCRYPTION_CONTEXT_FORMAT_V1;
 	new_fctx->contents_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CBC;
 	new_fctx->filenames_encryption_mode =3D FS_ENCRYPTION_MODE_AES_128_CTS;
-	//TODO  accept padding via a parameter
 	new_fctx->flags =3D FS_POLICY_FLAGS_PAD_4;
-	//TODO  accept descriptor via a parameter
-	RAND_bytes((void *)&new_fctx->master_key_descriptor, FS_KEY_DESCRIPTOR_=
SIZE);
 	RAND_bytes((void *)&new_fctx->nonce, FS_KEY_DERIVATION_NONCE_SIZE);
=20
 	return new_fctx;
 }
=20
+unsigned int fscrypt_fname_encrypted_size(struct fscrypt_context *fctx, =
unsigned int ilen)
+{
+	int padding;
+
+	padding =3D 4 << (fctx->flags & FS_POLICY_FLAGS_PAD_MASK);
+	ilen =3D max_t(unsigned int, ilen, FS_CRYPTO_BLOCK_SIZE);
+	return round_up(ilen, padding);
+}
+
+
 /**
  * open_ubi - open the UBI volume.
  * @node: name of the UBI volume character device to fetch information a=
bout
@@ -1478,11 +1495,54 @@ static int add_inode(struct stat *st, ino_t inum,=
 void *data,
 	ino->gid        =3D cpu_to_le32(st->st_gid);
 	ino->mode       =3D cpu_to_le32(st->st_mode);
 	ino->flags      =3D cpu_to_le32(use_flags);
-	ino->data_len   =3D cpu_to_le32(data_len);
 	ino->compr_type =3D cpu_to_le16(c->default_compr);
-	if (data_len)
-		memcpy(&ino->data, data, data_len);
+	if (data_len) {
+		if (!S_ISLNK(st->st_mode))
+			return err_msg("Expected symlink");
=20
+		if (!fctx) {
+			memcpy(&ino->data, data, data_len);
+		} else {
+			//TODO turn this into a common helper
+			struct fscrypt_symlink_data *sd;
+			void *inbuf, *outbuf, *crypt_key;
+			unsigned int max_namelen =3D UBIFS_MAX_INO_DATA;
+			unsigned int padding =3D 4 << (fctx->flags & FS_POLICY_FLAGS_PAD_MASK=
);
+			unsigned int cryptlen;
+			unsigned int link_disk_len =3D fscrypt_fname_encrypted_size(fctx, dat=
a_len) + sizeof(struct fscrypt_symlink_data);
+
+			cryptlen =3D max_t(unsigned int, data_len, FS_CRYPTO_BLOCK_SIZE);
+			cryptlen =3D round_up(cryptlen, padding);
+			cryptlen =3D min(cryptlen, max_namelen);
+
+			sd =3D xzalloc(link_disk_len);
+			inbuf =3D xmalloc(cryptlen);
+			/* CTS mode needs a block size aligned buffer */
+			outbuf =3D xmalloc(round_up(cryptlen, FS_CRYPTO_BLOCK_SIZE));
+
+			memset(inbuf, 0, cryptlen);
+			memcpy(inbuf, data, data_len);
+
+			crypt_key =3D calc_fscrypt_subkey(fctx);
+			if (!crypt_key)
+				return err_msg("could not compute subkey");
+			if (encrypt_aes128_cbc_cts(inbuf, cryptlen, crypt_key, outbuf) < 0)
+				return err_msg("could not encrypt filename");
+
+			memcpy(sd->encrypted_path, outbuf, cryptlen);
+			sd->len =3D cpu_to_le16(cryptlen);
+			memcpy(&ino->data, sd, link_disk_len);
+			((char *)&ino->data)[link_disk_len - 1] =3D '\0';
+
+			data_len =3D link_disk_len;
+
+			free(crypt_key);
+			free(inbuf);
+			free(outbuf);
+			free(sd);
+		}
+	}
+	ino->data_len   =3D cpu_to_le32(data_len);
 	len =3D UBIFS_INO_NODE_SZ + data_len;
=20
 	if (xattr_path) {
@@ -1635,7 +1695,8 @@ static int add_dent_node(ino_t dir_inum, const char=
 *name, ino_t inum,
 		cryptlen =3D min(cryptlen, max_namelen);
=20
 		inbuf =3D xmalloc(cryptlen);
-		outbuf =3D xmalloc(cryptlen + 32);
+		/* CTS mode needs a block size aligned buffer */
+		outbuf =3D xmalloc(round_up(cryptlen, FS_CRYPTO_BLOCK_SIZE));
=20
 		memset(inbuf, 0, cryptlen);
 		memcpy(inbuf, dname.name, dname.len);
--=20
2.19.1

Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9Rj-0004Dq-Az
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:31 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 16/42] mkfs.ubifs: Implement file contents encryption
Date: Thu, 18 Oct 2018 16:36:52 +0200
Message-Id: <20181018143718.26298-17-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 39 ++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 4ffd8fd51e41..b7d68c60d481 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1817,10 +1817,9 @@ static int add_file(const char *path_name, struct =
stat *st, ino_t inum,
 		}
 		/* Make data node */
 		memset(dn, 0, UBIFS_DATA_NODE_SZ);
-		data_key_init(&key, inum, block_no++);
+		data_key_init(&key, inum, block_no);
 		dn->ch.node_type =3D UBIFS_DATA_NODE;
 		key_write(&key, &dn->key);
-		dn->size =3D cpu_to_le32(bytes_read);
 		out_len =3D NODE_BUFFER_SIZE - UBIFS_DATA_NODE_SZ;
 		if (c->default_compr =3D=3D UBIFS_COMPR_NONE &&
 		    (flags & FS_COMPR_FL))
@@ -1834,7 +1833,39 @@ static int add_file(const char *path_name, struct =
stat *st, ino_t inum,
 		compr_type =3D compress_data(buf, bytes_read, &dn->data,
 					   &out_len, use_compr);
 		dn->compr_type =3D cpu_to_le16(compr_type);
-		//TODO: encrypt
+		dn->size =3D cpu_to_le32(bytes_read);
+
+		if (!fctx) {
+			dn->compr_size =3D 0;
+		} else {
+			void *inbuf, *outbuf, *crypt_key;
+			size_t ret, pad_len =3D round_up(out_len, FS_CRYPTO_BLOCK_SIZE);
+
+			dn->compr_size =3D out_len;
+
+			inbuf =3D xzalloc(pad_len);
+			outbuf =3D xzalloc(pad_len);
+
+			memcpy(inbuf, &dn->data, out_len);
+
+			crypt_key =3D calc_fscrypt_subkey(fctx);
+			if (!crypt_key)
+				return err_msg("could not compute subkey");
+
+			ret =3D encrypt_block_aes128_cbc(inbuf, pad_len, crypt_key, block_no,
+						       outbuf);
+			if (ret !=3D pad_len)
+				return err_msg("encrypt_block_aes128_cbc returned %zi instead of %zi=
", ret, pad_len);
+
+			memcpy(&dn->data, outbuf, pad_len);
+
+			out_len =3D pad_len;
+
+			free(inbuf);
+			free(outbuf);
+			free(crypt_key);
+		}
+
 		dn_len =3D UBIFS_DATA_NODE_SZ + out_len;
 		/* Add data node to file system */
 		err =3D add_node(&key, NULL, 0, dn, dn_len);
@@ -1842,6 +1873,8 @@ static int add_file(const char *path_name, struct s=
tat *st, ino_t inum,
 			close(fd);
 			return err;
 		}
+
+		block_no++;
 	} while (ret !=3D 0);
=20
 	if (close(fd) =3D=3D -1)
--=20
2.19.1

Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9Rv-0004KS-98
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:40:26 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 20/42] mkfs.ubifs: Seperate path encryption from symlink
 encryption helper
Date: Thu, 18 Oct 2018 16:36:56 +0200
Message-Id: <20181018143718.26298-21-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 36 ++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 66ca061cc225..49a895ae3682 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1451,24 +1451,20 @@ static int set_fscrypt_context(struct ubifs_ino_n=
ode *host_ino, ino_t inum,
 			 fctx, sizeof(*fctx));
 }
=20
-static int encrypt_symlink(void *dst, void *data, unsigned int data_len,
-			   struct fscrypt_context *fctx)
+static int encrypt_path(void **outbuf, void *data, unsigned int data_len=
,
+			unsigned int max_namelen, struct fscrypt_context *fctx)
 {
-	struct fscrypt_symlink_data *sd;
-	void *inbuf, *outbuf, *crypt_key;
-	unsigned int max_namelen =3D UBIFS_MAX_INO_DATA;
+	void *inbuf, *crypt_key;
 	unsigned int padding =3D 4 << (fctx->flags & FS_POLICY_FLAGS_PAD_MASK);
 	unsigned int cryptlen;
-	unsigned int link_disk_len =3D fscrypt_fname_encrypted_size(fctx, data_=
len) + sizeof(struct fscrypt_symlink_data);
=20
 	cryptlen =3D max_t(unsigned int, data_len, FS_CRYPTO_BLOCK_SIZE);
 	cryptlen =3D round_up(cryptlen, padding);
 	cryptlen =3D min(cryptlen, max_namelen);
=20
-	sd =3D xzalloc(link_disk_len);
 	inbuf =3D xmalloc(cryptlen);
 	/* CTS mode needs a block size aligned buffer */
-	outbuf =3D xmalloc(round_up(cryptlen, FS_CRYPTO_BLOCK_SIZE));
+	*outbuf =3D xmalloc(round_up(cryptlen, FS_CRYPTO_BLOCK_SIZE));
=20
 	memset(inbuf, 0, cryptlen);
 	memcpy(inbuf, data, data_len);
@@ -1476,16 +1472,34 @@ static int encrypt_symlink(void *dst, void *data,=
 unsigned int data_len,
 	crypt_key =3D calc_fscrypt_subkey(fctx);
 	if (!crypt_key)
 		return err_msg("could not compute subkey");
-	if (encrypt_aes128_cbc_cts(inbuf, cryptlen, crypt_key, outbuf) < 0)
+	if (encrypt_aes128_cbc_cts(inbuf, cryptlen, crypt_key, *outbuf) < 0)
 		return err_msg("could not encrypt filename");
=20
+	free(crypt_key);
+	free(inbuf);
+	return cryptlen;
+}
+
+static int encrypt_symlink(void *dst, void *data, unsigned int data_len,
+			   struct fscrypt_context *fctx)
+{
+	struct fscrypt_symlink_data *sd;
+	void *outbuf;
+	unsigned int link_disk_len =3D fscrypt_fname_encrypted_size(fctx, data_=
len) + sizeof(struct fscrypt_symlink_data);
+	unsigned int cryptlen;
+	int ret;
+
+	ret =3D encrypt_path(&outbuf, data, data_len, UBIFS_MAX_INO_DATA, fctx)=
;
+	if (ret < 0)
+		return ret;
+	cryptlen =3D ret;
+
+	sd =3D xzalloc(link_disk_len);
 	memcpy(sd->encrypted_path, outbuf, cryptlen);
 	sd->len =3D cpu_to_le16(cryptlen);
 	memcpy(dst, sd, link_disk_len);
 	((char *)dst)[link_disk_len - 1] =3D '\0';
=20
-	free(crypt_key);
-	free(inbuf);
 	free(outbuf);
 	free(sd);
 	return link_disk_len;
--=20
2.19.1

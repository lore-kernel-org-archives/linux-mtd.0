Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9Rv-0004MX-A6
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:40:36 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 21/42] mkfs.ubifs: Cleanup add_dent_node,
 user path encryption helper
Date: Thu, 18 Oct 2018 16:36:57 +0200
Message-Id: <20181018143718.26298-22-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 55 ++++++++---------------------
 1 file changed, 15 insertions(+), 40 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 49a895ae3682..ae1d26726deb 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1703,53 +1703,28 @@ static int add_dent_node(ino_t dir_inum, const ch=
ar *name, ino_t inum,
 	set_dent_cookie(dent);
=20
 	if (!fctx) {
-		dent_key_init(c, &key, dir_inum, dname.name, dname.len);
-		dent->nlen =3D cpu_to_le16(dname.len);
-		memcpy(dent->name, dname.name, dname.len);
-		dent->name[dname.len] =3D '\0';
-		len =3D UBIFS_DENT_NODE_SZ + dname.len + 1;
-
 		kname_len =3D dname.len;
 		kname =3D strdup(name);
 		if (!kname)
 			return err_msg("cannot allocate memory");
 	} else {
-		void *inbuf, *outbuf, *crypt_key;
 		unsigned int max_namelen =3D type =3D=3D UBIFS_ITYPE_LNK ? UBIFS_MAX_I=
NO_DATA : UBIFS_MAX_NLEN;
-		unsigned int padding =3D 4 << (fctx->flags & FS_POLICY_FLAGS_PAD_MASK)=
;
-		unsigned int cryptlen;
-
-		cryptlen =3D max_t(unsigned int, dname.len, FS_CRYPTO_BLOCK_SIZE);
-		cryptlen =3D round_up(cryptlen, padding);
-		cryptlen =3D min(cryptlen, max_namelen);
-
-		inbuf =3D xmalloc(cryptlen);
-		/* CTS mode needs a block size aligned buffer */
-		outbuf =3D xmalloc(round_up(cryptlen, FS_CRYPTO_BLOCK_SIZE));
-
-		memset(inbuf, 0, cryptlen);
-		memcpy(inbuf, dname.name, dname.len);
-
-		crypt_key =3D calc_fscrypt_subkey(fctx);
-		if (!crypt_key)
-			return err_msg("could not compute subkey");
-		if (encrypt_aes128_cbc_cts(inbuf, cryptlen, crypt_key, outbuf) < 0)
-			return err_msg("could not encrypt filename");
-
-		dent->nlen =3D cpu_to_le16(cryptlen);
-		memcpy(dent->name, outbuf, cryptlen);
-		dent->name[cryptlen] =3D '\0';
-		len =3D UBIFS_DENT_NODE_SZ + cryptlen + 1;
-
-		dent_key_init(c, &key, dir_inum, outbuf, cryptlen);
-
-		kname_len =3D cryptlen;
-		kname =3D xmalloc(cryptlen);
-		memcpy(kname, outbuf, cryptlen);
-		free(crypt_key);
-		free(inbuf);
-		free(outbuf);
+		int ret;
+
+		ret =3D encrypt_path((void **)&kname, dname.name, dname.len,
+				   max_namelen, fctx);
+		if (ret < 0)
+			return ret;
+
+		kname_len =3D ret;
 	}
+
+	dent_key_init(c, &key, dir_inum, kname, kname_len);
+	dent->nlen =3D cpu_to_le16(kname_len);
+	memcpy(dent->name, kname, kname_len);
+	dent->name[kname_len] =3D '\0';
+	len =3D UBIFS_DENT_NODE_SZ + kname_len + 1;
+
 	key_write(&key, dent->key);
=20
 	return add_node(&key, kname, kname_len, dent, len);
--=20
2.19.1

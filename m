Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RP-00045k-Qa
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:38:50 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 12/42] mkfs.ubifs: Implement filename encryption
Date: Thu, 18 Oct 2018 16:36:48 +0200
Message-Id: <20181018143718.26298-13-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/key.h        |  4 +-
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 61 +++++++++++++++++++++++------
 2 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/key.h b/ubifs-utils/mkfs.ubifs/key.h
index 0c7922b67687..c18e35e8f0a3 100644
--- a/ubifs-utils/mkfs.ubifs/key.h
+++ b/ubifs-utils/mkfs.ubifs/key.h
@@ -110,9 +110,9 @@ static inline void ino_key_init(union ubifs_key *key,=
 ino_t inum)
  */
 static inline void dent_key_init(const struct ubifs_info *c,
 				 union ubifs_key *key, ino_t inum,
-				 const struct qstr *nm)
+				 const void *name, int name_len)
 {
-	uint32_t hash =3D c->key_hash(nm->name, nm->len);
+	uint32_t hash =3D c->key_hash(name, name_len);
=20
 	assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
 	key->u32[0] =3D inum;
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 469d5874eaa2..7deca96e7953 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1596,6 +1596,7 @@ static int add_dent_node(ino_t dir_inum, const char=
 *name, ino_t inum,
 	union ubifs_key key;
 	struct qstr dname;
 	char *kname;
+	int kname_len;
 	int len;
=20
 	dbg_msg(3, "%s ino %lu type %u dir ino %lu", name, (unsigned long)inum,
@@ -1607,23 +1608,61 @@ static int add_dent_node(ino_t dir_inum, const ch=
ar *name, ino_t inum,
=20
 	dent->ch.node_type =3D UBIFS_DENT_NODE;
=20
-	dent_key_init(c, &key, dir_inum, &dname);
-	key_write(&key, dent->key);
 	dent->inum =3D cpu_to_le64(inum);
 	dent->padding1 =3D 0;
 	dent->type =3D type;
-	dent->nlen =3D cpu_to_le16(dname.len);
-	memcpy(dent->name, dname.name, dname.len);
-	dent->name[dname.len] =3D '\0';
 	set_dent_cookie(dent);
=20
-	len =3D UBIFS_DENT_NODE_SZ + dname.len + 1;
-
-	kname =3D strdup(name);
-	if (!kname)
-		return err_msg("cannot allocate memory");
+	if (!fctx) {
+		dent_key_init(c, &key, dir_inum, dname.name, dname.len);
+		dent->nlen =3D cpu_to_le16(dname.len);
+		memcpy(dent->name, dname.name, dname.len);
+		dent->name[dname.len] =3D '\0';
+		len =3D UBIFS_DENT_NODE_SZ + dname.len + 1;
+
+		kname_len =3D dname.len;
+		kname =3D strdup(name);
+		if (!kname)
+			return err_msg("cannot allocate memory");
+	} else {
+		void *inbuf, *outbuf, *crypt_key;
+		unsigned int max_namelen =3D type =3D=3D UBIFS_ITYPE_LNK ? UBIFS_MAX_I=
NO_DATA : UBIFS_MAX_NLEN;
+		unsigned int padding =3D 4 << (fctx->flags & FS_POLICY_FLAGS_PAD_MASK)=
;
+		unsigned int cryptlen;
+
+		cryptlen =3D max_t(unsigned int, dname.len, FS_CRYPTO_BLOCK_SIZE);
+		cryptlen =3D round_up(cryptlen, padding);
+		cryptlen =3D min(cryptlen, max_namelen);
+
+		inbuf =3D xmalloc(cryptlen);
+		outbuf =3D xmalloc(cryptlen + 32);
+
+		memset(inbuf, 0, cryptlen);
+		memcpy(inbuf, dname.name, dname.len);
+
+		crypt_key =3D calc_fscrypt_subkey(fctx);
+		if (!crypt_key)
+			return err_msg("could not compute subkey");
+		if (encrypt_aes128_cbc_cts(inbuf, cryptlen, crypt_key, outbuf) < 0)
+			return err_msg("could not encrypt filename");
+
+		dent->nlen =3D cpu_to_le16(cryptlen);
+		memcpy(dent->name, outbuf, cryptlen);
+		dent->name[cryptlen] =3D '\0';
+		len =3D UBIFS_DENT_NODE_SZ + cryptlen + 1;
+
+		dent_key_init(c, &key, dir_inum, outbuf, cryptlen);
+
+		kname_len =3D cryptlen;
+		kname =3D xmalloc(cryptlen);
+		memcpy(kname, outbuf, cryptlen);
+		free(crypt_key);
+		free(inbuf);
+		free(outbuf);
+	}
+	key_write(&key, dent->key);
=20
-	return add_node(&key, kname, dname.len, dent, len);
+	return add_node(&key, kname, kname_len, dent, len);
 }
=20
 /**
--=20
2.19.1

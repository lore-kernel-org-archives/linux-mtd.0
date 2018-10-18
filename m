Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RP-00045e-Qt
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:09 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 10/42] mkfs.ubifs: Implement fscrypto context store as xattr
Date: Thu, 18 Oct 2018 16:36:46 +0200
Message-Id: <20181018143718.26298-11-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 53 ++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 349f68ab8797..e391cdaae35f 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1156,36 +1156,45 @@ static int add_node(union ubifs_key *key, char *n=
ame, void *node, int len)
 	return 0;
 }
=20
-static int add_xattr(struct stat *st, ino_t inum, const void *data,
-		     unsigned int data_len, struct qstr *nm)
+static int add_xattr(struct ubifs_ino_node *host_ino, struct stat *st, i=
no_t inum,
+		     char *name, const void *data, unsigned int data_len)
 {
 	struct ubifs_ino_node *ino;
 	struct ubifs_dent_node *xent;
+	struct qstr nm;
 	union ubifs_key xkey, nkey;
 	int len, ret;
=20
-	xent =3D xzalloc(sizeof(*xent) + nm->len + 1);
+	nm.name =3D name;
+	nm.len =3D strlen(name);
+
+	host_ino->xattr_cnt++;
+	host_ino->xattr_size +=3D CALC_DENT_SIZE(nm.len);
+	host_ino->xattr_size +=3D CALC_XATTR_BYTES(data_len);
+	host_ino->xattr_names +=3D nm.len;
+
+	xent =3D xzalloc(sizeof(*xent) + nm.len + 1);
 	ino =3D xzalloc(sizeof(*ino) + data_len);
=20
-	xent_key_init(c, &xkey, inum, nm);
+	xent_key_init(c, &xkey, inum, &nm);
 	xent->ch.node_type =3D UBIFS_XENT_NODE;
 	key_write(&xkey, &xent->key);
=20
-	len =3D UBIFS_XENT_NODE_SZ + nm->len + 1;
+	len =3D UBIFS_XENT_NODE_SZ + nm.len + 1;
=20
 	xent->ch.len =3D len;
 	xent->padding1 =3D 0;
 	xent->type =3D UBIFS_ITYPE_DIR;
-	xent->nlen =3D cpu_to_le16(nm->len);
+	xent->nlen =3D cpu_to_le16(nm.len);
=20
-	memcpy(xent->name, nm->name, nm->len + 1);
+	memcpy(xent->name, nm.name, nm.len + 1);
=20
 	inum =3D ++c->highest_inum;
 	creat_sqnum =3D ++c->max_sqnum;
=20
 	xent->inum =3D cpu_to_le64(inum);
=20
-	ret =3D add_node(&xkey, nm->name, xent, len);
+	ret =3D add_node(&xkey, nm.name, xent, len);
 	if (ret)
 		goto out;
=20
@@ -1217,7 +1226,7 @@ static int add_xattr(struct stat *st, ino_t inum, c=
onst void *data,
 	if (data_len)
 		memcpy(&ino->data, data, data_len);
=20
-	ret =3D add_node(&nkey, nm->name, ino, UBIFS_INO_NODE_SZ + data_len) ;
+	ret =3D add_node(&nkey, nm.name, ino, UBIFS_INO_NODE_SZ + data_len) ;
=20
 out:
 	free(xent);
@@ -1270,7 +1279,6 @@ static int inode_add_xattr(struct ubifs_ino_node *h=
ost_ino,
 			   const char *path_name, struct stat *st, ino_t inum)
 {
 	int ret;
-	struct qstr nm;
 	void *buf =3D NULL;
 	ssize_t len;
 	ssize_t pos =3D 0;
@@ -1327,15 +1335,7 @@ static int inode_add_xattr(struct ubifs_ino_node *=
host_ino,
 			continue;
 		}
=20
-		nm.name =3D name;
-		nm.len =3D strlen(name);
-
-		host_ino->xattr_cnt++;
-		host_ino->xattr_size +=3D CALC_DENT_SIZE(nm.len);
-		host_ino->xattr_size +=3D CALC_XATTR_BYTES(attrsize);
-		host_ino->xattr_names +=3D nm.len;
-
-		ret =3D add_xattr(st, inum, attrbuf, attrsize, &nm);
+		ret =3D add_xattr(host_ino, st, inum, name, attrbuf, attrsize);
 		if (ret < 0)
 			goto out_free;
 	}
@@ -1415,6 +1415,15 @@ static inline int inode_add_selinux_xattr(struct u=
bifs_ino_node *host_ino,
 }
 #endif
=20
+static int set_fscrypt_context(struct ubifs_ino_node *host_ino, ino_t in=
um,
+			       struct stat *host_st,
+			       struct fscrypt_context *fctx)
+{
+	return add_xattr(host_ino, host_st, inum,
+			 UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT,
+			 fctx, sizeof(*fctx));
+}
+
 /**
  * add_inode - write an inode.
  * @st: stat information of source inode
@@ -1484,6 +1493,12 @@ static int add_inode(struct stat *st, ino_t inum, =
void *data,
 			return ret;
 	}
=20
+	if (fctx) {
+		ret =3D set_fscrypt_context(ino, inum, st, fctx);
+		if (ret < 0)
+			return ret;
+	}
+
 	return add_node(&key, NULL, ino, len);
 }
=20
--=20
2.19.1

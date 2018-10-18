Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RP-00045j-Qp
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:02 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 11/42] mkfs.ubifs: Store directory name len in the temporary
 index
Date: Thu, 18 Oct 2018 16:36:47 +0200
Message-Id: <20181018143718.26298-12-richard@nod.at>
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

since names are no longer strings, we need to know the length.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index e391cdaae35f..469d5874eaa2 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -73,6 +73,7 @@ struct idx_entry {
 	struct idx_entry *prev;
 	union ubifs_key key;
 	char *name;
+	int name_len;
 	int lnum;
 	int offs;
 	int len;
@@ -1069,7 +1070,7 @@ static void set_lprops(int lnum, int offs, int flag=
s)
  * @offs: node offset
  * @len: node length
  */
-static int add_to_index(union ubifs_key *key, char *name, int lnum, int =
offs,
+static int add_to_index(union ubifs_key *key, char *name, int name_len, =
int lnum, int offs,
 			int len)
 {
 	struct idx_entry *e;
@@ -1080,6 +1081,7 @@ static int add_to_index(union ubifs_key *key, char =
*name, int lnum, int offs,
 	e->prev =3D idx_list_last;
 	e->key =3D *key;
 	e->name =3D name;
+	e->name_len =3D name_len;
 	e->lnum =3D lnum;
 	e->offs =3D offs;
 	e->len =3D len;
@@ -1138,7 +1140,7 @@ static int reserve_space(int len, int *lnum, int *o=
ffs)
  * @node: node
  * @len: node length
  */
-static int add_node(union ubifs_key *key, char *name, void *node, int le=
n)
+static int add_node(union ubifs_key *key, char *name, int name_len, void=
 *node, int len)
 {
 	int err, lnum, offs;
=20
@@ -1151,7 +1153,7 @@ static int add_node(union ubifs_key *key, char *nam=
e, void *node, int len)
 	memcpy(leb_buf + offs, node, len);
 	memset(leb_buf + offs + len, 0xff, ALIGN(len, 8) - len);
=20
-	add_to_index(key, name, lnum, offs, len);
+	add_to_index(key, name, name_len, lnum, offs, len);
=20
 	return 0;
 }
@@ -1194,7 +1196,7 @@ static int add_xattr(struct ubifs_ino_node *host_in=
o, struct stat *st, ino_t inu
=20
 	xent->inum =3D cpu_to_le64(inum);
=20
-	ret =3D add_node(&xkey, nm.name, xent, len);
+	ret =3D add_node(&xkey, nm.name, nm.len, xent, len);
 	if (ret)
 		goto out;
=20
@@ -1226,7 +1228,7 @@ static int add_xattr(struct ubifs_ino_node *host_in=
o, struct stat *st, ino_t inu
 	if (data_len)
 		memcpy(&ino->data, data, data_len);
=20
-	ret =3D add_node(&nkey, nm.name, ino, UBIFS_INO_NODE_SZ + data_len) ;
+	ret =3D add_node(&nkey, nm.name, nm.len, ino, UBIFS_INO_NODE_SZ + data_=
len) ;
=20
 out:
 	free(xent);
@@ -1499,7 +1501,7 @@ static int add_inode(struct stat *st, ino_t inum, v=
oid *data,
 			return ret;
 	}
=20
-	return add_node(&key, NULL, ino, len);
+	return add_node(&key, NULL, 0, ino, len);
 }
=20
 /**
@@ -1621,7 +1623,7 @@ static int add_dent_node(ino_t dir_inum, const char=
 *name, ino_t inum,
 	if (!kname)
 		return err_msg("cannot allocate memory");
=20
-	return add_node(&key, kname, dent, len);
+	return add_node(&key, kname, dname.len, dent, len);
 }
=20
 /**
@@ -1732,9 +1734,10 @@ static int add_file(const char *path_name, struct =
stat *st, ino_t inum,
 		compr_type =3D compress_data(buf, bytes_read, &dn->data,
 					   &out_len, use_compr);
 		dn->compr_type =3D cpu_to_le16(compr_type);
+		//TODO: encrypt
 		dn_len =3D UBIFS_DATA_NODE_SZ + out_len;
 		/* Add data node to file system */
-		err =3D add_node(&key, NULL, dn, dn_len);
+		err =3D add_node(&key, NULL, 0, dn, dn_len);
 		if (err) {
 			close(fd);
 			return err;
@@ -2121,13 +2124,13 @@ static int write_data(void)
 	return flush_nodes();
 }
=20
-static int namecmp(const char *name1, const char *name2)
+static int namecmp(const struct idx_entry *e1, const struct idx_entry *e=
2)
 {
-	size_t len1 =3D strlen(name1), len2 =3D strlen(name2);
+	size_t len1 =3D e1->name_len, len2 =3D e2->name_len;
 	size_t clen =3D (len1 < len2) ? len1 : len2;
 	int cmp;
=20
-	cmp =3D memcmp(name1, name2, clen);
+	cmp =3D memcmp(e1->name, e2->name, clen);
 	if (cmp)
 		return cmp;
 	return (len1 < len2) ? -1 : 1;
@@ -2142,7 +2145,7 @@ static int cmp_idx(const void *a, const void *b)
 	cmp =3D keys_cmp(&e1->key, &e2->key);
 	if (cmp)
 		return cmp;
-	return namecmp(e1->name, e2->name);
+	return namecmp(e1, e2);
 }
=20
 /**
--=20
2.19.1

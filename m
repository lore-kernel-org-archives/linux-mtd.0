Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9S6-0002RX-IH
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:10 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 29/42] mkfs.ubifs: Cleanup over-long lines
Date: Thu, 18 Oct 2018 16:37:05 +0200
Message-Id: <20181018143718.26298-30-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 35 +++++++++++++++++++----------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 1710e25b88ee..9bd15a2f047a 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1030,8 +1030,8 @@ static void set_lprops(int lnum, int offs, int flag=
s)
  * @offs: node offset
  * @len: node length
  */
-static int add_to_index(union ubifs_key *key, char *name, int name_len, =
int lnum, int offs,
-			int len)
+static int add_to_index(union ubifs_key *key, char *name, int name_len,
+			int lnum, int offs, int len)
 {
 	struct idx_entry *e;
=20
@@ -1102,11 +1102,12 @@ static int reserve_space(int len, int *lnum, int =
*offs)
  */
 static int add_node(union ubifs_key *key, char *name, int name_len, void=
 *node, int len)
 {
-	int err, lnum, offs;
+	int err, lnum, offs, type =3D key_type(key);
=20
-	if (key_type(key) =3D=3D UBIFS_DENT_KEY || key_type(key) =3D=3D UBIFS_X=
ENT_KEY) {
+	if (type =3D=3D UBIFS_DENT_KEY || type =3D=3D UBIFS_XENT_KEY) {
 		if (!name)
-			return err_msg("Directory entry or xattr without name!");
+			return err_msg("Directory entry or xattr "
+					"without name!");
 	} else {
 		if (name)
 			return err_msg("Name given for non dir/xattr node!");
@@ -1126,8 +1127,9 @@ static int add_node(union ubifs_key *key, char *nam=
e, int name_len, void *node,
 	return 0;
 }
=20
-static int add_xattr(struct ubifs_ino_node *host_ino, struct stat *st, i=
no_t inum,
-		     char *name, const void *data, unsigned int data_len)
+static int add_xattr(struct ubifs_ino_node *host_ino, struct stat *st,
+		     ino_t inum, char *name, const void *data,
+		     unsigned int data_len)
 {
 	struct ubifs_ino_node *ino;
 	struct ubifs_dent_node *xent;
@@ -1399,10 +1401,13 @@ static int encrypt_symlink(void *dst, void *data,=
 unsigned int data_len,
 {
 	struct fscrypt_symlink_data *sd;
 	void *outbuf;
-	unsigned int link_disk_len =3D fscrypt_fname_encrypted_size(fctx, data_=
len) + sizeof(struct fscrypt_symlink_data);
+	unsigned int link_disk_len;
 	unsigned int cryptlen;
 	int ret;
=20
+	link_disk_len =3D sizeof(struct fscrypt_symlink_data);
+	link_disk_len +=3D fscrypt_fname_encrypted_size(fctx, data_len);
+
 	ret =3D encrypt_path(&outbuf, data, data_len, UBIFS_MAX_INO_DATA, fctx)=
;
 	if (ret < 0)
 		return ret;
@@ -1622,9 +1627,12 @@ static int add_dent_node(ino_t dir_inum, const cha=
r *name, ino_t inum,
 		if (!kname)
 			return err_msg("cannot allocate memory");
 	} else {
-		unsigned int max_namelen =3D type =3D=3D UBIFS_ITYPE_LNK ? UBIFS_MAX_I=
NO_DATA : UBIFS_MAX_NLEN;
+		unsigned int max_namelen =3D UBIFS_MAX_NLEN;
 		int ret;
=20
+		if (type =3D=3D UBIFS_ITYPE_LNK)
+			max_namelen =3D UBIFS_MAX_INO_DATA;
+
 		ret =3D encrypt_path((void **)&kname, dname.name, dname.len,
 				   max_namelen, fctx);
 		if (ret < 0)
@@ -1984,7 +1992,8 @@ static int add_directory(const char *dir_name, ino_=
t dir_inum, struct stat *st,
 			nlink +=3D 1;
 			type =3D UBIFS_ITYPE_DIR;
 		} else {
-			err =3D add_non_dir(name, &inum, 0, &type, &dent_st, new_fctx);
+			err =3D add_non_dir(name, &inum, 0, &type,
+					  &dent_st, new_fctx);
 			if (err)
 				goto out_free;
 		}
@@ -2045,7 +2054,8 @@ static int add_directory(const char *dir_name, ino_=
t dir_inum, struct stat *st,
 			nlink +=3D 1;
 			type =3D UBIFS_ITYPE_DIR;
 		} else {
-			err =3D add_non_dir(name, &inum, 0, &type, &fake_st, new_fctx);
+			err =3D add_non_dir(name, &inum, 0, &type,
+					  &fake_st, new_fctx);
 			if (err)
 				goto out_free;
 		}
@@ -2065,7 +2075,8 @@ static int add_directory(const char *dir_name, ino_=
t dir_inum, struct stat *st,
=20
 	creat_sqnum =3D dir_creat_sqnum;
=20
-	err =3D add_dir_inode(dir ? dir_name : NULL, dir, dir_inum, size, nlink=
, st, fctx);
+	err =3D add_dir_inode(dir ? dir_name : NULL, dir, dir_inum, size,
+			    nlink, st, fctx);
 	if (err)
 		goto out_free;
=20
--=20
2.19.1

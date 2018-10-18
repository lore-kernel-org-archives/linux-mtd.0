Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RP-00045f-R4
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:20 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 09/42] mkfs.ubifs: Implement basic fscrypto context passing
Date: Thu, 18 Oct 2018 16:36:45 +0200
Message-Id: <20181018143718.26298-10-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 64 ++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 09c28ab0b6bd..349f68ab8797 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -174,6 +174,7 @@ int yes;
=20
 static char *root;
 static int root_len;
+static struct fscrypt_context *root_fctx;
 static struct stat root_st;
 static char *output;
 static int out_fd;
@@ -1423,7 +1424,8 @@ static inline int inode_add_selinux_xattr(struct ub=
ifs_ino_node *host_ino,
  * @flags: source inode flags
  */
 static int add_inode(struct stat *st, ino_t inum, void *data,
-		     unsigned int data_len, int flags, const char *xattr_path)
+		     unsigned int data_len, int flags, const char *xattr_path,
+		     struct fscrypt_context *fctx)
 {
 	struct ubifs_ino_node *ino =3D node_buf;
 	union ubifs_key key;
@@ -1441,7 +1443,8 @@ static int add_inode(struct stat *st, ino_t inum, v=
oid *data,
 		use_flags |=3D UBIFS_APPEND_FL;
 	if (flags & FS_DIRSYNC_FL && S_ISDIR(st->st_mode))
 		use_flags |=3D UBIFS_DIRSYNC_FL;
-
+	if (fctx)
+		use_flags |=3D UBIFS_CRYPT_FL;
 	memset(ino, 0, UBIFS_INO_NODE_SZ);
=20
 	ino_key_init(&key, inum);
@@ -1498,7 +1501,8 @@ static int add_inode(struct stat *st, ino_t inum, v=
oid *data,
  * the device table.
  */
 static int add_dir_inode(const char *path_name, DIR *dir, ino_t inum, lo=
ff_t size,
-			 unsigned int nlink, struct stat *st)
+			 unsigned int nlink, struct stat *st,
+			 struct fscrypt_context *fctx)
 {
 	int fd, flags =3D 0;
=20
@@ -1513,7 +1517,7 @@ static int add_dir_inode(const char *path_name, DIR=
 *dir, ino_t inum, loff_t siz
 			flags =3D 0;
 	}
=20
-	return add_inode(st, inum, NULL, 0, flags, path_name);
+	return add_inode(st, inum, NULL, 0, flags, path_name, fctx);
 }
=20
 /**
@@ -1527,7 +1531,7 @@ static int add_dev_inode(const char *path_name, str=
uct stat *st, ino_t inum, int
 	union ubifs_dev_desc dev;
=20
 	dev.huge =3D cpu_to_le64(makedev(major(st->st_rdev), minor(st->st_rdev)=
));
-	return add_inode(st, inum, &dev, 8, flags, path_name);
+	return add_inode(st, inum, &dev, 8, flags, path_name, NULL);
 }
=20
 /**
@@ -1538,7 +1542,7 @@ static int add_dev_inode(const char *path_name, str=
uct stat *st, ino_t inum, int
  * @flags: source inode flags
  */
 static int add_symlink_inode(const char *path_name, struct stat *st, ino=
_t inum,
-			     int flags)
+			     int flags, struct fscrypt_context *fctx)
 {
 	char buf[UBIFS_MAX_INO_DATA + 2];
 	ssize_t len;
@@ -1550,7 +1554,7 @@ static int add_symlink_inode(const char *path_name,=
 struct stat *st, ino_t inum,
 	if (len > UBIFS_MAX_INO_DATA)
 		return err_msg("symlink too long for %s", path_name);
=20
-	return add_inode(st, inum, buf, len, flags, path_name);
+	return add_inode(st, inum, buf, len, flags, path_name, fctx);
 }
=20
 static void set_dent_cookie(struct ubifs_dent_node *dent)
@@ -1569,7 +1573,7 @@ static void set_dent_cookie(struct ubifs_dent_node =
*dent)
  * @type: type of the target inode
  */
 static int add_dent_node(ino_t dir_inum, const char *name, ino_t inum,
-			 unsigned char type)
+			 unsigned char type, struct fscrypt_context *fctx)
 {
 	struct ubifs_dent_node *dent =3D node_buf;
 	union ubifs_key key;
@@ -1658,7 +1662,7 @@ static int all_zero(void *buf, int len)
  * @flags: source inode flags
  */
 static int add_file(const char *path_name, struct stat *st, ino_t inum,
-		    int flags)
+		    int flags, struct fscrypt_context *fctx)
 {
 	struct ubifs_data_node *dn =3D node_buf;
 	void *buf =3D block_buf;
@@ -1728,7 +1732,7 @@ static int add_file(const char *path_name, struct s=
tat *st, ino_t inum,
 		return err_msg("file size changed during writing file '%s'",
 			       path_name);
=20
-	return add_inode(st, inum, NULL, 0, flags, path_name);
+	return add_inode(st, inum, NULL, 0, flags, path_name, fctx);
 }
=20
 /**
@@ -1741,7 +1745,8 @@ static int add_file(const char *path_name, struct s=
tat *st, ino_t inum,
  *      creating the UBIFS inode
  */
 static int add_non_dir(const char *path_name, ino_t *inum, unsigned int =
nlink,
-		       unsigned char *type, struct stat *st)
+		       unsigned char *type, struct stat *st,
+		       struct fscrypt_context *fctx)
 {
 	int fd, flags =3D 0;
=20
@@ -1806,17 +1811,17 @@ static int add_non_dir(const char *path_name, ino=
_t *inum, unsigned int nlink,
 	creat_sqnum =3D ++c->max_sqnum;
=20
 	if (S_ISREG(st->st_mode))
-		return add_file(path_name, st, *inum, flags);
+		return add_file(path_name, st, *inum, flags, fctx);
 	if (S_ISCHR(st->st_mode))
 		return add_dev_inode(path_name, st, *inum, flags);
 	if (S_ISBLK(st->st_mode))
 		return add_dev_inode(path_name, st, *inum, flags);
 	if (S_ISLNK(st->st_mode))
-		return add_symlink_inode(path_name, st, *inum, flags);
+		return add_symlink_inode(path_name, st, *inum, flags, fctx);
 	if (S_ISSOCK(st->st_mode))
-		return add_inode(st, *inum, NULL, 0, flags, NULL);
+		return add_inode(st, *inum, NULL, 0, flags, NULL, NULL);
 	if (S_ISFIFO(st->st_mode))
-		return add_inode(st, *inum, NULL, 0, flags, NULL);
+		return add_inode(st, *inum, NULL, 0, flags, NULL, NULL);
=20
 	return err_msg("file '%s' has unknown inode type", path_name);
 }
@@ -1831,7 +1836,7 @@ static int add_non_dir(const char *path_name, ino_t=
 *inum, unsigned int nlink,
  *            created because it is defined in the device table file.
  */
 static int add_directory(const char *dir_name, ino_t dir_inum, struct st=
at *st,
-			 int existing)
+			 int existing, struct fscrypt_context *fctx)
 {
 	struct dirent *entry;
 	DIR *dir =3D NULL;
@@ -1867,6 +1872,7 @@ static int add_directory(const char *dir_name, ino_=
t dir_inum, struct stat *st,
 	 */
 	for (; existing;) {
 		struct stat dent_st;
+		struct fscrypt_context *new_fctx =3D NULL;
=20
 		errno =3D 0;
 		entry =3D readdir(dir);
@@ -1922,14 +1928,16 @@ static int add_directory(const char *dir_name, in=
o_t dir_inum, struct stat *st,
=20
 		inum =3D ++c->highest_inum;
=20
+		new_fctx =3D inherit_fscrypt_context(fctx);
+
 		if (S_ISDIR(dent_st.st_mode)) {
-			err =3D add_directory(name, inum, &dent_st, 1);
+			err =3D add_directory(name, inum, &dent_st, 1, new_fctx);
 			if (err)
 				goto out_free;
 			nlink +=3D 1;
 			type =3D UBIFS_ITYPE_DIR;
 		} else {
-			err =3D add_non_dir(name, &inum, 0, &type, &dent_st);
+			err =3D add_non_dir(name, &inum, 0, &type, &dent_st, new_fctx);
 			if (err)
 				goto out_free;
 		}
@@ -1938,11 +1946,13 @@ static int add_directory(const char *dir_name, in=
o_t dir_inum, struct stat *st,
 		if (err)
 			goto out_free;
=20
-		err =3D add_dent_node(dir_inum, entry->d_name, inum, type);
+		err =3D add_dent_node(dir_inum, entry->d_name, inum, type, fctx);
 		if (err)
 			goto out_free;
 		size +=3D ALIGN(UBIFS_DENT_NODE_SZ + strlen(entry->d_name) + 1,
 			      8);
+
+		free_fscrypt_context(new_fctx);
 	}
=20
 	/*
@@ -1952,6 +1962,7 @@ static int add_directory(const char *dir_name, ino_=
t dir_inum, struct stat *st,
 	nh_elt =3D first_name_htbl_element(ph_elt, &itr);
 	while (nh_elt) {
 		struct stat fake_st;
+		struct fscrypt_context *new_fctx =3D NULL;
=20
 		/*
 		 * We prohibit creating regular files using the device table,
@@ -1978,14 +1989,16 @@ static int add_directory(const char *dir_name, in=
o_t dir_inum, struct stat *st,
 		name =3D make_path(dir_name, nh_elt->name);
 		inum =3D ++c->highest_inum;
=20
+		new_fctx =3D inherit_fscrypt_context(fctx);
+
 		if (S_ISDIR(nh_elt->mode)) {
-			err =3D add_directory(name, inum, &fake_st, 0);
+			err =3D add_directory(name, inum, &fake_st, 0, new_fctx);
 			if (err)
 				goto out_free;
 			nlink +=3D 1;
 			type =3D UBIFS_ITYPE_DIR;
 		} else {
-			err =3D add_non_dir(name, &inum, 0, &type, &fake_st);
+			err =3D add_non_dir(name, &inum, 0, &type, &fake_st, new_fctx);
 			if (err)
 				goto out_free;
 		}
@@ -1994,17 +2007,18 @@ static int add_directory(const char *dir_name, in=
o_t dir_inum, struct stat *st,
 		if (err)
 			goto out_free;
=20
-		err =3D add_dent_node(dir_inum, nh_elt->name, inum, type);
+		err =3D add_dent_node(dir_inum, nh_elt->name, inum, type, fctx);
 		if (err)
 			goto out_free;
 		size +=3D ALIGN(UBIFS_DENT_NODE_SZ + strlen(nh_elt->name) + 1, 8);
=20
 		nh_elt =3D next_name_htbl_element(ph_elt, &itr);
+		free_fscrypt_context(new_fctx);
 	}
=20
 	creat_sqnum =3D dir_creat_sqnum;
=20
-	err =3D add_dir_inode(dir ? dir_name : NULL, dir, dir_inum, size, nlink=
, st);
+	err =3D add_dir_inode(dir ? dir_name : NULL, dir, dir_inum, size, nlink=
, st, fctx);
 	if (err)
 		goto out_free;
=20
@@ -2035,7 +2049,7 @@ static int add_multi_linked_files(void)
 		for (im =3D hash_table[i]; im; im =3D im->next) {
 			dbg_msg(2, "%s", im->path_name);
 			err =3D add_non_dir(im->path_name, &im->use_inum,
-					  im->use_nlink, &type, &im->st);
+					  im->use_nlink, &type, &im->st, NULL);
 			if (err)
 				return err;
 		}
@@ -2083,7 +2097,7 @@ static int write_data(void)
 	if (err)
 		return err;
=20
-	err =3D add_directory(root, UBIFS_ROOT_INO, &root_st, !!root);
+	err =3D add_directory(root, UBIFS_ROOT_INO, &root_st, !!root, root_fctx=
);
 	if (err)
 		return err;
 	err =3D add_multi_linked_files();
--=20
2.19.1

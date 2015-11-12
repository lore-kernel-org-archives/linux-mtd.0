Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwoEX-00037D-EG
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 09:31:58 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [PATCH v2 1/5] mkfs.ubifs: change add_directory argument to 'existing'
Date: Thu, 12 Nov 2015 10:31:24 +0100
Message-Id: <1447320688-3086-2-git-send-email-mkl@pengutronix.de>
In-Reply-To: <1447320688-3086-1-git-send-email-mkl@pengutronix.de>
References: <1447320688-3086-1-git-send-email-mkl@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sascha Hauer <s.hauer@pengutronix.de>

A 'non_existing' argument which is only used with !non_existing
is just too confusing. Change this to positive logic.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Daniel Walter <dwalter@sigma-star.at>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index ca17e2bca3ac..1b816ae483e0 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1395,12 +1395,12 @@ static int add_non_dir(const char *path_name, ino_t *inum, unsigned int nlink,
  * @dir_name: directory path name
  * @dir_inum: UBIFS inode number of directory
  * @st: directory inode statistics
- * @non_existing: non-zero if this function is called for a directory which
- *                does not exist on the host file-system and it is being
- *                created because it is defined in the device table file.
+ * @existing: zero if this function is called for a directory which
+ *            does not exist on the host file-system and it is being
+ *            created because it is defined in the device table file.
  */
 static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
-			 int non_existing)
+			 int existing)
 {
 	struct dirent *entry;
 	DIR *dir = NULL;
@@ -1416,7 +1416,7 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 	unsigned long long dir_creat_sqnum = ++c->max_sqnum;
 
 	dbg_msg(2, "%s", dir_name);
-	if (!non_existing) {
+	if (existing) {
 		dir = opendir(dir_name);
 		if (dir == NULL)
 			return sys_err_msg("cannot open directory '%s'",
@@ -1434,7 +1434,7 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 	 * Before adding the directory itself, we have to iterate over all the
 	 * entries the device table adds to this directory and create them.
 	 */
-	for (; !non_existing;) {
+	for (; existing;) {
 		struct stat dent_st;
 
 		errno = 0;
@@ -1492,7 +1492,7 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 		inum = ++c->highest_inum;
 
 		if (S_ISDIR(dent_st.st_mode)) {
-			err = add_directory(name, inum, &dent_st, 0);
+			err = add_directory(name, inum, &dent_st, 1);
 			if (err)
 				goto out_free;
 			nlink += 1;
@@ -1544,7 +1544,7 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 		inum = ++c->highest_inum;
 
 		if (S_ISDIR(nh_elt->mode)) {
-			err = add_directory(name, inum, &fake_st, 1);
+			err = add_directory(name, inum, &fake_st, 0);
 			if (err)
 				goto out_free;
 			nlink += 1;
@@ -1570,14 +1570,14 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 		goto out_free;
 
 	free(name);
-	if (!non_existing && closedir(dir) == -1)
+	if (existing && closedir(dir) == -1)
 		return sys_err_msg("error closing directory '%s'", dir_name);
 
 	return 0;
 
 out_free:
 	free(name);
-	if (!non_existing)
+	if (existing)
 		closedir(dir);
 	return -1;
 }
@@ -1624,7 +1624,7 @@ static int write_data(void)
 	}
 
 	head_flags = 0;
-	err = add_directory(root, UBIFS_ROOT_INO, &root_st, !root);
+	err = add_directory(root, UBIFS_ROOT_INO, &root_st, !!root);
 	if (err)
 		return err;
 	err = add_multi_linked_files();
-- 
2.6.1

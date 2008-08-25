Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KXYHD-0004y8-7o
	for linux-mtd@lists.infradead.org; Mon, 25 Aug 2008 09:22:19 +0000
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: use 'stat(2)' instead of 'lstat(2)'
Date: Mon, 25 Aug 2008 11:21:48 +0200
Message-Id: <1219656108-1365-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The UBI tools refuse to work with symlinks like
'/dev/ubi/bootloader -> ../ubi0_2' because they use 'lstat(2)' and get
information about the symlink but not about the device.  This is
unwanted and fixed by this patch.

This patch renames 'struct stat stat' variables to 'st' to avoid
compilation errors.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 ubi-utils/new-utils/src/libubi.c |   14 +++++++-------
 ubi-utils/src/libubi.c           |   30 +++++++++++++++---------------
 ubi-utils/src/nand2bin.c         |    2 +-
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/ubi-utils/new-utils/src/libubi.c b/ubi-utils/new-utils/src/libubi.c
index 8f95108..10e3f2a 100644
--- a/ubi-utils/new-utils/src/libubi.c
+++ b/ubi-utils/new-utils/src/libubi.c
@@ -365,7 +365,7 @@ static int vol_node2nums(struct libubi *lib, const char *node, int *dev_num,
 	int i, fd, major, minor;
 	char file[strlen(lib->ubi_vol) + 100];
 
-	if (lstat(node, &st))
+	if (stat(node, &st))
 		return -1;
 
 	if (!S_ISCHR(st.st_mode)) {
@@ -427,20 +427,20 @@ static int vol_node2nums(struct libubi *lib, const char *node, int *dev_num,
  */
 static int dev_node2num(struct libubi *lib, const char *node, int *dev_num)
 {
-	struct stat stat;
+	struct stat st;
 	struct ubi_info info;
 	int i, major, minor;
 
-	if (lstat(node, &stat))
+	if (stat(node, &st))
 		return -1;
 
-	if (!S_ISCHR(stat.st_mode)) {
+	if (!S_ISCHR(st.st_mode)) {
 		errno = EINVAL;
 		return errmsg("\"%s\" is not a character device", node);
 	}
 
-	major = major(stat.st_rdev);
-	minor = minor(stat.st_rdev);
+	major = major(st.st_rdev);
+	minor = minor(st.st_rdev);
 
 	if (minor != 0) {
 		errno = EINVAL;
@@ -754,7 +754,7 @@ int ubi_node_type(libubi_t desc, const char *node)
 	struct libubi *lib = (struct libubi *)desc;
 	char file[strlen(lib->ubi_vol) + 100];
 
-	if (lstat(node, &st))
+	if (stat(node, &st))
 		return -1;
 
 	if (!S_ISCHR(st.st_mode)) {
diff --git a/ubi-utils/src/libubi.c b/ubi-utils/src/libubi.c
index a028fc6..a536b47 100644
--- a/ubi-utils/src/libubi.c
+++ b/ubi-utils/src/libubi.c
@@ -754,20 +754,20 @@ static char *mkpath(const char *path, const char *name)
  */
 static int find_dev_num(struct libubi *lib, const char *node)
 {
-	struct stat stat;
+	struct stat st;
 	struct ubi_info info;
 	int i, major, minor;
 
-	if (lstat(node, &stat))
+	if (stat(node, &st))
 		return -1;
 
-	if (!S_ISCHR(stat.st_mode)) {
+	if (!S_ISCHR(st.st_mode)) {
 		errno = EINVAL;
 		return -1;
 	}
 
-	major = major(stat.st_rdev);
-	minor = minor(stat.st_rdev);
+	major = major(st.st_rdev);
+	minor = minor(st.st_rdev);
 
 	if (minor != 0) {
 		errno = -EINVAL;
@@ -811,21 +811,21 @@ static int find_dev_num(struct libubi *lib, const char *node)
  */
 static int find_dev_num_vol(struct libubi *lib, const char *node)
 {
-	struct stat stat;
+	struct stat st;
 	struct ubi_info info;
 	int i, major;
 
-	if (lstat(node, &stat))
+	if (stat(node, &st))
 		return -1;
 
-	if (!S_ISCHR(stat.st_mode)) {
+	if (!S_ISCHR(st.st_mode)) {
 		errno = EINVAL;
 		return -1;
 	}
 
-	major = major(stat.st_rdev);
+	major = major(st.st_rdev);
 
-	if (minor(stat.st_rdev) == 0) {
+	if (minor(st.st_rdev) == 0) {
 		errno = -EINVAL;
 		return -1;
 	}
@@ -868,20 +868,20 @@ static int find_dev_num_vol(struct libubi *lib, const char *node)
  */
 static int find_vol_num(struct libubi *lib, int dev_num, const char *node)
 {
-	struct stat stat;
+	struct stat st;
 	struct ubi_dev_info info;
 	int i, major, minor;
 
-	if (lstat(node, &stat))
+	if (stat(node, &st))
 		return -1;
 
-	if (!S_ISCHR(stat.st_mode)) {
+	if (!S_ISCHR(st.st_mode)) {
 		errno = EINVAL;
 		return -1;
 	}
 
-	major = major(stat.st_rdev);
-	minor = minor(stat.st_rdev);
+	major = major(st.st_rdev);
+	minor = minor(st.st_rdev);
 
 	if (minor == 0) {
 		errno = -EINVAL;
diff --git a/ubi-utils/src/nand2bin.c b/ubi-utils/src/nand2bin.c
index be62e30..93ba29f 100644
--- a/ubi-utils/src/nand2bin.c
+++ b/ubi-utils/src/nand2bin.c
@@ -456,7 +456,7 @@ main(int argc, char *argv[])
 		exit(EXIT_FAILURE);
 	}
 
-	if (lstat(myargs.arg1, &file_info) != 0) {
+	if (stat(myargs.arg1, &file_info) != 0) {
 		perror("Cannot fetch file size from input file.\n");
 		exit(EXIT_FAILURE);
 	}
-- 
1.5.5.1

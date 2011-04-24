Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QE1vj-0002zn-Gc
	for linux-mtd@lists.infradead.org; Sun, 24 Apr 2011 16:13:09 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3OGD2pI010549
	for <linux-mtd@lists.infradead.org>; Sun, 24 Apr 2011 19:13:02 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/5] fs-tests: integck: ignore -e if in power cut mode
Date: Sun, 24 Apr 2011 19:16:17 +0300
Message-Id: <1303661778-13214-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303661778-13214-1-git-send-email-dedekind1@gmail.com>
References: <1303661778-13214-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Similarly to the previous commit, do not verify operations when in
power-cut testing mode. Again, this is because write-back may fail
meanwhile.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   38 ++++++++++++++++++++++-------------
 1 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 9f03709..f1a2f84 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -543,7 +543,7 @@ static int dir_new(struct dir_info *parent, const char *name)
 		return -1;
 	}
 
-	if (args.verify_ops) {
+	if (args.verify_ops && !args.power_cut_mode) {
 		struct stat st;
 
 		CHECK(lstat(path, &st) == 0);
@@ -589,7 +589,7 @@ static int dir_remove(struct dir_info *dir)
 		return -1;
 	}
 
-	if (args.verify_ops) {
+	if (args.verify_ops && !args.power_cut_mode) {
 		struct stat st;
 
 		CHECK(lstat(path, &st) == -1);
@@ -626,7 +626,7 @@ static int file_new(struct dir_info *parent, const char *name)
 		return -1;
 	}
 
-	if (args.verify_ops) {
+	if (args.verify_ops && !args.power_cut_mode) {
 		struct stat st;
 
 		CHECK(lstat(path, &st) == 0);
@@ -654,7 +654,7 @@ static int link_new(struct dir_info *parent, const char *name,
 	path = dir_path(parent, name);
 	target = dir_path(entry->parent, entry->name);
 
-	if (args.verify_ops)
+	if (args.verify_ops && !args.power_cut_mode)
 		CHECK(lstat(target, &st1) == 0);
 
 	ret = link(target, path);
@@ -670,7 +670,7 @@ static int link_new(struct dir_info *parent, const char *name,
 		return ret;
 	}
 
-	if (args.verify_ops) {
+	if (args.verify_ops && !args.power_cut_mode) {
 		CHECK(lstat(path, &st2) == 0);
 		CHECK(S_ISREG(st2.st_mode));
 		CHECK(st1.st_ino == st2.st_ino);
@@ -716,7 +716,7 @@ static int file_unlink(struct dir_entry_info *entry)
 		return -1;
 	}
 
-	if (args.verify_ops) {
+	if (args.verify_ops && !args.power_cut_mode) {
 		struct stat st;
 
 		CHECK(lstat(path, &st) == -1);
@@ -923,7 +923,7 @@ static void file_write_info(struct file_info *file, int fd, off_t offset,
 	w->random_seed = seed;
 	file->raw_writes = w;
 
-	if (args.verify_ops)
+	if (args.verify_ops && !args.power_cut_mode)
 		file_check_data(file, fd, new_write);
 
 	/* Insert it into file->writes */
@@ -1090,7 +1090,7 @@ static int file_ftruncate(struct file_info *file, int fd, off_t new_length)
 		return -1;
 	}
 
-	if (args.verify_ops)
+	if (args.verify_ops && !args.power_cut_mode)
 		CHECK(lseek(fd, 0, SEEK_END) == new_length);
 
 	return 0;
@@ -1419,6 +1419,8 @@ static void file_check_data(struct file_info *file, int fd,
 	char buf[IO_BUFFER_SIZE];
 	unsigned int seed = w->random_seed;
 
+	assert(!args.power_cut_mode);
+
 	for (r = 0; r < w->random_offset; ++r)
 		rand_r(&seed);
 	CHECK(lseek(fd, w->offset, SEEK_SET) != (off_t)-1);
@@ -1453,6 +1455,9 @@ static void file_check(struct file_info *file, int fd)
 	struct dir_entry_info *entry;
 	struct stat st;
 
+	if (args.power_cut_mode)
+		return;
+
 	/* Do not check files that have errored */
 	if (!fsinfo.nospc_size_ok && file->no_space_error)
 		return;
@@ -1528,6 +1533,9 @@ void symlink_check(const struct symlink_info *symlink)
 	ssize_t len;
 	int ret1, ret2;
 
+	if (args.power_cut_mode)
+		return;
+
 	path = dir_path(symlink->entry->parent, symlink->entry->name);
 	CHECK(lstat(path, &st1) == 0);
 	CHECK(S_ISLNK(st1.st_mode));
@@ -1591,6 +1599,8 @@ static void dir_check(struct dir_info *dir)
 	int link_count = 2; /* Parent and dot */
 	struct stat st;
 
+	assert(!args.power_cut_mode);
+
 	/* Create an array of entries */
 	sz = sizeof(struct dir_entry_info *);
 	n = dir->number_of_entries;
@@ -1836,7 +1846,7 @@ static int rename_entry(struct dir_entry_info *entry)
 	if (!path)
 		return 0;
 
-	if (args.verify_ops)
+	if (args.verify_ops && !args.power_cut_mode)
 		CHECK(lstat(path, &st1) == 0);
 
 	ret = rename(path, to);
@@ -1854,7 +1864,7 @@ static int rename_entry(struct dir_entry_info *entry)
 		return ret;
 	}
 
-	if (args.verify_ops) {
+	if (args.verify_ops && !args.power_cut_mode) {
 		CHECK(lstat(to, &st2) == 0);
 		CHECK(st1.st_ino == st2.st_ino);
 	}
@@ -1996,7 +2006,7 @@ static int symlink_new(struct dir_info *dir, const char *nm)
 		return ret;
 	}
 
-	if (args.verify_ops)
+	if (args.verify_ops && !args.power_cut_mode)
 		verify_symlink(target, path);
 
 	s = add_dir_entry(dir, 's', name, NULL);
@@ -2018,7 +2028,7 @@ static int symlink_remove(struct symlink_info *symlink)
 		return -1;
 	}
 
-	if (args.verify_ops) {
+	if (args.verify_ops && !args.power_cut_mode) {
 		struct stat st;
 
 		CHECK(lstat(path, &st) == -1);
@@ -2359,7 +2369,7 @@ static int rm_minus_rf_dir(const char *dir_name)
 	CHECK(chdir(buf) == 0);
 	CHECK(closedir(dir) == 0);
 
-	if (args.verify_ops) {
+	if (args.verify_ops && !args.power_cut_mode) {
 		dir = opendir(dir_name);
 		CHECK(dir != NULL);
 		do {
@@ -2379,7 +2389,7 @@ static int rm_minus_rf_dir(const char *dir_name)
 		return -1;
 	}
 
-	if (args.verify_ops) {
+	if (args.verify_ops && !args.power_cut_mode) {
 		struct stat st;
 
 		CHECK(lstat(dir_name, &st) == -1);
-- 
1.7.2.3

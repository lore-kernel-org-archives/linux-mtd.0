Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMEnP-0004fs-03
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 07:34:24 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4H7YFWu006045
	for <linux-mtd@lists.infradead.org>; Tue, 17 May 2011 10:34:21 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/11] fs-tests: integck: make -v work -e
Date: Tue, 17 May 2011 10:38:10 +0300
Message-Id: <1305617896-23711-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
References: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Make the verify option -v work with power cut emulation option -e. We can
verify all operations except of writing to the file, because of write-back.
Indeed, even if we write successfully, the pages may still be in the page-cache
and if an emulated power cut happens they will be dropped, and our verification
will fail.

I am not 100% sure it is save to verify non-write operation in other FSes, but
only UBIFS has power cut emulation mode now, so we do not really care about
other FSes at this point.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 1483f62..944ff3c 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -552,7 +552,7 @@ static int dir_new(struct dir_info *parent, const char *name)
 		return -1;
 	}
 
-	if (args.verify_ops && !args.power_cut_mode) {
+	if (args.verify_ops) {
 		struct stat st;
 
 		CHECK(lstat(path, &st) == 0);
@@ -598,7 +598,7 @@ static int dir_remove(struct dir_info *dir)
 		return -1;
 	}
 
-	if (args.verify_ops && !args.power_cut_mode) {
+	if (args.verify_ops) {
 		struct stat st;
 
 		CHECK(lstat(path, &st) == -1);
@@ -635,7 +635,7 @@ static int file_new(struct dir_info *parent, const char *name)
 		return -1;
 	}
 
-	if (args.verify_ops && !args.power_cut_mode) {
+	if (args.verify_ops) {
 		struct stat st;
 
 		CHECK(lstat(path, &st) == 0);
@@ -663,7 +663,7 @@ static int link_new(struct dir_info *parent, const char *name,
 	path = dir_path(parent, name);
 	target = dir_path(entry->parent, entry->name);
 
-	if (args.verify_ops && !args.power_cut_mode)
+	if (args.verify_ops)
 		CHECK(lstat(target, &st1) == 0);
 
 	ret = link(target, path);
@@ -679,7 +679,7 @@ static int link_new(struct dir_info *parent, const char *name,
 		return ret;
 	}
 
-	if (args.verify_ops && !args.power_cut_mode) {
+	if (args.verify_ops) {
 		CHECK(lstat(path, &st2) == 0);
 		CHECK(S_ISREG(st2.st_mode));
 		CHECK(st1.st_ino == st2.st_ino);
@@ -725,7 +725,7 @@ static int file_unlink(struct dir_entry_info *entry)
 		return -1;
 	}
 
-	if (args.verify_ops && !args.power_cut_mode) {
+	if (args.verify_ops) {
 		struct stat st;
 
 		CHECK(lstat(path, &st) == -1);
@@ -1109,7 +1109,7 @@ static int file_ftruncate(struct file_info *file, int fd, off_t new_length)
 		return -1;
 	}
 
-	if (args.verify_ops && !args.power_cut_mode)
+	if (args.verify_ops)
 		CHECK(lseek(fd, 0, SEEK_END) == new_length);
 
 	return 0;
@@ -1914,7 +1914,7 @@ static int rename_entry(struct dir_entry_info *entry)
 	if (!path)
 		return 0;
 
-	if (args.verify_ops && !args.power_cut_mode)
+	if (args.verify_ops)
 		CHECK(lstat(path, &st1) == 0);
 
 	ret = rename(path, to);
@@ -1932,7 +1932,7 @@ static int rename_entry(struct dir_entry_info *entry)
 		return ret;
 	}
 
-	if (args.verify_ops && !args.power_cut_mode) {
+	if (args.verify_ops) {
 		CHECK(lstat(to, &st2) == 0);
 		CHECK(st1.st_ino == st2.st_ino);
 	}
@@ -2074,7 +2074,7 @@ static int symlink_new(struct dir_info *dir, const char *nm)
 		return ret;
 	}
 
-	if (args.verify_ops && !args.power_cut_mode)
+	if (args.verify_ops)
 		verify_symlink(target, path);
 
 	s = add_dir_entry(dir, 's', name, NULL);
@@ -2096,7 +2096,7 @@ static int symlink_remove(struct symlink_info *symlink)
 		return -1;
 	}
 
-	if (args.verify_ops && !args.power_cut_mode) {
+	if (args.verify_ops) {
 		struct stat st;
 
 		CHECK(lstat(path, &st) == -1);
@@ -2434,7 +2434,7 @@ static int rm_minus_rf_dir(const char *dir_name)
 	CHECK(chdir(buf) == 0);
 	CHECK(closedir(dir) == 0);
 
-	if (args.verify_ops && !args.power_cut_mode) {
+	if (args.verify_ops) {
 		dir = opendir(dir_name);
 		CHECK(dir != NULL);
 		do {
@@ -2454,7 +2454,7 @@ static int rm_minus_rf_dir(const char *dir_name)
 		return -1;
 	}
 
-	if (args.verify_ops && !args.power_cut_mode) {
+	if (args.verify_ops) {
 		struct stat st;
 
 		CHECK(lstat(dir_name, &st) == -1);
-- 
1.7.2.3

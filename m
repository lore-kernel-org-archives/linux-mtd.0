Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURr-00064R-Im
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:15:57 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFlpE009474
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:50 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/35] fs-tests: integck: make more functions propogate error
	up
Date: Wed, 20 Apr 2011 13:18:39 +0300
Message-Id: <1303294748-5492-7-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
References: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
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

Teach 'operate_on_open_file()', 'operate_on_an_open_file()', and
'do_an_operation()' propogate errors up.

Also move whole 'operate_on_file()' to a more logical place.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |  126 ++++++++++++++++++++----------------
 1 files changed, 69 insertions(+), 57 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 1703364..4f39ce3 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1776,8 +1776,47 @@ static void symlink_remove(struct symlink_info *symlink)
 	free(path);
 }
 
-static void operate_on_dir(struct dir_info *dir);
-static void operate_on_file(struct file_info *file);
+static int operate_on_dir(struct dir_info *dir);
+
+/* Randomly select something to do with a file */
+static void operate_on_file(struct file_info *file)
+{
+	/* Try to keep at least 10 files open */
+	if (open_files_count < 10) {
+		file_open(file);
+		return;
+	}
+	/* Try to keep about 20 files open */
+	if (open_files_count < 20 && random_no(2) == 0) {
+		file_open(file);
+		return;
+	}
+	/* Try to keep up to 40 files open */
+	if (open_files_count < 40 && random_no(20) == 0) {
+		file_open(file);
+		return;
+	}
+	/* Occasionly truncate */
+	if (shrink && random_no(100) == 0) {
+		file_truncate_file(file);
+		return;
+	}
+	/* Mostly just write */
+	file_write_file(file);
+	/* Once in a while check it too */
+	if (random_no(100) == 1) {
+		int fd = -2;
+
+		if (file->links)
+			fd = -1;
+		else if (file->fds)
+			fd = file->fds->fd;
+		if (fd != -2) {
+			check_run_no += 1;
+			file_check(file, fd);
+		}
+	}
+}
 
 /* Randomly select something to do with a directory entry */
 static void operate_on_entry(struct dir_entry_info *entry)
@@ -1818,8 +1857,10 @@ static void operate_on_entry(struct dir_entry_info *entry)
 	}
 }
 
-/* Randomly select something to do with a directory */
-static void operate_on_dir(struct dir_info *dir)
+/*
+ * Randomly select something to do with a directory.
+ */
+static int operate_on_dir(struct dir_info *dir)
 {
 	struct dir_entry_info *entry;
 	struct file_info *file;
@@ -1849,54 +1890,17 @@ static void operate_on_dir(struct dir_info *dir)
 		if (entry)
 			operate_on_entry(entry);
 	}
-}
 
-/* Randomly select something to do with a file */
-static void operate_on_file(struct file_info *file)
-{
-	/* Try to keep at least 10 files open */
-	if (open_files_count < 10) {
-		file_open(file);
-		return;
-	}
-	/* Try to keep about 20 files open */
-	if (open_files_count < 20 && random_no(2) == 0) {
-		file_open(file);
-		return;
-	}
-	/* Try to keep up to 40 files open */
-	if (open_files_count < 40 && random_no(20) == 0) {
-		file_open(file);
-		return;
-	}
-	/* Occasionly truncate */
-	if (shrink && random_no(100) == 0) {
-		file_truncate_file(file);
-		return;
-	}
-	/* Mostly just write */
-	file_write_file(file);
-	/* Once in a while check it too */
-	if (random_no(100) == 1) {
-		int fd = -2;
-
-		if (file->links)
-			fd = -1;
-		else if (file->fds)
-			fd = file->fds->fd;
-		if (fd != -2) {
-			check_run_no += 1;
-			file_check(file, fd);
-		}
-	}
+	return 0;
 }
 
-/* Randomly select something to do with an open file */
-static void operate_on_open_file(struct fd_info *fdi)
+/*
+ * Randomly select something to do with an open file.
+ */
+static int operate_on_open_file(struct fd_info *fdi)
 {
-	unsigned int r;
+	unsigned int r = random_no(1000);
 
-	r = random_no(1000);
 	if (shrink && r < 5)
 		file_truncate(fdi->file, fdi->fd);
 	else if (r < 21)
@@ -1912,10 +1916,14 @@ static void operate_on_open_file(struct fd_info *fdi)
 				CHECK(fdatasync(fdi->fd) == 0);
 		}
 	}
+
+	return 0;
 }
 
-/* Select an open file at random */
-static void operate_on_an_open_file(void)
+/*
+ * Randomly select an open file and do a random operation on it.
+ */
+static int operate_on_an_open_file(void)
 {
 	unsigned int r;
 	struct open_file_info *ofi;
@@ -1928,9 +1936,10 @@ static void operate_on_an_open_file(void)
 		x &= 127;
 		if (x == 0) {
 			close_open_files();
-			return;
+			return 0;
 		}
 	}
+
 	/* Close any open files that have errored */
 	if (!fsinfo.nospc_size_ok) {
 		ofi = open_files;
@@ -1945,23 +1954,26 @@ static void operate_on_an_open_file(void)
 				ofi = ofi->next;
 		}
 	}
+
 	r = random_no(open_files_count);
-	for (ofi = open_files; ofi; ofi = ofi->next, --r)
+	for (ofi = open_files; ofi; ofi = ofi->next, r--)
 		if (!r) {
-			operate_on_open_file(ofi->fdi);
-			return;
+			return operate_on_open_file(ofi->fdi);
 		}
+
+	return 0;
 }
 
+/*
+ * Do a random file-system operation.
+ */
 static int do_an_operation(void)
 {
 	/* Half the time operate on already open files */
 	if (random_no(100) < 50)
-		operate_on_dir(top_dir);
+		return operate_on_dir(top_dir);
 	else
-		operate_on_an_open_file();
-
-	return 0;
+		return operate_on_an_open_file();
 }
 
 /*
-- 
1.7.2.3

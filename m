Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURy-00068o-Fa
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:12 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFlpK009474
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:57 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 24/35] fs-tests: integck: make operate_on_entry handle all
	errors
Date: Wed, 20 Apr 2011 13:18:57 +0300
Message-Id: <1303294748-5492-25-git-send-email-dedekind1@gmail.com>
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

Make 'operate_on_entry()' handle handle errors from all functions
it calls and return the error code to the caller.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   44 ++++++++++++++++++-----------------
 1 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index f99caae..c3c3813 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1881,27 +1881,27 @@ static int symlink_remove(struct symlink_info *symlink)
 static int operate_on_dir(struct dir_info *dir);
 
 /* Randomly select something to do with a file */
-static void operate_on_file(struct file_info *file)
+static int operate_on_file(struct file_info *file)
 {
 	/* Try to keep at least 10 files open */
 	if (open_files_count < 10) {
 		file_open(file);
-		return;
+		return 0;
 	}
 	/* Try to keep about 20 files open */
 	if (open_files_count < 20 && random_no(2) == 0) {
 		file_open(file);
-		return;
+		return 0;
 	}
 	/* Try to keep up to 40 files open */
 	if (open_files_count < 40 && random_no(20) == 0) {
 		file_open(file);
-		return;
+		return 0;
 	}
 	/* Occasionly truncate */
 	if (shrink && random_no(100) == 0) {
 		file_truncate_file(file);
-		return;
+		return 0;
 	}
 	/* Mostly just write */
 	file_write_file(file);
@@ -1918,38 +1918,40 @@ static void operate_on_file(struct file_info *file)
 			file_check(file, fd);
 		}
 	}
+	return 0;
 }
 
 /* Randomly select something to do with a directory entry */
 static int operate_on_entry(struct dir_entry_info *entry)
 {
+	int ret = 0;
+
 	/* 1 time in 1000 rename */
 	if (random_no(1000) == 0)
-		return rename_entry(entry);
-	if (entry->type == 's') {
+		ret = rename_entry(entry);
+	else if (entry->type == 's') {
 		symlink_check(entry->symlink);
 		/* If shrinking, 1 time in 50, remove a symlink */
 		if (shrink && random_no(50) == 0)
-			return symlink_remove(entry->symlink);
-		return 0;
-	}
-	if (entry->type == 'd') {
+			ret = symlink_remove(entry->symlink);
+	} else if (entry->type == 'd') {
 		/* If shrinking, 1 time in 50, remove a directory */
 		if (shrink && random_no(50) == 0)
-			return dir_remove(entry->dir);
-		return operate_on_dir(entry->dir);
-	}
-	if (entry->type == 'f') {
+			ret = dir_remove(entry->dir);
+		else
+			ret = operate_on_dir(entry->dir);
+	} else if (entry->type == 'f') {
 		/* If shrinking, 1 time in 10, remove a file */
 		if (shrink && random_no(10) == 0)
-			return file_delete(entry->file);
+			ret = file_delete(entry->file);
 		/* If not growing, 1 time in 10, unlink a file with links > 1 */
-		if (!grow && entry->file->link_count > 1 &&
-		    random_no(10) == 0)
-			return file_unlink_file(entry->file);
-		operate_on_file(entry->file);
+		else if (!grow && entry->file->link_count > 1 &&
+			 random_no(10) == 0)
+			ret = file_unlink_file(entry->file);
+		else
+			ret = operate_on_file(entry->file);
 	}
-	return 0;
+	return ret;
 }
 
 /*
-- 
1.7.2.3

Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURw-00067X-G8
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:08 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFms8009503
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:55 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 19/35] fs-tests: integck: make operate_on_dir propagate errors
	up
Date: Wed, 20 Apr 2011 13:18:52 +0300
Message-Id: <1303294748-5492-20-git-send-email-dedekind1@gmail.com>
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

Make 'operate_on_dir()' functions propogate errors up if any of
the functions it calls failed. This patch also makes 'operate_on_entry()'
return an error code, but without actual implementation.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   26 ++++++++++++++------------
 1 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 14d112f..09b4a7d 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1901,25 +1901,25 @@ static void operate_on_file(struct file_info *file)
 }
 
 /* Randomly select something to do with a directory entry */
-static void operate_on_entry(struct dir_entry_info *entry)
+static int operate_on_entry(struct dir_entry_info *entry)
 {
 	/* 1 time in 1000 rename */
 	if (random_no(1000) == 0) {
 		rename_entry(entry);
-		return;
+		return 0;
 	}
 	if (entry->type == 's') {
 		symlink_check(entry->symlink);
 		/* If shrinking, 1 time in 50, remove a symlink */
 		if (shrink && random_no(50) == 0)
 			symlink_remove(entry->symlink);
-		return;
+		return 0;
 	}
 	if (entry->type == 'd') {
 		/* If shrinking, 1 time in 50, remove a directory */
 		if (shrink && random_no(50) == 0) {
 			dir_remove(entry->dir);
-			return;
+			return 0;
 		}
 		operate_on_dir(entry->dir);
 	}
@@ -1927,16 +1927,17 @@ static void operate_on_entry(struct dir_entry_info *entry)
 		/* If shrinking, 1 time in 10, remove a file */
 		if (shrink && random_no(10) == 0) {
 			file_delete(entry->file);
-			return;
+			return 0;
 		}
 		/* If not growing, 1 time in 10, unlink a file with links > 1 */
 		if (!grow && entry->file->link_count > 1 &&
 		    random_no(10) == 0) {
 			file_unlink_file(entry->file);
-			return;
+			return 0;
 		}
 		operate_on_file(entry->file);
 	}
+	return 0;
 }
 
 /*
@@ -1947,20 +1948,21 @@ static int operate_on_dir(struct dir_info *dir)
 	struct dir_entry_info *entry;
 	struct file_info *file;
 	unsigned int r;
+	int ret = 0;
 
 	r = random_no(14);
 	if (r == 0 && grow)
 		/* When growing, 1 time in 14 create a file */
-		return file_new(dir, make_name(dir));
+		ret = file_new(dir, make_name(dir));
 	else if (r == 1 && grow)
 		/* When growing, 1 time in 14 create a directory */
-		return dir_new(dir, make_name(dir));
+		ret = dir_new(dir, make_name(dir));
 	else if (r == 2 && grow && (file = pick_file()) != NULL)
 		/* When growing, 1 time in 14 create a hard link */
-		return link_new(dir, make_name(dir), file);
+		ret = link_new(dir, make_name(dir), file);
 	else if (r == 3 && grow && random_no(5) == 0)
 		/* When growing, 1 time in 70 create a symbolic link */
-		return symlink_new(dir, make_name(dir));
+		ret = symlink_new(dir, make_name(dir));
 	else {
 		/* Otherwise randomly select an entry to operate on */
 		r = random_no(dir->number_of_entries);
@@ -1970,10 +1972,10 @@ static int operate_on_dir(struct dir_info *dir)
 			--r;
 		}
 		if (entry)
-			operate_on_entry(entry);
+			ret = operate_on_entry(entry);
 	}
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
1.7.2.3

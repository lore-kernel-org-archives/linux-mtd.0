Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURx-00068H-Iq
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:10 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmM1009480
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:56 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 22/35] fs-tests: integck: teach dir_remove return error and
	fix a memory leak
Date: Wed, 20 Apr 2011 13:18:55 +0300
Message-Id: <1303294748-5492-23-git-send-email-dedekind1@gmail.com>
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

Teach 'dir_remove()' to return an error to the caller if it fails to
remove the directory. Also, there was a memory leak - the 'path'
string was not freed - fix it as well.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   33 +++++++++++++++++++++------------
 1 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index a486229..9ab417d 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -484,30 +484,41 @@ static int file_delete(struct file_info *file);
 static int file_unlink(struct dir_entry_info *entry);
 static int symlink_remove(struct symlink_info *symlink);
 
-static void dir_remove(struct dir_info *dir)
+static int dir_remove(struct dir_info *dir)
 {
 	char *path;
 
 	/* Remove directory contents */
 	while (dir->first) {
 		struct dir_entry_info *entry;
+		int ret = 0;
 
 		entry = dir->first;
 		if (entry->type == 'd')
-			dir_remove(entry->dir);
+			ret = dir_remove(entry->dir);
 		else if (entry->type == 'f')
-			file_unlink(entry);
+			ret = file_unlink(entry);
 		else if (entry->type == 's')
-			symlink_remove(entry->symlink);
+			ret = symlink_remove(entry->symlink);
 		else
 			CHECK(0); /* Invalid struct dir_entry_info */
+		if (ret)
+			return -1;
+	}
+
+	/* Remove directory form the file-system */
+	path = dir_path(dir->parent, dir->name);
+	if (rmdir(path) != 0) {
+		pcv("cannot remove directory entry %s", path);
+		free(path);
+		return -1;
 	}
+
 	/* Remove entry from parent directory */
 	remove_dir_entry(dir->entry);
-	/* Remove directory itself */
-	path = dir_path(dir->parent, dir->name);
-	CHECK(rmdir(path) == 0);
+	free(path);
 	free(dir);
+	return 0;
 }
 
 static int file_new(struct dir_info *parent, const char *name)
@@ -1924,11 +1935,9 @@ static int operate_on_entry(struct dir_entry_info *entry)
 	}
 	if (entry->type == 'd') {
 		/* If shrinking, 1 time in 50, remove a directory */
-		if (shrink && random_no(50) == 0) {
-			dir_remove(entry->dir);
-			return 0;
-		}
-		operate_on_dir(entry->dir);
+		if (shrink && random_no(50) == 0)
+			return dir_remove(entry->dir);
+		return operate_on_dir(entry->dir);
 	}
 	if (entry->type == 'f') {
 		/* If shrinking, 1 time in 10, remove a file */
-- 
1.7.2.3

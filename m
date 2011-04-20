Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCUS0-0006A2-FW
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:14 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmUv009491
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:59 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 29/35] fs-tests: integck: introduce free_writes_info helper
Date: Wed, 20 Apr 2011 13:19:02 +0300
Message-Id: <1303294748-5492-30-git-send-email-dedekind1@gmail.com>
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

We have duplicated code for freeing write informatio - put it into
a helper function.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   50 +++++++++++++++++------------------
 1 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 666bc70..50b414f 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -152,7 +152,6 @@ struct file_info /* Each file has one of these */
 	off_t length;
 	int link_count;
 	unsigned int check_run_no; /* Run number used when checking */
-	unsigned int deleted:1; /* File has been deleted but is still open */
 	unsigned int no_space_error:1; /* File has incurred a ENOSPC error */
 };
 
@@ -442,7 +441,7 @@ static void remove_dir_entry(struct dir_entry_info *entry)
 			file->links = entry->next_link;
 		file->link_count -= 1;
 		if (file->link_count == 0)
-			file->deleted = 1;
+			assert(file->links == NULL);
 	}
 
 	free(entry->name);
@@ -599,6 +598,21 @@ static void file_close_all(struct file_info *file)
 }
 
 /*
+ * Free all the information about writes to a file.
+ */
+static void free_writes_info(struct file_info *file)
+{
+	struct write_info *w, *next;
+
+	w = file->writes;
+	while (w) {
+		next = w->next;
+		free(w);
+		w = next;
+	}
+}
+
+/*
  * Unlink a directory entry for a file.
  */
 static int file_unlink(struct dir_entry_info *entry)
@@ -622,18 +636,10 @@ static int file_unlink(struct dir_entry_info *entry)
 
 	/* Free struct file_info if file is not open and not linked */
 	if (!file->fds && !file->links) {
-		struct write_info *w, *next;
-
+		free_writes_info(file);
 		free(file->name);
-		w = file->writes;
-		while (w) {
-			next = w->next;
-			free(w);
-			w = next;
-		}
 		free(file);
-	} else if (!file->links)
-		file->deleted = 1;
+	}
 
 	return 0;
 }
@@ -702,7 +708,7 @@ static void file_info_display(struct file_info *file)
 	normsg("    File was open: %s",
 	       (file->fds == NULL) ? "false" : "true");
 	normsg("    File was deleted: %s",
-	       (file->deleted == 0) ? "false" : "true");
+	       (file->link_count == 0) ? "true" : "false");
 	normsg("    File was out of space: %s",
 	       (file->no_space_error == 0) ? "false" : "true");
 	normsg("    File Data:");
@@ -1048,7 +1054,7 @@ static int file_write(struct file_info *file, int fd)
 	unsigned int seed;
 	int ret, truncate = 0;
 
-	if (fsinfo.can_mmap && !full && !file->deleted &&
+	if (fsinfo.can_mmap && !full && file->link_count &&
 	    random_no(100) == 1)
 		return file_mmap_write(file);
 
@@ -1189,16 +1195,8 @@ static void file_close(struct fd_info *fdi)
 		if (fdp == fdi) {
 			*prev = fdi->next;
 			free(fdi);
-			if (file->deleted && !file->fds) {
-				/* Closing deleted file */
-				struct write_info *w, *next;
-
-				w = file->writes;
-				while (w) {
-					next = w->next;
-					free(w);
-					w = next;
-				}
+			if (!file->link_count && !file->fds) {
+				free_writes_info(file);
 				free(file->name);
 				free(file);
 			}
@@ -1554,7 +1552,7 @@ static void check_deleted_files(void)
 	struct open_file_info *ofi;
 
 	for (ofi = open_files; ofi; ofi = ofi->next)
-		if (ofi->fdi->file->deleted)
+		if (!ofi->fdi->file->link_count)
 			file_check(ofi->fdi->file, ofi->fdi->fd);
 }
 
@@ -2017,7 +2015,7 @@ static int operate_on_open_file(struct fd_info *fdi)
 		ret = file_truncate(fdi->file, fdi->fd);
 	else if (r < 21)
 		file_close(fdi);
-	else if (shrink && r < 121 && !fdi->file->deleted)
+	else if (shrink && r < 121 && fdi->file->link_count)
 		ret = file_delete(fdi->file);
 	else {
 		ret = file_write(fdi->file, fdi->fd);
-- 
1.7.2.3

Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCUS2-0006Av-P5
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:14 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmV1009491
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:16:01 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 34/35] fs-tests: integck: lessen memory consumption even more
Date: Wed, 20 Apr 2011 13:19:07 +0300
Message-Id: <1303294748-5492-35-git-send-email-dedekind1@gmail.com>
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

This patch kills the "name" field from 'struct file_info' where we stored
the original file name. We do not really need to keep this name around,
becaus it might have long gone and it is not very interesting. Besides,
we have several memory leaks where we leak 'file->name' strings, so this
is the easiest way to fix those leaks as well.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   17 ++++++-----------
 1 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index d5ee08e..310e228 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -143,7 +143,6 @@ struct dir_entry_info;
 
 struct file_info /* Each file has one of these */
 {
-	char *name; /* Original name */
 	struct write_info *writes; /* Record accumulated writes to the file */
 	struct write_info *raw_writes;
 				/* Record in order all writes to the file */
@@ -398,7 +397,6 @@ static void add_dir_entry(struct dir_info *parent, char type, const char *name,
 	if (entry->type == 'f') {
 		struct file_info *file = target;
 
-		file->name = dup_string(name);
 		entry->file = file;
 		entry->next_link = file->links;
 		if (file->links)
@@ -639,7 +637,6 @@ static int file_unlink(struct dir_entry_info *entry)
 	/* Free struct file_info if file is not open and not linked */
 	if (!file->fds && !file->links) {
 		free_writes_info(file);
-		free(file->name);
 		free(file);
 	}
 
@@ -697,7 +694,6 @@ static void file_info_display(struct file_info *file)
 	unsigned int wcnt;
 
 	normsg("File Info:");
-	normsg("    Original name: %s", file->name);
 	normsg("    Link count: %d", file->link_count);
 	normsg("    Links:");
 	entry = file->links;
@@ -805,7 +801,7 @@ static ssize_t file_write_data(struct file_info *file, int fd, off_t offset,
 			}
 			pcv("failed to write %zu bytes to offset %llu of file %s",
 			    block, (unsigned long long)(offset + actual),
-			    file->name);
+			    file->links->name);
 			return -1;
 		}
 		remains -= written;
@@ -955,7 +951,7 @@ static int file_ftruncate(struct file_info *file, int fd, off_t new_length)
 			return 1;
 		} else
 			pcv("cannot truncate file %s to %llu",
-			    file->name, (unsigned long long)new_length);
+			    file->links->name, (unsigned long long)new_length);
 		return -1;
 	}
 
@@ -1199,7 +1195,6 @@ static void file_close(struct fd_info *fdi)
 			free(fdi);
 			if (!file->link_count && !file->fds) {
 				free_writes_info(file);
-				free(file->name);
 				free(file);
 			}
 			return;
@@ -1249,7 +1244,7 @@ static void save_file(int fd, struct file_info *file)
 
 	/* Open file to save contents to */
 	strcpy(name, "/tmp/");
-	strcat(name, file->name);
+	strcat(name, file->links->name);
 	strcat(name, ".integ.sav.read");
 	normsg("Saving %sn", name);
 	w_fd = open(name, O_CREAT | O_WRONLY, 0777);
@@ -1269,7 +1264,7 @@ static void save_file(int fd, struct file_info *file)
 
 	/* Open file to save contents to */
 	strcpy(name, "/tmp/");
-	strcat(name, file->name);
+	strcat(name, file->links->name);
 	strcat(name, ".integ.sav.written");
 	normsg("Saving %s", name);
 	w_fd = open(name, O_CREAT | O_WRONLY, 0777);
@@ -2028,12 +2023,12 @@ static int operate_on_open_file(struct fd_info *fdi)
 				ret = fsync(fdi->fd);
 				if (ret)
 					pcv("fsync failed for %s",
-					    fdi->file->name);
+					    fdi->file->links->name);
 			} else {
 				ret = fdatasync(fdi->fd);
 				if (ret)
 					pcv("fdatasync failed for %s",
-					    fdi->file->name);
+					    fdi->file->links->name);
 			}
 		}
 	}
-- 
1.7.2.3

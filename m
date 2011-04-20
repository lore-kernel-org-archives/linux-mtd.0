Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURs-00064u-8F
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:00 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFlpG009474
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:51 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 08/35] fs-tests: integck: handle errors in file_delete
Date: Wed, 20 Apr 2011 13:18:41 +0300
Message-Id: <1303294748-5492-9-git-send-email-dedekind1@gmail.com>
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

Teach 'file_delete()' and several other functions it calls
(like 'file_unlink()) to handle write errors and propagate the
up to the caller.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   77 +++++++++++++++++++++++++-----------
 1 files changed, 54 insertions(+), 23 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 06e33b5..7ccbcb1 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -476,8 +476,8 @@ static struct dir_info *dir_new(struct dir_info *parent, const char *name)
 	return dir;
 }
 
-static void file_delete(struct file_info *file);
-static void file_unlink(struct dir_entry_info *entry);
+static int file_delete(struct file_info *file);
+static int file_unlink(struct dir_entry_info *entry);
 static void symlink_remove(struct symlink_info *symlink);
 
 static void dir_remove(struct dir_info *dir)
@@ -576,20 +576,28 @@ static void file_close_all(struct file_info *file)
 	}
 }
 
-static void file_unlink(struct dir_entry_info *entry)
+/*
+ * Unlink a directory entry for a file.
+ */
+static int file_unlink(struct dir_entry_info *entry)
 {
 	struct file_info *file = entry->file;
 	char *path;
+	int ret;
 
 	path = dir_path(entry->parent, entry->name);
+	/* Unlink the file */
+	ret = unlink(path);
+	if (ret) {
+		pcv("cannot unlink file %s", path);
+		free(path);
+		return -1;
+	}
+	free(path);
 
 	/* Remove file entry from parent directory */
 	remove_dir_entry(entry);
 
-	/* Unlink the file */
-	CHECK(unlink(path) == 0);
-	free(path);
-
 	/* Free struct file_info if file is not open and not linked */
 	if (!file->fds && !file->links) {
 		struct write_info *w, *next;
@@ -604,6 +612,8 @@ static void file_unlink(struct dir_entry_info *entry)
 		free(file);
 	} else if (!file->links)
 		file->deleted = 1;
+
+	return 0;
 }
 
 static struct dir_entry_info *pick_entry(struct file_info *file)
@@ -630,7 +640,11 @@ static void file_unlink_file(struct file_info *file)
 	file_unlink(entry);
 }
 
-static void file_delete(struct file_info *file)
+/*
+ * Close all open descriptors for a file described by 'file' and delete it by
+ * unlinking all its hardlinks.
+ */
+static int file_delete(struct file_info *file)
 {
 	struct dir_entry_info *entry = file->links;
 
@@ -638,9 +652,12 @@ static void file_delete(struct file_info *file)
 	while (entry) {
 		struct dir_entry_info *next = entry->next_link;
 
-		file_unlink(entry);
+		if (file_unlink(entry))
+			return -1;
 		entry = next;
 	}
+
+	return 0;
 }
 
 static void file_info_display(struct file_info *file)
@@ -892,7 +909,8 @@ static int file_ftruncate(struct file_info *file, int fd, off_t new_length)
 			file->no_space_error = 1;
 			/* Delete errored files */
 			if (!fsinfo.nospc_size_ok)
-				file_delete(file);
+				if (file_delete(file))
+					return -1;
 			return 1;
 		} else
 			pcv("cannot truncate file %s to %llu",
@@ -970,17 +988,21 @@ static void file_mmap_write(struct file_info *file)
 	file_write_info(file, offset, size, seed);
 }
 
-static void file_write(struct file_info *file, int fd)
+/*
+ * Write random amount of data to a random offset in an open file or randomly
+ * choose to truncate it.
+ */
+static int file_write(struct file_info *file, int fd)
 {
 	off_t offset;
 	size_t size, actual;
 	unsigned seed;
-	int truncate = 0;
+	int ret, truncate = 0;
 
 	if (fsinfo.can_mmap && !full && !file->deleted &&
 	    random_no(100) == 1) {
 		file_mmap_write(file);
-		return;
+		return 0;
 	}
 
 	get_offset_and_size(file, &offset, &size);
@@ -997,30 +1019,38 @@ static void file_write(struct file_info *file, int fd)
 		file_write_info(file, offset, actual, seed);
 
 	/* Delete errored files */
-	if (!fsinfo.nospc_size_ok && file->no_space_error) {
-		file_delete(file);
-		return;
-	}
+	if (!fsinfo.nospc_size_ok && file->no_space_error)
+		return file_delete(file);
 
 	if (truncate) {
 		size_t new_length = offset + actual;
 
-		if (!file_ftruncate(file, fd, new_length))
+		ret = file_ftruncate(file, fd, new_length);
+		if (ret == -1)
+			return -1;
+		if (!ret)
 			file_truncate_info(file, new_length);
 	}
+
+	return 0;
 }
 
-static void file_write_file(struct file_info *file)
+/*
+ * Write random amount of data to a random offset in a file or randomly
+ * choose to truncate it.
+ */
+static int file_write_file(struct file_info *file)
 {
-	int fd;
+	int fd, ret;
 	char *path;
 
 	path = dir_path(file->links->parent, file->links->name);
 	fd = open(path, O_WRONLY);
 	CHECK(fd != -1);
-	file_write(file, fd);
+	ret = file_write(file, fd);
 	CHECK(close(fd) == 0);
 	free(path);
+	return ret;
 }
 
 static void file_truncate_info(struct file_info *file, size_t new_length)
@@ -1924,9 +1954,10 @@ static int operate_on_open_file(struct fd_info *fdi)
 	else if (r < 21)
 		file_close(fdi);
 	else if (shrink && r < 121 && !fdi->file->deleted)
-		file_delete(fdi->file);
+		return file_delete(fdi->file);
 	else {
-		file_write(fdi->file, fdi->fd);
+		if (file_write(fdi->file, fdi->fd))
+			return -1;
 		if (r >= 999) {
 			if (random_no(100) >= 50)
 				CHECK(fsync(fdi->fd) == 0);
-- 
1.7.2.3

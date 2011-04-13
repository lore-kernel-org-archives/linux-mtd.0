Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nT-0003TJ-Gi
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:11 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFnVS018687
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:58 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 20/27] fs-tests: integck: prefer to check for success
Date: Wed, 13 Apr 2011 18:19:00 +0300
Message-Id: <1302707947-6143-21-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
References: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
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

Many of standard C libraries return 0 on success and -1 on failure.
Currently integck mostly checks for failure by comparing with -1, like:

CHECK(fsync(fd) != -1) /* Don't die if not failure */

but in some places the check is like

CHECK(fsync(fd) == 0) /* Don't die if success */

This patch harmonizes this an makes integck to use the second style
which seems to be more logical. Besides, the binary is smaller in
this case:

[dedekind@eru fs-tests (master)]$ size integrity/integck-old
   text    data     bss     dec     hex filename
  44677    1200   37408   83285   14555 integrity/integck
[dedekind@eru fs-tests (master)]$ size integrity/integck-new
   text    data     bss     dec     hex filename
  44661    1200   37408   83269   14545 integrity/integck

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   48 ++++++++++++++++++------------------
 1 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 284a5fc..92571d1 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -272,7 +272,7 @@ static uint64_t get_free_space(void)
 {
 	struct statvfs st;
 
-	CHECK(statvfs(fsinfo.mount_point, &st) != -1);
+	CHECK(statvfs(fsinfo.mount_point, &st) == 0);
 	return (uint64_t)st.f_bavail * (uint64_t)st.f_frsize;
 }
 
@@ -405,7 +405,7 @@ static struct dir_info *dir_new(struct dir_info *parent, const char *name)
 	char *path;
 
 	path = dir_path(parent, name);
-	if (mkdir(path, 0777) == -1) {
+	if (mkdir(path, 0777) != 0) {
 		CHECK(errno == ENOSPC);
 		full = 1;
 		free(path);
@@ -447,7 +447,7 @@ static void dir_remove(struct dir_info *dir)
 	remove_dir_entry(dir->entry);
 	/* Remove directory itself */
 	path = dir_path(dir->parent, dir->name);
-	CHECK(rmdir(path) != -1);
+	CHECK(rmdir(path) == 0);
 	free(dir);
 }
 
@@ -494,7 +494,7 @@ static void link_new(struct dir_info *parent, const char *name,
 	path = dir_path(parent, name);
 	target = dir_path(entry->parent, entry->name);
 	ret = link(target, path);
-	if (ret == -1) {
+	if (ret != 0) {
 		CHECK(errno == ENOSPC);
 		free(target);
 		free(path);
@@ -532,7 +532,7 @@ static void file_unlink(struct dir_entry_info *entry)
 	remove_dir_entry(entry);
 
 	/* Unlink the file */
-	CHECK(unlink(path) != -1);
+	CHECK(unlink(path) == 0);
 	free(path);
 
 	/* Free struct file_info if file is not open and not linked */
@@ -827,7 +827,7 @@ static void file_truncate_info(struct file_info *file, size_t new_length);
 
 static int file_ftruncate(struct file_info *file, int fd, off_t new_length)
 {
-	if (ftruncate(fd, new_length) == -1) {
+	if (ftruncate(fd, new_length) != 0) {
 		CHECK(errno = ENOSPC);
 		file->no_space_error = 1;
 		/* Delete errored files */
@@ -880,7 +880,7 @@ static void file_mmap_write(struct file_info *file)
 
 	/* mmap it */
 	addr = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, offs);
-	CHECK(close(fd) != -1);
+	CHECK(close(fd) == 0);
 	CHECK(addr != MAP_FAILED);
 
 	/* Randomly select a part of the mmapped area to write */
@@ -899,7 +899,7 @@ static void file_mmap_write(struct file_info *file)
 		waddr[i] = rand();
 
 	/* Unmap it */
-	CHECK(munmap(addr, len) != -1);
+	CHECK(munmap(addr, len) == 0);
 
 	/* Record what was written */
 	file_write_info(file, offset, size, seed);
@@ -953,7 +953,7 @@ static void file_write_file(struct file_info *file)
 	fd = open(path, O_WRONLY);
 	CHECK(fd != -1);
 	file_write(file, fd);
-	CHECK(close(fd) != -1);
+	CHECK(close(fd) == 0);
 	free(path);
 }
 
@@ -1008,7 +1008,7 @@ static void file_truncate_file(struct file_info *file)
 	fd = open(path, O_WRONLY);
 	CHECK(fd != -1);
 	file_truncate(file, fd);
-	CHECK(close(fd) != -1);
+	CHECK(close(fd) == 0);
 	free(path);
 }
 
@@ -1019,7 +1019,7 @@ static void file_close(struct fd_info *fdi)
 	struct fd_info **prev;
 
 	/* Close file */
-	CHECK(close(fdi->fd) != -1);
+	CHECK(close(fdi->fd) == 0);
 	/* Remove struct fd_info */
 	open_file_remove(fdi);
 	file = fdi->file;
@@ -1104,7 +1104,7 @@ static void save_file(int fd, struct file_info *file)
 			break;
 		CHECK(write(w_fd, buf, r) == r);
 	}
-	CHECK(close(w_fd) != -1);
+	CHECK(close(w_fd) == 0);
 
 	/* Open file to save contents to */
 	strcpy(name, "/tmp/");
@@ -1117,7 +1117,7 @@ static void save_file(int fd, struct file_info *file)
 	for (w = file->writes; w; w = w->next)
 		file_rewrite_data(w_fd, w, buf);
 
-	CHECK(close(w_fd) != -1);
+	CHECK(close(w_fd) == 0);
 }
 
 static void file_check_hole(	struct file_info *file,
@@ -1228,10 +1228,10 @@ static void file_check(struct file_info *file, int fd)
 	}
 	if (file->length > pos)
 		file_check_hole(file, fd, pos, file->length - pos);
-	CHECK(fstat(fd, &st) != -1);
+	CHECK(fstat(fd, &st) == 0);
 	CHECK(file->link_count == st.st_nlink);
 	if (open_and_close) {
-		CHECK(close(fd) != -1);
+		CHECK(close(fd) == 0);
 		free(path);
 	}
 	entry = file->links;
@@ -1270,7 +1270,7 @@ void symlink_check(const struct symlink_info *symlink)
 	int ret1, ret2;
 
 	path = dir_path(symlink->entry->parent, symlink->entry->name);
-	CHECK(lstat(path, &st1) != -1);
+	CHECK(lstat(path, &st1) == 0);
 	CHECK(S_ISLNK(st1.st_mode));
 	CHECK(st1.st_nlink == 1);
 	len = readlink(path, buf, 8192);
@@ -1283,7 +1283,7 @@ void symlink_check(const struct symlink_info *symlink)
 	target = symlink_path(path, symlink->target_pathname);
 	ret2 = stat(target, &st2);
 	CHECK(ret1 == ret2);
-	if (ret1 != -1) {
+	if (ret1 == 0) {
 		CHECK(st1.st_dev == st2.st_dev);
 		CHECK(st1.st_ino == st2.st_ino);
 	}
@@ -1368,7 +1368,7 @@ static void dir_check(struct dir_info *dir)
 			break;
 		}
 	}
-	CHECK(closedir(d) != -1);
+	CHECK(closedir(d) == 0);
 	CHECK(checked == dir->number_of_entries);
 
 	/* Now check each entry */
@@ -1386,7 +1386,7 @@ static void dir_check(struct dir_info *dir)
 		entry = entry->next;
 	}
 
-	CHECK(stat(path, &st) != -1);
+	CHECK(stat(path, &st) == 0);
 	CHECK(link_count == st.st_nlink);
 
 	free(entry_array);
@@ -1579,7 +1579,7 @@ static void rename_entry(struct dir_entry_info *entry)
 		return;
 
 	ret = rename(path, to);
-	if (ret == -1) {
+	if (ret != 0) {
 		if (errno == ENOSPC)
 			full = 1;
 		CHECK(errno == ENOSPC || errno == EBUSY);
@@ -1693,7 +1693,7 @@ static void symlink_new(struct dir_info *dir, const char *name_)
 
 	path = dir_path(dir, name);
 	target = pick_symlink_target(path);
-	if (symlink(target, path) == -1) {
+	if (symlink(target, path) != 0) {
 		CHECK(errno == ENOSPC || errno == ENAMETOOLONG);
 		if (errno == ENOSPC)
 			full = 1;
@@ -1718,7 +1718,7 @@ static void symlink_remove(struct symlink_info *symlink)
 
 	remove_dir_entry(symlink->entry);
 
-	CHECK(unlink(path) != -1);
+	CHECK(unlink(path) == 0);
 	free(path);
 }
 
@@ -1853,9 +1853,9 @@ static void operate_on_open_file(struct fd_info *fdi)
 		file_write(fdi->file, fdi->fd);
 		if (r >= 999) {
 			if (tests_random_no(100) >= 50)
-				CHECK(fsync(fdi->fd) != -1);
+				CHECK(fsync(fdi->fd) == 0);
 			else
-				CHECK(fdatasync(fdi->fd) != -1);
+				CHECK(fdatasync(fdi->fd) == 0);
 		}
 	}
 }
-- 
1.7.2.3

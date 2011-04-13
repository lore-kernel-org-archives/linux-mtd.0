Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nP-0003R6-PF
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:03 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFn4b018683
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:54 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 12/27] fs-tests: integck: move more variables to fsinfo
Date: Wed, 13 Apr 2011 18:18:52 +0300
Message-Id: <1302707947-6143-13-git-send-email-dedekind1@gmail.com>
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

Aggregate all the information about the tested file-system in
the fsinf object for better readability and cleanness. Move
'can_mmap' and 'check_nospc_files' there as well.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   45 ++++++++++++++++++++----------------
 1 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index e7a3547..e29db49 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -56,13 +56,21 @@ static struct {
  *
  * max_name_len: maximum file name length
  * page_size: memory page size to use with 'mmap()'
+ * nospc_size_ok: file size is updated even if the write operation failed with
+ *                ENOSPC error
+ * can_mmap: file-system supports share writable 'mmap()' operation
  * fstype: file-system type (e.g., "ubifs")
  */
 static struct {
 	int max_name_len;
 	int page_size;
+	unsigned int nospc_size_ok:1;
+	unsigned int can_mmap:1;
 	const char *fstype;
-} fsinfo;
+} fsinfo = {
+	.nospc_size_ok = 1,
+	.can_mmap = 1,
+};
 
 /* Structures to store data written to the test file system,
    so that we can check whether the file system is correct. */
@@ -160,11 +168,6 @@ static uint64_t initial_free_space = 0; /* Free space on file system when
 					   test starts */
 static unsigned log10_initial_free_space = 0; /* log10 of initial_free_space */
 
-static int check_nospc_files = 1; /* Also check data in files that incurred a
-				     "no space" error */
-
-static int can_mmap = 1; /* Can write via mmap */
-
 static unsigned int check_run_no;
 
 /*
@@ -810,7 +813,7 @@ static int file_ftruncate(struct file_info *file, int fd, off_t new_length)
 		CHECK(errno = ENOSPC);
 		file->no_space_error = 1;
 		/* Delete errored files */
-		if (!check_nospc_files)
+		if (!fsinfo.nospc_size_ok)
 			file_delete(file);
 		return 0;
 	}
@@ -891,7 +894,8 @@ static void file_write(struct file_info *file, int fd)
 	unsigned seed;
 	int truncate = 0;
 
-	if (can_mmap && !full && !file->deleted && tests_random_no(100) == 1) {
+	if (fsinfo.can_mmap && !full && !file->deleted &&
+	    tests_random_no(100) == 1) {
 		file_mmap_write(file);
 		return;
 	}
@@ -910,7 +914,7 @@ static void file_write(struct file_info *file, int fd)
 		file_write_info(file, offset, actual, seed);
 
 	/* Delete errored files */
-	if (!check_nospc_files && file->no_space_error) {
+	if (!fsinfo.nospc_size_ok && file->no_space_error) {
 		file_delete(file);
 		return;
 	}
@@ -1173,7 +1177,7 @@ static void file_check(struct file_info *file, int fd)
 	struct stat st;
 
 	/* Do not check files that have errored */
-	if (!check_nospc_files && file->no_space_error)
+	if (!fsinfo.nospc_size_ok && file->no_space_error)
 		return;
 	/* Do not check the same file twice */
 	if (file->check_run_no == check_run_no)
@@ -1856,7 +1860,7 @@ static void operate_on_an_open_file(void)
 		}
 	}
 	/* Close any open files that have errored */
-	if (!check_nospc_files) {
+	if (!fsinfo.nospc_size_ok) {
 		ofi = open_files;
 		while (ofi) {
 			if (ofi->fdi->file->no_space_error) {
@@ -2052,6 +2056,16 @@ static void get_tested_fs_info(void)
 	/* Get memory page size for 'mmap()' */
 	fsinfo.page_size = sysconf(_SC_PAGE_SIZE);
 	CHECK(fsinfo.page_size > 0);
+
+	/*
+	 * JFFS2 does not support shared writable mmap and it may report
+	 * incorrect file size after "no space" errors.
+	 */
+	if (strcmp(fsinfo.fstype, "jffs2") == 0) {
+		fsinfo.nospc_size_ok = 0;
+		fsinfo.can_mmap = 0;
+	}
+
 }
 
 static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
@@ -2144,15 +2158,6 @@ int main(int argc, char *argv[])
 	tests_file_system_mount_dir = (void *)args.mount_point;
 	tests_file_system_type = (void *)fsinfo.fstype;
 
-	/*
-	 * JFFS2 does not support shared writable mmap and it may report
-	 * incorrect file size after "no space" errors.
-	 */
-	if (strcmp(tests_file_system_type, "jffs2") == 0) {
-		check_nospc_files = 0;
-		can_mmap = 0;
-	}
-
 	/* Do the actual test */
 	ret = integck();
 	if (ret)
-- 
1.7.2.3

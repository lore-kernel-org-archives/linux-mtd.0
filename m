Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nS-0003SQ-8U
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:07 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFn4d018683
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:56 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 17/27] fs-tests: integck: clean up test directory creation
Date: Wed, 13 Apr 2011 18:18:57 +0300
Message-Id: <1302707947-6143-18-git-send-email-dedekind1@gmail.com>
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

Move the test directory name to the fsinfo structure and do few
other cleanups while on it.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   34 ++++++++++++++++++++++------------
 1 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index c21b488..ed02b56 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -44,6 +44,9 @@
 
 #define MAX_RANDOM_SEED 10000000
 
+/* The pattern for the top directory where we run the test */
+#define TEST_DIR_PATTERN "integck_test_dir_%u"
+
 /* The variables below are set by command line arguments */
 static struct {
 	long repeat_cnt;
@@ -64,6 +67,7 @@ static struct {
  * can_mmap: file-system supports share writable 'mmap()' operation
  * fstype: file-system type (e.g., "ubifs")
  * mount_point: tested file-system mount point path
+ * test_dir: the directory on the tested file-system where we test
  */
 static struct {
 	int max_name_len;
@@ -73,6 +77,7 @@ static struct {
 	unsigned int can_mmap:1;
 	const char *fstype;
 	const char *mount_point;
+	const char *test_dir;
 } fsinfo = {
 	.nospc_size_ok = 1,
 	.can_mmap = 1,
@@ -1970,27 +1975,21 @@ static void update_test_data(void)
 
 static int integck(void)
 {
-	unsigned int pid;
 	int64_t rpt;
-	char dir_name[256];
 
 	/* Make our top directory */
-	pid = getpid();
-	normsg("pid is %u", pid);
-	CHECK(sprintf(dir_name, "integck_test_dir_%u", pid) > 0);
-	if (chdir(dir_name) != -1) {
+	if (chdir(fsinfo.test_dir) != -1) {
 		/* Remove it if it is already there */
 		tests_clear_dir(".");
 		CHECK(chdir("..") != -1);
-		CHECK(rmdir(dir_name) != -1);
+		CHECK(rmdir(fsinfo.test_dir) != -1);
 	}
-	top_dir = dir_new(NULL, dir_name);
+	top_dir = dir_new(NULL, fsinfo.test_dir);
 
 	if (!top_dir)
 		return -1;
 
-	srand(pid);
-
+	srand(getpid());
 	create_test_data();
 
 	if (!tests_fs_is_rootfs()) {
@@ -2019,8 +2018,8 @@ static int integck(void)
 
 	/* Tidy up by removing everything */
 	close_open_files();
-	tests_clear_dir(dir_name);
-	CHECK(rmdir(dir_name) != -1);
+	tests_clear_dir(fsinfo.test_dir);
+	CHECK(rmdir(fsinfo.test_dir) != -1);
 
 	return 0;
 }
@@ -2036,6 +2035,7 @@ static void get_tested_fs_info(void)
         FILE *f;
 	uint64_t z;
 	char *p;
+	unsigned int pid;
 
 	/* Remove trailing '/' symbols from the mount point */
 	p = dup_string(args.mount_point);
@@ -2084,6 +2084,16 @@ static void get_tested_fs_info(void)
 
 	for (z = get_free_space(); z >= 10; z /= 10)
 		fsinfo.log10_initial_free += 1;
+
+	/* Pick the test directory name */
+	p = malloc(sizeof(TEST_DIR_PATTERN) + 20);
+	CHECK(p != NULL);
+	pid = getpid();
+	CHECK(sprintf(p, "integck_test_dir_%u", pid) > 0);
+	fsinfo.test_dir = p;
+
+	normsg("pid %u, testing \"%s\" at \"%s\"",
+	       pid, fsinfo.fstype, fsinfo.mount_point);
 }
 
 static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-- 
1.7.2.3

Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nO-0003QZ-Db
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:00 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFn4Z018683
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:53 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/27] fs-tests: integck: get rid of
	tests_check_test_file_system
Date: Wed, 13 Apr 2011 18:18:49 +0300
Message-Id: <1302707947-6143-10-git-send-email-dedekind1@gmail.com>
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

Stop using the shared 'tests_check_test_file_system()' function but
instead, use own independed version of this function. This is another
step forward the goal to make integck independent of the common
shared code.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   70 ++++++++++++++++++++++++++++++++---
 1 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index a225042..ebe4995 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -31,7 +31,10 @@
 #include <dirent.h>
 #include <getopt.h>
 #include <assert.h>
+#include <mntent.h>
 #include <sys/mman.h>
+#include <sys/vfs.h>
+#include <sys/mount.h>
 #include "tests.h"
 
 #define PROGRAM_VERSION "1.1"
@@ -48,6 +51,17 @@ static struct {
 	.repeat_cnt = 1,
 };
 
+/*
+ * The below data structure describes the tested file-system.
+ *
+ * max_name_len: maximum file name length
+ * fstype: file-system type (e.g., "ubifs")
+ */
+static struct {
+	int max_name_len;
+	const char *fstype;
+} fsinfo;
+
 /* Structures to store data written to the test file system,
    so that we can check whether the file system is correct. */
 
@@ -1383,7 +1397,7 @@ static char *make_name(struct dir_info *dir)
 	do {
 		found = 0;
 		if (tests_random_no(5) == 1) {
-			int i, n = tests_random_no(tests_max_fname_len) + 1;
+			int i, n = tests_random_no(fsinfo.max_name_len) + 1;
 
 			CHECK(n > 0 && n < 256);
 			for (i = 0; i < n; i++)
@@ -2000,6 +2014,43 @@ void integck(void)
 	CHECK(rmdir(dir_name) != -1);
 }
 
+/*
+ * Fill 'fsinfo' with information about the tested file-system.
+ */
+static void get_tested_fs_info(void)
+{
+	struct statfs fs_info;
+	struct mntent *mntent;
+	const char *mp;
+        FILE *f;
+
+	CHECK(statfs(args.mount_point, &fs_info) == 0);
+
+	fsinfo.max_name_len = fs_info.f_namelen;
+
+	mp = "/proc/mounts";
+        f = fopen(mp, "rb");
+        if (!f) {
+		mp = "/etc/mtab";
+                f = fopen(mp, "rb");
+	}
+	CHECK(f != NULL);
+
+        while (1) {
+		mntent = getmntent(f);
+                if (!mntent) {
+			errmsg("cannot find file-system info");
+			CHECK(0);
+		}
+
+		if (!strcmp(mntent->mnt_dir, args.mount_point))
+			break;
+        }
+        fclose(f);
+
+	fsinfo.fstype = dup_string(mntent->mnt_type);
+}
+
 static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 " - a stress test which checks the file-system integrity.\n"
 "It creates a directory named \"integck_test_dir_pid\", where where pid is the\n"
@@ -2023,10 +2074,13 @@ static const struct option long_options[] = {
 };
 
 /*
- * Parse input command-line options. Returns zero on success and -1 on error.
+ * Parse and validate input command-line options. Returns zero on success and
+ * -1 on error.
  */
 static int parse_opts(int argc, char * const argv[])
 {
+	struct stat st;
+
 	while (1) {
 		int key, error = 0;
 
@@ -2065,6 +2119,11 @@ static int parse_opts(int argc, char * const argv[])
 		return errmsg("more then one test file-system specified (use -h for help)");
 
 	args.mount_point = argv[optind];
+
+	if (chdir(args.mount_point) != 0 || lstat(args.mount_point, &st) != 0)
+		return errmsg("invalid test file system mount directory: %s",
+			      args.mount_point);
+
 	return 0;
 }
 
@@ -2076,12 +2135,11 @@ int main(int argc, char *argv[])
 	if (ret)
 		return EXIT_FAILURE;
 
+	get_tested_fs_info();
+
 	/* Temporary hack - will be fixed a bit later */
 	tests_file_system_mount_dir = (void *)args.mount_point;
-	tests_file_system_type = "ubifs";
-
-	/* Change directory to the file system and check it is ok for testing */
-	tests_check_test_file_system();
+	tests_file_system_type = (void *)fsinfo.fstype;
 
 	/*
 	 * JFFS2 does not support shared writable mmap and it may report
-- 
1.7.2.3

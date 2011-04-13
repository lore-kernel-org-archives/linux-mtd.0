Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nT-0003TU-U6
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:09 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFoff018740
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:58 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 21/27] fs-tests: integck: do not use tests_fs_is_rootfs
Date: Wed, 13 Apr 2011 18:19:01 +0300
Message-Id: <1302707947-6143-22-git-send-email-dedekind1@gmail.com>
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

Do not use the shared 'tests_fs_is_rootfs()' function - introduce
'fsinfo.is_rootfs' flag and utilize it instead. This is another step
forward the goal to make integck independent of the common code.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 92571d1..7a4bcdc 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -65,6 +65,7 @@ static struct {
  * nospc_size_ok: file size is updated even if the write operation failed with
  *                ENOSPC error
  * can_mmap: file-system supports share writable 'mmap()' operation
+ * is_rootfs: the tested file-system the root file-system
  * fstype: file-system type (e.g., "ubifs")
  * mount_point: tested file-system mount point path
  * test_dir: the directory on the tested file-system where we test
@@ -75,6 +76,7 @@ static struct {
 	unsigned int log10_initial_free;
 	unsigned int nospc_size_ok:1;
 	unsigned int can_mmap:1;
+	unsigned int is_rootfs:1;
 	const char *fstype;
 	const char *mount_point;
 	const char *test_dir;
@@ -2026,7 +2028,7 @@ static int integck(void)
 
 	create_test_data();
 
-	if (!tests_fs_is_rootfs()) {
+	if (fsinfo.is_rootfs) {
 		close_open_files();
 		tests_remount(); /* Requires root access */
 	}
@@ -2039,7 +2041,7 @@ static int integck(void)
 	for (rpt = 0; args.repeat_cnt == 0 || rpt < args.repeat_cnt; ++rpt) {
 		update_test_data();
 
-		if (!tests_fs_is_rootfs()) {
+		if (!fsinfo.is_rootfs) {
 			close_open_files();
 			tests_remount(); /* Requires root access */
 		}
@@ -2069,6 +2071,7 @@ static void get_tested_fs_info(void)
 	uint64_t z;
 	char *p;
 	unsigned int pid;
+	struct stat st1, st2;
 
 	/* Remove trailing '/' symbols from the mount point */
 	p = dup_string(args.mount_point);
@@ -2127,6 +2130,11 @@ static void get_tested_fs_info(void)
 
 	normsg("pid %u, testing \"%s\" at \"%s\"",
 	       pid, fsinfo.fstype, fsinfo.mount_point);
+
+	CHECK(stat(fsinfo.mount_point, &st1) == 0);
+	CHECK(stat("/", &st2) != -1);
+	if (st1.st_dev == st2.st_dev)
+		fsinfo.is_rootfs = 1;
 }
 
 static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-- 
1.7.2.3

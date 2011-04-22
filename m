Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3a-0002q5-PF
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:21 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM8lK025936
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:13 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 12/13] fs-tests: integck: improve remountability logic
Date: Fri, 22 Apr 2011 20:25:23 +0300
Message-Id: <1303493124-7619-13-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
References: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
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

The integck test assumes that if the FS is rootfs then it cannot
re-mount it, otherwise it can. However, this is not true because the
tested FS can be not remountable even if it is not rootfs, e.g., if
'integck' lives on this FS and is executed from it.

This patch improves the integck logic and actually checks wheter it
is possible to re-mount the FS before starting the test.

Also, it makes sure that power cut testing is run only on re-mountable
FS, because we have to be able to clean the "corrupted" state of the
file-system.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   46 +++++++++++++++++++++++++++--------
 1 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 9a2f3b4..55fe8be 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -95,7 +95,7 @@ static struct {
  * nospc_size_ok: file size is updated even if the write operation failed with
  *                ENOSPC error
  * can_mmap: file-system supports share writable 'mmap()' operation
- * is_rootfs: the tested file-system the root file-system
+ * can_remount: is it possible to re-mount the tested file-system?
  * fstype: file-system type (e.g., "ubifs")
  * fsdev: the underlying device mounted by the tested file-system
  * mount_opts: non-standard mount options of the tested file-system (non-standard
@@ -111,7 +111,7 @@ static struct {
 	unsigned int log10_initial_free;
 	unsigned int nospc_size_ok:1;
 	unsigned int can_mmap:1;
-	unsigned int is_rootfs:1;
+	unsigned int can_remount:1;
 	char *fstype;
 	char *fsdev;
 	char *mount_opts;
@@ -2534,12 +2534,13 @@ static int integck(void)
 	if (ret)
 		return -1;
 
-	if (!fsinfo.is_rootfs) {
+	if (fsinfo.can_remount) {
 		close_open_files();
 		ret = remount_tested_fs();
 		if (ret)
 			return -1;
-	}
+	} else
+		assert(!args.power_cut_mode);
 
 	/* Check everything */
 	check_run_no += 1;
@@ -2551,7 +2552,7 @@ static int integck(void)
 		if (ret)
 			return -1;
 
-		if (!fsinfo.is_rootfs) {
+		if (fsinfo.can_remount) {
 			close_open_files();
 			ret = remount_tested_fs();
 			if (ret)
@@ -2668,7 +2669,6 @@ static void get_tested_fs_info(void)
 	uint64_t z;
 	char *p;
 	unsigned int pid;
-	struct stat st1, st2;
 
 	/* Remove trailing '/' symbols from the mount point */
 	p = dup_string(args.mount_point);
@@ -2716,11 +2716,6 @@ static void get_tested_fs_info(void)
 
 	normsg("pid %u, testing \"%s\" at \"%s\"",
 	       pid, fsinfo.fstype, fsinfo.mount_point);
-
-	CHECK(stat(fsinfo.mount_point, &st1) == 0);
-	CHECK(stat("/", &st2) != -1);
-	if (st1.st_dev == st2.st_dev)
-		fsinfo.is_rootfs = 1;
 }
 
 static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
@@ -2972,6 +2967,35 @@ int main(int argc, char *argv[])
 		goto out_free;
 	}
 
+	/* Check whether we can re-mount the tested FS  */
+	do {
+		ret = recover_tested_fs();
+	} while (ret && args.power_cut_mode && errno == EROFS);
+
+	if (!ret) {
+		fsinfo.can_remount = 1;
+	} else {
+		warnmsg("file-system %s cannot be unmounted (%s)",
+			fsinfo.mount_point, strerror(errno));
+		if (args.power_cut_mode) {
+			/*
+			 * When testing emulated power cuts we have to be able
+			 * to re-mount the file-system to clean the EROFS
+			 * state.
+			 *
+			 * But there is also another reason. Imaging the test
+			 * writes many files successfully, and decides to check
+			 * them. But the test has done many modifications, so
+			 * there will be write-back. And when write-back fails,
+			 * Linux discards the dirty pages. So, if meanwhile FS
+			 * write-back encounters emulated power cut error, the
+			 * file checking will fail as well.
+			 */
+			errmsg("power cut mode requers unmountable FS");
+			goto out_free;
+		}
+	}
+
 	/* Do the actual test */
 	for (rpt = 0; ; rpt++) {
 		top_dir = zalloc(sizeof(struct dir_info));
-- 
1.7.2.3

Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QE1vi-0002zl-Vx
	for linux-mtd@lists.infradead.org; Sun, 24 Apr 2011 16:13:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3OGD1Je010524
	for <linux-mtd@lists.infradead.org>; Sun, 24 Apr 2011 19:13:01 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/5] fs-tests: integck: do not run checking when in power cut
	mode
Date: Sun, 24 Apr 2011 19:16:15 +0300
Message-Id: <1303661778-13214-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303661778-13214-1-git-send-email-dedekind1@gmail.com>
References: <1303661778-13214-1-git-send-email-dedekind1@gmail.com>
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

Do not check the file-system when we are in power cut mode. Currently
we still check the FS if we did not encounter any error, and the test
fails sometimes because meanwhile write-back encounters an error and
drops pages. Disable the checking so far. It should be enabled when
we implement the 'clean' flag for files.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   37 +++++++++++++++++++++++++----------
 1 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 52433ba..80d34c0 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -2507,9 +2507,32 @@ static int remount_tested_fs(void)
 
 static void check_tested_fs(void)
 {
-	check_run_no += 1;
-	dir_check(top_dir);
-	check_deleted_files();
+	/*
+	 * when we are in power cut mode we can only test files which have not
+	 * been modified since the last successful 'fsync()'. this is not
+	 * implemented yet.
+	 *
+	 * note, even if we have not encounter any error during the test, we
+	 * cannot test the file-system. indeed, consider the situation when we
+	 * have written data to file a. a lot of the data is currently cached
+	 * and is waiting for write-back. when write-back happens, an emulated
+	 * power cut may also happen and cause write-back to drop the errored
+	 * pages. and if we start checking the file a after this, we'll fail as
+	 * well.
+	 *
+	 * and even re-mounting will not help, because re-mounting will cause
+	 * full sync which may fail and data pages will be dropped, but
+	 * 'unmount()' will nevertheless succeed, and if we check the
+	 * file-system after this - the check will fail.
+	 *
+	 * and 'sync()' will not help as well since it does not return an
+	 * error.
+	 */
+	if (!args.power_cut_mode) {
+		check_run_no += 1;
+		dir_check(top_dir);
+		check_deleted_files();
+	}
 }
 
 /*
@@ -2985,14 +3008,6 @@ int main(int argc, char *argv[])
 			 * When testing emulated power cuts we have to be able
 			 * to re-mount the file-system to clean the EROFS
 			 * state.
-			 *
-			 * But there is also another reason. Imaging the test
-			 * writes many files successfully, and decides to check
-			 * them. But the test has done many modifications, so
-			 * there will be write-back. And when write-back fails,
-			 * Linux discards the dirty pages. So, if meanwhile FS
-			 * write-back encounters emulated power cut error, the
-			 * file checking will fail as well.
 			 */
 			errmsg("power cut mode requers unmountable FS");
 			goto out_free;
-- 
1.7.2.3

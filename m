Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMEnO-0004fZ-3Q
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 07:34:23 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4H7YFWt006045
	for <linux-mtd@lists.infradead.org>; Tue, 17 May 2011 10:34:20 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 04/11] fs-tests: integck: check direntries in power cut mode
Date: Tue, 17 May 2011 10:38:09 +0300
Message-Id: <1305617896-23711-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
References: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Enable directory entry checking in power cut mode. This means that with this
patch integck will check that all directory entries in the file-system were
created by integck.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   40 +++++++++--------------------------
 1 files changed, 11 insertions(+), 29 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index b411a68..1483f62 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1662,8 +1662,6 @@ static void dir_check(struct dir_info *dir)
 	int link_count = 2; /* Parent and dot */
 	struct stat st;
 
-	assert(!args.power_cut_mode);
-
 	/* Create an array of entries */
 	sz = sizeof(struct dir_entry_info *);
 	n = dir->number_of_entries;
@@ -1700,7 +1698,14 @@ static void dir_check(struct dir_info *dir)
 		}
 	}
 	CHECK(closedir(d) == 0);
-	CHECK(checked == dir->number_of_entries);
+
+	/*
+	 * In power cut mode the file-system may miss some directory entries
+	 * because it is possible that they have not reached the media by the
+	 * time of the emulated power cut.
+	 */
+	if (!args.power_cut_mode)
+		CHECK(checked == dir->number_of_entries);
 
 	/* Now check each entry */
 	entry = dir->first;
@@ -2577,32 +2582,9 @@ static int remount_tested_fs(void)
 
 static void check_tested_fs(void)
 {
-	/*
-	 * when we are in power cut mode we can only test files which have not
-	 * been modified since the last successful 'fsync()'. this is not
-	 * implemented yet.
-	 *
-	 * note, even if we have not encounter any error during the test, we
-	 * cannot test the file-system. indeed, consider the situation when we
-	 * have written data to file a. a lot of the data is currently cached
-	 * and is waiting for write-back. when write-back happens, an emulated
-	 * power cut may also happen and cause write-back to drop the errored
-	 * pages. and if we start checking the file a after this, we'll fail as
-	 * well.
-	 *
-	 * and even re-mounting will not help, because re-mounting will cause
-	 * full sync which may fail and data pages will be dropped, but
-	 * 'unmount()' will nevertheless succeed, and if we check the
-	 * file-system after this - the check will fail.
-	 *
-	 * and 'sync()' will not help as well since it does not return an
-	 * error.
-	 */
-	if (!args.power_cut_mode) {
-		check_run_no += 1;
-		dir_check(top_dir);
-		check_deleted_files();
-	}
+	check_run_no += 1;
+	dir_check(top_dir);
+	check_deleted_files();
 }
 
 /*
-- 
1.7.2.3

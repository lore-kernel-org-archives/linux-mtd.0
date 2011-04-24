Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QE1vi-0002zj-W2
	for linux-mtd@lists.infradead.org; Sun, 24 Apr 2011 16:13:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3OGD0Ne010309
	for <linux-mtd@lists.infradead.org>; Sun, 24 Apr 2011 19:13:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/5] fs-tests: integck: introduce a helper for checking
Date: Sun, 24 Apr 2011 19:16:14 +0300
Message-Id: <1303661778-13214-2-git-send-email-dedekind1@gmail.com>
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

Introduce a 'check_tested_fs()' helper function.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 63f6956..52433ba 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -2505,6 +2505,13 @@ static int remount_tested_fs(void)
 	return 0;
 }
 
+static void check_tested_fs(void)
+{
+	check_run_no += 1;
+	dir_check(top_dir);
+	check_deleted_files();
+}
+
 /*
  * Perform the test. Returns zero on success and -1 on failure.
  */
@@ -2543,9 +2550,7 @@ static int integck(void)
 		assert(!args.power_cut_mode);
 
 	/* Check everything */
-	check_run_no += 1;
-	dir_check(top_dir);
-	check_deleted_files();
+	check_tested_fs();
 
 	for (rpt = 0; args.repeat_cnt == 0 || rpt < args.repeat_cnt; ++rpt) {
 		ret = update_test_data();
@@ -2560,9 +2565,7 @@ static int integck(void)
 		}
 
 		/* Check everything */
-		check_run_no += 1;
-		dir_check(top_dir);
-		check_deleted_files();
+		check_tested_fs();
 	}
 
 	/* Tidy up by removing everything */
-- 
1.7.2.3

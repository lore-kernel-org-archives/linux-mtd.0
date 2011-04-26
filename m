Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEetC-0007yN-6H
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 09:49:03 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3Q9mxL1018828
	for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2011 12:49:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] fs-tests: integck: limit the recursion depth
Date: Tue, 26 Apr 2011 12:52:25 +0300
Message-Id: <1303811545-30840-1-git-send-email-dedekind1@gmail.com>
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

I observes segfaults in integck test, and unfortunately I do not have the core
file to investigate the problem. But I see one possibility for the test to
segfault - it has unbounded recursion. Limit the maximum recursion depth.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 1dd424e..a35b7ae 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -2094,11 +2094,20 @@ static int operate_on_file(struct file_info *file)
 	return 0;
 }
 
+/*
+ * The operate on entry function is recursive because it calls
+ * 'operate_on_dir()' which calls 'operate_on_entry()' again. This variable is
+ * used to limit the recursion depth.
+ */
+static int recursion_depth;
+
 /* Randomly select something to do with a directory entry */
 static int operate_on_entry(struct dir_entry_info *entry)
 {
 	int ret = 0;
 
+	recursion_depth += 1;
+
 	/* 1 time in 1000 rename */
 	if (random_no(1000) == 0)
 		ret = rename_entry(entry);
@@ -2111,7 +2120,7 @@ static int operate_on_entry(struct dir_entry_info *entry)
 		/* If shrinking, 1 time in 50, remove a directory */
 		if (shrink && random_no(50) == 0)
 			ret = dir_remove(entry->dir);
-		else
+		else if (recursion_depth < 20)
 			ret = operate_on_dir(entry->dir);
 	} else if (entry->type == 'f') {
 		/* If shrinking, 1 time in 10, remove a file */
@@ -2124,6 +2133,8 @@ static int operate_on_entry(struct dir_entry_info *entry)
 		else
 			ret = operate_on_file(entry->file);
 	}
+
+	recursion_depth -= 1;
 	return ret;
 }
 
-- 
1.7.2.3

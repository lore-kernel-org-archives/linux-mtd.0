Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURw-00067k-Re
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:09 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFlpJ009474
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:55 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 20/35] fs-tests: integck: make rename_entry return error on
	failure
Date: Wed, 20 Apr 2011 13:18:53 +0300
Message-Id: <1303294748-5492-21-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
References: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
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

Make 'rename_entry()' return an error to the caller when it fails
to rename a directory entry.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   23 +++++++++++++----------
 1 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 09b4a7d..f56ff66 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1664,7 +1664,7 @@ static char *pick_rename_name(struct dir_info **parent,
 	return dup_string(entry->name);
 }
 
-static void rename_entry(struct dir_entry_info *entry)
+static int rename_entry(struct dir_entry_info *entry)
 {
 	struct dir_entry_info *rename_entry = NULL;
 	struct dir_info *parent;
@@ -1672,7 +1672,7 @@ static void rename_entry(struct dir_entry_info *entry)
 	int ret, isdir, retry;
 
 	if (!entry->parent)
-		return;
+		return 0;
 
 	for (retry = 0; retry < 3; retry++) {
 		path = dir_path(entry->parent, entry->name);
@@ -1701,17 +1701,21 @@ static void rename_entry(struct dir_entry_info *entry)
 	}
 
 	if (!path)
-		return;
+		return 0;
 
 	ret = rename(path, to);
 	if (ret != 0) {
+		ret = 0;
 		if (errno == ENOSPC)
 			full = 1;
-		CHECK(errno == ENOSPC || errno == EBUSY);
+		else if (errno !=  EBUSY) {
+			pcv("failed to rename %s to %s", path, to);
+			ret = -1;
+		}
 		free(path);
 		free(name);
 		free(to);
-		return;
+		return ret;
 	}
 
 	free(path);
@@ -1720,7 +1724,7 @@ static void rename_entry(struct dir_entry_info *entry)
 	if (rename_entry && rename_entry->type == entry->type &&
 	    rename_entry->target == entry->target) {
 		free(name);
-		return;
+		return 0;
 	}
 
 	add_dir_entry(parent, entry->type, name, entry->target);
@@ -1728,6 +1732,7 @@ static void rename_entry(struct dir_entry_info *entry)
 		remove_dir_entry(rename_entry);
 	remove_dir_entry(entry);
 	free(name);
+	return 0;
 }
 
 static size_t str_count(const char *s, char c)
@@ -1904,10 +1909,8 @@ static void operate_on_file(struct file_info *file)
 static int operate_on_entry(struct dir_entry_info *entry)
 {
 	/* 1 time in 1000 rename */
-	if (random_no(1000) == 0) {
-		rename_entry(entry);
-		return 0;
-	}
+	if (random_no(1000) == 0)
+		return rename_entry(entry);
 	if (entry->type == 's') {
 		symlink_check(entry->symlink);
 		/* If shrinking, 1 time in 50, remove a symlink */
-- 
1.7.2.3

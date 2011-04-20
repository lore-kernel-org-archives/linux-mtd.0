Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURx-000684-8H
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:08 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmUu009491
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:55 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 21/35] fs-tests: integck: teach symlink_remove return error on
	removal failure
Date: Wed, 20 Apr 2011 13:18:54 +0300
Message-Id: <1303294748-5492-22-git-send-email-dedekind1@gmail.com>
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

When 'symlink_remove()' fails to unling a symlink - return an error to
the calling function.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index f56ff66..a486229 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -482,7 +482,7 @@ static int dir_new(struct dir_info *parent, const char *name)
 
 static int file_delete(struct file_info *file);
 static int file_unlink(struct dir_entry_info *entry);
-static void symlink_remove(struct symlink_info *symlink);
+static int symlink_remove(struct symlink_info *symlink);
 
 static void dir_remove(struct dir_info *dir)
 {
@@ -1851,16 +1851,20 @@ static int symlink_new(struct dir_info *dir, const char *nm)
 	return 0;
 }
 
-static void symlink_remove(struct symlink_info *symlink)
+static int symlink_remove(struct symlink_info *symlink)
 {
 	char *path;
 
 	path = dir_path(symlink->entry->parent, symlink->entry->name);
+	if (unlink(path) != 0) {
+		pcv("cannot unlink symlink %s", path);
+		free(path);
+		return -1;
+	}
 
 	remove_dir_entry(symlink->entry);
-
-	CHECK(unlink(path) == 0);
 	free(path);
+	return 0;
 }
 
 static int operate_on_dir(struct dir_info *dir);
@@ -1915,7 +1919,7 @@ static int operate_on_entry(struct dir_entry_info *entry)
 		symlink_check(entry->symlink);
 		/* If shrinking, 1 time in 50, remove a symlink */
 		if (shrink && random_no(50) == 0)
-			symlink_remove(entry->symlink);
+			return symlink_remove(entry->symlink);
 		return 0;
 	}
 	if (entry->type == 'd') {
-- 
1.7.2.3

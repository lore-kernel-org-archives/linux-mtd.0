Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURw-00067G-6k
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:08 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmUs009491
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:54 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 18/35] fs-tests: integck: teach link_new to return error on
	creation failure
Date: Wed, 20 Apr 2011 13:18:51 +0300
Message-Id: <1303294748-5492-19-git-send-email-dedekind1@gmail.com>
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

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   21 +++++++++++++--------
 1 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index fbf24fb..14d112f 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -542,8 +542,8 @@ static int file_new(struct dir_info *parent, const char *name)
 	return 0;
 }
 
-static void link_new(struct dir_info *parent, const char *name,
-		     struct file_info *file)
+static int link_new(struct dir_info *parent, const char *name,
+		    struct file_info *file)
 {
 	struct dir_entry_info *entry;
 	char *path, *target;
@@ -551,21 +551,26 @@ static void link_new(struct dir_info *parent, const char *name,
 
 	entry = file->links;
 	if (!entry)
-		return;
+		return 0;
+
 	path = dir_path(parent, name);
 	target = dir_path(entry->parent, entry->name);
 	ret = link(target, path);
 	if (ret != 0) {
-		CHECK(errno == ENOSPC);
+		if (errno == ENOSPC) {
+			ret = 0;
+			full = 1;
+		} else
+			pcv("cannot create hardlink %s in directory %s to file %s",
+			    path, parent->name, target);
 		free(target);
 		free(path);
-		full = 1;
-		return;
+		return ret;
 	}
 	free(target);
 	free(path);
-
 	add_dir_entry(parent, 'f', name, file);
+	return 0;
 }
 
 static void file_close(struct fd_info *fdi);
@@ -1952,7 +1957,7 @@ static int operate_on_dir(struct dir_info *dir)
 		return dir_new(dir, make_name(dir));
 	else if (r == 2 && grow && (file = pick_file()) != NULL)
 		/* When growing, 1 time in 14 create a hard link */
-		link_new(dir, make_name(dir), file);
+		return link_new(dir, make_name(dir), file);
 	else if (r == 3 && grow && random_no(5) == 0)
 		/* When growing, 1 time in 70 create a symbolic link */
 		return symlink_new(dir, make_name(dir));
-- 
1.7.2.3

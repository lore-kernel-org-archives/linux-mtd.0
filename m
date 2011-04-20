Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURv-00066d-7x
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:04 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFnam009530
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:53 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 16/35] fs-tests: integck: teach dir_new return error on
	creation failure
Date: Wed, 20 Apr 2011 13:18:49 +0300
Message-Id: <1303294748-5492-17-git-send-email-dedekind1@gmail.com>
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
 tests/fs-tests/integrity/integck.c |   30 ++++++++++++++++++------------
 1 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 471fcf4..e69d4c4 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -451,23 +451,24 @@ static void remove_dir_entry(struct dir_entry_info *entry)
 
 /*
  * Create a new directory "name" in the parent directory described by "parent"
- * and add it to the in-memory list of directories. In case of success, returns
- * a pointer to the new 'struct dir_info' object. Returns 'NULL' in case of
- * failure.
+ * and add it to the in-memory list of directories. Returns zero in case of
+ * success and -1 in case of failure.
  */
-static struct dir_info *dir_new(struct dir_info *parent, const char *name)
+static int dir_new(struct dir_info *parent, const char *name)
 {
 	struct dir_info *dir;
 	char *path;
 
 	path = dir_path(parent, name);
 	if (mkdir(path, 0777) != 0) {
-		if (errno == ENOSPC)
+		if (errno == ENOSPC) {
 			full = 1;
-		else
-			pcv("cannot create directory %s", path);
+			free(path);
+			return 0;
+		}
+		pcv("cannot create directory %s", path);
 		free(path);
-		return NULL;
+		return -1;
 	}
 	free(path);
 
@@ -476,7 +477,7 @@ static struct dir_info *dir_new(struct dir_info *parent, const char *name)
 	dir->parent = parent;
 	if (parent)
 		add_dir_entry(parent, 'd', name, dir);
-	return dir;
+	return 0;
 }
 
 static int file_delete(struct file_info *file);
@@ -1937,7 +1938,7 @@ static int operate_on_dir(struct dir_info *dir)
 		return file_new(dir, make_name(dir));
 	else if (r == 1 && grow)
 		/* When growing, 1 time in 14 create a directory */
-		dir_new(dir, make_name(dir));
+		return dir_new(dir, make_name(dir));
 	else if (r == 2 && grow && (file = pick_file()) != NULL)
 		/* When growing, 1 time in 14 create a hard link */
 		link_new(dir, make_name(dir), file);
@@ -2298,9 +2299,14 @@ static int integck(void)
 			return -1;
 	}
 
-	top_dir = dir_new(NULL, fsinfo.test_dir);
-	if (!top_dir)
+	ret = mkdir(fsinfo.test_dir, 0777);
+	if (ret) {
+		pcv("cannot create top test directory %s", fsinfo.test_dir);
 		return -1;
+	}
+
+	top_dir = zalloc(sizeof(struct dir_info));
+	top_dir->name = dup_string(fsinfo.test_dir);
 
 	ret = create_test_data();
 	if (ret)
-- 
1.7.2.3

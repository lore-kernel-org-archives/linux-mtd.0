Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCUS4-00063q-A7
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFnlN009509
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:16:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 33/35] fs-tests: integck: lessen memory consumption
Date: Wed, 20 Apr 2011 13:19:06 +0300
Message-Id: <1303294748-5492-34-git-send-email-dedekind1@gmail.com>
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

We do not need to store directory name in the 'struct dir_info' objects,
because we already have it in 'struct dir_entry_info'. So we duplicate
the names for directories in 'dir->name' and 'dir->entry->name'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   18 ++++++++----------
 1 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 03b3a01..d5ee08e 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -163,7 +163,6 @@ struct symlink_info /* Each symlink has one of these */
 
 struct dir_info /* Each directory has one of these */
 {
-	char *name;
 	struct dir_info *parent; /* Parent directory or null
 					for our top directory */
 	unsigned int number_of_entries;
@@ -332,7 +331,7 @@ static char *dir_path(struct dir_info *parent, const char *name)
 
 	if (!parent)
 		return cat_paths(fsinfo.mount_point, name);
-	parent_path = dir_path(parent->parent, parent->name);
+	parent_path = dir_path(parent->parent, parent->entry->name);
 	path = cat_paths(parent_path, name);
 	free(parent_path);
 	return path;
@@ -411,7 +410,6 @@ static void add_dir_entry(struct dir_info *parent, char type, const char *name,
 
 		entry->dir = dir;
 		dir->entry = entry;
-		dir->name = dup_string(name);
 		dir->parent = parent;
 	} else if (entry->type == 's') {
 		struct symlink_info *symlink = target;
@@ -505,7 +503,7 @@ static int dir_remove(struct dir_info *dir)
 	}
 
 	/* Remove directory form the file-system */
-	path = dir_path(dir->parent, dir->name);
+	path = dir_path(dir->parent, dir->entry->name);
 	if (rmdir(path) != 0) {
 		pcv("cannot remove directory entry %s", path);
 		free(path);
@@ -515,7 +513,6 @@ static int dir_remove(struct dir_info *dir)
 	/* Remove entry from parent directory */
 	remove_dir_entry(dir->entry);
 	free(path);
-	free(dir->name);
 	free(dir);
 	return 0;
 }
@@ -570,7 +567,7 @@ static int link_new(struct dir_info *parent, const char *name,
 			full = 1;
 		} else
 			pcv("cannot create hardlink %s in directory %s to file %s",
-			    path, parent->name, target);
+			    path, parent->entry->name, target);
 		free(target);
 		free(path);
 		return ret;
@@ -706,7 +703,7 @@ static void file_info_display(struct file_info *file)
 	entry = file->links;
 	while (entry) {
 		normsg("      Name: %s", entry->name);
-		normsg("      Directory: %s", entry->parent->name);
+		normsg("      Directory: %s", entry->parent->entry->name);
 		entry = entry->next_link;
 	}
 	normsg("    Length: %llu", (unsigned long long)file->length);
@@ -1510,7 +1507,7 @@ static void dir_check(struct dir_info *dir)
 	qsort(entry_array, n, sz, sort_comp);
 
 	/* Go through directory on file system checking entries match */
-	path = dir_path(dir->parent, dir->name);
+	path = dir_path(dir->parent, dir->entry->name);
 	d = opendir(path);
 	CHECK(d != NULL);
 	for (;;) {
@@ -1867,7 +1864,7 @@ static int symlink_new(struct dir_info *dir, const char *nm)
 			full = 1;
 		else if (errno != ENAMETOOLONG) {
 			pcv("cannot create symlink %s in directory %s to file %s",
-			    path, dir->name, target);
+			    path, dir->entry->name, target);
 			ret = -1;
 		}
 		free(target);
@@ -2356,7 +2353,8 @@ static int integck(void)
 	}
 
 	top_dir = zalloc(sizeof(struct dir_info));
-	top_dir->name = dup_string(fsinfo.test_dir);
+	top_dir->entry = zalloc(sizeof(struct dir_entry_info));
+	top_dir->entry->name = dup_string(fsinfo.test_dir);
 
 	ret = create_test_data();
 	if (ret)
-- 
1.7.2.3

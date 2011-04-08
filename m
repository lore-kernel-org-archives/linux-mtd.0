Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DNZ-0001Oi-2u
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:13:49 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p38FDhJX017790
	for <linux-mtd@lists.infradead.org>; Fri, 8 Apr 2011 18:13:44 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/6] fs-tests: integck: simplify dir_entry_info fields
Date: Fri,  8 Apr 2011 18:16:47 +0300
Message-Id: <1302275810-12632-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1302275810-12632-1-git-send-email-dedekind1@gmail.com>
References: <1302275810-12632-1-git-send-email-dedekind1@gmail.com>
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

Instead of using named union 'entry' in 'struct dir_entry_info'
and having to type long 'entry->entry.file', 'entry->entry.symlink',
etc, use anonymous union which makes the syntax simpler: 'entry->file',
'entry->symlink', etc.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   59 +++++++++++++++++------------------
 1 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index b53f11d..1801b20 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -89,13 +89,12 @@ struct dir_entry_info /* Each entry in a directory has one of these */
 	struct dir_info *parent; /* Parent directory */
 	char type; /* f => file, d => dir, s => symlink */
 	int checked; /* Temporary flag used when checking */
-	union entry_
-	{
+	union {
 		struct file_info *file;
 		struct dir_info *dir;
 		struct symlink_info *symlink;
 		void *target;
-	} entry;
+	};
 };
 
 struct fd_info /* We keep a number of files open */
@@ -288,7 +287,7 @@ static void add_dir_entry(struct dir_info *parent, char type, const char *name,
 	if (entry->type == 'f') {
 		struct file_info *file = target;
 
-		entry->entry.file = file;
+		entry->file = file;
 		entry->next_link = file->links;
 		if (file->links)
 			file->links->prev_link = entry;
@@ -297,14 +296,14 @@ static void add_dir_entry(struct dir_info *parent, char type, const char *name,
 	} else if (entry->type == 'd') {
 		struct dir_info *dir = target;
 
-		entry->entry.dir = dir;
+		entry->dir = dir;
 		dir->entry = entry;
 		dir->name = copy_string(name);
 		dir->parent = parent;
 	} else if (entry->type == 's') {
 		struct symlink_info *symlink = target;
 
-		entry->entry.symlink = symlink;
+		entry->symlink = symlink;
 		symlink->entry = entry;
 	}
 }
@@ -320,7 +319,7 @@ static void remove_dir_entry(struct dir_entry_info *entry)
 		entry->next->prev = entry->prev;
 
 	if (entry->type == 'f') {
-		struct file_info *file = entry->entry.file;
+		struct file_info *file = entry->file;
 
 		if (entry->prev_link)
 			entry->prev_link->next_link = entry->next_link;
@@ -373,11 +372,11 @@ static void dir_remove(struct dir_info *dir)
 
 		entry = dir->first;
 		if (entry->type == 'd')
-			dir_remove(entry->entry.dir);
+			dir_remove(entry->dir);
 		else if (entry->type == 'f')
 			file_unlink(entry);
 		else if (entry->type == 's')
-			symlink_remove(entry->entry.symlink);
+			symlink_remove(entry->symlink);
 		else
 			CHECK(0); /* Invalid struct dir_entry_info */
 	}
@@ -463,7 +462,7 @@ static void file_close_all(struct file_info *file)
 
 static void file_unlink(struct dir_entry_info *entry)
 {
-	struct file_info *file = entry->entry.file;
+	struct file_info *file = entry->file;
 	char *path;
 
 	path = dir_path(entry->parent, entry->name);
@@ -1325,12 +1324,12 @@ static void dir_check(struct dir_info *dir)
 	entry = dir->first;
 	while (entry) {
 		if (entry->type == 'd') {
-			dir_check(entry->entry.dir);
+			dir_check(entry->dir);
 			link_count += 1; /* <subdir>/.. */
 		} else if (entry->type == 'f')
-			file_check(entry->entry.file, -1);
+			file_check(entry->file, -1);
 		else if (entry->type == 's')
-			symlink_check(entry->entry.symlink);
+			symlink_check(entry->symlink);
 		else
 			CHECK(0);
 		entry = entry->next;
@@ -1405,13 +1404,13 @@ static struct file_info *pick_file(void)
 			if (!entry)
 				return NULL;
 			if (entry->type == 'f')
-				return entry->entry.file;
+				return entry->file;
 			if (entry->type == 'd')
-				if (entry->entry.dir->number_of_entries != 0)
+				if (entry->dir->number_of_entries != 0)
 					break;
 			entry = entry->next;
 		}
-		dir = entry->entry.dir;
+		dir = entry->dir;
 	}
 }
 
@@ -1450,7 +1449,7 @@ static struct dir_info *pick_dir(void)
 		}
 		if (!entry)
 			return dir;
-		dir = entry->entry.dir;
+		dir = entry->dir;
 		if (tests_random_no(40) >= 30)
 			return dir;
 	}
@@ -1478,7 +1477,7 @@ static char *pick_rename_name(struct dir_info **parent,
 	if (!entry)
 		entry = dir->first;
 	if (!entry ||
-	    (entry->type == 'd' && entry->entry.dir->number_of_entries != 0))
+	    (entry->type == 'd' && entry->dir->number_of_entries != 0))
 		return copy_string(make_name(dir));
 
 	if ((isdir && entry->type != 'd') ||
@@ -1512,9 +1511,9 @@ static void rename_entry(struct dir_entry_info *entry)
 			struct dir_info *p;
 
 			for (p = parent; p; p = p->parent)
-				if (p == entry->entry.dir)
+				if (p == entry->dir)
 					break;
-			if (p == entry->entry.dir) {
+			if (p == entry->dir) {
 				free(path);
 				free(name);
 				free(to);
@@ -1543,12 +1542,12 @@ static void rename_entry(struct dir_entry_info *entry)
 	free(to);
 
 	if (rename_entry && rename_entry->type == entry->type &&
-	    rename_entry->entry.target == entry->entry.target) {
+	    rename_entry->target == entry->target) {
 		free(name);
 		return;
 	}
 
-	add_dir_entry(parent, entry->type, name, entry->entry.target);
+	add_dir_entry(parent, entry->type, name, entry->target);
 	if (rename_entry)
 		remove_dir_entry(rename_entry);
 	remove_dir_entry(entry);
@@ -1684,33 +1683,33 @@ static void operate_on_entry(struct dir_entry_info *entry)
 		return;
 	}
 	if (entry->type == 's') {
-		symlink_check(entry->entry.symlink);
+		symlink_check(entry->symlink);
 		/* If shrinking, 1 time in 50, remove a symlink */
 		if (shrink && tests_random_no(50) == 0)
-			symlink_remove(entry->entry.symlink);
+			symlink_remove(entry->symlink);
 		return;
 	}
 	if (entry->type == 'd') {
 		/* If shrinking, 1 time in 50, remove a directory */
 		if (shrink && tests_random_no(50) == 0) {
-			dir_remove(entry->entry.dir);
+			dir_remove(entry->dir);
 			return;
 		}
-		operate_on_dir(entry->entry.dir);
+		operate_on_dir(entry->dir);
 	}
 	if (entry->type == 'f') {
 		/* If shrinking, 1 time in 10, remove a file */
 		if (shrink && tests_random_no(10) == 0) {
-			file_delete(entry->entry.file);
+			file_delete(entry->file);
 			return;
 		}
 		/* If not growing, 1 time in 10, unlink a file with links > 1 */
-		if (!grow && entry->entry.file->link_count > 1 &&
+		if (!grow && entry->file->link_count > 1 &&
 		    tests_random_no(10) == 0) {
-			file_unlink_file(entry->entry.file);
+			file_unlink_file(entry->file);
 			return;
 		}
-		operate_on_file(entry->entry.file);
+		operate_on_file(entry->file);
 	}
 }
 
-- 
1.7.2.3

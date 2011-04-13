Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nO-0003QG-02
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:01 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFnow018691
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:52 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 08/27] fs-tests: integck: clean-up copy_string
Date: Wed, 13 Apr 2011 18:18:48 +0300
Message-Id: <1302707947-6143-9-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
References: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
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

This is a clean-up patch which:
1. Simplifies copy_string by useng strdup instead of malloc
2. Adds an assertion which checks the input parameter agains NULL,
   instead of checking it.
3. Re-names it to dup_string which looks more readable to me.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   46 ++++++++++++++++++-----------------
 1 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 281de81..a225042 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -30,6 +30,7 @@
 #include <limits.h>
 #include <dirent.h>
 #include <getopt.h>
+#include <assert.h>
 #include <sys/mman.h>
 #include "tests.h"
 
@@ -172,15 +173,16 @@ static void *zalloc(size_t size)
 	return buf;
 }
 
-static char *copy_string(const char *s)
+/*
+ * Duplicate a string.
+ */
+static char *dup_string(const char *s)
 {
 	char *str;
 
-	if (!s)
-		return NULL;
-	str = malloc(strlen(s) + 1);
+	assert(s != NULL);
+	str = strdup(s);
 	CHECK(str != NULL);
-	strcpy(str, s);
 	return str;
 }
 
@@ -190,9 +192,9 @@ static char *cat_strings(const char *a, const char *b)
 	size_t sz;
 
 	if (a && !b)
-		return copy_string(a);
+		return dup_string(a);
 	if (b && !a)
-		return copy_string(b);
+		return dup_string(b);
 	if (!a && !b)
 		return NULL;
 	sz = strlen(a) + strlen(b) + 1;
@@ -211,9 +213,9 @@ static char *cat_paths(const char *a, const char *b)
 	size_t na, nb;
 
 	if (a && !b)
-		return copy_string(a);
+		return dup_string(a);
 	if (b && !a)
-		return copy_string(b);
+		return dup_string(b);
 	if (!a && !b)
 		return NULL;
 
@@ -301,7 +303,7 @@ static void add_dir_entry(struct dir_info *parent, char type, const char *name,
 
 	entry = zalloc(sizeof(struct dir_entry_info));
 	entry->type = type;
-	entry->name = copy_string(name);
+	entry->name = dup_string(name);
 	entry->parent = parent;
 
 	entry->next = parent->first;
@@ -324,7 +326,7 @@ static void add_dir_entry(struct dir_info *parent, char type, const char *name,
 
 		entry->dir = dir;
 		dir->entry = entry;
-		dir->name = copy_string(name);
+		dir->name = dup_string(name);
 		dir->parent = parent;
 	} else if (entry->type == 's') {
 		struct symlink_info *symlink = target;
@@ -377,7 +379,7 @@ static struct dir_info *dir_new(struct dir_info *parent, const char *name)
 	free(path);
 
 	dir = zalloc(sizeof(struct dir_info));
-	dir->name = copy_string(name);
+	dir->name = dup_string(name);
 	dir->parent = parent;
 	if (parent)
 		add_dir_entry(parent, 'd', name, dir);
@@ -435,7 +437,7 @@ static struct file_info *file_new(struct dir_info *parent, const char *name)
 	free(path);
 
 	file = zalloc(sizeof(struct file_info));
-	file->name = copy_string(name);
+	file->name = dup_string(name);
 
 	add_dir_entry(parent, 'f', name, file);
 
@@ -1210,7 +1212,7 @@ static char *symlink_path(const char *path, const char *target_pathname)
 	size_t len, totlen, tarlen;
 
 	if (target_pathname[0] == '/')
-		return copy_string(target_pathname);
+		return dup_string(target_pathname);
 	p = strrchr(path, '/');
 	len = p - path;
 	len += 1;
@@ -1479,7 +1481,7 @@ static char *pick_rename_name(struct dir_info **parent,
 	*rename_entry = NULL;
 
 	if (grow || tests_random_no(20) < 10)
-		return copy_string(make_name(dir));
+		return dup_string(make_name(dir));
 
 	r = tests_random_no(dir->number_of_entries);
 	entry = dir->first;
@@ -1491,14 +1493,14 @@ static char *pick_rename_name(struct dir_info **parent,
 		entry = dir->first;
 	if (!entry ||
 	    (entry->type == 'd' && entry->dir->number_of_entries != 0))
-		return copy_string(make_name(dir));
+		return dup_string(make_name(dir));
 
 	if ((isdir && entry->type != 'd') ||
 	    (!isdir && entry->type == 'd'))
-		return copy_string(make_name(dir));
+		return dup_string(make_name(dir));
 
 	*rename_entry = entry;
-	return copy_string(entry->name);
+	return dup_string(entry->name);
 }
 
 static void rename_entry(struct dir_entry_info *entry)
@@ -1593,13 +1595,13 @@ static char *relative_path(const char *path1, const char *path2)
 	len2 = strlen(p2);
 	up = str_count(p1, '/');
 	if (up == 0 && len2 != 0)
-		return copy_string(p2);
+		return dup_string(p2);
 	if (up == 0 && len2 == 0) {
 		p2 = strrchr(path2, '/');
-		return copy_string(p2);
+		return dup_string(p2);
 	}
 	if (up == 1 && len2 == 0)
-		return copy_string(".");
+		return dup_string(".");
 	if (len2 == 0)
 		up -= 1;
 	len = up * 3 + len2 + 1;
@@ -1651,7 +1653,7 @@ static char *pick_symlink_target(const char *symlink_path)
 static void symlink_new(struct dir_info *dir, const char *name_)
 {
 	struct symlink_info *s;
-	char *path, *target, *name = copy_string(name_);
+	char *path, *target, *name = dup_string(name_);
 
 	path = dir_path(dir, name);
 	target = pick_symlink_target(path);
-- 
1.7.2.3

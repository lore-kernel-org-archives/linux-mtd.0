Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DNY-0001Og-NR
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:13:47 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p38FDhpY017772
	for <linux-mtd@lists.infradead.org>; Fri, 8 Apr 2011 18:13:43 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/6] fs-tests: integck: introduce zalloc
Date: Fri,  8 Apr 2011 18:16:45 +0300
Message-Id: <1302275810-12632-2-git-send-email-dedekind1@gmail.com>
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

The integck test often allocates memory and fills it with zeroes.
Introduce a helper function for this frequent operation.

This is just a clean-up patch which makes the code 23 lines shorter.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   67 ++++++++++++------------------------
 1 files changed, 22 insertions(+), 45 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 145557f..a3f4130 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -135,6 +135,18 @@ static long mem_page_size; /* Page size for mmap */
 
 static uint64_t check_run_no;
 
+/*
+ * Allocate a buffer of 'size' bytes and fill it with zeroes.
+ */
+static void *zalloc(size_t size)
+{
+	void *buf = malloc(size);
+
+	CHECK(buf != NULL);
+	memset(buf, 0, size);
+	return buf;
+}
+
 static char *copy_string(const char *s)
 {
 	char *str;
@@ -218,12 +230,8 @@ static char *dir_path(struct dir_info *parent, const char *name)
 static void open_file_add(struct fd_info *fdi)
 {
 	struct open_file_info *ofi;
-	size_t sz;
 
-	sz = sizeof(struct open_file_info);
-	ofi = (struct open_file_info *) malloc(sz);
-	CHECK(ofi != NULL);
-	memset(ofi, 0, sz);
+	ofi = zalloc(sizeof(struct open_file_info));
 	ofi->next = open_files;
 	ofi->fdi = fdi;
 	open_files = ofi;
@@ -251,12 +259,8 @@ static void open_file_remove(struct fd_info *fdi)
 static struct fd_info *add_fd(struct file_info *file, int fd)
 {
 	struct fd_info *fdi;
-	size_t sz;
 
-	sz = sizeof(struct fd_info);
-	fdi = (struct fd_info *) malloc(sz);
-	CHECK(fdi != NULL);
-	memset(fdi, 0, sz);
+	fdi = zalloc(sizeof(struct fd_info));
 	fdi->next = file->fds;
 	fdi->file = file;
 	fdi->fd = fd;
@@ -269,13 +273,8 @@ static void add_dir_entry(struct dir_info *parent, char type, const char *name,
 			  void *target)
 {
 	struct dir_entry_info *entry;
-	size_t sz;
-
-	sz = sizeof(struct dir_entry_info);
-	entry = (struct dir_entry_info *) malloc(sz);
-	CHECK(entry != NULL);
-	memset(entry, 0, sz);
 
+	entry = zalloc(sizeof(struct dir_entry_info));
 	entry->type = type;
 	entry->name = copy_string(name);
 	entry->parent = parent;
@@ -341,7 +340,6 @@ static void remove_dir_entry(struct dir_entry_info *entry)
 static struct dir_info *dir_new(struct dir_info *parent, const char *name)
 {
 	struct dir_info *dir;
-	size_t sz;
 	char *path;
 
 	path = dir_path(parent, name);
@@ -353,10 +351,7 @@ static struct dir_info *dir_new(struct dir_info *parent, const char *name)
 	}
 	free(path);
 
-	sz = sizeof(struct dir_info);
-	dir = (struct dir_info *) malloc(sz);
-	CHECK(dir != NULL);
-	memset(dir, 0, sz);
+	dir = zalloc(sizeof(struct dir_info));
 	dir->name = copy_string(name);
 	dir->parent = parent;
 	if (parent)
@@ -400,7 +395,6 @@ static struct file_info *file_new(struct dir_info *parent, const char *name)
 	char *path;
 	mode_t mode;
 	int fd;
-	size_t sz;
 
 	CHECK(parent != NULL);
 
@@ -415,10 +409,7 @@ static struct file_info *file_new(struct dir_info *parent, const char *name)
 	}
 	free(path);
 
-	sz = sizeof(struct file_info);
-	file = (struct file_info *) malloc(sz);
-	CHECK(file != NULL);
-	memset(file, 0, sz);
+	file = zalloc(sizeof(struct file_info));
 	file->name = copy_string(name);
 
 	add_dir_entry(parent, 'f', name, file);
@@ -662,21 +653,15 @@ static void file_write_info(struct file_info *file,
 {
 	struct write_info *new_write, *w, **prev, *tmp;
 	int inserted;
-	size_t sz;
 	off_t end, chg;
 
 	/* Create struct write_info */
-	sz = sizeof(struct write_info);
-	new_write = (struct write_info *) malloc(sz);
-	CHECK(new_write != NULL);
-	memset(new_write, 0, sz);
+	new_write = zalloc(sizeof(struct write_info));
 	new_write->offset = offset;
 	new_write->size = size;
 	new_write->random_seed = seed;
 
-	w = (struct write_info *) malloc(sz);
-	CHECK(w != NULL);
-	memset(w, 0, sz);
+	w = zalloc(sizeof(struct write_info));
 	w->next = file->raw_writes;
 	w->offset = offset;
 	w->size = size;
@@ -707,7 +692,7 @@ static void file_write_info(struct file_info *file,
 				else {
 					/* w ends after new_write ends */
 					/* Split w */
-					tmp = (struct write_info *) malloc(sz);
+					tmp = malloc(sizeof(struct write_info));
 					CHECK(tmp != NULL);
 					*tmp = *w;
 					chg = end - tmp->offset;
@@ -921,7 +906,6 @@ static void file_write_file(struct file_info *file)
 static void file_truncate_info(struct file_info *file, size_t new_length)
 {
 	struct write_info *w, **prev, *tmp;
-	size_t sz;
 
 	/* Remove / truncate file->writes */
 	w = file->writes;
@@ -941,10 +925,7 @@ static void file_truncate_info(struct file_info *file, size_t new_length)
 		w = w->next;
 	}
 	/* Add an entry in raw_writes for the truncation */
-	sz = sizeof(struct write_info);
-	w = (struct write_info *) malloc(sz);
-	CHECK(w != NULL);
-	memset(w, 0, sz);
+	w = zalloc(sizeof(struct write_info));
 	w->next = file->raw_writes;
 	w->offset = file->length;
 	w->random_offset = new_length; /* Abuse random_offset */
@@ -1659,7 +1640,6 @@ static void symlink_new(struct dir_info *dir, const char *name_)
 {
 	struct symlink_info *s;
 	char *path, *target, *name = copy_string(name_);
-	size_t sz;
 
 	path = dir_path(dir, name);
 	target = pick_symlink_target(path);
@@ -1674,10 +1654,7 @@ static void symlink_new(struct dir_info *dir, const char *name_)
 	}
 	free(path);
 
-	sz = sizeof(struct symlink_info);
-	s = malloc(sz);
-	CHECK(s != NULL);
-	memset(s, 0, sz);
+	s = zalloc(sizeof(struct symlink_info));
 	add_dir_entry(dir, 's', name, s);
 	s->target_pathname = target;
 	free(name);
-- 
1.7.2.3

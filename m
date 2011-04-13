Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nW-0003Um-Bs
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:16 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFoZj018749
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:16:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 25/27] fs-tests: integck: do not use tests_random_no
Date: Wed, 13 Apr 2011 18:19:05 +0300
Message-Id: <1302707947-6143-26-git-send-email-dedekind1@gmail.com>
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

Do not use the shared 'tests_random_no()' function but use our own
simple implementation instead. We do not need those rather complex
and difficult to understand computations.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |  119 +++++++++++++++++++----------------
 1 files changed, 65 insertions(+), 54 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 5cb7bca..2dbe9de 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -196,6 +196,17 @@ static int is_truncation(struct write_info *w)
 }
 
 /*
+ * Return a random number between 0 and max - 1.
+ */
+static unsigned int random_no(unsigned int max)
+{
+	assert(max < RAND_MAX);
+	if (max == 0)
+		return 0;
+	return rand() % max;
+}
+
+/*
  * Allocate a buffer of 'size' bytes and fill it with zeroes.
  */
 static void *zalloc(size_t size)
@@ -567,11 +578,11 @@ static void file_unlink(struct dir_entry_info *entry)
 static struct dir_entry_info *pick_entry(struct file_info *file)
 {
 	struct dir_entry_info *entry;
-	size_t r;
+	unsigned int r;
 
 	if (!file->link_count)
 		return NULL;
-	r = tests_random_no(file->link_count);
+	r = random_no(file->link_count);
 	entry = file->links;
 	while (entry && r--)
 		entry = entry->next_link;
@@ -660,7 +671,7 @@ static struct fd_info *file_open(struct file_info *file)
 	char *path;
 
 	path = dir_path(file->links->parent, file->links->name);
-	if (tests_random_no(100) == 1)
+	if (random_no(100) == 1)
 		flags |= O_SYNC;
 	fd = open(path, flags);
 	CHECK(fd != -1);
@@ -806,30 +817,30 @@ static void get_offset_and_size(struct file_info *file,
 				off_t *offset,
 				size_t *size)
 {
-	size_t r, n;
+	unsigned int r, n;
 
-	r = tests_random_no(100);
+	r = random_no(100);
 	if (r == 0 && grow)
 		/* 1 time in 100, when growing, write off the end of the file */
-		*offset = file->length + tests_random_no(10000000);
+		*offset = file->length + random_no(10000000);
 	else if (r < 4)
 		/* 3 (or 4) times in 100, write at the beginning of file */
 		*offset = 0;
 	else if (r < 52 || !grow)
 		/* 48 times in 100, write into the file */
-		*offset = tests_random_no(file->length);
+		*offset = random_no(file->length);
 	else
 		/* 48 times in 100, write at the end of the  file */
 		*offset = file->length;
 	/* Distribute the size logarithmically */
-	if (tests_random_no(1000) == 0)
-		r = tests_random_no(fsinfo.log10_initial_free + 2);
+	if (random_no(1000) == 0)
+		r = random_no(fsinfo.log10_initial_free + 2);
 	else
-		r = tests_random_no(fsinfo.log10_initial_free);
+		r = random_no(fsinfo.log10_initial_free);
 	n = 1;
 	while (r--)
 		n *= 10;
-	*size = tests_random_no(n);
+	*size = random_no(n);
 	if (!grow && *offset + *size > file->length)
 		*size = file->length - *offset;
 	if (*size == 0)
@@ -875,7 +886,7 @@ static void file_mmap_write(struct file_info *file)
 		write_cnt += 1;
 		w = w->next;
 	}
-	r = tests_random_no(write_cnt);
+	r = random_no(write_cnt);
 	w = file->writes;
 	for (i = 0; w && w->next && i < r; i++)
 		w = w->next;
@@ -897,15 +908,15 @@ static void file_mmap_write(struct file_info *file)
 	CHECK(addr != MAP_FAILED);
 
 	/* Randomly select a part of the mmapped area to write */
-	size = tests_random_no(w->size);
+	size = random_no(w->size);
 	if (size > free_space)
 		size = free_space;
 	if (size == 0)
 		size = 1;
-	offset = w->offset + tests_random_no(w->size - size);
+	offset = w->offset + random_no(w->size - size);
 
 	/* Write it */
-	seed = tests_random_no(MAX_RANDOM_SEED);
+	seed = random_no(MAX_RANDOM_SEED);
 	srand(seed);
 	waddr = addr + (offset - offs);
 	for (i = 0; i < size; i++)
@@ -926,19 +937,19 @@ static void file_write(struct file_info *file, int fd)
 	int truncate = 0;
 
 	if (fsinfo.can_mmap && !full && !file->deleted &&
-	    tests_random_no(100) == 1) {
+	    random_no(100) == 1) {
 		file_mmap_write(file);
 		return;
 	}
 
 	get_offset_and_size(file, &offset, &size);
-	seed = tests_random_no(MAX_RANDOM_SEED);
+	seed = random_no(MAX_RANDOM_SEED);
 	actual = file_write_data(file, fd, offset, size, seed);
 
 	if (offset + actual <= file->length && shrink)
 		/* 1 time in 100, when shrinking
 		   truncate after the write */
-		if (tests_random_no(100) == 0)
+		if (random_no(100) == 0)
 			truncate = 1;
 
 	if (actual != 0)
@@ -1006,7 +1017,7 @@ static void file_truncate(struct file_info *file, int fd)
 {
 	size_t new_length;
 
-	new_length = tests_random_no(file->length);
+	new_length = random_no(file->length);
 
 	if (file_ftruncate(file, fd, new_length))
 		file_truncate_info(file, new_length);
@@ -1431,15 +1442,15 @@ static char *make_name(struct dir_info *dir)
 
 	do {
 		found = 0;
-		if (tests_random_no(5) == 1) {
-			int i, n = tests_random_no(fsinfo.max_name_len) + 1;
+		if (random_no(5) == 1) {
+			int i, n = random_no(fsinfo.max_name_len) + 1;
 
 			CHECK(n > 0 && n < 256);
 			for (i = 0; i < n; i++)
-				name[i] = 'a' + tests_random_no(26);
+				name[i] = 'a' + random_no(26);
 			name[i] = '\0';
 		} else
-			sprintf(name, "%u", (unsigned)tests_random_no(1000000));
+			sprintf(name, "%u", random_no(1000000));
 		for (entry = dir->first; entry; entry = entry->next) {
 			if (strcmp(entry->name, name) == 0) {
 				found = 1;
@@ -1456,9 +1467,9 @@ static struct file_info *pick_file(void)
 
 	for (;;) {
 		struct dir_entry_info *entry;
-		size_t r;
+		unsigned int r;
 
-		r = tests_random_no(dir->number_of_entries);
+		r = random_no(dir->number_of_entries);
 		entry = dir->first;
 		while (entry && r) {
 			entry = entry->next;
@@ -1482,13 +1493,13 @@ static struct dir_info *pick_dir(void)
 {
 	struct dir_info *dir = top_dir;
 
-	if (tests_random_no(40) >= 30)
+	if (random_no(40) >= 30)
 		return dir;
 	for (;;) {
 		struct dir_entry_info *entry;
 		size_t r;
 
-		r = tests_random_no(dir->number_of_entries);
+		r = random_no(dir->number_of_entries);
 		entry = dir->first;
 		while (entry && r) {
 			entry = entry->next;
@@ -1514,7 +1525,7 @@ static struct dir_info *pick_dir(void)
 		if (!entry)
 			return dir;
 		dir = entry->dir;
-		if (tests_random_no(40) >= 30)
+		if (random_no(40) >= 30)
 			return dir;
 	}
 }
@@ -1524,15 +1535,15 @@ static char *pick_rename_name(struct dir_info **parent,
 {
 	struct dir_info *dir = pick_dir();
 	struct dir_entry_info *entry;
-	size_t r;
+	unsigned int r;
 
 	*parent = dir;
 	*rename_entry = NULL;
 
-	if (grow || tests_random_no(20) < 10)
+	if (grow || random_no(20) < 10)
 		return dup_string(make_name(dir));
 
-	r = tests_random_no(dir->number_of_entries);
+	r = random_no(dir->number_of_entries);
 	entry = dir->first;
 	while (entry && r) {
 		entry = entry->next;
@@ -1673,15 +1684,15 @@ static char *pick_symlink_target(const char *symlink_path)
 {
 	struct dir_info *dir;
 	struct dir_entry_info *entry;
-	size_t r;
 	char *path, *rel_path;
+	unsigned int r;
 
 	dir = pick_dir();
 
-	if (tests_random_no(100) < 10)
+	if (random_no(100) < 10)
 		return dir_path(dir, make_name(dir));
 
-	r = tests_random_no(dir->number_of_entries);
+	r = random_no(dir->number_of_entries);
 	entry = dir->first;
 	while (entry && r) {
 		entry = entry->next;
@@ -1692,7 +1703,7 @@ static char *pick_symlink_target(const char *symlink_path)
 	if (!entry)
 		return dir_path(dir, make_name(dir));
 	path = dir_path(dir, entry->name);
-	if (tests_random_no(20) < 10)
+	if (random_no(20) < 10)
 		return path;
 	rel_path = relative_path(symlink_path, path);
 	free(path);
@@ -1742,20 +1753,20 @@ static void operate_on_file(struct file_info *file);
 static void operate_on_entry(struct dir_entry_info *entry)
 {
 	/* 1 time in 1000 rename */
-	if (tests_random_no(1000) == 0) {
+	if (random_no(1000) == 0) {
 		rename_entry(entry);
 		return;
 	}
 	if (entry->type == 's') {
 		symlink_check(entry->symlink);
 		/* If shrinking, 1 time in 50, remove a symlink */
-		if (shrink && tests_random_no(50) == 0)
+		if (shrink && random_no(50) == 0)
 			symlink_remove(entry->symlink);
 		return;
 	}
 	if (entry->type == 'd') {
 		/* If shrinking, 1 time in 50, remove a directory */
-		if (shrink && tests_random_no(50) == 0) {
+		if (shrink && random_no(50) == 0) {
 			dir_remove(entry->dir);
 			return;
 		}
@@ -1763,13 +1774,13 @@ static void operate_on_entry(struct dir_entry_info *entry)
 	}
 	if (entry->type == 'f') {
 		/* If shrinking, 1 time in 10, remove a file */
-		if (shrink && tests_random_no(10) == 0) {
+		if (shrink && random_no(10) == 0) {
 			file_delete(entry->file);
 			return;
 		}
 		/* If not growing, 1 time in 10, unlink a file with links > 1 */
 		if (!grow && entry->file->link_count > 1 &&
-		    tests_random_no(10) == 0) {
+		    random_no(10) == 0) {
 			file_unlink_file(entry->file);
 			return;
 		}
@@ -1780,11 +1791,11 @@ static void operate_on_entry(struct dir_entry_info *entry)
 /* Randomly select something to do with a directory */
 static void operate_on_dir(struct dir_info *dir)
 {
-	size_t r;
 	struct dir_entry_info *entry;
 	struct file_info *file;
+	unsigned int r;
 
-	r = tests_random_no(14);
+	r = random_no(14);
 	if (r == 0 && grow)
 		/* When growing, 1 time in 14 create a file */
 		file_new(dir, make_name(dir));
@@ -1794,12 +1805,12 @@ static void operate_on_dir(struct dir_info *dir)
 	else if (r == 2 && grow && (file = pick_file()) != NULL)
 		/* When growing, 1 time in 14 create a hard link */
 		link_new(dir, make_name(dir), file);
-	else if (r == 3 && grow && tests_random_no(5) == 0)
+	else if (r == 3 && grow && random_no(5) == 0)
 		/* When growing, 1 time in 70 create a symbolic link */
 		symlink_new(dir, make_name(dir));
 	else {
 		/* Otherwise randomly select an entry to operate on */
-		r = tests_random_no(dir->number_of_entries);
+		r = random_no(dir->number_of_entries);
 		entry = dir->first;
 		while (entry && r) {
 			entry = entry->next;
@@ -1819,24 +1830,24 @@ static void operate_on_file(struct file_info *file)
 		return;
 	}
 	/* Try to keep about 20 files open */
-	if (open_files_count < 20 && tests_random_no(2) == 0) {
+	if (open_files_count < 20 && random_no(2) == 0) {
 		file_open(file);
 		return;
 	}
 	/* Try to keep up to 40 files open */
-	if (open_files_count < 40 && tests_random_no(20) == 0) {
+	if (open_files_count < 40 && random_no(20) == 0) {
 		file_open(file);
 		return;
 	}
 	/* Occasionly truncate */
-	if (shrink && tests_random_no(100) == 0) {
+	if (shrink && random_no(100) == 0) {
 		file_truncate_file(file);
 		return;
 	}
 	/* Mostly just write */
 	file_write_file(file);
 	/* Once in a while check it too */
-	if (tests_random_no(100) == 1) {
+	if (random_no(100) == 1) {
 		int fd = -2;
 
 		if (file->links)
@@ -1853,9 +1864,9 @@ static void operate_on_file(struct file_info *file)
 /* Randomly select something to do with an open file */
 static void operate_on_open_file(struct fd_info *fdi)
 {
-	size_t r;
+	unsigned int r;
 
-	r = tests_random_no(1000);
+	r = random_no(1000);
 	if (shrink && r < 5)
 		file_truncate(fdi->file, fdi->fd);
 	else if (r < 21)
@@ -1865,7 +1876,7 @@ static void operate_on_open_file(struct fd_info *fdi)
 	else {
 		file_write(fdi->file, fdi->fd);
 		if (r >= 999) {
-			if (tests_random_no(100) >= 50)
+			if (random_no(100) >= 50)
 				CHECK(fsync(fdi->fd) == 0);
 			else
 				CHECK(fdatasync(fdi->fd) == 0);
@@ -1876,7 +1887,7 @@ static void operate_on_open_file(struct fd_info *fdi)
 /* Select an open file at random */
 static void operate_on_an_open_file(void)
 {
-	size_t r;
+	unsigned int r;
 	struct open_file_info *ofi;
 
 	/* When shrinking, close all open files 1 time in 128 */
@@ -1904,7 +1915,7 @@ static void operate_on_an_open_file(void)
 				ofi = ofi->next;
 		}
 	}
-	r = tests_random_no(open_files_count);
+	r = random_no(open_files_count);
 	for (ofi = open_files; ofi; ofi = ofi->next, --r)
 		if (!r) {
 			operate_on_open_file(ofi->fdi);
@@ -1915,7 +1926,7 @@ static void operate_on_an_open_file(void)
 static void do_an_operation(void)
 {
 	/* Half the time operate on already open files */
-	if (tests_random_no(100) < 50)
+	if (random_no(100) < 50)
 		operate_on_dir(top_dir);
 	else
 		operate_on_an_open_file();
-- 
1.7.2.3

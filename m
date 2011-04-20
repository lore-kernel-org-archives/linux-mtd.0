Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURu-000660-6V
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:04 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFnfJ009522
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:52 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 13/35] fs-tests: integck: use unsigned int everywhere
Date: Wed, 20 Apr 2011 13:18:46 +0300
Message-Id: <1303294748-5492-14-git-send-email-dedekind1@gmail.com>
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

The test sometimes uses "unsigned" and sometimes "unsigned int". This
patch makes the code more consistent by making it use "unsigned int"
everywhere.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   44 +++++++++++++++++------------------
 1 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 9eddc0b..3b28e99 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -167,7 +167,7 @@ struct dir_info /* Each directory has one of these */
 	char *name;
 	struct dir_info *parent; /* Parent directory or null
 					for our top directory */
-	unsigned number_of_entries;
+	unsigned int number_of_entries;
 	struct dir_entry_info *first;
 	struct dir_entry_info *entry; /* Dir entry of this dir */
 };
@@ -667,7 +667,7 @@ static void file_info_display(struct file_info *file)
 {
 	struct dir_entry_info *entry;
 	struct write_info *w;
-	unsigned wcnt;
+	unsigned int wcnt;
 
 	normsg("File Info:");
 	normsg("    Original name: %s", file->name);
@@ -679,7 +679,7 @@ static void file_info_display(struct file_info *file)
 		normsg("      Directory: %s", entry->parent->name);
 		entry = entry->next_link;
 	}
-	normsg("    Length: %u", (unsigned)file->length);
+	normsg("    Length: %u", (unsigned int)file->length);
 	normsg("    File was open: %s",
 	       (file->fds == NULL) ? "false" : "true");
 	normsg("    File was deleted: %s",
@@ -691,8 +691,9 @@ static void file_info_display(struct file_info *file)
 	w = file->writes;
 	while (w) {
 		normsg("        Offset: %u  Size: %u  Seed: %u  R.Off: %u",
-		       (unsigned)w->offset, (unsigned)w->size,
-		       (unsigned)w->random_seed, (unsigned)w->random_offset);
+		       (unsigned int)w->offset, (unsigned int)w->size,
+		       (unsigned int)w->random_seed,
+		       (unsigned int)w->random_offset);
 		wcnt += 1;
 		w = w->next;
 	}
@@ -704,11 +705,11 @@ static void file_info_display(struct file_info *file)
 	while (w) {
 		if (is_truncation(w))
 			normsg("        Trunc from %u to %u",
-			       (unsigned)w->offset, (unsigned)w->new_length);
+			       (unsigned int)w->offset, (unsigned int)w->new_length);
 		else
 			normsg("        Offset: %u  Size: %u  Seed: %u  R.Off: %u",
-			       (unsigned)w->offset, (unsigned)w->size,
-			       (unsigned)w->random_seed, (unsigned)w->random_offset);
+			       (unsigned int)w->offset, (unsigned int)w->size,
+			       (unsigned int)w->random_seed, (unsigned int)w->random_offset);
 		wcnt += 1;
 		w = w->next;
 	}
@@ -735,8 +736,8 @@ static struct fd_info *file_open(struct file_info *file)
  * gererator with 'seed'. Return amount of written data on success and -1 on
  * failure.
  */
-static ssize_t file_write_data(struct file_info *file, int fd,
-			       off_t offset, size_t size, unsigned seed)
+static ssize_t file_write_data(struct file_info *file, int fd, off_t offset,
+			       size_t size, unsigned int seed)
 {
 	size_t remains, actual, block;
 	ssize_t written;
@@ -779,10 +780,8 @@ static ssize_t file_write_data(struct file_info *file, int fd,
 	return actual;
 }
 
-static void file_write_info(struct file_info *file,
-			off_t offset,
-			size_t size,
-			unsigned seed)
+static void file_write_info(struct file_info *file, off_t offset, size_t size,
+			    unsigned int seed)
 {
 	struct write_info *new_write, *w, **prev, *tmp;
 	int inserted;
@@ -1016,7 +1015,7 @@ static int file_write(struct file_info *file, int fd)
 	off_t offset;
 	size_t size;
 	ssize_t actual;
-	unsigned seed;
+	unsigned int seed;
 	int ret, truncate = 0;
 
 	if (fsinfo.can_mmap && !full && !file->deleted &&
@@ -1260,8 +1259,8 @@ static void file_check_hole(struct file_info *file, int fd, off_t offset,
 			if (buf[i] != 0) {
 				errmsg("file_check_hole failed at %u checking "
 				       "hole at %u size %u",
-				       (unsigned)(size - remains + i),
-				       (unsigned)offset, (unsigned)size);
+				       (unsigned int)(size - remains + i),
+				       (unsigned int)offset, (unsigned int)size);
 				file_info_display(file);
 				save_file(fd, file);
 			}
@@ -1294,8 +1293,8 @@ static void file_check_data(struct file_info *file, int fd,
 			if (buf[i] != c) {
 				errmsg("file_check_data failed at %u checking "
 				       "data at %u size %u",
-					(unsigned)(w->size - remains + i),
-					(unsigned)w->offset, (unsigned)w->size);
+					(unsigned int)(w->size - remains + i),
+					(unsigned int)w->offset, (unsigned int)w->size);
 				file_info_display(file);
 				save_file(fd, file);
 			}
@@ -1333,7 +1332,7 @@ static void file_check(struct file_info *file, int fd)
 	pos = lseek(fd, 0, SEEK_END);
 	if (pos != file->length) {
 		errmsg("file_check failed checking length expected %u actual %u\n",
-		       (unsigned)file->length, (unsigned)pos);
+		       (unsigned int)file->length, (unsigned int)pos);
 		file_info_display(file);
 		save_file(fd, file);
 	}
@@ -1443,12 +1442,11 @@ static int sort_comp(const void *pa, const void *pb)
 
 static void dir_check(struct dir_info *dir)
 {
-	struct dir_entry_info **entry_array, **p;
+	struct dir_entry_info *entry, **entry_array, **p;
 	size_t sz, n;
-	struct dir_entry_info *entry;
 	DIR *d;
 	struct dirent *ent;
-	unsigned checked = 0;
+	unsigned int checked = 0;
 	char *path;
 	int link_count = 2; /* Parent and dot */
 	struct stat st;
-- 
1.7.2.3

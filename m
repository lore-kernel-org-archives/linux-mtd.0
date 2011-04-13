Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nT-0003T0-0q
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:10 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFnDn018703
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:57 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 19/27] fs-tests: integck: do not use space after cast
Date: Wed, 13 Apr 2011 18:18:59 +0300
Message-Id: <1302707947-6143-20-git-send-email-dedekind1@gmail.com>
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

Since we are kernel people lets use the style we are accustomed
to - no space between the cast and the variable: (type)a, not (type) a.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   36 ++++++++++++++++++------------------
 1 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 4806acd..284a5fc 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -604,7 +604,7 @@ static void file_info_display(struct file_info *file)
 		normsg("      Directory: %s", entry->parent->name);
 		entry = entry->next_link;
 	}
-	normsg("    Length: %u", (unsigned) file->length);
+	normsg("    Length: %u", (unsigned)file->length);
 	normsg("    File was open: %s",
 	       (file->fds == NULL) ? "false" : "true");
 	normsg("    File was deleted: %s",
@@ -616,8 +616,8 @@ static void file_info_display(struct file_info *file)
 	w = file->writes;
 	while (w) {
 		normsg("        Offset: %u  Size: %u  Seed: %u  R.Off: %u",
-		       (unsigned) w->offset, (unsigned) w->size,
-		       (unsigned) w->random_seed, (unsigned) w->random_offset);
+		       (unsigned)w->offset, (unsigned)w->size,
+		       (unsigned)w->random_seed, (unsigned)w->random_offset);
 		wcnt += 1;
 		w = w->next;
 	}
@@ -629,11 +629,11 @@ static void file_info_display(struct file_info *file)
 	while (w) {
 		if (is_truncation(w))
 			normsg("        Trunc from %u to %u",
-			       (unsigned) w->offset, (unsigned) w->new_length);
+			       (unsigned)w->offset, (unsigned)w->new_length);
 		else
 			normsg("        Offset: %u  Size: %u  Seed: %u  R.Off: %u",
-			       (unsigned) w->offset, (unsigned) w->size,
-			       (unsigned) w->random_seed, (unsigned) w->random_offset);
+			       (unsigned)w->offset, (unsigned)w->size,
+			       (unsigned)w->random_seed, (unsigned)w->random_offset);
 		wcnt += 1;
 		w = w->next;
 	}
@@ -668,7 +668,7 @@ static size_t file_write_data(	struct file_info *file,
 	char buf[BUFFER_SIZE];
 
 	srand(seed);
-	CHECK(lseek(fd, offset, SEEK_SET) != (off_t) -1);
+	CHECK(lseek(fd, offset, SEEK_SET) != (off_t)-1);
 	remains = size;
 	actual = 0;
 	written = BUFFER_SIZE;
@@ -1057,7 +1057,7 @@ static void file_rewrite_data(int fd, struct write_info *w, char *buf)
 	srand(w->random_seed);
 	for (r = 0; r < w->random_offset; ++r)
 		rand();
-	CHECK(lseek(fd, w->offset, SEEK_SET) != (off_t) -1);
+	CHECK(lseek(fd, w->offset, SEEK_SET) != (off_t)-1);
 	remains = w->size;
 	written = BUFFER_SIZE;
 	while (remains) {
@@ -1095,7 +1095,7 @@ static void save_file(int fd, struct file_info *file)
 	CHECK(w_fd != -1);
 
 	/* Start at the beginning */
-	CHECK(lseek(fd, 0, SEEK_SET) != (off_t) -1);
+	CHECK(lseek(fd, 0, SEEK_SET) != (off_t)-1);
 
 	for (;;) {
 		ssize_t r = read(fd, buf, BUFFER_SIZE);
@@ -1127,7 +1127,7 @@ static void file_check_hole(	struct file_info *file,
 	size_t remains, block, i;
 	char buf[BUFFER_SIZE];
 
-	CHECK(lseek(fd, offset, SEEK_SET) != (off_t) -1);
+	CHECK(lseek(fd, offset, SEEK_SET) != (off_t)-1);
 	remains = size;
 	while (remains) {
 		if (remains > BUFFER_SIZE)
@@ -1139,8 +1139,8 @@ static void file_check_hole(	struct file_info *file,
 			if (buf[i] != 0) {
 				errmsg("file_check_hole failed at %u checking "
 				       "hole at %u size %u",
-				       (unsigned) (size - remains + i),
-				       (unsigned) offset, (unsigned) size);
+				       (unsigned)(size - remains + i),
+				       (unsigned)offset, (unsigned)size);
 				file_info_display(file);
 				save_file(fd, file);
 			}
@@ -1161,7 +1161,7 @@ static void file_check_data(	struct file_info *file,
 	srand(w->random_seed);
 	for (r = 0; r < w->random_offset; ++r)
 		rand();
-	CHECK(lseek(fd, w->offset, SEEK_SET) != (off_t) -1);
+	CHECK(lseek(fd, w->offset, SEEK_SET) != (off_t)-1);
 	remains = w->size;
 	while (remains) {
 		if (remains > BUFFER_SIZE)
@@ -1170,12 +1170,12 @@ static void file_check_data(	struct file_info *file,
 			block = remains;
 		CHECK(read(fd, buf, block) == block);
 		for (i = 0; i < block; ++i) {
-			char c = (char) rand();
+			char c = (char)rand();
 			if (buf[i] != c) {
 				errmsg("file_check_data failed at %u checking "
 				       "data at %u size %u",
-					(unsigned) (w->size - remains + i),
-					(unsigned) w->offset, (unsigned) w->size);
+					(unsigned)(w->size - remains + i),
+					(unsigned)w->offset, (unsigned)w->size);
 				file_info_display(file);
 				save_file(fd, file);
 			}
@@ -1213,7 +1213,7 @@ static void file_check(struct file_info *file, int fd)
 	pos = lseek(fd, 0, SEEK_END);
 	if (pos != file->length) {
 		errmsg("file_check failed checking length expected %u actual %u\n",
-		       (unsigned) file->length, (unsigned) pos);
+		       (unsigned)file->length, (unsigned)pos);
 		file_info_display(file);
 		save_file(fd, file);
 	}
@@ -1426,7 +1426,7 @@ static char *make_name(struct dir_info *dir)
 				name[i] = 'a' + tests_random_no(26);
 			name[i] = '\0';
 		} else
-			sprintf(name, "%u", (unsigned) tests_random_no(1000000));
+			sprintf(name, "%u", (unsigned)tests_random_no(1000000));
 		for (entry = dir->first; entry; entry = entry->next) {
 			if (strcmp(entry->name, name) == 0) {
 				found = 1;
-- 
1.7.2.3

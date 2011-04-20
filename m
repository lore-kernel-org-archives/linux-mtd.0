Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURu-00066E-JF
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:04 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFnfK009522
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:53 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 14/35] fs-tests: integck: fix placeholders when printing
Date: Wed, 20 Apr 2011 13:18:47 +0300
Message-Id: <1303294748-5492-15-git-send-email-dedekind1@gmail.com>
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

There is a lot of code where %u is used for printing off_t variables,
which may be actually 64-bit wide. Fix this by using %llu.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   40 ++++++++++++++++++------------------
 1 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 3b28e99..f2223d4 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -679,7 +679,7 @@ static void file_info_display(struct file_info *file)
 		normsg("      Directory: %s", entry->parent->name);
 		entry = entry->next_link;
 	}
-	normsg("    Length: %u", (unsigned int)file->length);
+	normsg("    Length: %llu", (unsigned long long)file->length);
 	normsg("    File was open: %s",
 	       (file->fds == NULL) ? "false" : "true");
 	normsg("    File was deleted: %s",
@@ -690,10 +690,10 @@ static void file_info_display(struct file_info *file)
 	wcnt = 0;
 	w = file->writes;
 	while (w) {
-		normsg("        Offset: %u  Size: %u  Seed: %u  R.Off: %u",
-		       (unsigned int)w->offset, (unsigned int)w->size,
-		       (unsigned int)w->random_seed,
-		       (unsigned int)w->random_offset);
+		normsg("        Offset: %llu  Size: %zu  Seed: %llu  R.Off: %llu",
+		       (unsigned long long)w->offset, w->size,
+		       (unsigned long long)w->random_seed,
+		       (unsigned long long)w->random_offset);
 		wcnt += 1;
 		w = w->next;
 	}
@@ -704,12 +704,14 @@ static void file_info_display(struct file_info *file)
 	w = file->raw_writes;
 	while (w) {
 		if (is_truncation(w))
-			normsg("        Trunc from %u to %u",
-			       (unsigned int)w->offset, (unsigned int)w->new_length);
+			normsg("        Trunc from %llu to %llu",
+			       (unsigned long long)w->offset,
+			       (unsigned long long)w->new_length);
 		else
-			normsg("        Offset: %u  Size: %u  Seed: %u  R.Off: %u",
-			       (unsigned int)w->offset, (unsigned int)w->size,
-			       (unsigned int)w->random_seed, (unsigned int)w->random_offset);
+			normsg("        Offset: %llu  Size: %zu  Seed: %llu  R.Off: %llu",
+			       (unsigned long long)w->offset, w->size,
+			       (unsigned long long)w->random_seed,
+			       (unsigned long long)w->random_offset);
 		wcnt += 1;
 		w = w->next;
 	}
@@ -1257,10 +1259,9 @@ static void file_check_hole(struct file_info *file, int fd, off_t offset,
 		CHECK(read(fd, buf, block) == block);
 		for (i = 0; i < block; ++i) {
 			if (buf[i] != 0) {
-				errmsg("file_check_hole failed at %u checking "
-				       "hole at %u size %u",
-				       (unsigned int)(size - remains + i),
-				       (unsigned int)offset, (unsigned int)size);
+				errmsg("file_check_hole failed at %zu checking "
+				       "hole at %llu size %zu", size - remains + i,
+				       (unsigned long long)offset, size);
 				file_info_display(file);
 				save_file(fd, file);
 			}
@@ -1291,10 +1292,9 @@ static void file_check_data(struct file_info *file, int fd,
 		for (i = 0; i < block; ++i) {
 			char c = (char)rand();
 			if (buf[i] != c) {
-				errmsg("file_check_data failed at %u checking "
-				       "data at %u size %u",
-					(unsigned int)(w->size - remains + i),
-					(unsigned int)w->offset, (unsigned int)w->size);
+				errmsg("file_check_data failed at %zu checking "
+				       "data at %llu size %zu", w->size - remains + i,
+					(unsigned long long)w->offset, w->size);
 				file_info_display(file);
 				save_file(fd, file);
 			}
@@ -1331,8 +1331,8 @@ static void file_check(struct file_info *file, int fd)
 	/* Check length */
 	pos = lseek(fd, 0, SEEK_END);
 	if (pos != file->length) {
-		errmsg("file_check failed checking length expected %u actual %u\n",
-		       (unsigned int)file->length, (unsigned int)pos);
+		errmsg("file_check failed checking length expected %llu actual %llu\n",
+		       (unsigned long long)file->length, (unsigned long long)pos);
 		file_info_display(file);
 		save_file(fd, file);
 	}
-- 
1.7.2.3

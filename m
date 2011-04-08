Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DNZ-0001PB-M6
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:13:50 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p38FDh4u017762
	for <linux-mtd@lists.infradead.org>; Fri, 8 Apr 2011 18:13:44 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/6] fs-tests: integck: use common printing macros
Date: Fri,  8 Apr 2011 18:16:50 +0300
Message-Id: <1302275810-12632-7-git-send-email-dedekind1@gmail.com>
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

Instead of using printf() directly, use the shared mtd-utils printing
macros.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   89 ++++++++++++++++--------------------
 1 files changed, 39 insertions(+), 50 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index ed32b52..88def58 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -533,58 +533,51 @@ static void file_info_display(struct file_info *file)
 	struct write_info *w;
 	unsigned wcnt;
 
-	fprintf(stderr, "File Info:\n");
-	fprintf(stderr, "    Original name: %s\n", file->name);
-	fprintf(stderr, "    Link count: %d\n", file->link_count);
-	fprintf(stderr, "    Links:\n");
+	normsg("File Info:");
+	normsg("    Original name: %s", file->name);
+	normsg("    Link count: %d", file->link_count);
+	normsg("    Links:");
 	entry = file->links;
 	while (entry) {
-		fprintf(stderr, "      Name: %s\n", entry->name);
-		fprintf(stderr, "      Directory: %s\n", entry->parent->name);
+		normsg("      Name: %s", entry->name);
+		normsg("      Directory: %s", entry->parent->name);
 		entry = entry->next_link;
 	}
-	fprintf(stderr, "    Length: %u\n", (unsigned) file->length);
-	fprintf(stderr, "    File was open: %s\n",
-		(file->fds == NULL) ? "false" : "true");
-	fprintf(stderr, "    File was deleted: %s\n",
-		(file->deleted == 0) ? "false" : "true");
-	fprintf(stderr, "    File was out of space: %s\n",
-		(file->no_space_error == 0) ? "false" : "true");
-	fprintf(stderr, "    File Data:\n");
+	normsg("    Length: %u", (unsigned) file->length);
+	normsg("    File was open: %s",
+	       (file->fds == NULL) ? "false" : "true");
+	normsg("    File was deleted: %s",
+	       (file->deleted == 0) ? "false" : "true");
+	normsg("    File was out of space: %s",
+	       (file->no_space_error == 0) ? "false" : "true");
+	normsg("    File Data:");
 	wcnt = 0;
 	w = file->writes;
 	while (w) {
-		fprintf(stderr, "        Offset: %u  Size: %u  Seed: %u"
-				"  R.Off: %u\n",
-				(unsigned) w->offset,
-				(unsigned) w->size,
-				(unsigned) w->random_seed,
-				(unsigned) w->random_offset);
+		normsg("        Offset: %u  Size: %u  Seed: %u  R.Off: %u",
+		       (unsigned) w->offset, (unsigned) w->size,
+		       (unsigned) w->random_seed, (unsigned) w->random_offset);
 		wcnt += 1;
 		w = w->next;
 	}
-	fprintf(stderr, "    %u writes\n", wcnt);
-	fprintf(stderr, "    ============================================\n");
-	fprintf(stderr, "    Write Info:\n");
+	normsg("    %u writes", wcnt);
+	normsg("    ============================================");
+	normsg("    Write Info:");
 	wcnt = 0;
 	w = file->raw_writes;
 	while (w) {
 		if (w->trunc)
-			fprintf(stderr, "        Trunc from %u to %u\n",
-					(unsigned) w->offset,
-					(unsigned) w->random_offset);
+			normsg("        Trunc from %u to %u",
+			       (unsigned) w->offset, (unsigned) w->random_offset);
 		else
-			fprintf(stderr, "        Offset: %u  Size: %u  Seed: %u"
-					"  R.Off: %u\n",
-					(unsigned) w->offset,
-					(unsigned) w->size,
-					(unsigned) w->random_seed,
-					(unsigned) w->random_offset);
+			normsg("        Offset: %u  Size: %u  Seed: %u  R.Off: %u",
+			       (unsigned) w->offset, (unsigned) w->size,
+			       (unsigned) w->random_seed, (unsigned) w->random_offset);
 		wcnt += 1;
 		w = w->next;
 	}
-	fprintf(stderr, "    %u writes or truncations\n", wcnt);
-	fprintf(stderr, "    ============================================\n");
+	normsg("    %u writes or truncations", wcnt);
+	normsg("    ============================================");
 }
 
 static struct fd_info *file_open(struct file_info *file)
@@ -1035,7 +1028,7 @@ static void save_file(int fd, struct file_info *file)
 	strcpy(name, "/tmp/");
 	strcat(name, file->name);
 	strcat(name, ".integ.sav.read");
-	fprintf(stderr, "Saving %s\n", name);
+	normsg("Saving %sn", name);
 	w_fd = open(name, O_CREAT | O_WRONLY, 0777);
 	CHECK(w_fd != -1);
 
@@ -1055,7 +1048,7 @@ static void save_file(int fd, struct file_info *file)
 	strcpy(name, "/tmp/");
 	strcat(name, file->name);
 	strcat(name, ".integ.sav.written");
-	fprintf(stderr, "Saving %s\n", name);
+	normsg("Saving %s", name);
 	w_fd = open(name, O_CREAT | O_WRONLY, 0777);
 	CHECK(w_fd != -1);
 
@@ -1082,11 +1075,10 @@ static void file_check_hole(	struct file_info *file,
 		CHECK(read(fd, buf, block) == block);
 		for (i = 0; i < block; ++i) {
 			if (buf[i] != 0) {
-				fprintf(stderr, "file_check_hole failed at %u "
-					"checking hole at %u size %u\n",
-					(unsigned) (size - remains + i),
-					(unsigned) offset,
-					(unsigned) size);
+				errmsg("file_check_hole failed at %u checking "
+				       "hole at %u size %u",
+				       (unsigned) (size - remains + i),
+				       (unsigned) offset, (unsigned) size);
 				file_info_display(file);
 				save_file(fd, file);
 			}
@@ -1118,11 +1110,10 @@ static void file_check_data(	struct file_info *file,
 		for (i = 0; i < block; ++i) {
 			char c = (char) rand();
 			if (buf[i] != c) {
-				fprintf(stderr, "file_check_data failed at %u "
-					"checking data at %u size %u\n",
+				errmsg("file_check_data failed at %u checking "
+				       "data at %u size %u",
 					(unsigned) (w->size - remains + i),
-					(unsigned) w->offset,
-					(unsigned) w->size);
+					(unsigned) w->offset, (unsigned) w->size);
 				file_info_display(file);
 				save_file(fd, file);
 			}
@@ -1159,10 +1150,8 @@ static void file_check(struct file_info *file, int fd)
 	/* Check length */
 	pos = lseek(fd, 0, SEEK_END);
 	if (pos != file->length) {
-		fprintf(stderr, "file_check failed checking length "
-			"expected %u actual %u\n",
-			(unsigned) file->length,
-			(unsigned) pos);
+		errmsg("file_check failed checking length expected %u actual %u\n",
+		       (unsigned) file->length, (unsigned) pos);
 		file_info_display(file);
 		save_file(fd, file);
 	}
@@ -1934,7 +1923,7 @@ void integck(void)
 	CHECK(mem_page_size > 0);
 	/* Make our top directory */
 	pid = getpid();
-	printf("pid is %u\n", (unsigned) pid);
+	normsg("pid is %u", (unsigned) pid);
 	tests_cat_pid(dir_name, "integck_test_dir_", pid);
 	if (chdir(dir_name) != -1) {
 		/* Remove it if it is already there */
-- 
1.7.2.3

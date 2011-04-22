Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3X-0002nk-PC
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:14 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM9ZS025973
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:10 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/13] fs-tests: integck: implement holes verification
Date: Fri, 22 Apr 2011 20:25:17 +0300
Message-Id: <1303493124-7619-7-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
References: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
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

When -e option is used verify file holes after the truncate
operation. Re-use the existing 'file_check_hole()' function for
this.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   77 +++++++++++++++++++----------------
 1 files changed, 42 insertions(+), 35 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index e93e141..f09cfaf 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1017,7 +1017,46 @@ static void get_offset_and_size(struct file_info *file,
 		*size = 1;
 }
 
-static void file_truncate_info(struct file_info *file, size_t new_length);
+static void file_check_hole(struct file_info *file, int fd, off_t offset,
+			    size_t size);
+
+static void file_truncate_info(struct file_info *file, int fd,
+			       size_t new_length)
+{
+	struct write_info *w, **prev, *tmp;
+
+	/* Remove / truncate file->writes */
+	w = file->writes;
+	prev = &file->writes;
+	while (w) {
+		if (w->offset >= new_length) {
+			/* w comes after eof, so remove it */
+			*prev = w->next;
+			tmp = w;
+			w = w->next;
+			free(tmp);
+			continue;
+		}
+		if (w->offset + w->size > new_length)
+			w->size = new_length - w->offset;
+		prev = &w->next;
+		w = w->next;
+	}
+	/* Add an entry in raw_writes for the truncation */
+	w = zalloc(sizeof(struct write_info));
+	w->next = file->raw_writes;
+	w->offset = file->length;
+	w->new_length = new_length;
+	w->random_seed = MAX_RANDOM_SEED + 1;
+	file->raw_writes = w;
+
+	if (new_length > file->length)
+		file_check_hole(file, fd, file->length,
+				new_length - file->length);
+
+	/* Update file length */
+	file->length = new_length;
+}
 
 /*
  * Truncate a file to length 'new_length'. If there is no enough space to
@@ -1171,7 +1210,7 @@ static int file_write(struct file_info *file, int fd)
 		if (ret == -1)
 			return -1;
 		if (!ret)
-			file_truncate_info(file, new_length);
+			file_truncate_info(file, fd, new_length);
 	}
 
 	return 0;
@@ -1199,38 +1238,6 @@ static int file_write_file(struct file_info *file)
 	return ret;
 }
 
-static void file_truncate_info(struct file_info *file, size_t new_length)
-{
-	struct write_info *w, **prev, *tmp;
-
-	/* Remove / truncate file->writes */
-	w = file->writes;
-	prev = &file->writes;
-	while (w) {
-		if (w->offset >= new_length) {
-			/* w comes after eof, so remove it */
-			*prev = w->next;
-			tmp = w;
-			w = w->next;
-			free(tmp);
-			continue;
-		}
-		if (w->offset + w->size > new_length)
-			w->size = new_length - w->offset;
-		prev = &w->next;
-		w = w->next;
-	}
-	/* Add an entry in raw_writes for the truncation */
-	w = zalloc(sizeof(struct write_info));
-	w->next = file->raw_writes;
-	w->offset = file->length;
-	w->new_length = new_length;
-	w->random_seed = MAX_RANDOM_SEED + 1;
-	file->raw_writes = w;
-	/* Update file length */
-	file->length = new_length;
-}
-
 /*
  * Truncate an open file randomly.
  */
@@ -1244,7 +1251,7 @@ static int file_truncate(struct file_info *file, int fd)
 	if (ret == -1)
 		return -1;
 	if (!ret)
-		file_truncate_info(file, new_length);
+		file_truncate_info(file, fd, new_length);
 	return 0;
 }
 
-- 
1.7.2.3

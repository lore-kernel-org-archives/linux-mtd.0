Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nM-0003P6-Mf
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:15:56 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFoIU018754
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:51 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/27] fs-tests: integck: shrink write_info even more
Date: Wed, 13 Apr 2011 18:18:45 +0300
Message-Id: <1302707947-6143-6-git-send-email-dedekind1@gmail.com>
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

The 'struct write_info' data strucutre records information about
truncation, and has a separate integer field to specify if this is
a truncation or not. But it is too wasteful because we have huge
amount of these objects.

But it is easy to notice that the 'random_seed' field is not used
for truncation records, so we can use that as the truncation flag.

This patch introduces MAX_RANDOM_SEED macro and when the 'random_seed'
field is greater than that, we treat it as the truncation flag.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   25 ++++++++++++++++++-------
 1 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index eff7274..92e37a1 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -35,6 +35,8 @@
 #define PROGRAM_NAME "integck"
 #include "common.h"
 
+#define MAX_RANDOM_SEED 10000000
+
 /* Structures to store data written to the test file system,
    so that we can check whether the file system is correct. */
 
@@ -42,13 +44,14 @@ struct write_info /* Record of random data written into a file */
 {
 	struct write_info *next;
 	off_t offset; /* Where in the file the data was written */
-	size_t size; /* Number of bytes written */
-	unsigned random_seed; /* Seed for rand() to create random data */
 	union {
 		off_t random_offset; /* Call rand() this number of times first */
 		off_t new_length; /* For truncation records new file length */
 	};
-	int trunc; /* Records a truncation (raw_writes only) */
+	size_t size; /* Number of bytes written */
+	unsigned int random_seed; /* Seed for rand() to create random data. If
+				     greater than MAX_RANDOM_SEED then this is
+				     a truncation record (raw_writes only) */
 };
 
 struct dir_entry_info;
@@ -140,6 +143,14 @@ static long mem_page_size; /* Page size for mmap */
 static unsigned int check_run_no;
 
 /*
+ * Is this 'struct write_info' actually holds information about a truncation?
+ */
+static int is_truncation(struct write_info *w)
+{
+	return w->random_seed > MAX_RANDOM_SEED;
+}
+
+/*
  * Allocate a buffer of 'size' bytes and fill it with zeroes.
  */
 static void *zalloc(size_t size)
@@ -569,7 +580,7 @@ static void file_info_display(struct file_info *file)
 	wcnt = 0;
 	w = file->raw_writes;
 	while (w) {
-		if (w->trunc)
+		if (is_truncation(w))
 			normsg("        Trunc from %u to %u",
 			       (unsigned) w->offset, (unsigned) w->new_length);
 		else
@@ -834,7 +845,7 @@ static void file_mmap_write(struct file_info *file)
 	offset = w->offset + tests_random_no(w->size - size);
 
 	/* Write it */
-	seed = tests_random_no(10000000);
+	seed = tests_random_no(MAX_RANDOM_SEED);
 	srand(seed);
 	waddr = addr + (offset - offs);
 	for (i = 0; i < size; i++)
@@ -860,7 +871,7 @@ static void file_write(struct file_info *file, int fd)
 	}
 
 	get_offset_and_size(file, &offset, &size);
-	seed = tests_random_no(10000000);
+	seed = tests_random_no(MAX_RANDOM_SEED);
 	actual = file_write_data(file, fd, offset, size, seed);
 
 	if (offset + actual <= file->length && shrink)
@@ -924,7 +935,7 @@ static void file_truncate_info(struct file_info *file, size_t new_length)
 	w->next = file->raw_writes;
 	w->offset = file->length;
 	w->new_length = new_length;
-	w->trunc = 1;
+	w->random_seed = MAX_RANDOM_SEED + 1;
 	file->raw_writes = w;
 	/* Update file length */
 	file->length = new_length;
-- 
1.7.2.3

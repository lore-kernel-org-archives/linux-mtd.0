Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURt-00065X-Gh
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:00 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmDA009486
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:52 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/35] fs-tests: integck: teach file_write_data return an error
Date: Wed, 20 Apr 2011 13:18:44 +0300
Message-Id: <1303294748-5492-12-git-send-email-dedekind1@gmail.com>
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

Make 'file_write_data()' return an error in case of failure.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   33 +++++++++++++++++++++------------
 1 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 778e35c..67085ec 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -729,11 +729,13 @@ static struct fd_info *file_open(struct file_info *file)
 
 #define BUFFER_SIZE 32768
 
-static size_t file_write_data(	struct file_info *file,
-				int fd,
-				off_t offset,
-				size_t size,
-				unsigned seed)
+/*
+ * Write random 'size' bytes of random data to offset 'offset'. Seed the random
+ * gererator with 'seed'. Return amount of written data on success and -1 on
+ * failure.
+ */
+static ssize_t file_write_data(struct file_info *file, int fd,
+			       off_t offset, size_t size, unsigned seed)
 {
 	size_t remains, actual, block;
 	ssize_t written;
@@ -760,10 +762,15 @@ static size_t file_write_data(	struct file_info *file,
 			block = remains;
 		written = write(fd, buf, block);
 		if (written < 0) {
-			CHECK(errno == ENOSPC); /* File system full */
-			full = 1;
-			file->no_space_error = 1;
-			break;
+			if (errno == ENOSPC) {
+				full = 1;
+				file->no_space_error = 1;
+				break;
+			}
+			pcv("failed to write %zu bytes to offset %llu of file %s",
+			    block, (unsigned long long)(offset + actual),
+			    file->name);
+			return -1;
 		}
 		remains -= written;
 		actual += written;
@@ -1006,7 +1013,8 @@ static int file_mmap_write(struct file_info *file)
 static int file_write(struct file_info *file, int fd)
 {
 	off_t offset;
-	size_t size, actual;
+	size_t size;
+	ssize_t actual;
 	unsigned seed;
 	int ret, truncate = 0;
 
@@ -1017,10 +1025,11 @@ static int file_write(struct file_info *file, int fd)
 	get_offset_and_size(file, &offset, &size);
 	seed = random_no(MAX_RANDOM_SEED);
 	actual = file_write_data(file, fd, offset, size, seed);
+	if (actual < 0)
+		return -1;
 
 	if (offset + actual <= file->length && shrink)
-		/* 1 time in 100, when shrinking
-		   truncate after the write */
+		/* 1 time in 100, when shrinking truncate after the write */
 		if (random_no(100) == 0)
 			truncate = 1;
 
-- 
1.7.2.3

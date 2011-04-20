Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURt-00065o-Qy
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:03 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFnal009530
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:52 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 12/35] fs-tests: integck: rename BUFFER_SIZE
Date: Wed, 20 Apr 2011 13:18:45 +0300
Message-Id: <1303294748-5492-13-git-send-email-dedekind1@gmail.com>
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

Rename 'BUFFER_SIZE' constant into 'IO_BUFFER_SIZE' to reflect what
is the buffer this constant is about.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   59 +++++++++++++++++------------------
 1 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 67085ec..9eddc0b 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -46,6 +46,9 @@
 /* The pattern for the top directory where we run the test */
 #define TEST_DIR_PATTERN "integck_test_dir_%u"
 
+/* Maximum buffer size for a single read/write operation */
+#define IO_BUFFER_SIZE 32768
+
 /*
  * Check if a condition is true and die if not.
  */
@@ -727,8 +730,6 @@ static struct fd_info *file_open(struct file_info *file)
 	return add_fd(file, fd);
 }
 
-#define BUFFER_SIZE 32768
-
 /*
  * Write random 'size' bytes of random data to offset 'offset'. Seed the random
  * gererator with 'seed'. Return amount of written data on success and -1 on
@@ -739,25 +740,25 @@ static ssize_t file_write_data(struct file_info *file, int fd,
 {
 	size_t remains, actual, block;
 	ssize_t written;
-	char buf[BUFFER_SIZE];
+	char buf[IO_BUFFER_SIZE];
 
 	srand(seed);
 	CHECK(lseek(fd, offset, SEEK_SET) != (off_t)-1);
 	remains = size;
 	actual = 0;
-	written = BUFFER_SIZE;
+	written = IO_BUFFER_SIZE;
 	while (remains) {
 		/* Fill up buffer with random data */
-		if (written < BUFFER_SIZE) {
-			memmove(buf, buf + written, BUFFER_SIZE - written);
-			written = BUFFER_SIZE - written;
+		if (written < IO_BUFFER_SIZE) {
+			memmove(buf, buf + written, IO_BUFFER_SIZE - written);
+			written = IO_BUFFER_SIZE - written;
 		} else
 			written = 0;
-		for (; written < BUFFER_SIZE; ++written)
+		for (; written < IO_BUFFER_SIZE; ++written)
 			buf[written] = rand();
 		/* Write a block of data */
-		if (remains > BUFFER_SIZE)
-			block = BUFFER_SIZE;
+		if (remains > IO_BUFFER_SIZE)
+			block = IO_BUFFER_SIZE;
 		else
 			block = remains;
 		written = write(fd, buf, block);
@@ -1180,18 +1181,18 @@ static void file_rewrite_data(int fd, struct write_info *w, char *buf)
 		rand();
 	CHECK(lseek(fd, w->offset, SEEK_SET) != (off_t)-1);
 	remains = w->size;
-	written = BUFFER_SIZE;
+	written = IO_BUFFER_SIZE;
 	while (remains) {
 		/* Fill up buffer with random data */
-		if (written < BUFFER_SIZE)
-			memmove(buf, buf + written, BUFFER_SIZE - written);
+		if (written < IO_BUFFER_SIZE)
+			memmove(buf, buf + written, IO_BUFFER_SIZE - written);
 		else
 			written = 0;
-		for (; written < BUFFER_SIZE; ++written)
+		for (; written < IO_BUFFER_SIZE; ++written)
 			buf[written] = rand();
 		/* Write a block of data */
-		if (remains > BUFFER_SIZE)
-			block = BUFFER_SIZE;
+		if (remains > IO_BUFFER_SIZE)
+			block = IO_BUFFER_SIZE;
 		else
 			block = remains;
 		written = write(fd, buf, block);
@@ -1204,7 +1205,7 @@ static void save_file(int fd, struct file_info *file)
 {
 	int w_fd;
 	struct write_info *w;
-	char buf[BUFFER_SIZE];
+	char buf[IO_BUFFER_SIZE];
 	char name[256];
 
 	/* Open file to save contents to */
@@ -1219,7 +1220,7 @@ static void save_file(int fd, struct file_info *file)
 	CHECK(lseek(fd, 0, SEEK_SET) != (off_t)-1);
 
 	for (;;) {
-		ssize_t r = read(fd, buf, BUFFER_SIZE);
+		ssize_t r = read(fd, buf, IO_BUFFER_SIZE);
 		CHECK(r != -1);
 		if (!r)
 			break;
@@ -1241,18 +1242,17 @@ static void save_file(int fd, struct file_info *file)
 	CHECK(close(w_fd) == 0);
 }
 
-static void file_check_hole(	struct file_info *file,
-				int fd, off_t offset,
-				size_t size)
+static void file_check_hole(struct file_info *file, int fd, off_t offset,
+			    size_t size)
 {
 	size_t remains, block, i;
-	char buf[BUFFER_SIZE];
+	char buf[IO_BUFFER_SIZE];
 
 	CHECK(lseek(fd, offset, SEEK_SET) != (off_t)-1);
 	remains = size;
 	while (remains) {
-		if (remains > BUFFER_SIZE)
-			block = BUFFER_SIZE;
+		if (remains > IO_BUFFER_SIZE)
+			block = IO_BUFFER_SIZE;
 		else
 			block = remains;
 		CHECK(read(fd, buf, block) == block);
@@ -1271,13 +1271,12 @@ static void file_check_hole(	struct file_info *file,
 	}
 }
 
-static void file_check_data(	struct file_info *file,
-				int fd,
-				struct write_info *w)
+static void file_check_data(struct file_info *file, int fd,
+			    struct write_info *w)
 {
 	size_t remains, block, i;
 	off_t r;
-	char buf[BUFFER_SIZE];
+	char buf[IO_BUFFER_SIZE];
 
 	srand(w->random_seed);
 	for (r = 0; r < w->random_offset; ++r)
@@ -1285,8 +1284,8 @@ static void file_check_data(	struct file_info *file,
 	CHECK(lseek(fd, w->offset, SEEK_SET) != (off_t)-1);
 	remains = w->size;
 	while (remains) {
-		if (remains > BUFFER_SIZE)
-			block = BUFFER_SIZE;
+		if (remains > IO_BUFFER_SIZE)
+			block = IO_BUFFER_SIZE;
 		else
 			block = remains;
 		CHECK(read(fd, buf, block) == block);
-- 
1.7.2.3

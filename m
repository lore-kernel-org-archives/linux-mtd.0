Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3Y-0002p0-TM
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:19 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM8cL025942
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:11 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/13] fs-tests: integck: use rand_r everywhere
Date: Fri, 22 Apr 2011 20:25:20 +0300
Message-Id: <1303493124-7619-10-git-send-email-dedekind1@gmail.com>
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

Instead of using rand_r with own seed for operations and rand() with
global state for data it is cleaner to use rand_r with own different
states for these things. This patch eliminates 'srand()' and 'rand()'
usage.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   44 ++++++++++++++++-------------------
 1 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 5fb990e..0f48377 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -131,11 +131,11 @@ struct write_info /* Record of random data written into a file */
 	struct write_info *next;
 	off_t offset; /* Where in the file the data was written */
 	union {
-		off_t random_offset; /* Call rand() this number of times first */
+		off_t random_offset; /* Call rand_r() this number of times first */
 		off_t new_length; /* For truncation records new file length */
 	};
 	size_t size; /* Number of bytes written */
-	unsigned int random_seed; /* Seed for rand() to create random data. If
+	unsigned int random_seed; /* Seed for rand_r() to create random data. If
 				     greater than MAX_RANDOM_SEED then this is
 				     a truncation record (raw_writes only) */
 };
@@ -860,7 +860,6 @@ static ssize_t file_write_data(struct file_info *file, int fd, off_t offset,
 	ssize_t written;
 	char buf[IO_BUFFER_SIZE];
 
-	srand(seed);
 	CHECK(lseek(fd, offset, SEEK_SET) != (off_t)-1);
 	remains = size;
 	actual = 0;
@@ -873,7 +872,7 @@ static ssize_t file_write_data(struct file_info *file, int fd, off_t offset,
 		} else
 			written = 0;
 		for (; written < IO_BUFFER_SIZE; ++written)
-			buf[written] = rand();
+			buf[written] = rand_r(&seed);
 		/* Write a block of data */
 		if (remains > IO_BUFFER_SIZE)
 			block = IO_BUFFER_SIZE;
@@ -1107,7 +1106,7 @@ static int file_mmap_write(struct file_info *file)
 	void *addr;
 	char *waddr, *path;
 	off_t offs, offset;
-	unsigned int seed;
+	unsigned int seed, seed_tmp;
 	uint64_t free_space;
 	int fd;
 
@@ -1157,11 +1156,10 @@ static int file_mmap_write(struct file_info *file)
 	offset = w->offset + random_no(w->size - size);
 
 	/* Write it */
-	seed = random_no(MAX_RANDOM_SEED);
-	srand(seed);
+	seed_tmp = seed = random_no(MAX_RANDOM_SEED);
 	waddr = addr + (offset - offs);
 	for (i = 0; i < size; i++)
-		waddr[i] = rand();
+		waddr[i] = rand_r(&seed_tmp);
 
 	/* Unmap it */
 	if (munmap(addr, len)) {
@@ -1318,10 +1316,10 @@ static void file_rewrite_data(int fd, struct write_info *w, char *buf)
 	size_t remains, block;
 	ssize_t written;
 	off_t r;
+	unsigned int seed = w->random_seed;
 
-	srand(w->random_seed);
 	for (r = 0; r < w->random_offset; ++r)
-		rand();
+		rand_r(&seed);
 	CHECK(lseek(fd, w->offset, SEEK_SET) != (off_t)-1);
 	remains = w->size;
 	written = IO_BUFFER_SIZE;
@@ -1332,7 +1330,7 @@ static void file_rewrite_data(int fd, struct write_info *w, char *buf)
 		else
 			written = 0;
 		for (; written < IO_BUFFER_SIZE; ++written)
-			buf[written] = rand();
+			buf[written] = rand_r(&seed);
 		/* Write a block of data */
 		if (remains > IO_BUFFER_SIZE)
 			block = IO_BUFFER_SIZE;
@@ -1419,10 +1417,10 @@ static void file_check_data(struct file_info *file, int fd,
 	size_t remains, block, i;
 	off_t r;
 	char buf[IO_BUFFER_SIZE];
+	unsigned int seed = w->random_seed;
 
-	srand(w->random_seed);
 	for (r = 0; r < w->random_offset; ++r)
-		rand();
+		rand_r(&seed);
 	CHECK(lseek(fd, w->offset, SEEK_SET) != (off_t)-1);
 	remains = w->size;
 	while (remains) {
@@ -1432,7 +1430,7 @@ static void file_check_data(struct file_info *file, int fd,
 			block = remains;
 		CHECK(read(fd, buf, block) == block);
 		for (i = 0; i < block; ++i) {
-			char c = (char)rand();
+			char c = (char)rand_r(&seed);
 			if (buf[i] != c) {
 				errmsg("file_check_data failed at %zu checking "
 				       "data at %llu size %zu", w->size - remains + i,
@@ -2404,11 +2402,11 @@ static int remount_tested_fs(void)
 	CHECK(chdir("/") == 0);
 
 	/* Choose what to do */
-	rorw1 = rand() & 1;
-	um = rand() & 1;
-	um_ro = rand() & 1;
-	um_rorw = rand() & 1;
-	rorw2 = rand() & 1;
+	rorw1 = random_no(2);
+	um = random_no(2);
+	um_ro = random_no(2);
+	um_rorw = random_no(2);
+	rorw2 = random_no(2);
 
 	if (rorw1 + um + rorw2 == 0)
 		um = 1;
@@ -2876,8 +2874,8 @@ static int recover_tested_fs(void)
 	CHECK(chdir("/") == 0);
 
 	/* Choose what to do */
-	um_rorw = rand() & 1;
-	rorw2 = rand() & 1;
+	um_rorw = random_no(2);
+	rorw2 = random_no(2);
 
 	/*
 	 * At this point we do not know for sure whether the tested FS is
@@ -2954,7 +2952,6 @@ int main(int argc, char *argv[])
 {
 	int ret;
 	long rpt;
-	unsigned int pid = getpid();
 
 	ret = parse_opts(argc, argv);
 	if (ret)
@@ -2963,8 +2960,7 @@ int main(int argc, char *argv[])
 	get_tested_fs_info();
 
 	/* Seed the random generator with out PID */
-	srand(pid);
-	random_seed = pid;
+	random_seed = getpid();
 
 	random_name_buf = malloc(fsinfo.max_name_len + 1);
 	CHECK(random_name_buf != NULL);
-- 
1.7.2.3

Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURt-00065M-1a
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:00 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFnak009530
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:51 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/35] fs-tests: integck: handle errors in file_mmap_write
Date: Wed, 20 Apr 2011 13:18:43 +0300
Message-Id: <1303294748-5492-11-git-send-email-dedekind1@gmail.com>
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

Teach 'file_mmap_write()' to propagate failures up to the caller.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   37 ++++++++++++++++++++++-------------
 1 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 7348e14..778e35c 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -921,26 +921,28 @@ static int file_ftruncate(struct file_info *file, int fd, off_t new_length)
 	return 0;
 }
 
-static void file_mmap_write(struct file_info *file)
+/*
+ * 'mmap()' a file and randomly select where to write data.
+ */
+static int file_mmap_write(struct file_info *file)
 {
 	size_t write_cnt = 0, r, i, len, size;
 	struct write_info *w = file->writes;
 	void *addr;
-	char *waddr;
+	char *waddr, *path;
 	off_t offs, offset;
-	unsigned seed;
+	unsigned int seed;
 	uint64_t free_space;
 	int fd;
-	char *path;
 
 	if (!file->links)
-		return;
+		return 0;
 	get_fs_space(NULL, &free_space);
 	if (!free_space)
-		return;
+		return 0;
 	/* Randomly pick a written area of the file */
 	if (!w)
-		return;
+		return 0;
 	while (w) {
 		write_cnt += 1;
 		w = w->next;
@@ -959,12 +961,15 @@ static void file_mmap_write(struct file_info *file)
 	path = dir_path(file->links->parent, file->links->name);
 	fd = open(path, O_RDWR);
 	CHECK(fd != -1);
-	free(path);
 
 	/* mmap it */
 	addr = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, offs);
 	CHECK(close(fd) == 0);
-	CHECK(addr != MAP_FAILED);
+	if (addr == MAP_FAILED) {
+		pcv("cannot mmap file %s", path);
+		free(path);
+		return -1;
+	}
 
 	/* Randomly select a part of the mmapped area to write */
 	size = random_no(w->size);
@@ -982,10 +987,16 @@ static void file_mmap_write(struct file_info *file)
 		waddr[i] = rand();
 
 	/* Unmap it */
-	CHECK(munmap(addr, len) == 0);
+	if (munmap(addr, len)) {
+		pcv("cannot unmap file %s", path);
+		free(path);
+		return -1;
+	}
 
 	/* Record what was written */
 	file_write_info(file, offset, size, seed);
+	free(path);
+	return 0;
 }
 
 /*
@@ -1000,10 +1011,8 @@ static int file_write(struct file_info *file, int fd)
 	int ret, truncate = 0;
 
 	if (fsinfo.can_mmap && !full && !file->deleted &&
-	    random_no(100) == 1) {
-		file_mmap_write(file);
-		return 0;
-	}
+	    random_no(100) == 1)
+		return file_mmap_write(file);
 
 	get_offset_and_size(file, &offset, &size);
 	seed = random_no(MAX_RANDOM_SEED);
-- 
1.7.2.3

Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3X-0002ni-DH
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:15 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM9Ks025968
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:10 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/13] fs-tests: integck: implement data verification
Date: Fri, 22 Apr 2011 20:25:16 +0300
Message-Id: <1303493124-7619-6-git-send-email-dedekind1@gmail.com>
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

When -e options is used - verify written data. Re-use the existing
file_check_data() function to implement this.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   36 ++++++++++++++++++++++++------------
 1 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index f39745f..e93e141 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -885,8 +885,15 @@ static ssize_t file_write_data(struct file_info *file, int fd, off_t offset,
 	return actual;
 }
 
-static void file_write_info(struct file_info *file, off_t offset, size_t size,
-			    unsigned int seed)
+static void file_check_data(struct file_info *file, int fd,
+			    struct write_info *w);
+
+/*
+ * Save the information about a file write operation and verify the write if
+ * necessary.
+ */
+static void file_write_info(struct file_info *file, int fd, off_t offset,
+			    size_t size, unsigned int seed)
 {
 	struct write_info *new_write, *w, **prev, *tmp;
 	int inserted;
@@ -905,6 +912,9 @@ static void file_write_info(struct file_info *file, off_t offset, size_t size,
 	w->random_seed = seed;
 	file->raw_writes = w;
 
+	if (args.verify_ops)
+		file_check_data(file, fd, new_write);
+
 	/* Insert it into file->writes */
 	inserted = 0;
 	end = offset + size;
@@ -1077,17 +1087,14 @@ static int file_mmap_write(struct file_info *file)
 	fd = open(path, O_RDWR);
 	if (fd == -1) {
 		pcv("cannot open file %s to do mmap", path);
-		free(path);
-		return -1;
+		goto out_error;
 	}
 
 	/* mmap it */
 	addr = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, offs);
-	CHECK(close(fd) == 0);
 	if (addr == MAP_FAILED) {
 		pcv("cannot mmap file %s", path);
-		free(path);
-		return -1;
+		goto out_error;
 	}
 
 	/* Randomly select a part of the mmapped area to write */
@@ -1108,14 +1115,19 @@ static int file_mmap_write(struct file_info *file)
 	/* Unmap it */
 	if (munmap(addr, len)) {
 		pcv("cannot unmap file %s", path);
-		free(path);
-		return -1;
+		goto out_error;
 	}
 
 	/* Record what was written */
-	file_write_info(file, offset, size, seed);
+	file_write_info(file, fd, offset, size, seed);
 	free(path);
+	CHECK(close(fd) == 0);
 	return 0;
+
+out_error:
+	free(path);
+	CHECK(close(fd) == 0);
+	return -1;
 }
 
 /*
@@ -1146,7 +1158,7 @@ static int file_write(struct file_info *file, int fd)
 			truncate = 1;
 
 	if (actual != 0)
-		file_write_info(file, offset, actual, seed);
+		file_write_info(file, fd, offset, actual, seed);
 
 	/* Delete errored files */
 	if (!fsinfo.nospc_size_ok && file->no_space_error)
@@ -1175,7 +1187,7 @@ static int file_write_file(struct file_info *file)
 	char *path;
 
 	path = dir_path(file->links->parent, file->links->name);
-	fd = open(path, O_WRONLY);
+	fd = open(path, O_RDWR);
 	if (fd == -1) {
 		pcv("cannot open file %s for writing", path);
 		free(path);
-- 
1.7.2.3

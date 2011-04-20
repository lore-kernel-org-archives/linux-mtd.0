Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCUS1-00062U-Ps
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:03 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFnan009530
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:57 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 26/35] fs-tests: integck: make file_truncate_file return error
Date: Wed, 20 Apr 2011 13:18:59 +0300
Message-Id: <1303294748-5492-27-git-send-email-dedekind1@gmail.com>
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

Teach 'file_truncate_file()' return an error to the caller if it fails
to open the file or to truncate it.

Additionally, check the error code from 'open()' in other places.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   35 ++++++++++++++++++++++++-----------
 1 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 3498c76..79c1020 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -993,7 +993,11 @@ static int file_mmap_write(struct file_info *file)
 	/* Open it */
 	path = dir_path(file->links->parent, file->links->name);
 	fd = open(path, O_RDWR);
-	CHECK(fd != -1);
+	if (fd == -1) {
+		pcv("cannot open file %s to do mmap", path);
+		free(path);
+		return -1;
+	}
 
 	/* mmap it */
 	addr = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, offs);
@@ -1090,7 +1094,11 @@ static int file_write_file(struct file_info *file)
 
 	path = dir_path(file->links->parent, file->links->name);
 	fd = open(path, O_WRONLY);
-	CHECK(fd != -1);
+	if (fd == -1) {
+		pcv("cannot open file %s for writing", path);
+		free(path);
+		return -1;
+	}
 	ret = file_write(file, fd);
 	CHECK(close(fd) == 0);
 	free(path);
@@ -1146,17 +1154,23 @@ static int file_truncate(struct file_info *file, int fd)
 	return 0;
 }
 
-static void file_truncate_file(struct file_info *file)
+static int file_truncate_file(struct file_info *file)
 {
 	int fd;
 	char *path;
+	int ret;
 
 	path = dir_path(file->links->parent, file->links->name);
 	fd = open(path, O_WRONLY);
-	CHECK(fd != -1);
-	file_truncate(file, fd);
-	CHECK(close(fd) == 0);
+	if (fd == -1) {
+		pcv("cannot open file %s to truncate", path);
+		free(path);
+		return -1;
+	}
 	free(path);
+	ret = file_truncate(file, fd);
+	CHECK(close(fd) == 0);
+	return ret;
 }
 
 static void file_close(struct fd_info *fdi)
@@ -1899,12 +1913,11 @@ static int operate_on_file(struct file_info *file)
 		return file_open(file);
 
 	/* Occasionly truncate */
-	if (shrink && random_no(100) == 0) {
-		file_truncate_file(file);
-		return 0;
-	}
+	if (shrink && random_no(100) == 0)
+		return file_truncate_file(file);
 	/* Mostly just write */
-	file_write_file(file);
+	if (file_write_file(file) != 0)
+		return -1;
 	/* Once in a while check it too */
 	if (random_no(100) == 1) {
 		int fd = -2;
-- 
1.7.2.3

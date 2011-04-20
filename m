Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURr-00064a-TV
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:15:58 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFlpF009474
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:50 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 07/35] fs-tests: integck: teach file_truncate return error code
Date: Wed, 20 Apr 2011 13:18:40 +0300
Message-Id: <1303294748-5492-8-git-send-email-dedekind1@gmail.com>
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

Teach 'file_truncate()' return an error code in case of failure.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   44 +++++++++++++++++++++++++----------
 1 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 4f39ce3..06e33b5 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -880,17 +880,27 @@ static void get_offset_and_size(struct file_info *file,
 
 static void file_truncate_info(struct file_info *file, size_t new_length);
 
+/*
+ * Truncate a file to length 'new_length'. If there is no enough space to
+ * peform the operation, this function returns 1. Returns 0 on success and -1
+ * on failure.
+ */
 static int file_ftruncate(struct file_info *file, int fd, off_t new_length)
 {
 	if (ftruncate(fd, new_length) != 0) {
-		CHECK(errno = ENOSPC);
-		file->no_space_error = 1;
-		/* Delete errored files */
-		if (!fsinfo.nospc_size_ok)
-			file_delete(file);
-		return 0;
+		if (errno == ENOSPC) {
+			file->no_space_error = 1;
+			/* Delete errored files */
+			if (!fsinfo.nospc_size_ok)
+				file_delete(file);
+			return 1;
+		} else
+			pcv("cannot truncate file %s to %llu",
+			    file->name, (unsigned long long)new_length);
+		return -1;
 	}
-	return 1;
+
+	return 0;
 }
 
 static void file_mmap_write(struct file_info *file)
@@ -994,7 +1004,8 @@ static void file_write(struct file_info *file, int fd)
 
 	if (truncate) {
 		size_t new_length = offset + actual;
-		if (file_ftruncate(file, fd, new_length))
+
+		if (!file_ftruncate(file, fd, new_length))
 			file_truncate_info(file, new_length);
 	}
 }
@@ -1044,14 +1055,21 @@ static void file_truncate_info(struct file_info *file, size_t new_length)
 	file->length = new_length;
 }
 
-static void file_truncate(struct file_info *file, int fd)
+/*
+ * Truncate an open file randomly.
+ */
+static int file_truncate(struct file_info *file, int fd)
 {
-	size_t new_length;
+	int ret;
+	size_t new_length = random_no(file->length);
 
-	new_length = random_no(file->length);
 
-	if (file_ftruncate(file, fd, new_length))
+	ret = file_ftruncate(file, fd, new_length);
+	if (ret == -1)
+		return -1;
+	if (!ret)
 		file_truncate_info(file, new_length);
+	return 0;
 }
 
 static void file_truncate_file(struct file_info *file)
@@ -1902,7 +1920,7 @@ static int operate_on_open_file(struct fd_info *fdi)
 	unsigned int r = random_no(1000);
 
 	if (shrink && r < 5)
-		file_truncate(fdi->file, fdi->fd);
+		return file_truncate(fdi->file, fdi->fd);
 	else if (r < 21)
 		file_close(fdi);
 	else if (shrink && r < 121 && !fdi->file->deleted)
-- 
1.7.2.3

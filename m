Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURy-000694-W2
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:12 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFnlK009509
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:57 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 25/35] fs-tests: integck: make file_open return error on
	failure
Date: Wed, 20 Apr 2011 13:18:58 +0300
Message-Id: <1303294748-5492-26-git-send-email-dedekind1@gmail.com>
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

Make 'file_open()' return an error to the caller if it fails to open
the file.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   30 +++++++++++++++---------------
 1 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index c3c3813..3498c76 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -738,7 +738,7 @@ static void file_info_display(struct file_info *file)
 	normsg("    ============================================");
 }
 
-static struct fd_info *file_open(struct file_info *file)
+static int file_open(struct file_info *file)
 {
 	int fd, flags = O_RDWR;
 	char *path;
@@ -747,9 +747,14 @@ static struct fd_info *file_open(struct file_info *file)
 	if (random_no(100) == 1)
 		flags |= O_SYNC;
 	fd = open(path, flags);
-	CHECK(fd != -1);
+	if (fd == -1) {
+		pcv("cannot open file %s", path);
+		free(path);
+		return -1;
+	}
 	free(path);
-	return add_fd(file, fd);
+	add_fd(file, fd);
+	return 0;
 }
 
 /*
@@ -1884,20 +1889,15 @@ static int operate_on_dir(struct dir_info *dir);
 static int operate_on_file(struct file_info *file)
 {
 	/* Try to keep at least 10 files open */
-	if (open_files_count < 10) {
-		file_open(file);
-		return 0;
-	}
+	if (open_files_count < 10)
+		return file_open(file);
 	/* Try to keep about 20 files open */
-	if (open_files_count < 20 && random_no(2) == 0) {
-		file_open(file);
-		return 0;
-	}
+	if (open_files_count < 20 && random_no(2) == 0)
+		return file_open(file);
 	/* Try to keep up to 40 files open */
-	if (open_files_count < 40 && random_no(20) == 0) {
-		file_open(file);
-		return 0;
-	}
+	if (open_files_count < 40 && random_no(20) == 0)
+		return file_open(file);
+
 	/* Occasionly truncate */
 	if (shrink && random_no(100) == 0) {
 		file_truncate_file(file);
-- 
1.7.2.3

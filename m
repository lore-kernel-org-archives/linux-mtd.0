Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURv-00066Q-2i
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:04 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFlpH009474
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:53 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 15/35] fs-tests: integck: make file_new return error on create
	failure
Date: Wed, 20 Apr 2011 13:18:48 +0300
Message-Id: <1303294748-5492-16-git-send-email-dedekind1@gmail.com>
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

Teach 'file_new()' to return -1 if it fails to create a file.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   22 ++++++++++++----------
 1 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index f2223d4..471fcf4 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -509,23 +509,27 @@ static void dir_remove(struct dir_info *dir)
 	free(dir);
 }
 
-static struct file_info *file_new(struct dir_info *parent, const char *name)
+static int file_new(struct dir_info *parent, const char *name)
 {
-	struct file_info *file = NULL;
+	struct file_info *file;
 	char *path;
 	mode_t mode;
 	int fd;
 
-	CHECK(parent != NULL);
+	assert(parent != NULL);
 
 	path = dir_path(parent, name);
 	mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH;
 	fd = open(path, O_CREAT | O_EXCL | O_RDWR, mode);
 	if (fd == -1) {
-		CHECK(errno == ENOSPC);
+		if (errno == ENOSPC) {
+			full = 1;
+			free(path);
+			return 0;
+		}
+		pcv("cannot create file %s", path);
 		free(path);
-		full = 1;
-		return NULL;
+		return -1;
 	}
 	free(path);
 
@@ -533,10 +537,8 @@ static struct file_info *file_new(struct dir_info *parent, const char *name)
 	file->name = dup_string(name);
 
 	add_dir_entry(parent, 'f', name, file);
-
 	add_fd(file, fd);
-
-	return file;
+	return 0;
 }
 
 static void link_new(struct dir_info *parent, const char *name,
@@ -1932,7 +1934,7 @@ static int operate_on_dir(struct dir_info *dir)
 	r = random_no(14);
 	if (r == 0 && grow)
 		/* When growing, 1 time in 14 create a file */
-		file_new(dir, make_name(dir));
+		return file_new(dir, make_name(dir));
 	else if (r == 1 && grow)
 		/* When growing, 1 time in 14 create a directory */
 		dir_new(dir, make_name(dir));
-- 
1.7.2.3

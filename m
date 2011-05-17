Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMEnM-0004et-4C
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 07:34:21 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4H7YFWr006045
	for <linux-mtd@lists.infradead.org>; Tue, 17 May 2011 10:34:19 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 02/11] fs-tests: integck: fix segfault
Date: Tue, 17 May 2011 10:38:07 +0300
Message-Id: <1305617896-23711-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
References: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Commit 1394a46213e8180e1233ca6d4811e7c77d49b1e0 was a good idea, but it
introduced a segfault - files can be unlinked and 'file->links' is NULL, it is
bad idea to unconditionally dereference it with 'file->links->name'. This patch
introduces a helper function which takes care of the situation with unlinked
files, plus it adds few assertions.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   28 +++++++++++++++++++++-------
 1 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 9b98ef0..1b08acc 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -837,6 +837,8 @@ static int file_open(struct file_info *file)
 	int fd, flags = O_RDWR;
 	char *path;
 
+	assert(file->links);
+
 	path = dir_path(file->links->parent, file->links->name);
 	if (random_no(100) == 1)
 		flags |= O_SYNC;
@@ -851,6 +853,13 @@ static int file_open(struct file_info *file)
 	return 0;
 }
 
+static const char *get_file_name(struct file_info *file)
+{
+	if (file->links)
+		return file->links->name;
+	return "(unlinked file, no names)";
+}
+
 /*
  * Write random 'size' bytes of random data to offset 'offset'. Seed the random
  * gererator with 'seed'. Return amount of written data on success and -1 on
@@ -890,7 +899,7 @@ static ssize_t file_write_data(struct file_info *file, int fd, off_t offset,
 			}
 			pcv("failed to write %zu bytes to offset %llu of file %s",
 			    block, (unsigned long long)(offset + actual),
-			    file->links->name);
+			    get_file_name(file));
 			return -1;
 		}
 		remains -= written;
@@ -1089,7 +1098,8 @@ static int file_ftruncate(struct file_info *file, int fd, off_t new_length)
 			return 1;
 		} else
 			pcv("cannot truncate file %s to %llu",
-			    file->links->name, (unsigned long long)new_length);
+			    get_file_name(file),
+			    (unsigned long long)new_length);
 		return -1;
 	}
 
@@ -1139,6 +1149,7 @@ static int file_mmap_write(struct file_info *file)
 		len = 1 << 24;
 
 	/* Open it */
+	assert(file->links);
 	path = dir_path(file->links->parent, file->links->name);
 	fd = open(path, O_RDWR);
 	if (fd == -1) {
@@ -1256,12 +1267,12 @@ static int file_write(struct file_info *file, int fd)
 		if (random_no(100) >= 50) {
 			ret = fsync(fd);
 			if (ret)
-				pcv("fsync failed for %s", file->links->name);
+				pcv("fsync failed for %s", get_file_name(file));
 		} else {
 			ret = fdatasync(fd);
 			if (ret)
 				pcv("fdatasync failed for %s",
-				    file->links->name);
+				    get_file_name(file));
 		}
 		file->clean = 1;
 	}
@@ -1278,6 +1289,7 @@ static int file_write_file(struct file_info *file)
 	int fd, ret;
 	char *path;
 
+	assert(file->links);
 	path = dir_path(file->links->parent, file->links->name);
 	fd = open(path, O_RDWR);
 	if (fd == -1) {
@@ -1314,6 +1326,7 @@ static int file_truncate_file(struct file_info *file)
 	char *path;
 	int ret;
 
+	assert(file->links);
 	path = dir_path(file->links->parent, file->links->name);
 	fd = open(path, O_WRONLY);
 	if (fd == -1) {
@@ -1394,7 +1407,7 @@ static void save_file(int fd, struct file_info *file)
 
 	/* Open file to save contents to */
 	strcpy(name, "/tmp/");
-	strcat(name, file->links->name);
+	strcat(name, get_file_name(file));
 	strcat(name, ".integ.sav.read");
 	normsg("Saving %sn", name);
 	w_fd = open(name, O_CREAT | O_WRONLY, 0777);
@@ -1414,7 +1427,7 @@ static void save_file(int fd, struct file_info *file)
 
 	/* Open file to save contents to */
 	strcpy(name, "/tmp/");
-	strcat(name, file->links->name);
+	strcat(name, get_file_name(file));
 	strcat(name, ".integ.sav.written");
 	normsg("Saving %s", name);
 	w_fd = open(name, O_CREAT | O_WRONLY, 0777);
@@ -1512,7 +1525,8 @@ static void file_check(struct file_info *file, int fd)
 		open_and_close = 1;
 	if (open_and_close) {
 		/* Open file */
-		path = dir_path(file->links->parent, file->links->name);
+		assert(file->links);
+		path = dir_path(file->links->parent, get_file_name(file));
 		fd = open(path, O_RDONLY);
 		CHECK(fd != -1);
 	}
-- 
1.7.2.3

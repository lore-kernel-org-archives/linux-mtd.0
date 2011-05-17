Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMEnV-0004hc-1a
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 07:34:30 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4H7YFX2006045
	for <linux-mtd@lists.infradead.org>; Tue, 17 May 2011 10:34:27 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/11] fs-tests: integck: read all files in power cut mode
Date: Tue, 17 May 2011 10:38:16 +0300
Message-Id: <1305617896-23711-12-git-send-email-dedekind1@gmail.com>
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

When we are in power cut mode read all files after re-mounting. This will
check that FS recovery worked well and all files are readable after recovery.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   76 +++++++++++++++++++++++++++++++++--
 1 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 2140a1b..c2bf964 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1538,10 +1538,9 @@ static void file_check(struct file_info *file, int fd)
 	if (file->check_run_no == check_run_no)
 		return;
 	file->check_run_no = check_run_no;
-	if (fd == -1)
-		open_and_close = 1;
-	if (open_and_close) {
+	if (fd == -1) {
 		/* Open file */
+		open_and_close = 1;
 		assert(file->links);
 		path = dir_path(file->links->parent, get_file_name(file));
 		fd = open(path, O_RDONLY);
@@ -2630,6 +2629,73 @@ static void check_tested_fs(void)
 }
 
 /*
+ * This is a helper function which just reads whole file. We do this in case of
+ * emulated power cuts testing to make sure that unclean files can be at least
+ * read.
+ */
+static void read_whole_file(const char *name)
+{
+	size_t rd;
+	char buf[IO_BUFFER_SIZE];
+	int fd;
+
+	fd = open(name, O_RDONLY);
+	CHECK(fd != -1);
+
+	do {
+		rd = read(fd, buf, IO_BUFFER_SIZE);
+		CHECK(rd != -1);
+	} while (rd);
+
+	close(fd);
+}
+
+/*
+ * Recursively walk whole tested file-system and make sure we can read
+ * everything. This is done in case of power cuts emulation testing to ensure
+ * that everything in the file-system is readable.
+ */
+static void read_all(const char *dir_name)
+{
+	DIR *dir;
+	struct dirent *dent;
+	char buf[PATH_MAX];
+
+	assert(args.power_cut_mode);
+
+	dir = opendir(dir_name);
+	CHECK(dir != NULL);
+	CHECK(getcwd(buf, PATH_MAX) != NULL);
+	CHECK(chdir(dir_name) == 0);
+
+	for (;;) {
+		errno = 0;
+		dent = readdir(dir);
+		if (!dent) {
+			CHECK(errno == 0);
+			break;
+		}
+
+		if (!strcmp(dent->d_name, ".") ||
+		    !strcmp(dent->d_name, ".."))
+			continue;
+
+		if (dent->d_type == DT_DIR)
+			read_all(dent->d_name);
+		else if (dent->d_type == DT_REG)
+			read_whole_file(dent->d_name);
+		else if (dent->d_type == DT_LNK) {
+			char b[IO_BUFFER_SIZE];
+
+			CHECK(readlink(dent->d_name, b, IO_BUFFER_SIZE) != -1);
+		}
+	}
+
+	CHECK(chdir(buf) == 0);
+	CHECK(closedir(dir) == 0);
+}
+
+/*
  * Perform the test. Returns zero on success and -1 on failure.
  */
 static int integck(void)
@@ -2641,8 +2707,9 @@ static int integck(void)
 
 	/* Create our top directory */
 	if (chdir(fsinfo.test_dir) == 0) {
-		/* Remove it if it is already there */
 		CHECK(chdir("..") == 0);
+		if (args.power_cut_mode)
+			read_all(fsinfo.test_dir);
 		ret = rm_minus_rf_dir(fsinfo.test_dir);
 		if (ret)
 			return -1;
@@ -2974,7 +3041,6 @@ static void free_fs_info(struct dir_info *dir)
 			assert(0);
 	}
 }
-
 /**
  * Recover the tested file-system from an emulated power cut failure by
  * unmounting it and mounting it again.
-- 
1.7.2.3

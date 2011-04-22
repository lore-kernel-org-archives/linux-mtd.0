Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3X-0002nh-1H
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:17 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM9Kr025968
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:09 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 04/13] fs-tests: integck: add -e option to verify operations
Date: Fri, 22 Apr 2011 20:25:15 +0300
Message-Id: <1303493124-7619-5-git-send-email-dedekind1@gmail.com>
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

Improve the test and add -e option which forces integck to verify all
operation it performs. This patch does not implement file writes and
holes operations so far - will be done in subsequent patches.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |  138 +++++++++++++++++++++++++++++++++---
 1 files changed, 127 insertions(+), 11 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 9822b3b..f39745f 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -68,6 +68,7 @@
 static struct {
 	long repeat_cnt;
 	int power_cut_mode;
+	int verify_ops;
 	int verbose;
 	const char *mount_point;
 } args = {
@@ -529,6 +530,13 @@ static int dir_new(struct dir_info *parent, const char *name)
 		free(path);
 		return -1;
 	}
+
+	if (args.verify_ops) {
+		struct stat st;
+
+		CHECK(lstat(path, &st) == 0);
+		CHECK(S_ISDIR(st.st_mode));
+	}
 	free(path);
 
 	add_dir_entry(parent, 'd', name, NULL);
@@ -569,8 +577,16 @@ static int dir_remove(struct dir_info *dir)
 		return -1;
 	}
 
+	if (args.verify_ops) {
+		struct stat st;
+
+		CHECK(lstat(path, &st) == -1);
+		CHECK(errno == ENOENT);
+	}
+
 	/* Remove entry from parent directory */
 	remove_dir_entry(dir->entry, 1);
+
 	free(path);
 	return 0;
 }
@@ -597,10 +613,17 @@ static int file_new(struct dir_info *parent, const char *name)
 		free(path);
 		return -1;
 	}
-	free(path);
 
+	if (args.verify_ops) {
+		struct stat st;
+
+		CHECK(lstat(path, &st) == 0);
+		CHECK(S_ISREG(st.st_mode));
+	}
 	file = add_dir_entry(parent, 'f', name, NULL);
 	add_fd(file, fd);
+
+	free(path);
 	return 0;
 }
 
@@ -610,6 +633,7 @@ static int link_new(struct dir_info *parent, const char *name,
 	struct dir_entry_info *entry;
 	char *path, *target;
 	int ret;
+	struct stat st1, st2;
 
 	entry = file->links;
 	if (!entry)
@@ -617,6 +641,10 @@ static int link_new(struct dir_info *parent, const char *name,
 
 	path = dir_path(parent, name);
 	target = dir_path(entry->parent, entry->name);
+
+	if (args.verify_ops)
+		CHECK(lstat(target, &st1) == 0);
+
 	ret = link(target, path);
 	if (ret != 0) {
 		if (errno == ENOSPC) {
@@ -629,9 +657,19 @@ static int link_new(struct dir_info *parent, const char *name,
 		free(path);
 		return ret;
 	}
+
+	if (args.verify_ops) {
+		CHECK(lstat(path, &st2) == 0);
+		CHECK(S_ISREG(st2.st_mode));
+		CHECK(st1.st_ino == st2.st_ino);
+		CHECK(st2.st_nlink > 1);
+		CHECK(st2.st_nlink == st1.st_nlink + 1);
+	}
+
+	add_dir_entry(parent, 'f', name, file);
+
 	free(target);
 	free(path);
-	add_dir_entry(parent, 'f', name, file);
 	return 0;
 }
 
@@ -665,10 +703,18 @@ static int file_unlink(struct dir_entry_info *entry)
 		free(path);
 		return -1;
 	}
-	free(path);
+
+	if (args.verify_ops) {
+		struct stat st;
+
+		CHECK(lstat(path, &st) == -1);
+		CHECK(errno == ENOENT);
+	}
 
 	/* Remove file entry from parent directory */
 	remove_dir_entry(entry, 1);
+
+	free(path);
 	return 0;
 }
 
@@ -984,6 +1030,9 @@ static int file_ftruncate(struct file_info *file, int fd, off_t new_length)
 		return -1;
 	}
 
+	if (args.verify_ops)
+		CHECK(lseek(fd, 0, SEEK_END) == new_length);
+
 	return 0;
 }
 
@@ -1724,6 +1773,7 @@ static int rename_entry(struct dir_entry_info *entry)
 	struct dir_info *parent;
 	char *path, *to, *name;
 	int ret, isdir, retry;
+	struct stat st1, st2;
 
 	if (!entry->parent)
 		return 0;
@@ -1757,6 +1807,9 @@ static int rename_entry(struct dir_entry_info *entry)
 	if (!path)
 		return 0;
 
+	if (args.verify_ops)
+		CHECK(lstat(path, &st1) == 0);
+
 	ret = rename(path, to);
 	if (ret != 0) {
 		ret = 0;
@@ -1772,6 +1825,11 @@ static int rename_entry(struct dir_entry_info *entry)
 		return ret;
 	}
 
+	if (args.verify_ops) {
+		CHECK(lstat(to, &st2) == 0);
+		CHECK(st1.st_ino == st2.st_ino);
+	}
+
 	free(path);
 	free(to);
 
@@ -1870,6 +1928,18 @@ static char *pick_symlink_target(const char *symlink_path)
 	return rel_path;
 }
 
+static void verify_symlink(const char *target, const char *path)
+{
+	int bytes;
+	char buf[PATH_MAX + 1];
+
+	bytes = readlink(path, buf, PATH_MAX);
+	CHECK(bytes >= 0);
+	CHECK(bytes < PATH_MAX);
+	buf[bytes] = '\0';
+	CHECK(!strcmp(buf, target));
+}
+
 static int symlink_new(struct dir_info *dir, const char *nm)
 {
 	struct symlink_info *s;
@@ -1896,10 +1966,14 @@ static int symlink_new(struct dir_info *dir, const char *nm)
 		free(path);
 		return ret;
 	}
-	free(path);
+
+	if (args.verify_ops)
+		verify_symlink(target, path);
 
 	s = add_dir_entry(dir, 's', name, NULL);
 	s->target_pathname = target;
+
+	free(path);
 	free(name);
 	return 0;
 }
@@ -1915,7 +1989,15 @@ static int symlink_remove(struct symlink_info *symlink)
 		return -1;
 	}
 
+	if (args.verify_ops) {
+		struct stat st;
+
+		CHECK(lstat(path, &st) == -1);
+		CHECK(errno == ENOENT);
+	}
+
 	remove_dir_entry(symlink->entry, 1);
+
 	free(path);
 	return 0;
 }
@@ -2247,11 +2329,34 @@ static int rm_minus_rf_dir(const char *dir_name)
 
 	CHECK(chdir(buf) == 0);
 	CHECK(closedir(dir) == 0);
+
+	if (args.verify_ops) {
+		dir = opendir(dir_name);
+		CHECK(dir != NULL);
+		do {
+			errno = 0;
+			dent = readdir(dir);
+			if (dent)
+				CHECK(!strcmp(dent->d_name, ".") ||
+				      !strcmp(dent->d_name, ".."));
+		} while (dent);
+		CHECK(errno == 0);
+		CHECK(closedir(dir) == 0);
+	}
+
 	ret = rmdir(dir_name);
 	if (ret) {
 		pcv("cannot remove directory %s", dir_name);
 		return -1;
 	}
+
+	if (args.verify_ops) {
+		struct stat st;
+
+		CHECK(lstat(dir_name, &st) == -1);
+		CHECK(errno == ENOENT);
+	}
+
 	return 0;
 }
 
@@ -2600,6 +2705,11 @@ static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 "directories, etc) should be there and the contents of the files should be\n"
 "correct. This is repeated a number of times (set with -n, default 1).\n"
 "\n"
+"By default the test does not verify file-system modifications and assumes they\n"
+"are done correctly if the file-system returns success. However, the -e flag\n"
+"enables additional verifications and the test verifies all the file-system\n"
+"operations it performs.\n"
+"\n"
 "This test is also able to perform power cut testing. The underlying file-system\n"
 "or the device driver should be able to emulate power-cuts, by switching to R/O\n"
 "mode at random moments. And the file-system should return EROFS (read-only\n"
@@ -2612,16 +2722,20 @@ static const char optionsstr[] =
 "-n, --repeat=<count> repeat count, default is 1; zero value - repeat forever\n"
 "-p, --power-cut      power cut testing mode (-n parameter is ignored and the\n"
 "                     test continues forever)\n"
+"-e, --verify-ops     verify all operations, e.g., every time a file is written\n"
+"                     to, read the data back and verify it, every time a\n"
+"                     directory is created, check that it exists, etc\n"
 "-v, --verbose        be verbose about failures during power cut testing\n"
 "-h, -?, --help       print help message\n"
 "-V, --version        print program version\n";
 
 static const struct option long_options[] = {
-	{ .name = "repeat",    .has_arg = 1, .flag = NULL, .val = 'n' },
-	{ .name = "power-cut", .has_arg = 0, .flag = NULL, .val = 'p' },
-	{ .name = "verbose",   .has_arg = 0, .flag = NULL, .val = 'v' },
-	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "repeat",     .has_arg = 1, .flag = NULL, .val = 'n' },
+	{ .name = "power-cut",  .has_arg = 0, .flag = NULL, .val = 'p' },
+	{ .name = "verify-ops", .has_arg = 0, .flag = NULL, .val = 'e' },
+	{ .name = "verbose",    .has_arg = 0, .flag = NULL, .val = 'v' },
+	{ .name = "help",       .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",    .has_arg = 0, .flag = NULL, .val = 'V' },
 	{ NULL, 0, NULL, 0},
 };
 
@@ -2636,7 +2750,7 @@ static int parse_opts(int argc, char * const argv[])
 	while (1) {
 		int key, error = 0;
 
-		key = getopt_long(argc, argv, "n:pvVh?", long_options, NULL);
+		key = getopt_long(argc, argv, "n:pevVh?", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -2649,6 +2763,9 @@ static int parse_opts(int argc, char * const argv[])
 		case 'p':
 			args.power_cut_mode = 1;
 			break;
+		case 'e':
+			args.verify_ops = 1;
+			break;
 		case 'v':
 			args.verbose = 1;
 			break;
@@ -2867,7 +2984,6 @@ int main(int argc, char *argv[])
 		} while (ret);
 	}
 
-
 	free_test_data();
 
 out_free:
-- 
1.7.2.3

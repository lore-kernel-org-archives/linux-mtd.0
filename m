Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nS-0003Si-Jd
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:08 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFpWh018758
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:57 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 18/27] fs-tests: integck: do not use tests_clear_dir
Date: Wed, 13 Apr 2011 18:18:58 +0300
Message-Id: <1302707947-6143-19-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
References: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
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

Do not use shared 'tests_clear_dir()' function which removes a directory
tree recursively, but instead use own implementation. This is because
I'm trying to make integck independend on the shared code because I
need this to do further improvements.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   54 ++++++++++++++++++++++++++++++------
 1 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index ed02b56..4806acd 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1942,6 +1942,42 @@ static void create_test_data(void)
 		do_an_operation();
 }
 
+/*
+ * Recursively remove a directory, just like "rm -rf" shell command.
+ */
+void rm_minus_rf_dir(const char *dir_name)
+{
+	DIR *dir;
+	struct dirent *entry;
+	char buf[PATH_MAX];
+
+	dir = opendir(dir_name);
+	CHECK(dir != NULL);
+	CHECK(getcwd(buf, PATH_MAX) != NULL);
+	CHECK(chdir(dir_name) == 0);
+
+	for (;;) {
+		errno = 0;
+		entry = readdir(dir);
+		if (!entry) {
+			CHECK(errno == 0);
+			break;
+		}
+
+		if (strcmp(entry->d_name, ".") &&
+		    strcmp(entry->d_name, "..")) {
+			if (entry->d_type == DT_DIR)
+				rm_minus_rf_dir(entry->d_name);
+			else
+				CHECK(unlink(entry->d_name) == 0);
+		}
+	}
+
+	CHECK(chdir(buf) == 0);
+	CHECK(closedir(dir) == 0);
+	CHECK(rmdir(dir_name) == 0);
+}
+
 static void update_test_data(void)
 {
 	uint64_t i, n;
@@ -1977,19 +2013,17 @@ static int integck(void)
 {
 	int64_t rpt;
 
-	/* Make our top directory */
-	if (chdir(fsinfo.test_dir) != -1) {
+	/* Create our top directory */
+	if (chdir(fsinfo.test_dir) == 0) {
 		/* Remove it if it is already there */
-		tests_clear_dir(".");
-		CHECK(chdir("..") != -1);
-		CHECK(rmdir(fsinfo.test_dir) != -1);
+		CHECK(chdir("..") == 0);
+		rm_minus_rf_dir(fsinfo.test_dir);
 	}
-	top_dir = dir_new(NULL, fsinfo.test_dir);
 
+	top_dir = dir_new(NULL, fsinfo.test_dir);
 	if (!top_dir)
 		return -1;
 
-	srand(getpid());
 	create_test_data();
 
 	if (!tests_fs_is_rootfs()) {
@@ -2018,8 +2052,7 @@ static int integck(void)
 
 	/* Tidy up by removing everything */
 	close_open_files();
-	tests_clear_dir(fsinfo.test_dir);
-	CHECK(rmdir(fsinfo.test_dir) != -1);
+	rm_minus_rf_dir(fsinfo.test_dir);
 
 	return 0;
 }
@@ -2186,6 +2219,9 @@ int main(int argc, char *argv[])
 	tests_file_system_mount_dir = (void *)fsinfo.mount_point;
 	tests_file_system_type = (void *)fsinfo.fstype;
 
+	/* Seed the random generator with out PID */
+	srand(getpid());
+
 	/* Do the actual test */
 	ret = integck();
 	if (ret)
-- 
1.7.2.3

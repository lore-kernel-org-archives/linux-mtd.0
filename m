Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURq-00063i-0f
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:15:54 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmWs009496
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:48 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 02/35] fs-tests: integck: check deletion errors in
	rm_minus_rf_dir
Date: Wed, 20 Apr 2011 13:18:35 +0300
Message-Id: <1303294748-5492-3-git-send-email-dedekind1@gmail.com>
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

Modify the 'rm_minus_rf_dir()' function to return -1 in case of any
errors during deletions. Make 'integck()' handle the errors. Also
introduce a 'pcv()' function to print error message if -v command
line option was specified.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   54 ++++++++++++++++++++++++++---------
 1 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 73b6622..dd1ba1c 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -62,6 +62,15 @@
 	}                                                        \
 } while(0)
 
+#define pcv(fmt, ...) do {                                        \
+	if (args.power_cut_mode) {                                \
+		int _err = errno;                                 \
+		errmsg(fmt, ##__VA_ARGS__);                       \
+		errmsg("error %d (%s) at %s:%d\n",                \
+		       _err, strerror(_err), __FILE__, __LINE__); \
+	}                                                         \
+} while(0)
+
 /* The variables below are set by command line arguments */
 static struct {
 	long repeat_cnt;
@@ -1989,10 +1998,11 @@ static void create_test_data(void)
 /*
  * Recursively remove a directory, just like "rm -rf" shell command.
  */
-void rm_minus_rf_dir(const char *dir_name)
+static int rm_minus_rf_dir(const char *dir_name)
 {
+	int ret;
 	DIR *dir;
-	struct dirent *entry;
+	struct dirent *dent;
 	char buf[PATH_MAX];
 
 	dir = opendir(dir_name);
@@ -2002,24 +2012,34 @@ void rm_minus_rf_dir(const char *dir_name)
 
 	for (;;) {
 		errno = 0;
-		entry = readdir(dir);
-		if (!entry) {
+		dent = readdir(dir);
+		if (!dent) {
 			CHECK(errno == 0);
 			break;
 		}
 
-		if (strcmp(entry->d_name, ".") &&
-		    strcmp(entry->d_name, "..")) {
-			if (entry->d_type == DT_DIR)
-				rm_minus_rf_dir(entry->d_name);
-			else
-				CHECK(unlink(entry->d_name) == 0);
+		if (strcmp(dent->d_name, ".") &&
+		    strcmp(dent->d_name, "..")) {
+			if (dent->d_type == DT_DIR)
+				rm_minus_rf_dir(dent->d_name);
+			else {
+				ret = unlink(dent->d_name);
+				if (ret) {
+					pcv("cannot unlink %s", dent->d_name);
+					return -1;
+				}
+			}
 		}
 	}
 
 	CHECK(chdir(buf) == 0);
 	CHECK(closedir(dir) == 0);
-	CHECK(rmdir(dir_name) == 0);
+	ret = rmdir(dir_name);
+	if (ret) {
+		pcv("cannot remove directory %s", dir_name);
+		return -1;
+	}
+	return 0;
 }
 
 static void update_test_data(void)
@@ -2146,13 +2166,18 @@ void remount_tested_fs(void)
  */
 static int integck(void)
 {
+	int ret;
 	int64_t rpt;
 
+	CHECK(chdir(fsinfo.mount_point) == 0);
+
 	/* Create our top directory */
 	if (chdir(fsinfo.test_dir) == 0) {
 		/* Remove it if it is already there */
 		CHECK(chdir("..") == 0);
-		rm_minus_rf_dir(fsinfo.test_dir);
+		ret = rm_minus_rf_dir(fsinfo.test_dir);
+		if (ret)
+			return -1;
 	}
 
 	top_dir = dir_new(NULL, fsinfo.test_dir);
@@ -2187,7 +2212,9 @@ static int integck(void)
 
 	/* Tidy up by removing everything */
 	close_open_files();
-	rm_minus_rf_dir(fsinfo.test_dir);
+	ret = rm_minus_rf_dir(fsinfo.test_dir);
+	if (ret)
+		return -1;
 
 	return 0;
 }
@@ -2403,7 +2430,6 @@ static int parse_opts(int argc, char * const argv[])
 			fprintf(stderr, "%s\n\n", doc);
 			fprintf(stderr, "%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
-
 		case ':':
 			return errmsg("parameter is missing");
 
-- 
1.7.2.3

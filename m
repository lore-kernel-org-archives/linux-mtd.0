Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nN-0003Pz-J0
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:15:59 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFnDi018703
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:52 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 07/27] fs-tests: integck: implement own parameters parsing
Date: Wed, 13 Apr 2011 18:18:47 +0300
Message-Id: <1302707947-6143-8-git-send-email-dedekind1@gmail.com>
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

Instead of using shared command line arguments parsing routine
implement own. The reason is that I want to add more parameters,
which are integck-specific. Also, longer-term plan is to make
integck independent of the common tests.c file.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |  112 ++++++++++++++++++++++++++----------
 1 files changed, 81 insertions(+), 31 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index ea3684b..281de81 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -29,14 +29,24 @@
 #include <errno.h>
 #include <limits.h>
 #include <dirent.h>
+#include <getopt.h>
 #include <sys/mman.h>
 #include "tests.h"
 
+#define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME "integck"
 #include "common.h"
 
 #define MAX_RANDOM_SEED 10000000
 
+/* The variables below are set by command line arguments */
+static struct {
+	long repeat_cnt;
+	const char *mount_point;
+} args = {
+	.repeat_cnt = 1,
+};
+
 /* Structures to store data written to the test file system,
    so that we can check whether the file system is correct. */
 
@@ -235,7 +245,7 @@ static char *dir_path(struct dir_info *parent, const char *name)
 	char *path;
 
 	if (!parent)
-		return cat_paths(tests_file_system_mount_dir, name);
+		return cat_paths(args.mount_point, name);
 	parent_path = dir_path(parent->parent, parent->name);
 	path = cat_paths(parent_path, name);
 	free(parent_path);
@@ -1968,8 +1978,7 @@ void integck(void)
 	dir_check(top_dir);
 	check_deleted_files();
 
-	for (rpt = 0; tests_repeat_parameter == 0 ||
-				rpt < tests_repeat_parameter; ++rpt) {
+	for (rpt = 0; args.repeat_cnt == 0 || rpt < args.repeat_cnt; ++rpt) {
 		update_test_data();
 
 		if (!tests_fs_is_rootfs()) {
@@ -1989,44 +1998,85 @@ void integck(void)
 	CHECK(rmdir(dir_name) != -1);
 }
 
-/* Title of this test */
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+" - a stress test which checks the file-system integrity.\n"
+"It creates a directory named \"integck_test_dir_pid\", where where pid is the\n"
+"process id. Then it randomly creates and deletes files, directories, symlinks\n"
+"and hardlinks, randomly writes and truncate files, sometimes makes holes in\n"
+"files, sometimes fsync()'s them. Then it un-mounts and re-mounts the test file\n"
+"system and checks the contents - everything (files, dirs, etc) should be there\n"
+"and the contents of the files should be correct.\n"
+"This is repeated a number of times (set with -n, default 1).";
+
+static const char optionsstr[] =
+"-n, --repeat=<count> repeat count, default is 1; zero value - repeat forever\n"
+"-h, -?, --help       print help message\n"
+"-V, --version        print program version\n";
+
+static const struct option long_options[] = {
+	{ .name = "repeat",  .has_arg = 1, .flag = NULL, .val = 'n' },
+	{ .name = "help",    .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0},
+};
 
-const char *integck_get_title(void)
+/*
+ * Parse input command-line options. Returns zero on success and -1 on error.
+ */
+static int parse_opts(int argc, char * const argv[])
 {
-	return "Test file system integrity";
-}
+	while (1) {
+		int key, error = 0;
 
-/* Description of this test */
+		key = getopt_long(argc, argv, "n:Vh?", long_options, NULL);
+		if (key == -1)
+			break;
 
-const char *integck_get_description(void)
-{
-	return
-		"Create a directory named integck_test_dir_pid " \
-		"where pid is the process id. " \
-		"Randomly create and delete files and directories. " \
-		"Randomly write to and truncate files. " \
-		"Un-mount and re-mount test file " \
-		"system (if it is not the root file system ). " \
-		"Check data. Make more random changes. " \
-		"Un-mount and re-mount again. Check again. " \
-		"Repeat some number of times. "
-		"The repeat count is set by the -n or --repeat option, " \
-		"otherwise it defaults to 1. " \
-		"A repeat count of zero repeats forever.";
+		switch (key) {
+		case 'n':
+			args.repeat_cnt = simple_strtoul(optarg, &error);
+			if (error || args.repeat_cnt < 0)
+				return errmsg("bad repeat count: \"%s\"", optarg);
+			break;
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case 'h':
+		case '?':
+			fprintf(stderr, "%s\n\n", doc);
+			fprintf(stderr, "%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case ':':
+			return errmsg("parameter is missing");
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	if (optind == argc)
+		return errmsg("test file-system was not specified (use -h for help)");
+	else if (optind != argc - 1)
+		return errmsg("more then one test file-system specified (use -h for help)");
+
+	args.mount_point = argv[optind];
+	return 0;
 }
 
 int main(int argc, char *argv[])
 {
-	int run_test;
+	int ret;
 
-	/* Set default test repetition */
-	tests_repeat_parameter = 1;
+	ret = parse_opts(argc, argv);
+	if (ret)
+		return EXIT_FAILURE;
 
-	/* Handle common arguments */
-	run_test = tests_get_args(argc, argv, integck_get_title(),
-			integck_get_description(), "n");
-	if (!run_test)
-		return 1;
+	/* Temporary hack - will be fixed a bit later */
+	tests_file_system_mount_dir = (void *)args.mount_point;
+	tests_file_system_type = "ubifs";
 
 	/* Change directory to the file system and check it is ok for testing */
 	tests_check_test_file_system();
-- 
1.7.2.3

Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURp-00063h-UK
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:15:51 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmD6009486
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:48 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/35] fs-tests: integck: introduce power cut testing arguments
Date: Wed, 20 Apr 2011 13:18:34 +0300
Message-Id: <1303294748-5492-2-git-send-email-dedekind1@gmail.com>
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

Introduce new command line arguments for power cut testing:
-p to enable the power cut testing mode and -v to be verbose
about the errors. The real functionality is not implemented
so far.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   31 +++++++++++++++++++++++++------
 1 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 61fb12c..73b6622 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -65,6 +65,8 @@
 /* The variables below are set by command line arguments */
 static struct {
 	long repeat_cnt;
+	int power_cut_mode;
+	int verbose;
 	const char *mount_point;
 } args = {
 	.repeat_cnt = 1,
@@ -2339,18 +2341,29 @@ static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 "and hardlinks, randomly writes and truncate files, sometimes makes holes in\n"
 "files, sometimes fsync()'s them. Then it un-mounts and re-mounts the test file\n"
 "system and checks the contents - everything (files, dirs, etc) should be there\n"
-"and the contents of the files should be correct.\n"
-"This is repeated a number of times (set with -n, default 1).";
+"and the contents of the files should be correct. This is repeated a number of\n"
+"times (set with -n, default 1).\n\n"
+"This test is also able to perform powe cut testing. The underlying file-system\n"
+"or the device driver should be able to emulate power-cuts, e.g., but switching\n"
+"to R/O mode at random points of time. And the file-system should return EROFS\n"
+"(read-only file-system error) for all operations which modify it. In this case\n"
+"this test program re-mounts the file-system and checks that all files and\n"
+"directories which have been successfully synchronized before the power cut are\n"
+"there and contains correct data. Then the test continues.\n";
 
 static const char optionsstr[] =
 "-n, --repeat=<count> repeat count, default is 1; zero value - repeat forever\n"
+"-p, --power-cut      power cut testing mode\n"
+"-v, --verbose        be verbose about failure during power cut testing\n"
 "-h, -?, --help       print help message\n"
 "-V, --version        print program version\n";
 
 static const struct option long_options[] = {
-	{ .name = "repeat",  .has_arg = 1, .flag = NULL, .val = 'n' },
-	{ .name = "help",    .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "repeat",    .has_arg = 1, .flag = NULL, .val = 'n' },
+	{ .name = "power-cut", .has_arg = 0, .flag = NULL, .val = 'p' },
+	{ .name = "verbose",   .has_arg = 0, .flag = NULL, .val = 'v' },
+	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
 	{ NULL, 0, NULL, 0},
 };
 
@@ -2365,7 +2378,7 @@ static int parse_opts(int argc, char * const argv[])
 	while (1) {
 		int key, error = 0;
 
-		key = getopt_long(argc, argv, "n:Vh?", long_options, NULL);
+		key = getopt_long(argc, argv, "n:pvVh?", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -2375,6 +2388,12 @@ static int parse_opts(int argc, char * const argv[])
 			if (error || args.repeat_cnt < 0)
 				return errmsg("bad repeat count: \"%s\"", optarg);
 			break;
+		case 'p':
+			args.power_cut_mode = 1;
+			break;
+		case 'v':
+			args.verbose = 1;
+			break;
 		case 'V':
 			fprintf(stderr, "%s\n", PROGRAM_VERSION);
 			exit(EXIT_SUCCESS);
-- 
1.7.2.3

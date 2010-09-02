Received: from sand.ocn.ne.jp ([122.28.30.136] helo=smtp.sand.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqzqT-0006f8-JH
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 02:48:14 +0000
From: Jon Povey <jon.povey@racelogic.co.uk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] ubi-utils: provide default value for /dev/ubi_ctrl
Date: Thu,  2 Sep 2010 11:47:53 +0900
Message-Id: <1283395673-4710-1-git-send-email-jon.povey@racelogic.co.uk>
Cc: Jon Povey <jon.povey@racelogic.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Modify ubiattach and ubidetach to default to /dev/ubi_ctrl if not supplied
rather than requiring the user to type it in every time.

Also bump version from 1.0 to 1.1

Signed-off-by: Jon Povey <jon.povey@racelogic.co.uk>
---
 ubi-utils/src/ubiattach.c |   17 ++++++++++-------
 ubi-utils/src/ubidetach.c |   17 ++++++++++-------
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/ubi-utils/src/ubiattach.c b/ubi-utils/src/ubiattach.c
index b1c8d74..4454c38 100644
--- a/ubi-utils/src/ubiattach.c
+++ b/ubi-utils/src/ubiattach.c
@@ -31,8 +31,9 @@
 #include "common.h"
 #include "ubiutils-common.h"
 
-#define PROGRAM_VERSION "1.0"
+#define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME    "ubiattach"
+#define DEFAULT_CTRL_DEV "/dev/ubi_ctrl"
 
 /* The variables below are set by command line arguments */
 struct args {
@@ -68,13 +69,14 @@ static const char *optionsstr =
 "-V, --version                   print program version";
 
 static const char *usage =
-"Usage: " PROGRAM_NAME " <UBI control device node file name>\n"
+"Usage: " PROGRAM_NAME " [<UBI control device node file name>]\n"
 "\t[-m <MTD device number>] [-d <UBI device number>] [-p <path to device>]\n"
 "\t[--mtdn=<MTD device number>] [--devn=<UBI device number>]\n"
 "\t[--dev-path=<path to device>]\n"
-"Example 1: " PROGRAM_NAME " /dev/ubi_ctrl -p /dev/mtd0 - attach /dev/mtd0 to UBI\n"
-"Example 2: " PROGRAM_NAME " /dev/ubi_ctrl -m 0 - attach MTD device 0 (mtd0) to UBI\n"
-"Example 3: " PROGRAM_NAME " /dev/ubi_ctrl -m 0 -d 3 - attach MTD device 0 (mtd0) to UBI and\n"
+"UBI control device defaults to " DEFAULT_CTRL_DEV " if not supplied.\n"
+"Example 1: " PROGRAM_NAME " -p /dev/mtd0 - attach /dev/mtd0 to UBI\n"
+"Example 2: " PROGRAM_NAME " -m 0 - attach MTD device 0 (mtd0) to UBI\n"
+"Example 3: " PROGRAM_NAME " -m 0 -d 3 - attach MTD device 0 (mtd0) to UBI\n"
 "           and create UBI device number 3 (ubi3)";
 
 static const struct option long_options[] = {
@@ -142,14 +144,15 @@ static int parse_opt(int argc, char * const argv[])
 	}
 
 	if (optind == argc)
-		return errmsg("UBI control device name was not specified (use -h for help)");
+		args.node = DEFAULT_CTRL_DEV;
 	else if (optind != argc - 1)
 		return errmsg("more then one UBI control device specified (use -h for help)");
+	else
+		args.node = argv[optind];
 
 	if (args.mtdn == -1 && args.dev == NULL)
 		return errmsg("MTD device to attach was not specified (use -h for help)");
 
-	args.node = argv[optind];
 	return 0;
 }
 
diff --git a/ubi-utils/src/ubidetach.c b/ubi-utils/src/ubidetach.c
index 335486d..c4c05a5 100644
--- a/ubi-utils/src/ubidetach.c
+++ b/ubi-utils/src/ubidetach.c
@@ -30,8 +30,9 @@
 #include <libubi.h>
 #include "common.h"
 
-#define PROGRAM_VERSION "1.0"
+#define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME    "ubidetach"
+#define DEFAULT_CTRL_DEV "/dev/ubi_ctrl"
 
 /* The variables below are set by command line arguments */
 struct args {
@@ -59,13 +60,14 @@ static const char *optionsstr =
 "-V, --version                   print program version";
 
 static const char *usage =
-"Usage: " PROGRAM_NAME " <UBI control device node file name>\n"
+"Usage: " PROGRAM_NAME " [<UBI control device node file name>]\n"
 "\t[-d <UBI device number>] [-m <MTD device number>] [-p <path to device>]\n"
 "\t[--devn=<UBI device number>] [--mtdn=<MTD device number>]\n"
 "\t[--dev-path=<path to device>]\n"
-"Example 1: " PROGRAM_NAME " /dev/ubi_ctrl -p /dev/mtd0 - detach MTD device /dev/mtd0\n"
-"Example 2: " PROGRAM_NAME " /dev/ubi_ctrl -d 2 - delete UBI device 2 (ubi2)\n"
-"Example 3: " PROGRAM_NAME " /dev/ubi_ctrl -m 0 - detach MTD device 0 (mtd0)";
+"UBI control device defaults to " DEFAULT_CTRL_DEV " if not supplied.\n"
+"Example 1: " PROGRAM_NAME " -p /dev/mtd0 - detach MTD device /dev/mtd0\n"
+"Example 2: " PROGRAM_NAME " -d 2 - delete UBI device 2 (ubi2)\n"
+"Example 3: " PROGRAM_NAME " -m 0 - detach MTD device 0 (mtd0)";
 
 static const struct option long_options[] = {
 	{ .name = "devn",     .has_arg = 1, .flag = NULL, .val = 'd' },
@@ -124,9 +126,11 @@ static int parse_opt(int argc, char * const argv[])
 	}
 
 	if (optind == argc)
-		return errmsg("UBI control device name was not specified (use -h for help)");
+		args.node = DEFAULT_CTRL_DEV;
 	else if (optind != argc - 1)
 		return errmsg("more then one UBI control device specified (use -h for help)");
+	else
+		args.node = argv[optind];
 
 	if (args.mtdn == -1 && args.devn == -1 && args.dev == NULL)
 		return errmsg("neither MTD nor UBI devices were specified (use -h for help)");
@@ -138,7 +142,6 @@ static int parse_opt(int argc, char * const argv[])
 	} else if (args.mtdn != -1 && args.dev != NULL)
 		return errmsg("specify either MTD number or device node (use -h for help)");
 
-	args.node = argv[optind];
 	return 0;
 }
 
-- 
1.6.3.3

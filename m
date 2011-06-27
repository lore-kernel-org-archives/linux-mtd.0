Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbGYL-0003Dh-04
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 18:28:59 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 09/10] mtdinfo: kill -m option
Date: Mon, 27 Jun 2011 11:27:26 -0700
Message-ID: <1309199247-19248-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to feature-removal-schedule, we shouldn't use `-m', since
it relies on a specific device-naming pattern.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 feature-removal-schedule.txt |    8 --------
 ubi-utils/mtdinfo.c          |   25 ++++++-------------------
 2 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
index 0920203..69a8155 100644
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -26,11 +26,3 @@ to stop using them.
 The further step is to remove both of them.
 
 ---------------------------
-2. Kill -m parameter of mtdinfo
-
-We cannot assume that mtd device names follow the "/dev/mtd%d" pattern,
-because it is up to udev rules to name the devices. So we are removing
-the -m option. For now, we just have a warning, but the option will be
-removed in release 1.4.6.
-
----------------------------
diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index ab00ce0..dd5da53 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -56,8 +56,6 @@ static const char doc[] = PROGRAM_NAME " version " VERSION
 			 " - a tool to print MTD information.";
 
 static const char optionsstr[] =
-"-m, --mtdn=<MTD device number>  MTD device number to get information about\n"
-"                                (deprecated option, will be removed, do not use)\n"
 "-u, --ubi-info                  print what would UBI layout be if it was put\n"
 "                                on this MTD device\n"
 "-M, --map                       print eraseblock map\n"
@@ -66,20 +64,16 @@ static const char optionsstr[] =
 "-V, --version                   print program version";
 
 static const char usage[] =
-"Usage 1: " PROGRAM_NAME " [-m <MTD device number>] [-u] [-M] [-h] [-V] [--mtdn <MTD device number>]\n"
-"\t\t[--ubi-info] [--help] [--version]\n"
-"Usage 2: " PROGRAM_NAME " <MTD device node file name> [-u] [-M] [-h] [-V] [--ubi-info] [--help]\n"
+"Usage: " PROGRAM_NAME " <MTD device node file name> [-u] [-M] [-h] [-V] [--ubi-info] [--help]\n"
 "\t\t[--version]\n"
 "Example 1: " PROGRAM_NAME " - (no arguments) print general MTD information\n"
-"Example 2: " PROGRAM_NAME " -m 1 - print information about MTD device number 1\n"
-"Example 3: " PROGRAM_NAME " /dev/mtd0 - print information MTD device /dev/mtd0\n"
-"Example 4: " PROGRAM_NAME " /dev/mtd0 -u - print information MTD device /dev/mtd0\n"
+"Example 2: " PROGRAM_NAME " /dev/mtd0 - print information MTD device /dev/mtd0\n"
+"Example 3: " PROGRAM_NAME " /dev/mtd0 -u - print information MTD device /dev/mtd0\n"
 "\t\t\t\tand include UBI layout information\n"
-"Example 5: " PROGRAM_NAME " -a - print information about all MTD devices\n"
+"Example 4: " PROGRAM_NAME " -a - print information about all MTD devices\n"
 "\t\t\tand include UBI layout information\n";
 
 static const struct option long_options[] = {
-	{ .name = "mtdn",      .has_arg = 1, .flag = NULL, .val = 'm' },
 	{ .name = "ubi-info",  .has_arg = 0, .flag = NULL, .val = 'u' },
 	{ .name = "map",       .has_arg = 0, .flag = NULL, .val = 'M' },
 	{ .name = "all",       .has_arg = 0, .flag = NULL, .val = 'a' },
@@ -91,9 +85,9 @@ static const struct option long_options[] = {
 static int parse_opt(int argc, char * const argv[])
 {
 	while (1) {
-		int key, error = 0;
+		int key;
 
-		key = getopt_long(argc, argv, "am:uMhV", long_options, NULL);
+		key = getopt_long(argc, argv, "auMhV", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -106,13 +100,6 @@ static int parse_opt(int argc, char * const argv[])
 			args.ubinfo = 1;
 			break;
 
-		case 'm':
-			args.mtdn = simple_strtoul(optarg, &error);
-			if (error || args.mtdn < 0)
-				return errmsg("bad MTD device number: \"%s\"", optarg);
-			warnmsg("-m/--mtdn is depecated, will be removed in mtd-utils-1.4.6");
-			break;
-
 		case 'M':
 			args.map = 1;
 			break;
-- 
1.7.0.4

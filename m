Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qt3b7-0008W4-1w
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 20:17:21 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v4 5/5] mtdinfo: consolidate help as display_help()
Date: Mon, 15 Aug 2011 13:17:05 -0700
Message-ID: <1313439425-27044-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313079580-22144-1-git-send-email-computersforpeace@gmail.com>
References: <1313079580-22144-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: brian.foster@maxim-ic.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The help message for mtdinfo is unnecessarily disjointed. It is split
into three strings which reuse the PROGRAM_NAME string inefficiently and
don't have a consistent style.

This fixup should provide a cleaner look with aligned columns and
easier-to-read source code.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v4: use spaces instead of tabs for indentation, using "strlen" plus printf
    positional parameters

v3: indented help message 'properly'

v2: split off from previous patch

 ubi-utils/mtdinfo.c |   52 ++++++++++++++++++++++++++------------------------
 1 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index 1c3a46f..d919673 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -50,28 +50,32 @@ static struct args args = {
 	.node = NULL,
 };
 
-static const char doc[] = PROGRAM_NAME " version " VERSION
-			 " - a tool to print MTD information.";
-
-static const char optionsstr[] =
-"-u, --ubi-info                  print what would UBI layout be if it was put\n"
-"                                on this MTD device\n"
-"-M, --map                       print eraseblock map\n"
-"-a, --all                       print information about all MTD devices\n"
-"                                Note: `--all' may give less info per device\n"
-"                                than, e.g., `mtdinfo /dev/mtdX'\n"
-"-h, --help                      print help message\n"
-"-V, --version                   print program version";
-
-static const char usage[] =
-"Usage: " PROGRAM_NAME " <MTD node file path> [--map | -M] [--ubi-info | -u]\n"
-"       " PROGRAM_NAME " --all [--ubi-info | -u]\n"
-"       " PROGRAM_NAME " [--help | --version]\n"
-"\n"
-"Example 1: " PROGRAM_NAME " /dev/mtd0       print information MTD device /dev/mtd0\n"
-"Example 2: " PROGRAM_NAME " /dev/mtd0 -u    print information MTD device /dev/mtd0\n"
-"\t\t\t\t   and include UBI layout information\n"
-"Example 3: " PROGRAM_NAME " -a              print information about all MTD devices\n";
+static void display_help(void)
+{
+	printf(
+		"%1$s version %2$s - a tool to print MTD information.\n"
+		"\n"
+		"Usage: %1$s <MTD node file path> [--map | -M] [--ubi-info | -u]\n"
+		"       %1$s --all [--ubi-info | -u]\n"
+		"       %1$s [--help | --version]\n"
+		"\n"
+		"Options:\n"
+		"-u, --ubi-info                  print what would UBI layout be if it was put\n"
+		"                                on this MTD device\n"
+		"-M, --map                       print eraseblock map\n"
+		"-a, --all                       print information about all MTD devices\n"
+		"                                Note: `--all' may give less info per device\n"
+		"                                than, e.g., `mtdinfo /dev/mtdX'\n"
+		"-h, --help                      print help message\n"
+		"-V, --version                   print program version\n"
+		"\n"
+		"Examples:\n"
+		"  %1$s /dev/mtd0             print information MTD device /dev/mtd0\n"
+		"  %1$s /dev/mtd0 -u          print information MTD device /dev/mtd0\n"
+		"  %4$*3$s                    and include UBI layout information\n"
+		"  %1$s -a                    print information about all MTD devices\n",
+		PROGRAM_NAME, VERSION, (int)strlen(PROGRAM_NAME) + 3, "");
+}
 
 static const struct option long_options[] = {
 	{ .name = "ubi-info",  .has_arg = 0, .flag = NULL, .val = 'u' },
@@ -105,9 +109,7 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'h':
-			printf("%s\n\n", doc);
-			printf("%s\n\n", usage);
-			printf("%s\n", optionsstr);
+			display_help();
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-- 
1.7.0.4

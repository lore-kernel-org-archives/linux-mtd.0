Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ozyy0-0007iV-H5
	for linux-mtd@lists.infradead.org; Sun, 26 Sep 2010 21:41:07 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 1AA131B400E
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 21:41:01 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi-utils: tweak const strings decls
Date: Sun, 26 Sep 2010 17:41:55 -0400
Message-Id: <1285537315-6833-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1285526931-4005-1-git-send-email-vapier@gentoo.org>
References: <1285526931-4005-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Shrink the data size a little by declaring addresses of constant strings
instead of pointers to it.

Also slip in static & const on long_options missing them.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
note: this depends on the program_name cleanup only because it changes
	code in the same area

 ubi-utils/src/mtdinfo.c      |    6 +++---
 ubi-utils/src/ubiattach.c    |    6 +++---
 ubi-utils/src/ubicrc32.c     |    6 +++---
 ubi-utils/src/ubidetach.c    |    6 +++---
 ubi-utils/src/ubiformat.c    |    6 +++---
 ubi-utils/src/ubimkvol.c     |    6 +++---
 ubi-utils/src/ubinfo.c       |    6 +++---
 ubi-utils/src/ubinize.c      |   10 +++++-----
 ubi-utils/src/ubirename.c    |    2 +-
 ubi-utils/src/ubirmvol.c     |    6 +++---
 ubi-utils/src/ubirsvol.c     |    6 +++---
 ubi-utils/src/ubiupdatevol.c |    8 ++++----
 12 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index a2d7547..54a039a 100644
--- a/ubi-utils/src/mtdinfo.c
+++ b/ubi-utils/src/mtdinfo.c
@@ -51,10 +51,10 @@ static struct args args = {
 	.node = NULL,
 };
 
-static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 			 " - a tool to print MTD information.";
 
-static const char *optionsstr =
+static const char optionsstr[] =
 "-m, --mtdn=<MTD device number>  MTD device number to get information about\n"
 "-u, --ubi-info                  print what would UBI layout be if it was put\n"
 "                                on this MTD device\n"
@@ -62,7 +62,7 @@ static const char *optionsstr =
 "-h, --help                      print help message\n"
 "-V, --version                   print program version";
 
-static const char *usage =
+static const char usage[] =
 "Usage 1: " PROGRAM_NAME " [-m <MTD device number>] [-u] [-h] [-V] [--mtdn <MTD device number>]\n"
 "\t\t[--ubi-info] [--help] [--version]\n"
 "Usage 2: " PROGRAM_NAME " <MTD device node file name> [-u] [-h] [-V] [--ubi-info] [--help]\n"
diff --git a/ubi-utils/src/ubiattach.c b/ubi-utils/src/ubiattach.c
index 51a0cfb..d2f191b 100644
--- a/ubi-utils/src/ubiattach.c
+++ b/ubi-utils/src/ubiattach.c
@@ -53,10 +53,10 @@ static struct args args = {
 	.dev = NULL,
 };
 
-static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 			 " - a tool to attach MTD device to UBI.";
 
-static const char *optionsstr =
+static const char optionsstr[] =
 "-d, --devn=<number>   the number to assign to the newly created UBI device\n"
 "                      (assigned automatically if this is not specified)\n"
 "-p, --dev-path=<path> path to MTD device node to attach\n"
@@ -67,7 +67,7 @@ static const char *optionsstr =
 "-h, --help            print help message\n"
 "-V, --version         print program version";
 
-static const char *usage =
+static const char usage[] =
 "Usage: " PROGRAM_NAME " [<UBI control device node file name>]\n"
 "\t[-m <MTD device number>] [-d <UBI device number>] [-p <path to device>]\n"
 "\t[--mtdn=<MTD device number>] [--devn=<UBI device number>]\n"
diff --git a/ubi-utils/src/ubicrc32.c b/ubi-utils/src/ubicrc32.c
index ec10858..a09f053 100644
--- a/ubi-utils/src/ubicrc32.c
+++ b/ubi-utils/src/ubicrc32.c
@@ -37,14 +37,14 @@
 
 #define BUFSIZE 4096
 
-static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 			 " - a tool to calculate CRC32 with UBI start value (0xFFFFFFFF)";
 
-static const char *optionsstr =
+static const char optionsstr[] =
 "-h, --help                    print help message\n"
 "-V, --version                 print program version";
 
-static const char *usage =
+static const char usage[] =
 "Usage: " PROGRAM_NAME " <file to calculate CRC32 for> [-h] [--help]";
 
 static const struct option long_options[] = {
diff --git a/ubi-utils/src/ubidetach.c b/ubi-utils/src/ubidetach.c
index 59e478b..dfd6485 100644
--- a/ubi-utils/src/ubidetach.c
+++ b/ubi-utils/src/ubidetach.c
@@ -50,17 +50,17 @@ static struct args args = {
 	.dev = NULL,
 };
 
-static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 " - tool to remove UBI devices (detach MTD devices from UBI)";
 
-static const char *optionsstr =
+static const char optionsstr[] =
 "-d, --devn=<UBI device number>  UBI device number to delete\n"
 "-p, --dev-path=<path to device> or alternatively, MTD device node path to detach\n"
 "-m, --mtdn=<MTD device number>  or alternatively, MTD device number to detach\n"
 "-h, --help                      print help message\n"
 "-V, --version                   print program version";
 
-static const char *usage =
+static const char usage[] =
 "Usage: " PROGRAM_NAME " [<UBI control device node file name>]\n"
 "\t[-d <UBI device number>] [-m <MTD device number>] [-p <path to device>]\n"
 "\t[--devn=<UBI device number>] [--mtdn=<MTD device number>]\n"
diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 7cea8a9..098da7d 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -72,10 +72,10 @@ static struct args args =
 	.ubi_ver   = 1,
 };
 
-static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 		" - a tool to format MTD devices and flash UBI images";
 
-static const char *optionsstr =
+static const char optionsstr[] =
 "-s, --sub-page-size=<bytes>  minimum input/output unit used for UBI\n"
 "                             headers, e.g. sub-page size in case of NAND\n"
 "                             flash (equivalent to the minimum input/output\n"
@@ -101,7 +101,7 @@ static const char *optionsstr =
 "-h, -?, --help               print help message\n"
 "-V, --version                print program version\n";
 
-static const char *usage =
+static const char usage[] =
 "Usage: " PROGRAM_NAME " <MTD device node file name> [-s <bytes>] [-O <offs>] [-n]\n"
 "\t\t\t[-f <file>] [-S <bytes>] [-e <value>] [-x <num>] [-y] [-q] [-v] [-h] [-v]\n"
 "\t\t\t[--sub-page-size=<bytes>] [--vid-hdr-offset=<offs>] [--no-volume-table]\n"
diff --git a/ubi-utils/src/ubimkvol.c b/ubi-utils/src/ubimkvol.c
index cc8cd55..f6e498f 100644
--- a/ubi-utils/src/ubimkvol.c
+++ b/ubi-utils/src/ubimkvol.c
@@ -56,10 +56,10 @@ static struct args args = {
 	.vol_id = UBI_VOL_NUM_AUTO,
 };
 
-static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 			 " - a tool to create UBI volumes.";
 
-static const char *optionsstr =
+static const char optionsstr[] =
 "-a, --alignment=<alignment>   volume alignment (default is 1)\n"
 "-n, --vol_id=<volume ID>      UBI volume ID, if not specified, the volume ID\n"
 "                              will be assigned automatically\n"
@@ -74,7 +74,7 @@ static const char *optionsstr =
 "-V, --version                 print program version";
 
 
-static const char *usage =
+static const char usage[] =
 "Usage: " PROGRAM_NAME " <UBI device node file name> [-h] [-a <alignment>] [-n <volume ID>] [-N <name>]\n"
 "\t\t\t[-s <bytes>] [-S <LEBs>] [-t <static|dynamic>] [-V] [-m]\n"
 "\t\t\t[--alignment=<alignment>][--vol_id=<volume ID>] [--name=<name>]\n"
diff --git a/ubi-utils/src/ubinfo.c b/ubi-utils/src/ubinfo.c
index 44f6fb0..3171e8a 100644
--- a/ubi-utils/src/ubinfo.c
+++ b/ubi-utils/src/ubinfo.c
@@ -51,10 +51,10 @@ static struct args args = {
 	.vol_name = NULL,
 };
 
-static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 			 " - a tool to print UBI information.";
 
-static const char *optionsstr =
+static const char optionsstr[] =
 "-d, --devn=<UBI device number>  UBI device number to get information about\n"
 "-n, --vol_id=<volume ID>        ID of UBI volume to print information about\n"
 "-N, --name=<volume name>        name of UBI volume to print information about\n"
@@ -64,7 +64,7 @@ static const char *optionsstr =
 "-h, --help                      print help message\n"
 "-V, --version                   print program version";
 
-static const char *usage =
+static const char usage[] =
 "Usage 1: " PROGRAM_NAME " [-d <UBI device number>] [-n <volume ID> | -N <volume name>] [-a] [-h] [-V]\n"
 "\t\t[--vol_id=<volume ID> | --name <volume name>] [--devn <UBI device number>] [--all] [--help] [--version]\n"
 "Usage 2: " PROGRAM_NAME " <UBI device node file name> [-a] [-h] [-V] [--all] [--help] [--version]\n"
diff --git a/ubi-utils/src/ubinize.c b/ubi-utils/src/ubinize.c
index 5cee5aa..4991691 100644
--- a/ubi-utils/src/ubinize.c
+++ b/ubi-utils/src/ubinize.c
@@ -39,7 +39,7 @@
 #include "common.h"
 #include "ubiutils-common.h"
 
-static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 " - a tool to generate UBI images. An UBI image may contain one or more UBI "
 "volumes which have to be defined in the input configuration ini-file. The "
 "ini file defines all the UBI volumes - their characteristics and the and the "
@@ -48,7 +48,7 @@ static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
 "the command-line options. Note, if not sure about some of the command-line "
 "parameters, do not specify them and let the utility to use default values.";
 
-static const char *optionsstr =
+static const char optionsstr[] =
 "-o, --output=<file name>     output file name\n"
 "-p, --peb-size=<bytes>       size of the physical eraseblock of the flash\n"
 "                             this UBI image is created for in bytes,\n"
@@ -74,7 +74,7 @@ static const char *optionsstr =
 "-h, --help                   print help message\n"
 "-V, --version                print program version";
 
-static const char *usage =
+static const char usage[] =
 "Usage: " PROGRAM_NAME " [-o filename] [-p <bytes>] [-m <bytes>] [-s <bytes>] [-O <num>] [-e <num>]\n"
 "\t\t[-x <num>] [-Q <num>] [-v] [-h] [-V] [--output=<filename>] [--peb-size=<bytes>]\n"
 "\t\t[--min-io-size=<bytes>] [--sub-page-size=<bytes>] [--vid-hdr-offset=<num>]\n"
@@ -83,7 +83,7 @@ static const char *usage =
 "Example: " PROGRAM_NAME " -o ubi.img -p 16KiB -m 512 -s 256 cfg.ini - create UBI image\n"
 "         'ubi.img' as described by configuration file 'cfg.ini'";
 
-static const char *ini_doc = "INI-file format.\n"
+static const char ini_doc[] = "INI-file format.\n"
 "The input configuration ini-file describes all the volumes which have to\n"
 "be included to the output UBI image. Each volume is described in its own\n"
 "section which may be named arbitrarily. The section consists on\n"
@@ -116,7 +116,7 @@ static const char *ini_doc = "INI-file format.\n"
 "    put all the volumes which are described by these section to the output\n"
 "    UBI image file.";
 
-struct option long_options[] = {
+static const struct option long_options[] = {
 	{ .name = "output",         .has_arg = 1, .flag = NULL, .val = 'o' },
 	{ .name = "peb-size",       .has_arg = 1, .flag = NULL, .val = 'p' },
 	{ .name = "min-io-size",    .has_arg = 1, .flag = NULL, .val = 'm' },
diff --git a/ubi-utils/src/ubirename.c b/ubi-utils/src/ubirename.c
index 295bfc7..070e32e 100644
--- a/ubi-utils/src/ubirename.c
+++ b/ubi-utils/src/ubirename.c
@@ -33,7 +33,7 @@
 #include <libubi.h>
 #include "common.h"
 
-static const char *usage =
+static const char usage[] =
 "Usage: " PROGRAM_NAME " <UBI device node file name> [<old name> <new name>|...]\n\n"
 "Example: " PROGRAM_NAME "/dev/ubi0 A B C D - rename volume A to B, and C to D\n\n"
 "This utility allows re-naming several volumes in one go atomically.\n"
diff --git a/ubi-utils/src/ubirmvol.c b/ubi-utils/src/ubirmvol.c
index 334bb38..9e55b02 100644
--- a/ubi-utils/src/ubirmvol.c
+++ b/ubi-utils/src/ubirmvol.c
@@ -46,16 +46,16 @@ static struct args args = {
 	.vol_id = -1,
 };
 
-static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 				 " - a tool to remove UBI volumes.";
 
-static const char *optionsstr =
+static const char optionsstr[] =
 "-n, --vol_id=<volume id>   volume ID to remove\n"
 "-N, --name=<volume name>   volume name to remove\n"
 "-h, -?, --help             print help message\n"
 "-V, --version              print program version";
 
-static const char *usage =
+static const char usage[] =
 "Usage: " PROGRAM_NAME " <UBI device node file name> [-n <volume id>] [--vol_id=<volume id>]\n\n"
 "         [-N <volume name>] [--name=<volume name>] [-h] [--help]\n\n"
 "Example: " PROGRAM_NAME "/dev/ubi0 -n 1 - remove UBI volume 1 from UBI device corresponding\n"
diff --git a/ubi-utils/src/ubirsvol.c b/ubi-utils/src/ubirsvol.c
index a622ea6..20a1d33 100644
--- a/ubi-utils/src/ubirsvol.c
+++ b/ubi-utils/src/ubirsvol.c
@@ -51,10 +51,10 @@ static struct args args = {
 	.lebs = -1,
 };
 
-static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 				 " - a tool to resize UBI volumes.";
 
-static const char *optionsstr =
+static const char optionsstr[] =
 "-n, --vol_id=<volume id>   volume ID to resize\n"
 "-N, --name=<volume name>   volume name to resize\n"
 "-s, --size=<bytes>         volume size volume size in bytes, kilobytes (KiB)\n"
@@ -65,7 +65,7 @@ static const char *optionsstr =
 "-V, --version              print program version";
 
 
-static const char *usage =
+static const char usage[] =
 "Usage: " PROGRAM_NAME " <UBI device node file name> [-n <volume id>] [--vol_id=<volume id>]\n\n"
 "         [-N <volume name>] [--name=<volume name>] [-s <bytes>] [-S <LEBs>] [-h] [--help]\n\n"
 "Example: " PROGRAM_NAME " /dev/ubi0 -n 1 -s 1MiB resize UBI volume 1 to 1 MiB on\n"
diff --git a/ubi-utils/src/ubiupdatevol.c b/ubi-utils/src/ubiupdatevol.c
index 4521138..4bf4123 100644
--- a/ubi-utils/src/ubiupdatevol.c
+++ b/ubi-utils/src/ubiupdatevol.c
@@ -52,22 +52,22 @@ struct args {
 
 static struct args args;
 
-static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 			 " - a tool to write data to UBI volumes.";
 
-static const char *optionsstr =
+static const char optionsstr[] =
 "-t, --truncate             truncate volume (wipe it out)\n"
 "-s, --size=<bytes>         bytes in input, if not reading from file\n"
 "-h, --help                 print help message\n"
 "-V, --version              print program version";
 
-static const char *usage =
+static const char usage[] =
 "Usage: " PROGRAM_NAME " <UBI volume node file name> [-t] [-s <size>] [-h] [-V] [--truncate]\n"
 "\t\t\t[--size=<size>] [--help] [--version] <image file>\n\n"
 "Example 1: " PROGRAM_NAME " /dev/ubi0_1 fs.img - write file \"fs.img\" to UBI volume /dev/ubi0_1\n"
 "Example 2: " PROGRAM_NAME " /dev/ubi0_1 -t - wipe out UBI volume /dev/ubi0_1";
 
-struct option long_options[] = {
+static const struct option long_options[] = {
 	{ .name = "truncate", .has_arg = 0, .flag = NULL, .val = 't' },
 	{ .name = "help",     .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",  .has_arg = 0, .flag = NULL, .val = 'V' },
-- 
1.7.2.3

Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTyak-0005tE-Df
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 15:53:19 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 44A196550A
	for <linux-mtd@lists.infradead.org>;
	Tue,  7 Jun 2011 15:53:17 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtdinfo: add regioninfo/eraseblock map display
Date: Tue,  7 Jun 2011 11:53:19 -0400
Message-Id: <1307461999-6483-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307427548-29306-5-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-5-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This brings the mtdinfo utility in line with the functionality
of the flash_info utility.  It dumps the erase regioninfo (if
the devices has it) as well as showing a handy eraseblock map
(if the user has requested it).  The eraseblock map also shows
which blocks are locked and which ones are bad.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- rename sector map to eraseblock map
	- include bad block info in map
	- update libmtd api calls

 ubi-utils/src/mtdinfo.c |   82 ++++++++++++++++++++++++++++++++++++++++++++---
 1 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index 666d739..5572199 100644
--- a/ubi-utils/src/mtdinfo.c
+++ b/ubi-utils/src/mtdinfo.c
@@ -29,6 +29,7 @@
 #include <getopt.h>
 #include <stdlib.h>
 #include <string.h>
+#include <unistd.h>
 #include <mtd/mtd-user.h>
 
 #include <libubigen.h>
@@ -41,6 +42,7 @@ struct args {
 	int mtdn;
 	unsigned int all:1;
 	unsigned int ubinfo:1;
+	unsigned int map:1;
 	const char *node;
 };
 
@@ -59,14 +61,15 @@ static const char optionsstr[] =
 "                                (deprecated option, will be removed, do not use)\n"
 "-u, --ubi-info                  print what would UBI layout be if it was put\n"
 "                                on this MTD device\n"
+"-M, --map                       print eraseblock map\n"
 "-a, --all                       print information about all MTD devices\n"
 "-h, --help                      print help message\n"
 "-V, --version                   print program version";
 
 static const char usage[] =
-"Usage 1: " PROGRAM_NAME " [-m <MTD device number>] [-u] [-h] [-V] [--mtdn <MTD device number>]\n"
+"Usage 1: " PROGRAM_NAME " [-m <MTD device number>] [-u] [-M] [-h] [-V] [--mtdn <MTD device number>]\n"
 "\t\t[--ubi-info] [--help] [--version]\n"
-"Usage 2: " PROGRAM_NAME " <MTD device node file name> [-u] [-h] [-V] [--ubi-info] [--help]\n"
+"Usage 2: " PROGRAM_NAME " <MTD device node file name> [-u] [-M] [-h] [-V] [--ubi-info] [--help]\n"
 "\t\t[--version]\n"
 "Example 1: " PROGRAM_NAME " - (no arguments) print general MTD information\n"
 "Example 2: " PROGRAM_NAME " -m 1 - print information about MTD device number 1\n"
@@ -79,6 +82,7 @@ static const char usage[] =
 static const struct option long_options[] = {
 	{ .name = "mtdn",      .has_arg = 1, .flag = NULL, .val = 'm' },
 	{ .name = "ubi-info",  .has_arg = 0, .flag = NULL, .val = 'u' },
+	{ .name = "map",       .has_arg = 0, .flag = NULL, .val = 'M' },
 	{ .name = "all",       .has_arg = 0, .flag = NULL, .val = 'a' },
 	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
@@ -90,7 +94,7 @@ static int parse_opt(int argc, char * const argv[])
 	while (1) {
 		int key, error = 0;
 
-		key = getopt_long(argc, argv, "am:uhV", long_options, NULL);
+		key = getopt_long(argc, argv, "am:uMhV", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -110,6 +114,10 @@ static int parse_opt(int argc, char * const argv[])
 			warnmsg("-m/--mtdn is depecated, will be removed in mtd-utils-1.4.6");
 			break;
 
+		case 'M':
+			args.map = 1;
+			break;
+
 		case 'h':
 			printf("%s\n\n", doc);
 			printf("%s\n\n", usage);
@@ -160,9 +168,40 @@ static int translate_dev(libmtd_t libmtd, const char *node)
 	return 0;
 }
 
+static void print_map(libmtd_t libmtd, const struct mtd_dev_info *mtd,
+		      int fd, const region_info_t *reginfo)
+{
+	unsigned long start;
+	int i, width;
+
+	printf("Eraseblock map:\n");
+
+	/* figure out the number of spaces to pad w/out libm */
+	for (i = 1, width = 0; i < reginfo->numblocks; i *= 10, ++width)
+		continue;
+
+	for (i = 0; i < reginfo->numblocks; ++i) {
+		start = reginfo->offset + i * reginfo->erasesize;
+		printf(" %*i: %08lx ", width, i, start);
+		if (mtd_is_locked(libmtd, mtd, fd, i) == 1)
+			printf("RO ");
+		else
+			printf("   ");
+		if (mtd_is_bad(mtd, fd, i) == 1)
+			printf("BAD ");
+		else
+			printf("    ");
+		if (((i + 1) % 4) == 0)
+			printf("\n");
+	}
+	if (i % 4)
+		printf("\n");
+}
+
 static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int mtdn)
 {
-	int err;
+	int err, fd = -1;
+	region_info_t reginfo;
 	struct mtd_dev_info mtd;
 	struct ubigen_info ui;
 
@@ -196,8 +235,26 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
 	if (mtd.oob_size > 0)
 		printf("OOB size:                       %d bytes\n",
 		       mtd.oob_size);
-	if (mtd.region_cnt > 0)
+	if (mtd.region_cnt > 0) {
 		printf("Additional erase regions:       %d\n", mtd.oob_size);
+		if (args.node)
+			fd = open(args.node, O_RDONLY | O_CLOEXEC);
+		if (fd != -1) {
+			int r;
+
+			for (r = 0; r < mtd.region_cnt; ++r) {
+				printf(" region %i: ", r);
+				if (mtd_regioninfo(fd, r, &reginfo) == 0) {
+					printf(" offset: %#x size: %#x numblocks: %#x\n",
+						reginfo.offset, reginfo.erasesize,
+						reginfo.numblocks);
+					if (args.map)
+						print_map(libmtd, &mtd, fd, &reginfo);
+				} else
+					printf(" info is unavailable\n");
+			}
+		}
+	}
 	if (mtd_info->sysfs_supported)
 		printf("Character device major/minor:   %d:%d\n",
 		       mtd.major, mtd.minor);
@@ -225,6 +282,21 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
 	printf("Maximum UBI volumes count:      %d\n", ui.max_volumes);
 
 out:
+	if (args.map && mtd.region_cnt == 0 && args.node) {
+		if (fd == -1)
+			fd = open(args.node, O_RDONLY | O_CLOEXEC);
+		if (fd != -1) {
+			reginfo.offset = 0;
+			reginfo.erasesize = mtd.eb_size;
+			reginfo.numblocks = mtd.eb_cnt;
+			reginfo.regionindex = 0;
+			print_map(libmtd, &mtd, fd, &reginfo);
+		}
+	}
+
+	if (fd != -1)
+		close(fd);
+
 	printf("\n");
 	return 0;
 }
-- 
1.7.5.3

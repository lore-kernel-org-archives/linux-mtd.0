Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTpdA-0002TG-LC
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 06:19:13 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 0FA551B401E
	for <linux-mtd@lists.infradead.org>;
	Tue,  7 Jun 2011 06:19:10 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] mtdinfo: add regioninfo/sectormap display
Date: Tue,  7 Jun 2011 02:19:07 -0400
Message-Id: <1307427548-29306-5-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
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
the devices has it) as well as showing a handy sector map (if
the user has requested it).  The sector map also utilizes the
MEMISLOCKED ioctl in order to show which sectors exactly are
locked.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 ubi-utils/src/mtdinfo.c |   75 +++++++++++++++++++++++++++++++++++++++++++---
 1 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index f20fe49..3dab27a 100644
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
+	unsigned int sectormap:1;
 	const char *node;
 };
 
@@ -58,14 +60,15 @@ static const char optionsstr[] =
 "-m, --mtdn=<MTD device number>  MTD device number to get information about\n"
 "-u, --ubi-info                  print what would UBI layout be if it was put\n"
 "                                on this MTD device\n"
+"-s, --sector-map                print sector map\n"
 "-a, --all                       print information about all MTD devices\n"
 "-h, --help                      print help message\n"
 "-V, --version                   print program version";
 
 static const char usage[] =
-"Usage 1: " PROGRAM_NAME " [-m <MTD device number>] [-u] [-h] [-V] [--mtdn <MTD device number>]\n"
+"Usage 1: " PROGRAM_NAME " [-m <MTD device number>] [-u] [-s] [-h] [-V] [--mtdn <MTD device number>]\n"
 "\t\t[--ubi-info] [--help] [--version]\n"
-"Usage 2: " PROGRAM_NAME " <MTD device node file name> [-u] [-h] [-V] [--ubi-info] [--help]\n"
+"Usage 2: " PROGRAM_NAME " <MTD device node file name> [-u] [-s] [-h] [-V] [--ubi-info] [--help]\n"
 "\t\t[--version]\n"
 "Example 1: " PROGRAM_NAME " - (no arguments) print general MTD information\n"
 "Example 2: " PROGRAM_NAME " -m 1 - print information about MTD device number 1\n"
@@ -78,6 +81,7 @@ static const char usage[] =
 static const struct option long_options[] = {
 	{ .name = "mtdn",      .has_arg = 1, .flag = NULL, .val = 'm' },
 	{ .name = "ubi-info",  .has_arg = 0, .flag = NULL, .val = 'u' },
+	{ .name = "sector-map",.has_arg = 0, .flag = NULL, .val = 's' },
 	{ .name = "all",       .has_arg = 0, .flag = NULL, .val = 'a' },
 	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
@@ -89,7 +93,7 @@ static int parse_opt(int argc, char * const argv[])
 	while (1) {
 		int key, error = 0;
 
-		key = getopt_long(argc, argv, "am:uhV", long_options, NULL);
+		key = getopt_long(argc, argv, "am:ushV", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -109,6 +113,10 @@ static int parse_opt(int argc, char * const argv[])
 
 			break;
 
+		case 's':
+			args.sectormap = 1;
+			break;
+
 		case 'h':
 			printf("%s\n\n", doc);
 			printf("%s\n\n", usage);
@@ -159,9 +167,36 @@ static int translate_dev(libmtd_t libmtd, const char *node)
 	return 0;
 }
 
+static void print_sector_map(const struct mtd_dev_info *mtd, int fd,
+			     const region_info_t *reginfo)
+{
+	unsigned long start;
+	int i, width;
+
+	printf("Sector map:\n");
+
+	/* figure out the number of spaces to pad w/out libm */
+	for (i = 1, width = 0; i < reginfo->numblocks; i *= 10, ++width)
+		continue;
+
+	for (i = 0; i < reginfo->numblocks; ++i) {
+		start = reginfo->offset + i * reginfo->erasesize;
+		printf(" %*i: %08lx ", width, i, start);
+		if (mtd_islocked(mtd, fd, i) == 1)
+			printf("RO ");
+		else
+			printf("   ");
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
 
@@ -195,8 +230,25 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
 	if (mtd.oob_size > 0)
 		printf("OOB size:                       %d bytes\n",
 		       mtd.oob_size);
-	if (mtd.region_cnt > 0)
+	if (mtd.region_cnt > 0) {
 		printf("Additional erase regions:       %d\n", mtd.oob_size);
+		fd = mtd_open_dev1(mtdn);
+		if (fd != -1) {
+			int r;
+
+			for (r = 0; r < mtd.region_cnt; ++r) {
+				printf(" region %i: ", r);
+				if (mtd_regioninfo(fd, r, &reginfo) == 0) {
+					printf(" offset: %#x size: %#x numblocks: %#x\n",
+						reginfo.offset, reginfo.erasesize,
+						reginfo.numblocks);
+					if (args.sectormap)
+						print_sector_map(&mtd, fd, &reginfo);
+				} else
+					printf(" info is unavailable\n");
+			}
+		}
+	}
 	if (mtd_info->sysfs_supported)
 		printf("Character device major/minor:   %d:%d\n",
 		       mtd.major, mtd.minor);
@@ -224,6 +276,19 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
 	printf("Maximum UBI volumes count:      %d\n", ui.max_volumes);
 
 out:
+	if (args.sectormap && mtd.region_cnt == 0) {
+		if (fd == -1)
+			fd = mtd_open_dev1(mtdn);
+		reginfo.offset = 0;
+		reginfo.erasesize = mtd.eb_size;
+		reginfo.numblocks = mtd.eb_cnt;
+		reginfo.regionindex = 0;
+		print_sector_map(&mtd, fd, &reginfo);
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

Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUOA7-0002kN-Cd
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 19:11:32 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id D83A8669D8
	for <linux-mtd@lists.infradead.org>;
	Wed,  8 Jun 2011 19:11:29 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4] mtdinfo: add regioninfo/eraseblock map display
Date: Wed,  8 Jun 2011 15:11:32 -0400
Message-Id: <1307560292-29595-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307559742-29134-1-git-send-email-vapier@gentoo.org>
References: <1307559742-29134-1-git-send-email-vapier@gentoo.org>
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
v4
	- still show region info when map isn't requested

 ubi-utils/src/mtdinfo.c |  122 +++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 119 insertions(+), 3 deletions(-)

diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index 38b63ca..e4b9f70 100644
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
@@ -139,6 +147,9 @@ static int parse_opt(int argc, char * const argv[])
 		args.node = NULL;
 	}
 
+	if (args.map && !args.node)
+		return errmsg("-M requires MTD device node name");
+
 	return 0;
 }
 
@@ -181,6 +192,109 @@ static void print_ubi_info(const struct mtd_info *mtd_info,
 	printf("Maximum UBI volumes count:      %d\n", ui.max_volumes);
 }
 
+static void print_region_map(const struct mtd_dev_info *mtd, int fd,
+			     const region_info_t *reginfo)
+{
+	unsigned long start;
+	int i, width;
+	int ret_locked, errno_locked, ret_bad, errno_bad;
+
+	printf("Eraseblock map:\n");
+
+	/* figure out the number of spaces to pad w/out libm */
+	for (i = 1, width = 0; i < reginfo->numblocks; i *= 10, ++width)
+		continue;
+
+	/* if we don't have a fd to query, just show the bare map */
+	if (fd == -1) {
+		ret_locked = ret_bad = -1;
+		errno_locked = errno_bad = ENODEV;
+	} else
+		ret_locked = ret_bad = errno_locked = errno_bad = 0;
+
+	for (i = 0; i < reginfo->numblocks; ++i) {
+		start = reginfo->offset + i * reginfo->erasesize;
+		printf(" %*i: %08lx ", width, i, start);
+
+		if (ret_locked != -1) {
+			ret_locked = mtd_is_locked(mtd, fd, i);
+			if (ret_locked == 1)
+				printf("RO ");
+			else
+				errno_locked = errno;
+		}
+		if (ret_locked != 1)
+			printf("   ");
+
+		if (ret_bad != -1) {
+			ret_bad = mtd_is_bad(mtd, fd, i);
+			if (ret_bad == 1)
+				printf("BAD ");
+			else
+				errno_bad = errno;
+		}
+		if (ret_bad != 1)
+			printf("    ");
+
+		if (((i + 1) % 4) == 0)
+			printf("\n");
+	}
+	if (i % 4)
+		printf("\n");
+
+	if (ret_locked == -1 && errno_locked != EOPNOTSUPP) {
+		errno = errno_locked;
+		sys_errmsg("could not read locked block info");
+	}
+
+	if (mtd->bb_allowed && ret_bad == -1 && errno_bad != EOPNOTSUPP) {
+		errno = errno_bad;
+		sys_errmsg("could not read bad block info");
+	}
+}
+
+static void print_region_info(const struct mtd_dev_info *mtd)
+{
+	region_info_t reginfo;
+	int r, fd;
+
+	/* If we don't have any region info, just return */
+	if (!args.map && mtd->region_cnt == 0)
+		return;
+
+	/* First open the device so we can query it */
+	fd = open(args.node, O_RDONLY | O_CLOEXEC);
+	if (fd == -1) {
+		sys_errmsg("couldn't open MTD dev: %s", args.node);
+		if (mtd->region_cnt)
+			return;
+	}
+
+	/* Walk all the regions and show the map for them */
+	if (mtd->region_cnt) {
+		for (r = 0; r < mtd->region_cnt; ++r) {
+			printf("Eraseblock region %i: ", r);
+			if (mtd_regioninfo(fd, r, &reginfo) == 0) {
+				printf(" offset: %#x size: %#x numblocks: %#x\n",
+					reginfo.offset, reginfo.erasesize,
+					reginfo.numblocks);
+				if (args.map)
+					print_region_map(mtd, fd, &reginfo);
+			} else
+				printf(" info is unavailable\n");
+		}
+	} else {
+		reginfo.offset = 0;
+		reginfo.erasesize = mtd->eb_size;
+		reginfo.numblocks = mtd->eb_cnt;
+		reginfo.regionindex = 0;
+		print_region_map(mtd, fd, &reginfo);
+	}
+
+	if (fd != -1)
+		close(fd);
+}
+
 static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int mtdn)
 {
 	int err;
@@ -229,6 +343,8 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
 	if (args.ubinfo)
 		print_ubi_info(mtd_info, &mtd);
 
+	print_region_info(&mtd);
+
 	printf("\n");
 	return 0;
 }
-- 
1.7.5.3

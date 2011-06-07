Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTpdB-0002Ta-Il
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 06:19:14 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 7A2451B400C
	for <linux-mtd@lists.infradead.org>;
	Tue,  7 Jun 2011 06:19:12 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/6] flash_info: punt in favor of mtdinfo
Date: Tue,  7 Jun 2011 02:19:08 -0400
Message-Id: <1307427548-29306-6-git-send-email-vapier@gentoo.org>
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

Now that the mtdinfo utility can do everything that flash_info
could do (and better), punt it.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile     |    2 +-
 flash_info.c |  141 ----------------------------------------------------------
 2 files changed, 1 insertions(+), 142 deletions(-)
 delete mode 100644 flash_info.c

diff --git a/Makefile b/Makefile
index 8bdba8e..0c8eb9f 100644
--- a/Makefile
+++ b/Makefile
@@ -16,7 +16,7 @@ SUBDIRS = lib ubi-utils mkfs.ubifs
 TESTS = tests
 
 TARGETS = ftl_format flash_erase nanddump doc_loadbios \
-	ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \
+	ftl_check mkfs.jffs2 flash_lock flash_unlock \
 	flash_otp_info flash_otp_dump mtd_debug flashcp nandwrite nandtest \
 	jffs2dump \
 	nftldump nftl_format docfdisk \
diff --git a/flash_info.c b/flash_info.c
deleted file mode 100644
index 0e056f3..0000000
--- a/flash_info.c
+++ /dev/null
@@ -1,141 +0,0 @@
-/*
- * flash_info.c -- print info about a MTD device
- */
-
-#define PROGRAM_NAME "flash_info"
-
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <fcntl.h>
-#include <time.h>
-#include <sys/ioctl.h>
-#include <sys/mount.h>
-
-#include "common.h"
-#include <mtd/mtd-user.h>
-
-static void usage(int status)
-{
-	fprintf(status ? stderr : stdout,
-		"Usage: %s <device> [devices]\n",
-		PROGRAM_NAME);
-	exit(status);
-}
-
-#define T(t) [MTD_##t] = #t
-static const char * const mtdtypes[] = {
-	T(ABSENT),
-	T(RAM),
-	T(ABSENT),
-	T(RAM),
-	T(ROM),
-	T(NORFLASH),
-	T(NANDFLASH),
-	T(DATAFLASH),
-	T(UBIVOLUME),
-};
-static const char *mtdtype(int type)
-{
-	if (type < ARRAY_SIZE(mtdtypes) && mtdtypes[type])
-		return mtdtypes[type];
-	return "UNKNOWN";
-}
-
-/* Show a pretty map of all the sectors on this device */
-static void show_sector_map(int fd, const region_info_t *reginfo)
-{
-	erase_info_t einfo;
-	int i, width;
-
-	printf(" sector map:\n");
-
-	einfo.length = reginfo->erasesize;
-	/* figure out the number of spaces to pad w/out libm */
-	for (i = 1, width = 0; i < reginfo->numblocks; i *= 10, ++width)
-		continue;
-
-	for (i = 0; i < reginfo->numblocks; ++i) {
-		einfo.start = reginfo->offset + i * reginfo->erasesize;
-		printf(" %*i: %08x ", width, i, einfo.start);
-		if (ioctl(fd, MEMISLOCKED, &einfo))
-			printf("RO ");
-		else
-			printf("   ");
-		if (((i + 1) % 4) == 0)
-			printf("\n");
-	}
-	if (i % 4)
-		printf("\n");
-}
-
-int main(int argc, char *argv[])
-{
-	int fd, i, regcount;
-
-	if (argc < 2)
-		usage(1);
-	if (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help"))
-		usage(0);
-
-	for (i = 1; i < argc; ++i) {
-		const char *dev = argv[i];
-		int r;
-		region_info_t reginfo;
-		mtd_info_t mtdinfo;
-
-		/* Open and size the device */
-		fd = open(dev, O_RDONLY);
-		if (fd < 0) {
-			sys_errmsg("could not open: %s", dev);
-			continue;
-		}
-
-		/* Print out general device info first */
-		if (ioctl(fd, MEMGETINFO, &mtdinfo)) {
-			sys_errmsg("could not get mtd info: %s", dev);
-			continue;
-		}
-
-		printf("%s: type: %i (%s)\n flags: %#x ( ",
-			dev, mtdinfo.type, mtdtype(mtdinfo.type), mtdinfo.flags);
-		if (mtdinfo.flags & MTD_POWERUP_LOCK)
-			printf("powerup_lock ");
-		if (mtdinfo.flags & MTD_NO_ERASE)
-			printf("no_erase ");
-		if (mtdinfo.flags & MTD_BIT_WRITEABLE)
-			printf("bit_writeable ");
-		if (mtdinfo.flags & MTD_WRITEABLE)
-			printf("writeable ");
-		printf(")\n sizes: total %#x write %#x erase %#x oob %#x\n",
-			mtdinfo.size, mtdinfo.writesize,
-			mtdinfo.erasesize, mtdinfo.oobsize);
-
-		/* Print out the region info (if the device has any) */
-		if (ioctl(fd, MEMGETREGIONCOUNT, &regcount) == 0) {
-			printf(" erase regions: %i\n", regcount);
-			for (r = 0; r < regcount; ++r) {
-				reginfo.regionindex = r;
-				if (ioctl(fd, MEMGETREGIONINFO, &reginfo) == 0) {
-					printf(" region %i: offset: %#x size: %#x numblocks: %#x\n",
-						r, reginfo.offset, reginfo.erasesize,
-						reginfo.numblocks);
-					show_sector_map(fd, &reginfo);
-				} else
-					warnmsg(" region %i: can not read region info!?", r);
-			}
-		} else
-			regcount = 0;
-
-		/* If the flash has no regions, then show the whole thing */
-		if (regcount == 0) {
-			reginfo.offset = 0;
-			reginfo.erasesize = mtdinfo.erasesize;
-			reginfo.numblocks = mtdinfo.size / mtdinfo.erasesize,
-			reginfo.regionindex = 0;
-			show_sector_map(fd, &reginfo);
-		}
-	}
-
-	return 0;
-}
-- 
1.7.5.3

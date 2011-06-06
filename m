Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTeRP-0003yi-Al
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 18:22:21 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id C1B2B1B4015
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Jun 2011 18:22:16 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] flash_info: display MEMGETINFO and MEMISLOCKED
Date: Mon,  6 Jun 2011 14:22:17 -0400
Message-Id: <1307384537-9607-4-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
References: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found the existing flash_info output to be a little lacking, so
add decoders for MEMGETINFO and MEMISLOCKED.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 flash_info.c |   98 +++++++++++++++++++++++++++++++++++++++++++++++++++------
 1 files changed, 87 insertions(+), 11 deletions(-)

diff --git a/flash_info.c b/flash_info.c
index 6c518b2..0e056f3 100644
--- a/flash_info.c
+++ b/flash_info.c
@@ -23,6 +23,52 @@ static void usage(int status)
 	exit(status);
 }
 
+#define T(t) [MTD_##t] = #t
+static const char * const mtdtypes[] = {
+	T(ABSENT),
+	T(RAM),
+	T(ABSENT),
+	T(RAM),
+	T(ROM),
+	T(NORFLASH),
+	T(NANDFLASH),
+	T(DATAFLASH),
+	T(UBIVOLUME),
+};
+static const char *mtdtype(int type)
+{
+	if (type < ARRAY_SIZE(mtdtypes) && mtdtypes[type])
+		return mtdtypes[type];
+	return "UNKNOWN";
+}
+
+/* Show a pretty map of all the sectors on this device */
+static void show_sector_map(int fd, const region_info_t *reginfo)
+{
+	erase_info_t einfo;
+	int i, width;
+
+	printf(" sector map:\n");
+
+	einfo.length = reginfo->erasesize;
+	/* figure out the number of spaces to pad w/out libm */
+	for (i = 1, width = 0; i < reginfo->numblocks; i *= 10, ++width)
+		continue;
+
+	for (i = 0; i < reginfo->numblocks; ++i) {
+		einfo.start = reginfo->offset + i * reginfo->erasesize;
+		printf(" %*i: %08x ", width, i, einfo.start);
+		if (ioctl(fd, MEMISLOCKED, &einfo))
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
 int main(int argc, char *argv[])
 {
 	int fd, i, regcount;
@@ -36,6 +82,7 @@ int main(int argc, char *argv[])
 		const char *dev = argv[i];
 		int r;
 		region_info_t reginfo;
+		mtd_info_t mtdinfo;
 
 		/* Open and size the device */
 		fd = open(dev, O_RDONLY);
@@ -44,20 +91,49 @@ int main(int argc, char *argv[])
 			continue;
 		}
 
-		if (ioctl(fd, MEMGETREGIONCOUNT, &regcount))
+		/* Print out general device info first */
+		if (ioctl(fd, MEMGETINFO, &mtdinfo)) {
+			sys_errmsg("could not get mtd info: %s", dev);
 			continue;
+		}
+
+		printf("%s: type: %i (%s)\n flags: %#x ( ",
+			dev, mtdinfo.type, mtdtype(mtdinfo.type), mtdinfo.flags);
+		if (mtdinfo.flags & MTD_POWERUP_LOCK)
+			printf("powerup_lock ");
+		if (mtdinfo.flags & MTD_NO_ERASE)
+			printf("no_erase ");
+		if (mtdinfo.flags & MTD_BIT_WRITEABLE)
+			printf("bit_writeable ");
+		if (mtdinfo.flags & MTD_WRITEABLE)
+			printf("writeable ");
+		printf(")\n sizes: total %#x write %#x erase %#x oob %#x\n",
+			mtdinfo.size, mtdinfo.writesize,
+			mtdinfo.erasesize, mtdinfo.oobsize);
 
-		printf("%s: %d erase regions\n", dev, regcount);
-		for (r = 0; r < regcount; ++r) {
-			reginfo.regionindex = r;
-			if (ioctl(fd, MEMGETREGIONINFO, &reginfo) == 0) {
-				printf("Region %d is at 0x%x with size 0x%x and "
-						"has 0x%x blocks\n", r, reginfo.offset,
-						reginfo.erasesize, reginfo.numblocks);
-			} else {
-				warnmsg("can not read region %d from a %d region device",
-					r, regcount);
+		/* Print out the region info (if the device has any) */
+		if (ioctl(fd, MEMGETREGIONCOUNT, &regcount) == 0) {
+			printf(" erase regions: %i\n", regcount);
+			for (r = 0; r < regcount; ++r) {
+				reginfo.regionindex = r;
+				if (ioctl(fd, MEMGETREGIONINFO, &reginfo) == 0) {
+					printf(" region %i: offset: %#x size: %#x numblocks: %#x\n",
+						r, reginfo.offset, reginfo.erasesize,
+						reginfo.numblocks);
+					show_sector_map(fd, &reginfo);
+				} else
+					warnmsg(" region %i: can not read region info!?", r);
 			}
+		} else
+			regcount = 0;
+
+		/* If the flash has no regions, then show the whole thing */
+		if (regcount == 0) {
+			reginfo.offset = 0;
+			reginfo.erasesize = mtdinfo.erasesize;
+			reginfo.numblocks = mtdinfo.size / mtdinfo.erasesize,
+			reginfo.regionindex = 0;
+			show_sector_map(fd, &reginfo);
 		}
 	}
 
-- 
1.7.5.3

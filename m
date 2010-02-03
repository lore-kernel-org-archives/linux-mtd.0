Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcX1r-0005xw-0V
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 04:39:55 +0000
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id o134doZC029360
	for <linux-mtd@lists.infradead.org>;
	Tue, 2 Feb 2010 20:39:50 -0800 (PST)
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] Place the cleanmarker in OOB area according to the mode
	MTD_OOB_AUTO
Date: Wed,  3 Feb 2010 12:45:54 +0800
Message-Id: <1265172354-26682-6-git-send-email-stanley.miao@windriver.com>
In-Reply-To: <1265172354-26682-5-git-send-email-stanley.miao@windriver.com>
References: <1265172354-26682-1-git-send-email-stanley.miao@windriver.com>
	<1265172354-26682-2-git-send-email-stanley.miao@windriver.com>
	<1265172354-26682-3-git-send-email-stanley.miao@windriver.com>
	<1265172354-26682-4-git-send-email-stanley.miao@windriver.com>
	<1265172354-26682-5-git-send-email-stanley.miao@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the current linux kernel, Jffs2 writes the cleanmarker according to the
mode MTD_OOB_AUTO, so modify the layout of the cleanmarker from
MTD_OOB_PLACE to MTD_OOB_AUTO in flash_eraseall.

Signed-off-by: Stanley.Miao <stanley.miao@windriver.com>
---
 flash_eraseall.c |   38 ++++++++++++++++++++------------------
 1 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index 1842906..d2d0bcb 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -34,7 +34,7 @@
 #include <time.h>
 #include <getopt.h>
 #include <sys/ioctl.h>
-#include <sys/mount.h>
+#include <sys/param.h>
 #include "crc32.h"
 
 #include <mtd/mtd-user.h>
@@ -58,9 +58,11 @@ int target_endian = __BYTE_ORDER;
 int main (int argc, char *argv[])
 {
 	mtd_info_t meminfo;
-	int fd, clmpos = 0, clmlen = 8;
+	int fd;
 	erase_info_t erase;
 	int isNAND, bbtest = 1;
+	unsigned char oobbuf[128];
+	memset(oobbuf, 0xFF, 128);
 
 	process_options(argc, argv);
 
@@ -81,29 +83,29 @@ int main (int argc, char *argv[])
 	if (jffs2) {
 		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
 		cleanmarker.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
-		if (!isNAND)
+		if (!isNAND) {
 			cleanmarker.totlen = cpu_to_je32 (sizeof (struct jffs2_unknown_node));
-		else {
+			cleanmarker.hdr_crc = cpu_to_je32(crc32(0, &cleanmarker,  sizeof(struct jffs2_unknown_node) - 4));
+		} else {
+			int already_read, num, i, start;
 			struct nand_ecclayout ecclayout;
 
+			cleanmarker.totlen = cpu_to_je32(8);
+			cleanmarker.hdr_crc = cpu_to_je32(crc32(0, &cleanmarker,  sizeof(struct jffs2_unknown_node) - 4));
+
 			if (ioctl(fd, ECCGETLAYOUT, &ecclayout) != 0) {
 				fprintf(stderr,	"%s: %s: unable to get NAND oob layout\n",
 						exe_name, mtd_device);
 				return 1;
 			}
-
-			/* Get the position of the free bytes */
-			if (!ecclayout.oobfree[0].length) {
-				fprintf(stderr, " Eeep. Autoplacement selected and no empty space in oob\n");
-				return 1;
+			already_read = 0;
+			for (i = 0; (already_read < 8) && ecclayout.oobfree[i].length; i++) {
+				num = MIN(8 - already_read, ecclayout.oobfree[i].length);
+				start = ecclayout.oobfree[i].offset;
+				memcpy(oobbuf + start, (unsigned char *)&cleanmarker + already_read, num);
+				already_read += num;
 			}
-			clmpos = ecclayout.oobfree[0].offset;
-			clmlen = ecclayout.oobfree[0].length;
-			if (clmlen > 8)
-				clmlen = 8;
-			cleanmarker.totlen = cpu_to_je32(8);
 		}
-		cleanmarker.hdr_crc =  cpu_to_je32 (crc32 (0, &cleanmarker,  sizeof (struct jffs2_unknown_node) - 4));
 	}
 
 	for (erase.start = 0; erase.start < meminfo.size; erase.start += meminfo.erasesize) {
@@ -143,9 +145,9 @@ int main (int argc, char *argv[])
 		/* write cleanmarker */
 		if (isNAND) {
 			struct mtd_oob_buf oob;
-			oob.ptr = (unsigned char *) &cleanmarker;
-			oob.start = erase.start + clmpos;
-			oob.length = clmlen;
+			oob.ptr = oobbuf;
+			oob.start = erase.start;
+			oob.length = meminfo.oobsize;
 			if (ioctl (fd, MEMWRITEOOB, &oob) != 0) {
 				fprintf(stderr, "\n%s: %s: MTD writeoob failure: %s\n", exe_name, mtd_device, strerror(errno));
 				continue;
-- 
1.5.4.3

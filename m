Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OQJMF-00084K-Lh
	for linux-mtd@lists.infradead.org; Sun, 20 Jun 2010 12:10:40 +0000
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv3 3/3] Place the cleanmarker in OOB area according to the mode
	MTD_OOB_AUTO
Date: Sun, 20 Jun 2010 20:23:00 +0800
Message-Id: <1277036580-3501-4-git-send-email-stanley.miao@windriver.com>
In-Reply-To: <1277036580-3501-3-git-send-email-stanley.miao@windriver.com>
References: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
	<1277036580-3501-2-git-send-email-stanley.miao@windriver.com>
	<1277036580-3501-3-git-send-email-stanley.miao@windriver.com>
Cc: Artem.Bityutskiy@nokia.com, joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The jffs2 filesystem writes the cleanmarker according to the mode
MTD_OOB_AUTO, so flash_eraseall should arrange the layout of the
cleanmarker according to the mode MTD_OOB_AUTO too.

Signed-off-by: Stanley.Miao <stanley.miao@windriver.com>
---
 flash_eraseall.c |   40 ++++++++++++++++++++++------------------
 1 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index b8068c0..374edd7 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -34,7 +34,7 @@
 #include <time.h>
 #include <getopt.h>
 #include <sys/ioctl.h>
-#include <sys/mount.h>
+#include <sys/param.h>
 #include <sys/utsname.h>
 #include "crc32.h"
 
@@ -83,9 +83,11 @@ static int get_linux_version(void)
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
 
@@ -106,11 +108,18 @@ int main (int argc, char *argv[])
 	if (jffs2) {
 		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
 		cleanmarker.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
-		if (!isNAND)
+		if (!isNAND) {
 			cleanmarker.totlen = cpu_to_je32 (sizeof (struct jffs2_unknown_node));
-		else {
+			cleanmarker.hdr_crc = cpu_to_je32(crc32(0, &cleanmarker, \
+						sizeof(struct jffs2_unknown_node) - 4));
+		} else {
+			int already_read, num, i, start;
 			struct nand_ecclayout ecclayout;
 
+			cleanmarker.totlen = cpu_to_je32(8);
+			cleanmarker.hdr_crc = cpu_to_je32(crc32(0, &cleanmarker, \
+						sizeof(struct jffs2_unknown_node) - 4));
+
 			memset(&ecclayout, 0, sizeof(ecclayout));
 			if (get_linux_version() > LINUX_VERSION(2, 6, 17)) {
 				if (ioctl(fd, ECCGETLAYOUT, &ecclayout) != 0) {
@@ -130,19 +139,14 @@ int main (int argc, char *argv[])
 				memcpy(&ecclayout.oobfree, &oi.oobfree, sizeof(oi.oobfree));
 				ecclayout.eccbytes = oi.eccbytes;
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
@@ -182,9 +186,9 @@ int main (int argc, char *argv[])
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

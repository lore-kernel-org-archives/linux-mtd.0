Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ON0TV-0004cb-T0
	for linux-mtd@lists.infradead.org; Fri, 11 Jun 2010 09:24:30 +0000
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: Artem.Bityutskiy@nokia.com
Subject: [PATCH 2/3] Discard the legacy interface MEMGETOOBSEL in
	flash_eraseall
Date: Fri, 11 Jun 2010 17:36:14 +0800
Message-Id: <1276248975-1822-3-git-send-email-stanley.miao@windriver.com>
In-Reply-To: <1276248975-1822-2-git-send-email-stanley.miao@windriver.com>
References: <1276248975-1822-1-git-send-email-stanley.miao@windriver.com>
	<1276248975-1822-2-git-send-email-stanley.miao@windriver.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The "struct nand_oobinfo" is able to record only 32 ECC code positions,which
is not enough for many big NAND chips. Therefore, this structure is replaced
by "struct nand_ecclayout" in linux kernel from the version 2.6.17.
Consequently, the ioctl command changed from MEMGETOOBSEL to ECCGETLAYOUT.

Now update flash_eraseall to use the new ioctl command ECCGETLAYOUT. In order
to keep compatible with the old linux kernel, a linux version detection
function is added.

Signed-off-by: Stanley.Miao <stanley.miao@windriver.com>
---
 flash_eraseall.c |   71 ++++++++++++++++++++++++++++++++----------------------
 1 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index a22fc49..4e2108b 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -43,6 +43,8 @@
 #define PROGRAM "flash_eraseall"
 #define VERSION "$Revision: 1.22 $"
 
+#define LINUX_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))
+
 static const char *exe_name;
 static const char *mtd_device;
 static int quiet;		/* true -- don't output progress */
@@ -55,6 +57,21 @@ static void display_version (void);
 static struct jffs2_unknown_node cleanmarker;
 int target_endian = __BYTE_ORDER;
 
+static int get_linux_version(void)
+{
+	FILE *fd;
+	int a = 0, b = 0, c = 0;
+	
+	fd = fopen("/proc/version", "r");
+	if (fd) {
+		fscanf(fd, "Linux version %d.%d.%d", &a, &b, &c);
+		fclose(fd);
+	}
+
+	return LINUX_VERSION(a, b, c); 
+}
+
+
 int main (int argc, char *argv[])
 {
 	mtd_info_t meminfo;
@@ -84,41 +101,37 @@ int main (int argc, char *argv[])
 		if (!isNAND)
 			cleanmarker.totlen = cpu_to_je32 (sizeof (struct jffs2_unknown_node));
 		else {
-			struct nand_oobinfo oobinfo;
-
-			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0) {
-				fprintf(stderr, "%s: %s: unable to get NAND oobinfo\n", exe_name, mtd_device);
-				return 1;
-			}
+			struct nand_ecclayout ecclayout;
 
-			/* Check for autoplacement */
-			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
-				/* Get the position of the free bytes */
-				if (!oobinfo.oobfree[0][1]) {
-					fprintf (stderr, " Eeep. Autoplacement selected and no empty space in oob\n");
+			memset(&ecclayout, 0, sizeof(ecclayout));
+			if (get_linux_version() > LINUX_VERSION(2, 6, 17)) {
+				if (ioctl(fd, ECCGETLAYOUT, &ecclayout) != 0) {
+					fprintf(stderr,	"%s: %s: unable to get NAND oob layout\n", \
+							exe_name, mtd_device);
 					return 1;
 				}
-				clmpos = oobinfo.oobfree[0][0];
-				clmlen = oobinfo.oobfree[0][1];
-				if (clmlen > 8)
-					clmlen = 8;
 			} else {
-				/* Legacy mode */
-				switch (meminfo.oobsize) {
-					case 8:
-						clmpos = 6;
-						clmlen = 2;
-						break;
-					case 16:
-						clmpos = 8;
-						clmlen = 8;
-						break;
-					case 64:
-						clmpos = 16;
-						clmlen = 8;
-						break;
+				struct nand_oobinfo oi;
+
+				if (ioctl(fd, MEMGETOOBSEL, &oi) != 0) {
+					fprintf(stderr, "%s: %s: unable to get NAND oobinfo\n", \
+							exe_name, mtd_device);
+					return 1;
 				}
+				memcpy(&ecclayout.eccpos, &oi.eccpos, sizeof(oi.eccpos));
+				memcpy(&ecclayout.oobfree, &oi.oobfree, sizeof(oi.oobfree));
+				ecclayout.eccbytes = oi.eccbytes;
+			}
+
+			/* Get the position of the free bytes */
+			if (!ecclayout.oobfree[0].length) {
+				fprintf(stderr, " Eeep. Autoplacement selected and no empty space in oob\n");
+				return 1;
 			}
+			clmpos = ecclayout.oobfree[0].offset;
+			clmlen = ecclayout.oobfree[0].length;
+			if (clmlen > 8)
+				clmlen = 8;
 			cleanmarker.totlen = cpu_to_je32(8);
 		}
 		cleanmarker.hdr_crc =  cpu_to_je32 (crc32 (0, &cleanmarker,  sizeof (struct jffs2_unknown_node) - 4));
-- 
1.5.4.3

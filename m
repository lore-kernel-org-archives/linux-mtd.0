Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcVK5-00025H-6j
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 02:50:39 +0000
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id o132oWOu016373
	for <linux-mtd@lists.infradead.org>;
	Tue, 2 Feb 2010 18:50:32 -0800 (PST)
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] Discard the legacy interface MEMGETOOBSEL in
	flash_eraseall
Date: Wed,  3 Feb 2010 10:56:35 +0800
Message-Id: <1265165796-24686-5-git-send-email-stanley.miao@windriver.com>
In-Reply-To: <1265165796-24686-4-git-send-email-stanley.miao@windriver.com>
References: <1265165796-24686-1-git-send-email-stanley.miao@windriver.com>
	<1265165796-24686-2-git-send-email-stanley.miao@windriver.com>
	<1265165796-24686-3-git-send-email-stanley.miao@windriver.com>
	<1265165796-24686-4-git-send-email-stanley.miao@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ioctl command "MEMGETOOBSEL" is not suitable with some platforms with
the NAND ECC data longer than 32 bytes, so replace it with the new command
"ECCGETLAYOUT".

Signed-off-by: Stanley.Miao <stanley.miao@windriver.com>
---
 flash_eraseall.c |   42 ++++++++++++------------------------------
 1 files changed, 12 insertions(+), 30 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index a22fc49..1842906 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -84,41 +84,23 @@ int main (int argc, char *argv[])
 		if (!isNAND)
 			cleanmarker.totlen = cpu_to_je32 (sizeof (struct jffs2_unknown_node));
 		else {
-			struct nand_oobinfo oobinfo;
+			struct nand_ecclayout ecclayout;
 
-			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0) {
-				fprintf(stderr, "%s: %s: unable to get NAND oobinfo\n", exe_name, mtd_device);
+			if (ioctl(fd, ECCGETLAYOUT, &ecclayout) != 0) {
+				fprintf(stderr,	"%s: %s: unable to get NAND oob layout\n",
+						exe_name, mtd_device);
 				return 1;
 			}
 
-			/* Check for autoplacement */
-			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
-				/* Get the position of the free bytes */
-				if (!oobinfo.oobfree[0][1]) {
-					fprintf (stderr, " Eeep. Autoplacement selected and no empty space in oob\n");
-					return 1;
-				}
-				clmpos = oobinfo.oobfree[0][0];
-				clmlen = oobinfo.oobfree[0][1];
-				if (clmlen > 8)
-					clmlen = 8;
-			} else {
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
-				}
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

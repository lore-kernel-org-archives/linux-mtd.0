Received: from ocean.emcraft.com ([213.221.7.182])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KwOeM-0003Fj-5G
	for linux-mtd@lists.infradead.org; Sat, 01 Nov 2008 22:08:54 +0000
From: Ilya Yanok <yanok@emcraft.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: try to use ECCLAYOUT ioctl if MEMGETOOBSEL fails
Date: Sun,  2 Nov 2008 01:08:01 +0300
Message-Id: <1225577281-23536-1-git-send-email-yanok@emcraft.com>
Cc: Ilya Yanok <yanok@emcraft.com>, dzu@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use newer ECCLAYOUT ioctl (if defined) in case of MEMGETOOBSEL
ioctl fails inside flash_eraseall.

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 flash_eraseall.c |   68 ++++++++++++++++++++++++++++++++++-------------------
 1 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index 60036d3..7644ea2 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -87,38 +87,56 @@ int main (int argc, char *argv[])
 			struct nand_oobinfo oobinfo;
 
 			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0) {
+#ifdef ECCLAYOUT
+				struct nand_layout layout;
+				if (ioctl(fd, ECCLAYOUT, &layout) != 0) {
+#endif
 				fprintf(stderr, "%s: %s: unable to get NAND oobinfo\n", exe_name, mtd_device);
 				exit(1);
-			}
-
-			/* Check for autoplacement */
-			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
-				/* Get the position of the free bytes */
-				if (!oobinfo.oobfree[0][1]) {
-					fprintf (stderr, " Eeep. Autoplacement selected and no empty space in oob\n");
+#ifdef ECCLAYOUT
+				}
+				if (!layout.oobfree[0].length) {
+					fprintf(stderr,
+						" Eep. No empty space "
+						"in oob\n");
 					exit(1);
 				}
-				clmpos = oobinfo.oobfree[0][0];
-				clmlen = oobinfo.oobfree[0][1];
-				if (clmlen > 8)
-					clmlen = 8;
+				clmpos = layout.oobfree[0].offset;
+				clmlen = layout.oobfree[0].length;
+#endif
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
+				/* Check for autoplacement */
+				if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
+					/* Get the position of the free bytes */
+					if (!oobinfo.oobfree[0][1]) {
+						fprintf (stderr, " Eeep. "
+							 "Autoplacement "
+							 "selected and no empty"
+							 "space in oob\n");
+						exit(1);
+					}
+					clmpos = oobinfo.oobfree[0][0];
+					clmlen = oobinfo.oobfree[0][1];
+				} else {
+					/* Legacy mode */
+					switch (meminfo.oobsize) {
+						case 8:
+							clmpos = 6;
+							clmlen = 2;
+							break;
+						case 16:
+							clmpos = 8;
+							clmlen = 8;
+							break;
+						case 64:
+							clmpos = 16;
+							clmlen = 8;
+							break;
+					}
 				}
 			}
+			if (clmlen > 8)
+				clmlen = 8;
 			cleanmarker.totlen = cpu_to_je32(8);
 		}
 		cleanmarker.hdr_crc =  cpu_to_je32 (crc32 (0, &cleanmarker,  sizeof (struct jffs2_unknown_node) - 4));
-- 
1.5.6.1

Received: from fg-out-1718.google.com ([72.14.220.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O3smp-0007gI-2O
	for linux-mtd@lists.infradead.org; Mon, 19 Apr 2010 15:21:24 +0000
Received: by fg-out-1718.google.com with SMTP id e21so2666547fga.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Apr 2010 08:21:19 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: sm_common: split smartmedia and xD table
Date: Mon, 19 Apr 2010 18:20:41 +0300
Message-Id: <1271690441-25088-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2GB xD card, and 4MB SmartMedia ROM card share same ID, so to make both work
split xD and smartmedia ID tables.

Hardware driver must be able to know which type it handles (and probably just one).

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/r852.c      |    2 +-
 drivers/mtd/nand/sm_common.c |   37 +++++++++++++++++++++----------------
 drivers/mtd/nand/sm_common.h |    2 +-
 3 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 96bfbd8..6dfbb47 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -666,7 +666,7 @@ int r852_register_nand_device(struct r852_device *dev)
 
 	r852_engine_enable(dev);
 
-	if (sm_register_device(dev->mtd))
+	if (sm_register_device(dev->mtd, dev->sm))
 		goto error2;
 
 	if (device_create_file(&dev->mtd->dev, &dev_attr_media_type))
diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.c
index aae0b9a..ac80fb3 100644
--- a/drivers/mtd/nand/sm_common.c
+++ b/drivers/mtd/nand/sm_common.c
@@ -68,8 +68,6 @@ static int sm_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 
 static struct nand_flash_dev nand_smartmedia_flash_ids[] = {
-
-	/* SmartMedia */
 	{"SmartMedia 1MiB 5V",          0x6e, 256, 1, 0x1000, 0},
 	{"SmartMedia 1MiB 3,3V",        0xe8, 256, 1, 0x1000, 0},
 	{"SmartMedia 1MiB 3,3V",        0xec, 256, 1, 0x1000, 0},
@@ -82,28 +80,34 @@ static struct nand_flash_dev nand_smartmedia_flash_ids[] = {
 	{"SmartMedia 4MiB 3,3V ROM",    0xd5, 512, 4, 0x2000, NAND_ROM},
 	{"SmartMedia 8MiB 3,3V",        0xe6, 512, 8, 0x2000, 0},
 	{"SmartMedia 8MiB 3,3V ROM",    0xd6, 512, 8, 0x2000, NAND_ROM},
-
-#define XD_TYPEM       (NAND_NO_AUTOINCR | NAND_BROKEN_XD)
-	/* xD / SmartMedia */
-	{"SmartMedia/xD 16MiB 3,3V",    0x73, 512, 16, 0x4000, 0},
+	{"SmartMedia 16MiB 3,3V",       0x73, 512, 16, 0x4000, 0},
 	{"SmartMedia 16MiB 3,3V ROM",   0x57, 512, 16, 0x4000, NAND_ROM},
-	{"SmartMedia/xD 32MiB 3,3V",    0x75, 512, 32, 0x4000, 0},
+	{"SmartMedia 32MiB 3,3V",       0x75, 512, 32, 0x4000, 0},
 	{"SmartMedia 32MiB 3,3V ROM",   0x58, 512, 32, 0x4000, NAND_ROM},
-	{"SmartMedia/xD 64MiB 3,3V",    0x76, 512, 64, 0x4000, 0},
+	{"SmartMedia 64MiB 3,3V",       0x76, 512, 64, 0x4000, 0},
 	{"SmartMedia 64MiB 3,3V ROM",   0xd9, 512, 64, 0x4000, NAND_ROM},
-	{"SmartMedia/xD 128MiB 3,3V",   0x79, 512, 128, 0x4000, 0},
+	{"SmartMedia 128MiB 3,3V",      0x79, 512, 128, 0x4000, 0},
 	{"SmartMedia 128MiB 3,3V ROM",  0xda, 512, 128, 0x4000, NAND_ROM},
-	{"SmartMedia/xD 256MiB 3,3V",   0x71, 512, 256, 0x4000, XD_TYPEM},
+	{"SmartMedia 256MiB 3,3V",      0x71, 512, 256, 0x4000 },
 	{"SmartMedia 256MiB 3,3V ROM",  0x5b, 512, 256, 0x4000, NAND_ROM},
+	{NULL,}
+};
 
-	/* xD only */
-	{"xD 512MiB 3,3V",              0xDC, 512, 512, 0x4000, XD_TYPEM},
-	{"xD 1GiB 3,3V",                0xD3, 512, 1024, 0x4000, XD_TYPEM},
-	{"xD 2GiB 3,3V",                0xD5, 512, 2048, 0x4000, XD_TYPEM},
+#define XD_TYPEM       (NAND_NO_AUTOINCR | NAND_BROKEN_XD)
+static struct nand_flash_dev nand_xd_flash_ids[] = {
+
+	{"xD 16MiB 3,3V",    0x73, 512, 16, 0x4000, 0},
+	{"xD 32MiB 3,3V",    0x75, 512, 32, 0x4000, 0},
+	{"xD 64MiB 3,3V",    0x76, 512, 64, 0x4000, 0},
+	{"xD 128MiB 3,3V",   0x79, 512, 128, 0x4000, 0},
+	{"xD 256MiB 3,3V",   0x71, 512, 256, 0x4000, XD_TYPEM},
+	{"xD 512MiB 3,3V",   0xdc, 512, 512, 0x4000, XD_TYPEM},
+	{"xD 1GiB 3,3V",     0xd3, 512, 1024, 0x4000, XD_TYPEM},
+	{"xD 2GiB 3,3V",     0xd5, 512, 2048, 0x4000, XD_TYPEM},
 	{NULL,}
 };
 
-int sm_register_device(struct mtd_info *mtd)
+int sm_register_device(struct mtd_info *mtd, int smartmedia)
 {
 	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
 	int ret;
@@ -111,7 +115,8 @@ int sm_register_device(struct mtd_info *mtd)
 	chip->options |= NAND_SKIP_BBTSCAN;
 
 	/* Scan for card properties */
-	ret = nand_scan_ident(mtd, 1, nand_smartmedia_flash_ids);
+	ret = nand_scan_ident(mtd, 1, smartmedia ?
+		nand_smartmedia_flash_ids : nand_xd_flash_ids);
 
 	if (ret)
 		return ret;
diff --git a/drivers/mtd/nand/sm_common.h b/drivers/mtd/nand/sm_common.h
index 18284f5..00f4a83 100644
--- a/drivers/mtd/nand/sm_common.h
+++ b/drivers/mtd/nand/sm_common.h
@@ -36,7 +36,7 @@ struct sm_oob {
 #define SM_SMALL_OOB_SIZE	8
 
 
-extern int sm_register_device(struct mtd_info *mtd);
+extern int sm_register_device(struct mtd_info *mtd, int smartmedia);
 
 
 static inline int sm_sector_valid(struct sm_oob *oob)
-- 
1.7.0.4

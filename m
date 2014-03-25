Received: from mail-wg0-f50.google.com ([74.125.82.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMbR-00024z-VD
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:20:58 +0000
Received: by mail-wg0-f50.google.com with SMTP id x13so75418wgg.33
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:20:34 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 09/47] mtd: nand: stm_nand_bch: introduce and initialise some
 important data structures
Date: Tue, 25 Mar 2014 08:19:26 +0000
Message-Id: <1395735604-26706-10-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Provide some more in-depth structures which will be used heavily within
the driver. We also add a convenience function, used to set the default
values.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 76 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index cc0159e..7333ad6 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -21,10 +21,30 @@
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/completion.h>
+#include <linux/mtd/nand.h>
 #include <linux/mtd/stm_nand.h>
 
 #include "stm_nand_regs.h"
 
+/* Bad Block Table (BBT) */
+struct nandi_bbt_info {
+	uint32_t	bbt_size;		/* Size of bad-block table */
+	uint32_t	bbt_vers[2];		/* Version (Primary/Mirror) */
+	uint32_t	bbt_block[2];		/* Block No. (Primary/Mirror) */
+	uint8_t		*bbt;			/* Table data */
+};
+
+/* Collection of MTD/NAND device information */
+struct nandi_info {
+	struct mtd_info		mtd;		/* MTD info */
+	struct nand_chip	chip;		/* NAND chip info */
+
+	struct nand_ecclayout	ecclayout;	/* MTD ECC layout */
+	struct nandi_bbt_info	bbt_info;	/* Bad Block Table */
+	int			nr_parts;	/* Number of MTD partitions */
+	struct	mtd_partition	*parts;		/* MTD partitions */
+};
+
 /* NANDi Controller (Hamming/BCH) */
 struct nandi_controller {
 	void __iomem		*base;		/* Controller base*/
@@ -60,6 +80,8 @@ struct nandi_controller {
 
 	int			cached_page;	/* page number of page in */
 						/* 'page_buf'             */
+
+	struct nandi_info	info;		/* NAND device info */
 };
 
 /*
@@ -107,6 +129,46 @@ static void nandi_disable_interrupts(struct nandi_controller *nandi,
 	writel(val, nandi->base + NANDBCH_INT_EN);
 }
 
+static void nandi_set_mtd_defaults(struct nandi_controller *nandi,
+				   struct mtd_info *mtd, struct nand_chip *chip)
+{
+	struct nandi_info *info = &nandi->info;
+	int i;
+
+	/* ecclayout */
+	info->ecclayout.eccbytes = mtd->oobsize;
+	for (i = 0; i < 64; i++)
+		info->ecclayout.eccpos[i] = i;
+	info->ecclayout.oobfree[0].offset = 0;
+	info->ecclayout.oobfree[0].length = 0;
+	info->ecclayout.oobavail = 0;
+
+	/* nand_chip */
+	chip->controller = &chip->hwcontrol;
+	spin_lock_init(&chip->controller->lock);
+	init_waitqueue_head(&chip->controller->wq);
+	chip->state = FL_READY;
+	chip->priv = nandi;
+	chip->ecc.layout = &info->ecclayout;
+
+	/* mtd_info */
+	mtd->owner = THIS_MODULE;
+	mtd->type = MTD_NANDFLASH;
+	mtd->flags = MTD_CAP_NANDFLASH;
+	mtd->ecclayout = &info->ecclayout;
+	mtd->oobavail = 0;
+	mtd->subpage_sft = 0;
+
+	mtd->_point = NULL;
+	mtd->_unpoint = NULL;
+	mtd->_lock = NULL;
+	mtd->_unlock = NULL;
+
+	mtd->_sync = nand_sync;
+	mtd->_suspend = nand_suspend;
+	mtd->_resume = nand_resume;
+}
+
 static void nandi_clk_enable(struct nandi_controller *nandi)
 {
 	if (nandi->emi_clk)
@@ -271,7 +333,11 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 {
 	struct stm_plat_nand_bch_data *pdata = pdev->dev.platform_data;
 	struct stm_nand_bank_data *bank;
+	struct nandi_bbt_info *bbt_info;
 	struct nandi_controller *nandi;
+	struct nandi_info *info;
+	struct nand_chip *chip;
+	struct mtd_info *mtd;
 
 	if (!pdata) {
 		dev_err(&pdev->dev, "no platform data found\n");
@@ -291,6 +357,16 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 	if (bank)
 		nandi_init_controller(nandi, bank->csn);
 
+	info            = &nandi->info;
+	chip            = &info->chip;
+	bbt_info        = &info->bbt_info;
+	mtd             = &info->mtd;
+	mtd->priv       = chip;
+	mtd->name       = dev_name(&pdev->dev);
+	mtd->dev.parent = &pdev->dev;
+
+	nandi_set_mtd_defaults(nandi, mtd, chip);
+
 	return 0;
 }
 
-- 
1.8.3.2

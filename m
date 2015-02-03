Received: from mail-ob0-x230.google.com ([2607:f8b0:4003:c01::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YImYZ-0005UQ-VF
 for linux-mtd@lists.infradead.org; Tue, 03 Feb 2015 23:06:56 +0000
Received: by mail-ob0-f176.google.com with SMTP id wo20so16498583obc.7
 for <linux-mtd@lists.infradead.org>; Tue, 03 Feb 2015 15:06:33 -0800 (PST)
Sender: Rob Herring <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: pxa3xx: fix build on ARM64
Date: Tue,  3 Feb 2015 17:06:16 -0600
Message-Id: <1423004776-17825-1-git-send-email-robh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In preparation to enable ARCH_MMP on ARM64, a couple of fixes are needed
to build the pxa3xx_nand driver:

Legacy DMA will only used on ARM, so also make it condtional on
CONFIG_ARM.
__raw_{read,write}sl are not available on ARM64 or generically, so use
the readsl/writesl variants instead.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/pxa3xx_nand.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 96b0b1d..404d390 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -28,7 +28,7 @@
 #include <linux/of_device.h>
 #include <linux/of_mtd.h>
 
-#if defined(CONFIG_ARCH_PXA) || defined(CONFIG_ARCH_MMP)
+#if defined(CONFIG_ARM) && (defined(CONFIG_ARCH_PXA) || defined(CONFIG_ARCH_MMP))
 #define ARCH_HAS_DMA
 #endif
 
@@ -486,24 +486,24 @@ static void handle_data_pio(struct pxa3xx_nand_info *info)
 
 	switch (info->state) {
 	case STATE_PIO_WRITING:
-		__raw_writesl(info->mmio_base + NDDB,
-			      info->data_buff + info->data_buff_pos,
-			      DIV_ROUND_UP(do_bytes, 4));
+		writesl(info->mmio_base + NDDB,
+			info->data_buff + info->data_buff_pos,
+			DIV_ROUND_UP(do_bytes, 4));
 
 		if (info->oob_size > 0)
-			__raw_writesl(info->mmio_base + NDDB,
-				      info->oob_buff + info->oob_buff_pos,
-				      DIV_ROUND_UP(info->oob_size, 4));
+			writesl(info->mmio_base + NDDB,
+				info->oob_buff + info->oob_buff_pos,
+				DIV_ROUND_UP(info->oob_size, 4));
 		break;
 	case STATE_PIO_READING:
-		__raw_readsl(info->mmio_base + NDDB,
-			     info->data_buff + info->data_buff_pos,
-			     DIV_ROUND_UP(do_bytes, 4));
+		readsl(info->mmio_base + NDDB,
+		       info->data_buff + info->data_buff_pos,
+		       DIV_ROUND_UP(do_bytes, 4));
 
 		if (info->oob_size > 0)
-			__raw_readsl(info->mmio_base + NDDB,
-				     info->oob_buff + info->oob_buff_pos,
-				     DIV_ROUND_UP(info->oob_size, 4));
+			readsl(info->mmio_base + NDDB,
+			       info->oob_buff + info->oob_buff_pos,
+			       DIV_ROUND_UP(info->oob_size, 4));
 		break;
 	default:
 		dev_err(&info->pdev->dev, "%s: invalid state %d\n", __func__,
@@ -1580,7 +1580,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	info->pdev = pdev;
 	info->variant = pxa3xx_nand_get_variant(pdev);
 	for (cs = 0; cs < pdata->num_cs; cs++) {
-		mtd = (struct mtd_info *)((unsigned int)&info[1] +
+		mtd = (struct mtd_info *)((void *)&info[1] +
 		      (sizeof(*mtd) + sizeof(*host)) * cs);
 		chip = (struct nand_chip *)(&mtd[1]);
 		host = (struct pxa3xx_nand_host *)chip;
-- 
2.1.0

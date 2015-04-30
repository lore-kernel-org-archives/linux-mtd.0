Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ynuup-00031R-CE
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 20:18:36 +0000
Received: by obfe9 with SMTP id e9so53069580obf.1
 for <linux-mtd@lists.infradead.org>; Thu, 30 Apr 2015 13:18:12 -0700 (PDT)
Sender: Rob Herring <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2] mtd: nand: pxa3xx: fix build on ARM64
Date: Thu, 30 Apr 2015 15:17:47 -0500
Message-Id: <1430425067-26996-1-git-send-email-robh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
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
the readsl/writesl variants instead. Somewhat inconsistently,
{read,write}sl are inherently non-swapping with the generic version
using __raw_{read,write}l.

Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
---
This never got applied. It is essentially the same as v1, but I added 
some more explanation that {read,write}sl are inherently non-swapping 
and I dropped an unneeded cast.

Rob

 drivers/mtd/nand/pxa3xx_nand.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index a4615fc..6aced6c 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -28,7 +28,7 @@
 #include <linux/of_device.h>
 #include <linux/of_mtd.h>
 
-#if defined(CONFIG_ARCH_PXA) || defined(CONFIG_ARCH_MMP)
+#if defined(CONFIG_ARM) && (defined(CONFIG_ARCH_PXA) || defined(CONFIG_ARCH_MMP))
 #define ARCH_HAS_DMA
 #endif
 
@@ -513,7 +513,7 @@ static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
 		}
 	}
 
-	__raw_readsl(info->mmio_base + NDDB, data, len);
+	readsl(info->mmio_base + NDDB, data, len);
 }
 
 static void handle_data_pio(struct pxa3xx_nand_info *info)
@@ -522,14 +522,14 @@ static void handle_data_pio(struct pxa3xx_nand_info *info)
 
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
 		drain_fifo(info,
@@ -1630,8 +1630,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	info->pdev = pdev;
 	info->variant = pxa3xx_nand_get_variant(pdev);
 	for (cs = 0; cs < pdata->num_cs; cs++) {
-		mtd = (struct mtd_info *)((unsigned int)&info[1] +
-		      (sizeof(*mtd) + sizeof(*host)) * cs);
+		mtd = (void *)&info[1] + (sizeof(*mtd) + sizeof(*host)) * cs;
 		chip = (struct nand_chip *)(&mtd[1]);
 		host = (struct pxa3xx_nand_host *)chip;
 		info->host[cs] = host;
-- 
2.1.0

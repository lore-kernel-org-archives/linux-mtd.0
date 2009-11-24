Received: from adsl-99-41-73-217.dsl.pltn13.sbcglobal.net ([99.41.73.217]
	helo=amused2.locolabs2.com)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NCne5-0006rV-Uv
	for linux-mtd@lists.infradead.org; Tue, 24 Nov 2009 05:09:03 +0000
From: David Hunter <hunterd42@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] [NAND] pxa3xx_nand: Fix PIO data transfer
Date: Mon, 23 Nov 2009 21:02:35 -0800
Message-Id: <1259038955-10416-1-git-send-email-hunterd42@gmail.com>
Cc: David Hunter <hunterd42@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The shift operator used here to convert from bytes to 32-bit words is
backwards.

Signed-off-by: David Hunter <hunterd42@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 6ea520a..75aa871 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -489,7 +489,7 @@ static int handle_data_pio(struct pxa3xx_nand_info *info)
 	switch (info->state) {
 	case STATE_PIO_WRITING:
 		__raw_writesl(info->mmio_base + NDDB, info->data_buff,
-				info->data_size << 2);
+				info->data_size >> 2);
 
 		enable_int(info, NDSR_CS0_BBD | NDSR_CS0_CMDD);
 
@@ -501,7 +501,7 @@ static int handle_data_pio(struct pxa3xx_nand_info *info)
 		break;
 	case STATE_PIO_READING:
 		__raw_readsl(info->mmio_base + NDDB, info->data_buff,
-				info->data_size << 2);
+				info->data_size >> 2);
 		break;
 	default:
 		printk(KERN_ERR "%s: invalid state %d\n", __func__,
-- 
1.6.0.4

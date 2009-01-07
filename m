Received: from vpn.static.83-173-204-231.cybernet.ch ([83.173.204.231]
	helo=localhost.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKOfK-0003mG-4V
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 03:01:06 +0000
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] Fix typo that prevented non DMA aka polling mode from
	working correctly.
Date: Wed,  7 Jan 2009 03:40:51 +0100
Message-Id: <1231296053-2378-2-git-send-email-marcel@ziswiler.com>
In-Reply-To: <1231296053-2378-1-git-send-email-marcel@ziswiler.com>
References: <1231296053-2378-1-git-send-email-marcel@ziswiler.com>
Cc: eric.y.miao@gmail.com, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Due to __raw_{read,write}sl() being 'long' size based the shift operations need
to divide the size in bytes by 4 which is achieved by ">> 2".

Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index fc41444..761e43d 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -468,7 +468,7 @@ static int handle_data_pio(struct pxa3xx_nand_info *info)
 	switch (info->state) {
 	case STATE_PIO_WRITING:
 		__raw_writesl(info->mmio_base + NDDB, info->data_buff,
-				info->data_size << 2);
+				info->data_size >> 2);
 
 		enable_int(info, NDSR_CS0_BBD | NDSR_CS0_CMDD);
 
@@ -480,7 +480,7 @@ static int handle_data_pio(struct pxa3xx_nand_info *info)
 		break;
 	case STATE_PIO_READING:
 		__raw_readsl(info->mmio_base + NDDB, info->data_buff,
-				info->data_size << 2);
+				info->data_size >> 2);
 		break;
 	default:
 		printk(KERN_ERR "%s: invalid state %d\n", __func__,
-- 
1.6.0.6

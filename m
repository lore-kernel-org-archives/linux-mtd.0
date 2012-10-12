Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMW3x-0007Bs-6f
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2012 03:37:25 +0000
From: <dinguyen@altera.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] denali: nand: Fix build break for driver when built as a
 module
Date: Thu, 11 Oct 2012 22:36:56 -0600
Message-ID: <1350016616-22098-1-git-send-email-dinguyen@altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: sfr@canb.auug.org.au, dinh.linux@gmail.com,
 Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Dinh Nguyen <dinguyen@altera.com>

Make denali_init and denali_remove accessible when the driver
is built as a loadable module.

Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
---
 drivers/mtd/nand/denali.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 8f99e9b..0c8bb6b 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1596,6 +1596,7 @@ failed_req_irq:
 
 	return ret;
 }
+EXPORT_SYMBOL(denali_init);
 
 /* driver exit point */
 void denali_remove(struct denali_nand_info *denali)
@@ -1604,3 +1605,4 @@ void denali_remove(struct denali_nand_info *denali)
 	dma_unmap_single(denali->dev, denali->buf.dma_buf, DENALI_BUF_SIZE,
 			DMA_BIDIRECTIONAL);
 }
+EXPORT_SYMBOL(denali_remove);
-- 
1.7.9.5

Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtJFt-0001Jm-Sq
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 15:41:50 +0000
Received: by mail-pa0-f49.google.com with SMTP id kx10so6086158pab.22
 for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2013 07:41:27 -0800 (PST)
From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 1/2] mtd: gpmi: allocate a proper buffer for non ECC read/write
Date: Wed, 18 Dec 2013 23:40:59 +0800
Message-Id: <1387381260-11923-1-git-send-email-shijie8@gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The @data_buffer_dma buffer is used for non ECC read/write.

Currently, the length of the buffer is PAGE_SIZE, but the NAND chip may
has 8K page or 16K page. So we have to extend it for the large page NAND
chips.

The gpmi_alloc_dma_buffer will be called twice. The first time is to
allocate a temporary buffer for scanning the NAND chip; The second time
is to allocate a buffer to store the real page content.

This patch allocates a buffer of PAGE_SIZE size for scanning the NAND
chip when gpmi_alloc_dma_buffer is called the first time, and allocates a
buffer of the real NAND page size for the second time gpmi_alloc_dma_buffer
is called.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index f3efde9..cee5f81 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -783,14 +783,23 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
 {
 	struct bch_geometry *geo = &this->bch_geometry;
 	struct device *dev = this->dev;
+	struct mtd_info *mtd = &this->mtd;
 
 	/* [1] Allocate a command buffer. PAGE_SIZE is enough. */
 	this->cmd_buffer = kzalloc(PAGE_SIZE, GFP_DMA | GFP_KERNEL);
 	if (this->cmd_buffer == NULL)
 		goto error_alloc;
 
-	/* [2] Allocate a read/write data buffer. PAGE_SIZE is enough. */
-	this->data_buffer_dma = kzalloc(PAGE_SIZE, GFP_DMA | GFP_KERNEL);
+	/*
+	 * [2] Allocate a read/write data buffer.
+	 *     The gpmi_alloc_dma_buffer can be called twice.
+	 *     We allocate a PAGE_SIZE length buffer if gpmi_alloc_dma_buffer
+	 *     is called before the nand_scan_ident; and we allocate a buffer
+	 *     of the real NAND page size when the gpmi_alloc_dma_buffer is
+	 *     called after the nand_scan_ident.
+	 */
+	this->data_buffer_dma = kzalloc(mtd->writesize ?: PAGE_SIZE,
+					GFP_DMA | GFP_KERNEL);
 	if (this->data_buffer_dma == NULL)
 		goto error_alloc;
 
-- 
1.8.3.1

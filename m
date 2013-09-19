Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMggb-000132-Ct
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:02:36 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/21] mtd: nand: pxa3xx: Allocate data buffer on detected
 flash size
Date: Thu, 19 Sep 2013 13:01:25 -0300
Message-Id: <1379606505-2529-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit replaces the currently hardcoded buffer size, by a
dynamic detection scheme. First a small 256 bytes buffer is allocated
so the device can be detected (using READID and friends commands).

After detection, this buffer is released and a new buffer is allocated
to acommodate the page size plus out-of-band size.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 45 ++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index dd03dfd..b4f3784 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -39,6 +39,13 @@
 #define NAND_STOP_DELAY		(2 * HZ/50)
 #define PAGE_CHUNK_SIZE		(2048)
 
+/*
+ * Define a buffer size for the initial command that detects the flash device:
+ * STATUS, READID and PARAM. The largest of these is the PARAM command,
+ * needing 256 bytes.
+ */
+#define INIT_BUFFER_SIZE	256
+
 /* registers and bit definitions */
 #define NDCR		(0x00) /* Control register */
 #define NDTR0CS0	(0x04) /* Timing Parameter 0 for CS0 */
@@ -164,6 +171,7 @@ struct pxa3xx_nand_info {
 
 	unsigned int 		buf_start;
 	unsigned int		buf_count;
+	unsigned int		buf_size;
 
 	/* DMA information */
 	int			drcmr_dat;
@@ -912,26 +920,20 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 	return 0;
 }
 
-/* the maximum possible buffer size for large page with OOB data
- * is: 2048 + 64 = 2112 bytes, allocate a page here for both the
- * data buffer and the DMA descriptor
- */
-#define MAX_BUFF_SIZE	PAGE_SIZE
-
 #ifdef ARCH_HAS_DMA
 static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
 {
 	struct platform_device *pdev = info->pdev;
-	int data_desc_offset = MAX_BUFF_SIZE - sizeof(struct pxa_dma_desc);
+	int data_desc_offset = info->buf_size - sizeof(struct pxa_dma_desc);
 
 	if (use_dma == 0) {
-		info->data_buff = kmalloc(MAX_BUFF_SIZE, GFP_KERNEL);
+		info->data_buff = kmalloc(info->buf_size, GFP_KERNEL);
 		if (info->data_buff == NULL)
 			return -ENOMEM;
 		return 0;
 	}
 
-	info->data_buff = dma_alloc_coherent(&pdev->dev, MAX_BUFF_SIZE,
+	info->data_buff = dma_alloc_coherent(&pdev->dev, info->buf_size,
 				&info->data_buff_phys, GFP_KERNEL);
 	if (info->data_buff == NULL) {
 		dev_err(&pdev->dev, "failed to allocate dma buffer\n");
@@ -945,7 +947,7 @@ static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
 				pxa3xx_nand_data_dma_irq, info);
 	if (info->data_dma_ch < 0) {
 		dev_err(&pdev->dev, "failed to request data dma\n");
-		dma_free_coherent(&pdev->dev, MAX_BUFF_SIZE,
+		dma_free_coherent(&pdev->dev, info->buf_size,
 				info->data_buff, info->data_buff_phys);
 		return info->data_dma_ch;
 	}
@@ -958,7 +960,7 @@ static void pxa3xx_nand_free_buff(struct pxa3xx_nand_info *info)
 	struct platform_device *pdev = info->pdev;
 	if (use_dma) {
 		pxa_free_dma(info->data_dma_ch);
-		dma_free_coherent(&pdev->dev, MAX_BUFF_SIZE,
+		dma_free_coherent(&pdev->dev, info->buf_size,
 				  info->data_buff, info->data_buff_phys);
 	} else {
 		kfree(info->data_buff);
@@ -967,7 +969,7 @@ static void pxa3xx_nand_free_buff(struct pxa3xx_nand_info *info)
 #else
 static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
 {
-	info->data_buff = kmalloc(MAX_BUFF_SIZE, GFP_KERNEL);
+	info->data_buff = kmalloc(info->buf_size, GFP_KERNEL);
 	if (info->data_buff == NULL)
 		return -ENOMEM;
 	return 0;
@@ -1081,7 +1083,16 @@ KEEP_CONFIG:
 	else
 		host->col_addr_cycles = 1;
 
+	/* release the initial buffer */
+	kfree(info->data_buff);
+
+	/* allocate the real data + oob buffer */
+	info->buf_size = mtd->writesize + mtd->oobsize;
+	ret = pxa3xx_nand_init_buff(info);
+	if (ret)
+		return ret;
 	info->oob_buff = info->data_buff + mtd->writesize;
+
 	if ((mtd->size >> chip->page_shift) > 65536)
 		host->row_addr_cycles = 3;
 	else
@@ -1187,9 +1198,13 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	}
 	info->mmio_phys = r->start;
 
-	ret = pxa3xx_nand_init_buff(info);
-	if (ret)
+	/* Allocate a buffer to allow flash detection */
+	info->buf_size = INIT_BUFFER_SIZE;
+	info->data_buff = kmalloc(info->buf_size, GFP_KERNEL);
+	if (info->data_buff == NULL) {
+		ret = -ENOMEM;
 		goto fail_disable_clk;
+	}
 
 	/* initialize all interrupts to be disabled */
 	disable_int(info, NDSR_MASK);
@@ -1207,7 +1222,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 
 fail_free_buf:
 	free_irq(irq, info);
-	pxa3xx_nand_free_buff(info);
+	kfree(info->data_buff);
 fail_disable_clk:
 	clk_disable_unprepare(info->clk);
 	return ret;
-- 
1.8.1.5

From: Mika Westerberg <ext-mika.1.westerberg@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: OneNAND: OMAP2/3: unmap correct DMA buffer
Date: Wed, 24 Mar 2010 12:10:48 +0200
Message-Id: <1269425448-3426-1-git-send-email-ext-mika.1.westerberg@nokia.com>
In-Reply-To: <4BA8C513.3070308@nokia.com>
References: <4BA8C513.3070308@nokia.com>
Cc: kyungmin.park@samsung.com, dwmw2@infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Functions omap2_onenand_write_bufferram() and omap3_onenand_write_bufferram()
map the write buffer and store the returned handle in variable dma_src. However,
when DMA unmap is done, variable dma_dst is used instead of the correct dma_src.

This patch fixes them to use the correct DMA buffer.

Signed-off-by: Mika Westerberg <ext-mika.1.westerberg@nokia.com>
---
 drivers/mtd/onenand/omap2.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 75f38b9..f79a47b 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -402,7 +402,7 @@ static int omap3_onenand_write_bufferram(struct mtd_info *mtd, int area,
 
 	dma_src = dma_map_single(&c->pdev->dev, buf, count, DMA_TO_DEVICE);
 	dma_dst = c->phys_base + bram_offset;
-	if (dma_mapping_error(&c->pdev->dev, dma_dst)) {
+	if (dma_mapping_error(&c->pdev->dev, dma_src)) {
 		dev_err(&c->pdev->dev,
 			"Couldn't DMA map a %d byte buffer\n",
 			count);
@@ -425,7 +425,7 @@ static int omap3_onenand_write_bufferram(struct mtd_info *mtd, int area,
 		if (*done)
 			break;
 
-	dma_unmap_single(&c->pdev->dev, dma_dst, count, DMA_TO_DEVICE);
+	dma_unmap_single(&c->pdev->dev, dma_src, count, DMA_TO_DEVICE);
 
 	if (!*done) {
 		dev_err(&c->pdev->dev, "timeout waiting for DMA\n");
@@ -520,7 +520,7 @@ static int omap2_onenand_write_bufferram(struct mtd_info *mtd, int area,
 	dma_src = dma_map_single(&c->pdev->dev, (void *) buffer, count,
 				 DMA_TO_DEVICE);
 	dma_dst = c->phys_base + bram_offset;
-	if (dma_mapping_error(&c->pdev->dev, dma_dst)) {
+	if (dma_mapping_error(&c->pdev->dev, dma_src)) {
 		dev_err(&c->pdev->dev,
 			"Couldn't DMA map a %d byte buffer\n",
 			count);
@@ -538,7 +538,7 @@ static int omap2_onenand_write_bufferram(struct mtd_info *mtd, int area,
 	omap_start_dma(c->dma_channel);
 	wait_for_completion(&c->dma_done);
 
-	dma_unmap_single(&c->pdev->dev, dma_dst, count, DMA_TO_DEVICE);
+	dma_unmap_single(&c->pdev->dev, dma_src, count, DMA_TO_DEVICE);
 
 	return 0;
 }
-- 
1.5.6.5

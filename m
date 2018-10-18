From: Christoph Hellwig <hch@lst.de>
To: maximlevitsky@gmail.com, boris.brezillon@bootlin.com,
 miquel.raynal@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: r852: use generic DMA API
Date: Thu, 18 Oct 2018 14:59:35 +0200
Message-Id: <20181018125935.9028-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the generic DMA API instead of the legacy PCI DMA API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/nand/raw/r852.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 39be65b35ac25..35f0b343cf908 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -151,8 +151,9 @@ static void r852_dma_done(struct r852_device *dev, int error)
 	dev->dma_stage = 0;
 
 	if (dev->phys_dma_addr && dev->phys_dma_addr != dev->phys_bounce_buffer)
-		pci_unmap_single(dev->pci_dev, dev->phys_dma_addr, R852_DMA_LEN,
-			dev->dma_dir ? PCI_DMA_FROMDEVICE : PCI_DMA_TODEVICE);
+		dma_unmap_single(&dev->pci_dev->dev, dev->phys_dma_addr,
+			R852_DMA_LEN,
+			dev->dma_dir ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
 }
 
 /*
@@ -197,11 +198,10 @@ static void r852_do_dma(struct r852_device *dev, uint8_t *buf, int do_read)
 		bounce = 1;
 
 	if (!bounce) {
-		dev->phys_dma_addr = pci_map_single(dev->pci_dev, (void *)buf,
+		dev->phys_dma_addr = dma_map_single(&dev->pci_dev->dev, buf,
 			R852_DMA_LEN,
-			(do_read ? PCI_DMA_FROMDEVICE : PCI_DMA_TODEVICE));
-
-		if (pci_dma_mapping_error(dev->pci_dev, dev->phys_dma_addr))
+			do_read ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+		if (dma_mapping_error(&dev->pci_dev->dev, dev->phys_dma_addr))
 			bounce = 1;
 	}
 
@@ -835,7 +835,7 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 
 	pci_set_master(pci_dev);
 
-	error = pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32));
+	error = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32));
 	if (error)
 		goto error2;
 
@@ -885,8 +885,8 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	dev->pci_dev = pci_dev;
 	pci_set_drvdata(pci_dev, dev);
 
-	dev->bounce_buffer = pci_alloc_consistent(pci_dev, R852_DMA_LEN,
-		&dev->phys_bounce_buffer);
+	dev->bounce_buffer = dma_alloc_coherent(&pci_dev->dev, R852_DMA_LEN,
+		&dev->phys_bounce_buffer, GFP_KERNEL);
 
 	if (!dev->bounce_buffer)
 		goto error6;
@@ -946,8 +946,8 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 error8:
 	pci_iounmap(pci_dev, dev->mmio);
 error7:
-	pci_free_consistent(pci_dev, R852_DMA_LEN,
-		dev->bounce_buffer, dev->phys_bounce_buffer);
+	dma_free_coherent(&pci_dev->dev, R852_DMA_LEN, dev->bounce_buffer,
+			  dev->phys_bounce_buffer);
 error6:
 	kfree(dev);
 error5:
@@ -980,8 +980,8 @@ static void r852_remove(struct pci_dev *pci_dev)
 	/* Cleanup */
 	kfree(dev->tmp_buffer);
 	pci_iounmap(pci_dev, dev->mmio);
-	pci_free_consistent(pci_dev, R852_DMA_LEN,
-		dev->bounce_buffer, dev->phys_bounce_buffer);
+	dma_free_coherent(&pci_dev->dev, R852_DMA_LEN, dev->bounce_buffer,
+			  dev->phys_bounce_buffer);
 
 	kfree(dev->chip);
 	kfree(dev);
-- 
2.19.1

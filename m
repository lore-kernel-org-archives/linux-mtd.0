Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eydNy-0001W6-U1
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 13:02:38 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 02/16] mtd: rawnand: cafe: fix probe function error path
Date: Wed, 21 Mar 2018 14:01:43 +0100
Message-Id: <20180321130157.9524-3-miquel.raynal@bootlin.com>
In-Reply-To: <20180321130157.9524-1-miquel.raynal@bootlin.com>
References: <20180321130157.9524-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An error after nand_scan_tail() should trigger a nand_cleanup().
The helper mtd_device_parse_register() returns an error code that should
be checked and nand_cleanup() called accordingly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 3c1b6a3786b2..de9682d87a56 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -774,21 +774,25 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, mtd);
 
 	mtd->name = "cafe_nand";
-	mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err)
+		goto out_cleanup_nand;
 
-	goto out;
+	return 0;
 
- out_free_dma:
+out_cleanup_nand:
+	nand_cleanup(&cafe->nand);
+out_free_dma:
 	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
- out_irq:
+out_irq:
 	/* Disable NAND IRQ in global IRQ mask register */
 	cafe_writel(cafe, ~1 & cafe_readl(cafe, GLOBAL_IRQ_MASK), GLOBAL_IRQ_MASK);
 	free_irq(pdev->irq, mtd);
- out_ior:
+out_ior:
 	pci_iounmap(pdev, cafe->mmio);
- out_free_mtd:
+out_free_mtd:
 	kfree(cafe);
- out:
+
 	return err;
 }
 
-- 
2.14.1

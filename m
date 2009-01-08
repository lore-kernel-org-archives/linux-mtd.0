Received: from mout.perfora.net ([74.208.4.195])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LL3X4-0001u0-2j
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 22:39:18 +0000
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3 v2] [MTD] [NAND] pxa3xx_nand.c: Fix compilation without
	MTD partitioning support
Date: Thu,  8 Jan 2009 23:38:56 +0100
Message-Id: <1231454336-4430-4-git-send-email-marcel@ziswiler.com>
In-Reply-To: <1231454336-4430-3-git-send-email-marcel@ziswiler.com>
References: <1231454336-4430-1-git-send-email-marcel@ziswiler.com>
	<1231454336-4430-2-git-send-email-marcel@ziswiler.com>
	<1231454336-4430-3-git-send-email-marcel@ziswiler.com>
Cc: Marcel Ziswiler <marcel.ziswiler@noser.com>, eric.y.miao@gmail.com,
	Marcel Ziswiler <marcel@ziswiler.com>, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes compilation without MTD partitioning support previously failing.

Acked-by: Eric Miao <eric.miao@marvell.com>
Signed-off-by: Marcel Ziswiler <marcel.ziswiler@noser.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 45122ab..04ba7be 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1161,7 +1161,10 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 		goto fail_free_irq;
 	}
 
-	return add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
+#ifdef CONFIG_MTD_PARTITIONS
+	ret = add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
+#endif
+	return ret;
 
 fail_free_irq:
 	free_irq(IRQ_NAND, info);
@@ -1192,7 +1195,9 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 
 	del_mtd_device(mtd);
+#ifdef CONFIG_MTD_PARTITIONS
 	del_mtd_partitions(mtd);
+#endif
 	free_irq(IRQ_NAND, info);
 	if (use_dma) {
 		pxa_free_dma(info->data_dma_ch);
-- 
1.6.0.6

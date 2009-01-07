Received: from vpn.static.83-173-204-231.cybernet.ch ([83.173.204.231]
	helo=localhost.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKOfJ-0003mG-8t
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 03:01:05 +0000
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] Fix compilation without MTD partitioning support
Date: Wed,  7 Jan 2009 03:40:53 +0100
Message-Id: <1231296053-2378-4-git-send-email-marcel@ziswiler.com>
In-Reply-To: <1231296053-2378-3-git-send-email-marcel@ziswiler.com>
References: <1231296053-2378-1-git-send-email-marcel@ziswiler.com>
	<1231296053-2378-2-git-send-email-marcel@ziswiler.com>
	<1231296053-2378-3-git-send-email-marcel@ziswiler.com>
Cc: eric.y.miao@gmail.com, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes compilation without MTD partitioning support previously failing.

Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index d2da717..90cadc9 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1162,7 +1162,11 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 		goto fail_free_irq;
 	}
 
+#ifdef CONFIG_MTD_PARTITIONS
 	return add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
+#else
+	return 0;
+#endif
 
 fail_free_irq:
 	free_irq(IRQ_NAND, info);
@@ -1193,7 +1197,9 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
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

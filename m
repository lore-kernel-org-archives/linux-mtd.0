Received: from vpn.static.83-173-204-231.cybernet.ch ([83.173.204.231]
	helo=localhost.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKibV-00087o-4p
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 00:18:29 +0000
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3 v2] [MTD] [NAND] pxa3xx_nand.c: Fix compilation without
	MTD partitioning support
Date: Thu,  8 Jan 2009 01:06:40 +0100
Message-Id: <1231373200-19248-4-git-send-email-marcel@ziswiler.com>
In-Reply-To: <1231373200-19248-3-git-send-email-marcel@ziswiler.com>
References: <1231373200-19248-1-git-send-email-marcel@ziswiler.com>
	<1231373200-19248-2-git-send-email-marcel@ziswiler.com>
	<1231373200-19248-3-git-send-email-marcel@ziswiler.com>
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

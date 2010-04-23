Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O5QOC-0005Yn-UJ
	for linux-mtd@lists.infradead.org; Fri, 23 Apr 2010 21:26:22 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Fri, 23 Apr 2010 23:25:44 +0200
Message-Id: <1272057944-19380-1-git-send-email-mkl@pengutronix.de>
Subject: [PATCH] pxa32xx_nand: add support for partition table parsing
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The pxa32xx_nand driver doesn't support partition tables from the
command line. This patch adds support for it.

Please review and consider to apply.

cheers, Marc


>From a2caa92b08351511ee60bd94bf735be5f3a6fb65 Mon Sep 17 00:00:00 2001
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Fri, 23 Apr 2010 10:43:42 +0200
Subject: [PATCH] pxa32xx_nand: add support for partition table parsing

The pxa32xx_nand driver doesn't support partition tables from the
command line. This patch adds support for it.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/mtd/nand/pxa3xx_nand.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 5d55152..e02fa4f 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1320,6 +1320,17 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 		goto fail_free_irq;
 	}
 
+	if (mtd_has_cmdlinepart()) {
+		static const char *probes[] = { "cmdlinepart", NULL };
+		struct mtd_partition *parts;
+		int nr_parts;
+
+		nr_parts = parse_mtd_partitions(mtd, probes, &parts, 0);
+
+		if (nr_parts)
+			return add_mtd_partitions(mtd, parts, nr_parts);
+	}
+
 	return add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
 
 fail_free_irq:
-- 
1.7.0.4

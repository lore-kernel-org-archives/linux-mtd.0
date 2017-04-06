Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwAkG-0005sT-9N
 for linux-mtd@lists.infradead.org; Thu, 06 Apr 2017 16:59:22 +0000
Received: from player731.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id E6BE37A5AE
 for <linux-mtd@lists.infradead.org>; Thu,  6 Apr 2017 18:58:29 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 09/10] mtd: spi-nor: aspeed: link controller with the ahb clock
Date: Thu,  6 Apr 2017 18:56:47 +0200
Message-Id: <1491497808-25487-10-git-send-email-clg@kaod.org>
In-Reply-To: <1491497808-25487-1-git-send-email-clg@kaod.org>
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We will need the AHB frequency to set the HCLK settings in the SMC
controller to optimize the reads.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 3c004dfaf873..1b398303f039 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/bug.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
@@ -119,6 +120,8 @@ struct aspeed_smc_controller {
 	void __iomem *regs;			/* controller registers */
 	void __iomem *ahb_base;			/* per-chip windows resource */
 
+	struct clk *ahb_clk;
+
 	/* interrupt handling */
 	int irq;
 
@@ -1107,6 +1110,10 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 	if (IS_ERR(controller->ahb_base))
 		return PTR_ERR(controller->ahb_base);
 
+	controller->ahb_clk = devm_clk_get(&pdev->dev, "ahb");
+	if (IS_ERR(controller->ahb_clk))
+		return PTR_ERR(controller->ahb_clk);
+
 	aspeed_smc_dma_setup(controller, pdev);
 
 	ret = aspeed_smc_setup_flash(controller, np, res);
-- 
2.7.4

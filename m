Received: from 14.mo6.mail-out.ovh.net ([46.105.56.113])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWKyJ-0004gK-3I
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2018 12:15:47 +0000
Received: from player792.ha.ovh.net (unknown [10.109.105.105])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 934AA1660AD
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2018 14:15:09 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-aspeed@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/4] mtd: spi-nor: aspeed: retrieve the ABH clock frequency
Date: Fri, 22 Jun 2018 14:14:16 +0200
Message-Id: <20180622121417.6762-4-clg@kaod.org>
In-Reply-To: <20180622121417.6762-1-clg@kaod.org>
References: <20180622121417.6762-1-clg@kaod.org>
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

We will need the AHB frequency to set the SPI clock frequency to
perform the SPI calibration sequence and optimize the controller
settings for the fast reads.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 054614f34698..0251724eeecb 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/bug.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -113,6 +114,8 @@ struct aspeed_smc_controller {
 	void __iomem *ahb_base;			/* per-chip windows resource */
 	u32 ahb_window_size;			/* full mapping window size */
 
+	unsigned long	clk_frequency;
+
 	struct aspeed_smc_chip *chips[0];	/* pointers to attached chips */
 };
 
@@ -911,6 +914,7 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 	struct aspeed_smc_controller *controller;
 	const struct of_device_id *match;
 	const struct aspeed_smc_info *info;
+	struct clk *clk;
 	struct resource *res;
 	int ret;
 
@@ -942,6 +946,12 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 
 	controller->ahb_window_size = resource_size(res);
 
+	clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+	controller->clk_frequency = clk_get_rate(clk);
+	devm_clk_put(&pdev->dev, clk);
+
 	ret = aspeed_smc_setup_flash(controller, np, res);
 	if (ret)
 		dev_err(dev, "Aspeed SMC probe failed %d\n", ret);
-- 
2.13.6

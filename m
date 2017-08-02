Received: from 2.mo178.mail-out.ovh.net ([46.105.39.61])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcpON-0005Il-El
 for linux-mtd@lists.infradead.org; Wed, 02 Aug 2017 08:52:37 +0000
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 966B44B35A
 for <linux-mtd@lists.infradead.org>; Wed,  2 Aug 2017 10:52:10 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] mtd: spi-nor: aspeed: set 4B setting for all chips
Date: Wed,  2 Aug 2017 10:51:51 +0200
Message-Id: <1501663911-26532-1-git-send-email-clg@kaod.org>
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

The driver made the wrong assumption that the 4B setting was
autodetected for all chips of the AST2500 FMC flash controller. This
is only the case for the CS0.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 23622bf62b6b..1b76fe14a435 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -794,19 +794,18 @@ static void aspeed_smc_chip_set_type(struct aspeed_smc_chip *chip, int type)
 }
 
 /*
- * The AST2500 FMC flash controller should be strapped by hardware, or
- * autodetected, but the AST2500 SPI flash needs to be set.
+ * The first chip of the AST2500 FMC flash controller is strapped by
+ * hardware, or autodetected, but other chips need to be set. Enforce
+ * the 4B setting for all chips.
  */
 static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
 {
 	struct aspeed_smc_controller *controller = chip->controller;
 	u32 reg;
 
-	if (chip->controller->info == &spi_2500_info) {
-		reg = readl(controller->regs + CE_CONTROL_REG);
-		reg |= 1 << chip->cs;
-		writel(reg, controller->regs + CE_CONTROL_REG);
-	}
+	reg = readl(controller->regs + CE_CONTROL_REG);
+	reg |= 1 << chip->cs;
+	writel(reg, controller->regs + CE_CONTROL_REG);
 }
 
 /*
-- 
2.7.5

Received: from 15.mo5.mail-out.ovh.net ([178.33.107.29])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFONd-0007sK-03
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2016 16:50:43 +0000
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 6FC7353640
 for <linux-mtd@lists.infradead.org>; Fri,  9 Dec 2016 17:50:18 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 2/5] mtd: aspeed: add memory controllers for the Aspeed
 AST2400 SoC
Date: Fri,  9 Dec 2016 17:49:24 +0100
Message-Id: <1481302167-28044-3-git-send-email-clg@kaod.org>
In-Reply-To: <1481302167-28044-1-git-send-email-clg@kaod.org>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
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

This driver adds mtd support for the Aspeed AST2400 SoC static memory
controllers:

 * New Static Memory Controller (referred as FMC)
   . BMC firmware
   . AST2500 compatible register set
   . 5 chip select pins (CE0 ∼ CE4)
   . supports NOR flash, NAND flash and SPI flash memory.

 * SPI Flash Controller (SPI)
   . host Firmware
   . slightly different register set, between AST2500 and the legacy
     controller
   . supports SPI flash memory
   . 1 chip select pin (CE0)

The legacy static memory controller (referred as SMC) is not
supported, as well as types other than SPI.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/Kconfig      |  2 +-
 drivers/mtd/spi-nor/aspeed-smc.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 5c0efbd9dd89..22bea563f9bc 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -35,7 +35,7 @@ config SPI_ASPEED
 	depends on HAS_IOMEM && OF
 	help
 	  This enables support for the Firmware Memory controller (FMC)
-	  in the Aspeed AST2500 SoC when attached to SPI NOR chips,
+	  in the Aspeed AST2500/AST2400 SoCs when attached to SPI NOR chips,
 	  and support for the SPI flash memory controller (SPI) for
 	  the host firmware. The implementation only supports SPI NOR.
 
diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 6f9244f07aef..99302b0d7786 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -119,8 +119,27 @@ struct aspeed_smc_info {
 	void (*set_4b)(struct aspeed_smc_chip *chip);
 };
 
+static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip);
 static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
 
+static const struct aspeed_smc_info fmc_2400_info = {
+	.maxsize = 64 * 1024 * 1024,
+	.nce = 5,
+	.hastype = true,
+	.we0 = 16,
+	.ctl0 = 0x10,
+	.set_4b = aspeed_smc_chip_set_4b,
+};
+
+static const struct aspeed_smc_info spi_2400_info = {
+	.maxsize = 64 * 1024 * 1024,
+	.nce = 1,
+	.hastype = false,
+	.we0 = 0,
+	.ctl0 = 0x04,
+	.set_4b = aspeed_smc_chip_set_4b_spi_2400,
+};
+
 static const struct aspeed_smc_info fmc_2500_info = {
 	.maxsize = 256 * 1024 * 1024,
 	.nce = 3,
@@ -210,6 +229,7 @@ struct aspeed_smc_controller {
 #define CONTROL_IO_DUMMY_HI		BIT(14)
 #define CONTROL_IO_DUMMY_HI_SHIFT	14
 #define CONTROL_CLK_DIV4		BIT(13) /* others */
+#define CONTROL_IO_ADDRESS_4B		BIT(13) /* AST2400 SPI */
 #define CONTROL_RW_MERGE		BIT(12)
 #define CONTROL_IO_DUMMY_LO_SHIFT	6
 #define CONTROL_IO_DUMMY_LO		GENMASK(7, \
@@ -406,6 +426,8 @@ static int aspeed_smc_remove(struct platform_device *dev)
 }
 
 static const struct of_device_id aspeed_smc_matches[] = {
+	{ .compatible = "aspeed,ast2400-fmc", .data = &fmc_2400_info },
+	{ .compatible = "aspeed,ast2400-spi", .data = &spi_2400_info },
 	{ .compatible = "aspeed,ast2500-fmc", .data = &fmc_2500_info },
 	{ .compatible = "aspeed,ast2500-spi", .data = &spi_2500_info },
 	{ }
@@ -479,6 +501,17 @@ static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
 	}
 }
 
+/*
+ * The AST2400 SPI flash controller does not have a CE Control
+ * register. It uses the CE0 control register to set 4Byte mode at the
+ * controller level.
+ */
+static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip)
+{
+	chip->ctl_val[smc_base] |= CONTROL_IO_ADDRESS_4B;
+	chip->ctl_val[smc_read] |= CONTROL_IO_ADDRESS_4B;
+}
+
 static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 				      struct resource *res)
 {
-- 
2.7.4

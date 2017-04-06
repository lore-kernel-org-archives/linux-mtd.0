Received: from 6.mo2.mail-out.ovh.net ([87.98.165.38])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwAjw-0005iX-OW
 for linux-mtd@lists.infradead.org; Thu, 06 Apr 2017 16:58:48 +0000
Received: from player731.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 7CF587A4E7
 for <linux-mtd@lists.infradead.org>; Thu,  6 Apr 2017 18:58:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 07/10] mtd: spi-nor: aspeed: configure chip window on AHB bus
Date: Thu,  6 Apr 2017 18:56:45 +0200
Message-Id: <1491497808-25487-8-git-send-email-clg@kaod.org>
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

The segment registers of the SMC controller provide a way to configure
the mapping windows of the chips on the AHB bus. The settings are
required to be correct when the controller operates in Command mode,
which is the case for DMAs and the LPC mapping.

This tries to set the segment registers of each chip depending on the
size of the flash device and depending on the previous segment
settings, in order to have a contiguous window across multiple chip.

Unfortunately, the AST2500 SPI controller has a bug and it is not
possible to configure a full 128MB window for a chip of the same
size. The window size needs to be restricted to 120MB. This issue only
applies to CE0.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 124 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index b3c8cfe29765..336a1ddd100b 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -104,6 +104,7 @@ struct aspeed_smc_chip {
 	struct aspeed_smc_controller *controller;
 	void __iomem *ctl;			/* control register */
 	void __iomem *ahb_base;			/* base of chip window */
+	u32 ahb_window_size;			/* chip window size */
 	unsigned long phys_base;		/* physical address of window */
 	u32 ctl_val[smc_max];			/* control settings */
 	enum aspeed_smc_flash_type type;	/* what type of flash */
@@ -218,6 +219,10 @@ struct aspeed_smc_controller {
 #define SEGMENT_ADDR_REG0		0x30
 #define SEGMENT_ADDR_START(_r)		((((_r) >> 16) & 0xFF) << 23)
 #define SEGMENT_ADDR_END(_r)		((((_r) >> 24) & 0xFF) << 23)
+#define SEGMENT_ADDR_VALUE(start, end)					\
+	(((((start) >> 23) & 0xFF) << 16) | ((((end) >> 23) & 0xFF) << 24))
+#define SEGMENT_ADDR_REG(controller, cs)	\
+	((controller)->regs + SEGMENT_ADDR_REG0 + (cs) * 4)
 
 /* DMA Registers */
 #define DMA_CONTROL_REG			0x80
@@ -604,8 +609,7 @@ static void __iomem *aspeed_smc_chip_base(struct aspeed_smc_chip *chip,
 	u32 reg;
 
 	if (controller->info->nce > 1) {
-		reg = readl(controller->regs + SEGMENT_ADDR_REG0 +
-			    chip->cs * 4);
+		reg = readl(SEGMENT_ADDR_REG(controller, chip->cs));
 
 		if (SEGMENT_ADDR_START(reg) >= SEGMENT_ADDR_END(reg))
 			return NULL;
@@ -616,6 +620,111 @@ static void __iomem *aspeed_smc_chip_base(struct aspeed_smc_chip *chip,
 	return controller->ahb_base + offset;
 }
 
+static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 start,
+			    u32 size)
+{
+	struct aspeed_smc_controller *controller = chip->controller;
+	void __iomem *seg_reg;
+	u32 oldval, newval, val0, start0, end;
+
+	val0 = readl(SEGMENT_ADDR_REG(controller, 0));
+	start0 = SEGMENT_ADDR_START(val0);
+
+	seg_reg = SEGMENT_ADDR_REG(controller, cs);
+	oldval = readl(seg_reg);
+
+	/* If the chip size is not specified, use the default segment
+	 * size, but take into account the possible overlap with the
+	 * previous segment
+	 */
+	if (!size)
+		size = SEGMENT_ADDR_END(oldval) - start;
+
+	/* The segment cannot exceed the maximum window size of the
+	 * controller.
+	 */
+	if (start + size > start0 + controller->info->maxsize) {
+		size = start0 + controller->info->maxsize - start;
+		dev_warn(chip->nor.dev, "CE%d window resized to %dMB",
+			 cs, size >> 20);
+	}
+
+	end = start + size;
+	newval = SEGMENT_ADDR_VALUE(start, end);
+	writel(newval, seg_reg);
+
+	/* Restore default value if something goes wrong. The chip
+	 * might have set some bogus value and we would loose access
+	 * to the chip.
+	 */
+	if (newval != readl(seg_reg)) {
+		dev_err(chip->nor.dev, "CE%d window invalid", cs);
+		writel(oldval, seg_reg);
+		start = SEGMENT_ADDR_START(oldval);
+		end = SEGMENT_ADDR_END(oldval);
+		size = end - start;
+	}
+
+	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x- 0x%.8x ] %dMB",
+		 cs, start, end, size >> 20);
+
+	return size;
+}
+
+/*
+ * This is expected to be called in increasing CE order
+ */
+static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
+{
+	struct aspeed_smc_controller *controller = chip->controller;
+	u32  val0, start0, start;
+	u32 size = chip->nor.mtd.size;
+
+	/* The AST2500 SPI controller has a bug when the CE0 chip size
+	 * exceeds 120MB.
+	 */
+	if (chip->cs == 0 && controller->info == &spi_2500_info &&
+	    size == (128 << 20)) {
+		size = 120 << 20;
+		dev_info(chip->nor.dev,
+			 "CE%d window resized to %dMB (AST2500 HW quirk)",
+			 chip->cs, size >> 20);
+	}
+
+	val0 = readl(SEGMENT_ADDR_REG(controller, 0));
+	start0 = SEGMENT_ADDR_START(val0);
+
+	/* As a start address for the current segment, use the default
+	 * start address if we are handling CE0 or use the previous
+	 * segment ending address
+	 */
+	if (chip->cs) {
+		u32 prev = readl(SEGMENT_ADDR_REG(controller, chip->cs - 1));
+
+		start = SEGMENT_ADDR_END(prev);
+	} else
+		start = start0;
+
+	size = chip_set_segment(chip, chip->cs, start, size);
+
+	/* Update chip base address on the AHB bus */
+	chip->ahb_base = controller->ahb_base + (start - start0);
+
+	if (size < chip->nor.mtd.size)
+		dev_warn(chip->nor.dev,
+			 "CE%d window too small for chip %dMB",
+			 chip->cs, (u32) chip->nor.mtd.size >> 20);
+
+	/* Make sure the next segment does not overlap with the
+	 * current one we just configured even if there is no
+	 * available chip. That could break access in Command Mode.
+	 */
+	if (chip->cs < controller->info->nce - 1)
+		chip_set_segment(chip, chip->cs + 1, start + size, 0);
+
+	return size;
+}
+
 static void aspeed_smc_chip_enable_write(struct aspeed_smc_chip *chip)
 {
 	struct aspeed_smc_controller *controller = chip->controller;
@@ -689,7 +798,7 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 	 */
 	chip->ahb_base = aspeed_smc_chip_base(chip, res);
 	if (!chip->ahb_base) {
-		dev_warn(chip->nor.dev, "CE segment window closed.\n");
+		dev_warn(chip->nor.dev, "CE%d window closed", chip->cs);
 		return -EINVAL;
 	}
 
@@ -738,6 +847,15 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	if (chip->nor.addr_width == 4 && info->set_4b)
 		info->set_4b(chip);
 
+	/* This is for direct AHB access when using Command Mode. For
+	 * the AST2400 SPI controller which only handles one chip,
+	 * let's use the full window.
+	 */
+	if (controller->info->nce == 1)
+		chip->ahb_window_size = info->maxsize;
+	else
+		chip->ahb_window_size = aspeed_smc_chip_set_segment(chip);
+
 	/*
 	 * base mode has not been optimized yet. use it for writes.
 	 */
-- 
2.7.4

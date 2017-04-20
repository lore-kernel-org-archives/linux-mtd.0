Received: from 6.mo4.mail-out.ovh.net ([188.165.36.253])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1AiS-0003lv-5z
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 11:57:47 +0000
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id B6C295F71F
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 13:57:21 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/4] mtd: spi-nor: aspeed: configure chip window on AHB bus
Date: Thu, 20 Apr 2017 13:56:36 +0200
Message-Id: <1492689397-4704-4-git-send-email-clg@kaod.org>
In-Reply-To: <1492689397-4704-1-git-send-email-clg@kaod.org>
References: <1492689397-4704-1-git-send-email-clg@kaod.org>
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
settings, in order to have a contiguous window across multiple chips.

Unfortunately, the AST2500 SPI controller has a bug and it is not
possible to configure a full 128MB window for a chip of the same
size. The window size needs to be restricted to 120MB. This issue only
applies to CE0.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 Changes since initial version :

 - fixed comments
 - renamed variables to be more explicit
 - introduced aspeed_smc_ahb_base_phy()
 - slightly reworked the code for the AST2400 SPI support 
 - introduced a 'ahb_window_size' field in the controller holding the
   size of the overall AHB window.
 
 drivers/mtd/spi-nor/aspeed-smc.c | 156 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 153 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 183d950e621b..60c020482946 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -97,6 +97,7 @@ struct aspeed_smc_chip {
 	struct aspeed_smc_controller *controller;
 	void __iomem *ctl;			/* control register */
 	void __iomem *ahb_base;			/* base of chip window */
+	u32 ahb_window_size;			/* chip mapping window size */
 	u32 ctl_val[smc_max];			/* control settings */
 	enum aspeed_smc_flash_type type;	/* what type of flash */
 	struct spi_nor nor;
@@ -109,6 +110,7 @@ struct aspeed_smc_controller {
 	const struct aspeed_smc_info *info;	/* type info of controller */
 	void __iomem *regs;			/* controller registers */
 	void __iomem *ahb_base;			/* per-chip windows resource */
+	u32 ahb_window_size;			/* full mapping window size */
 
 	struct aspeed_smc_chip *chips[0];	/* pointers to attached chips */
 };
@@ -193,6 +195,10 @@ struct aspeed_smc_controller {
 #define SEGMENT_ADDR_REG0		0x30
 #define SEGMENT_ADDR_START(_r)		((((_r) >> 16) & 0xFF) << 23)
 #define SEGMENT_ADDR_END(_r)		((((_r) >> 24) & 0xFF) << 23)
+#define SEGMENT_ADDR_VALUE(start, end)					\
+	(((((start) >> 23) & 0xFF) << 16) | ((((end) >> 23) & 0xFF) << 24))
+#define SEGMENT_ADDR_REG(controller, cs)	\
+	((controller)->regs + SEGMENT_ADDR_REG0 + (cs) * 4)
 
 /*
  * In user mode all data bytes read or written to the chip decode address
@@ -446,8 +452,7 @@ static void __iomem *aspeed_smc_chip_base(struct aspeed_smc_chip *chip,
 	u32 reg;
 
 	if (controller->info->nce > 1) {
-		reg = readl(controller->regs + SEGMENT_ADDR_REG0 +
-			    chip->cs * 4);
+		reg = readl(SEGMENT_ADDR_REG(controller, chip->cs));
 
 		if (SEGMENT_ADDR_START(reg) >= SEGMENT_ADDR_END(reg))
 			return NULL;
@@ -458,6 +463,146 @@ static void __iomem *aspeed_smc_chip_base(struct aspeed_smc_chip *chip,
 	return controller->ahb_base + offset;
 }
 
+static u32 aspeed_smc_ahb_base_phy(struct aspeed_smc_controller *controller)
+{
+	u32 seg0_val = readl(SEGMENT_ADDR_REG(controller, 0));
+
+	return SEGMENT_ADDR_START(seg0_val);
+}
+
+static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 start,
+			    u32 size)
+{
+	struct aspeed_smc_controller *controller = chip->controller;
+	void __iomem *seg_reg;
+	u32 seg_oldval, seg_newval, ahb_base_phy, end;
+
+	ahb_base_phy = aspeed_smc_ahb_base_phy(controller);
+
+	seg_reg = SEGMENT_ADDR_REG(controller, cs);
+	seg_oldval = readl(seg_reg);
+
+	/*
+	 * If the chip size is not specified, use the default segment
+	 * size, but take into account the possible overlap with the
+	 * previous segment
+	 */
+	if (!size)
+		size = SEGMENT_ADDR_END(seg_oldval) - start;
+
+	/*
+	 * The segment cannot exceed the maximum window size of the
+	 * controller.
+	 */
+	if (start + size > ahb_base_phy + controller->ahb_window_size) {
+		size = ahb_base_phy + controller->ahb_window_size - start;
+		dev_warn(chip->nor.dev, "CE%d window resized to %dMB",
+			 cs, size >> 20);
+	}
+
+	end = start + size;
+	seg_newval = SEGMENT_ADDR_VALUE(start, end);
+	writel(seg_newval, seg_reg);
+
+	/*
+	 * Restore default value if something goes wrong. The chip
+	 * might have set some bogus value and we would loose access
+	 * to the chip.
+	 */
+	if (seg_newval != readl(seg_reg)) {
+		dev_err(chip->nor.dev, "CE%d window invalid", cs);
+		writel(seg_oldval, seg_reg);
+		start = SEGMENT_ADDR_START(seg_oldval);
+		end = SEGMENT_ADDR_END(seg_oldval);
+		size = end - start;
+	}
+
+	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB",
+		 cs, start, end, size >> 20);
+
+	return size;
+}
+
+/*
+ * The segment register defines the mapping window on the AHB bus and
+ * it needs to be configured depending on the chip size. The segment
+ * register of the following CE also needs to be tuned in order to
+ * provide a contiguous window across multiple chips.
+ *
+ * This is expected to be called in increasing CE order
+ */
+static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
+{
+	struct aspeed_smc_controller *controller = chip->controller;
+	u32 ahb_base_phy, start;
+	u32 size = chip->nor.mtd.size;
+
+	/*
+	 * Each controller has a chip size limit for direct memory
+	 * access
+	 */
+	if (size > controller->info->maxsize)
+		size = controller->info->maxsize;
+
+	/*
+	 * The AST2400 SPI controller only handles one chip and does
+	 * not have segment registers. Let's use the chip size for the
+	 * AHB window.
+	 */
+	if (controller->info == &spi_2400_info)
+		goto out;
+
+	/*
+	 * The AST2500 SPI controller has a HW bug when the CE0 chip
+	 * size reaches 128MB. Enforce a size limit of 120MB to
+	 * prevent the controller from using bogus settings in the
+	 * segment register.
+	 */
+	if (chip->cs == 0 && controller->info == &spi_2500_info &&
+	    size == SZ_128M) {
+		size = 120 << 20;
+		dev_info(chip->nor.dev,
+			 "CE%d window resized to %dMB (AST2500 HW quirk)",
+			 chip->cs, size >> 20);
+	}
+
+	ahb_base_phy = aspeed_smc_ahb_base_phy(controller);
+
+	/*
+	 * As a start address for the current segment, use the default
+	 * start address if we are handling CE0 or use the previous
+	 * segment ending address
+	 */
+	if (chip->cs) {
+		u32 prev = readl(SEGMENT_ADDR_REG(controller, chip->cs - 1));
+
+		start = SEGMENT_ADDR_END(prev);
+	} else {
+		start = ahb_base_phy;
+	}
+
+	size = chip_set_segment(chip, chip->cs, start, size);
+
+	/* Update chip base address on the AHB bus */
+	chip->ahb_base = controller->ahb_base + (start - ahb_base_phy);
+
+	/*
+	 * Now, make sure the next segment does not overlap with the
+	 * current one we just configured, even if there is no
+	 * available chip. That could break access in Command Mode.
+	 */
+	if (chip->cs < controller->info->nce - 1)
+		chip_set_segment(chip, chip->cs + 1, start + size, 0);
+
+out:
+	if (size < chip->nor.mtd.size)
+		dev_warn(chip->nor.dev,
+			 "CE%d window too small for chip %dMB",
+			 chip->cs, (u32)chip->nor.mtd.size >> 20);
+
+	return size;
+}
+
 static void aspeed_smc_chip_enable_write(struct aspeed_smc_chip *chip)
 {
 	struct aspeed_smc_controller *controller = chip->controller;
@@ -531,7 +676,7 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 	 */
 	chip->ahb_base = aspeed_smc_chip_base(chip, res);
 	if (!chip->ahb_base) {
-		dev_warn(chip->nor.dev, "CE segment window closed.\n");
+		dev_warn(chip->nor.dev, "CE%d window closed", chip->cs);
 		return -EINVAL;
 	}
 
@@ -578,6 +723,9 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	if (chip->nor.addr_width == 4 && info->set_4b)
 		info->set_4b(chip);
 
+	/* This is for direct AHB access when using Command Mode. */
+	chip->ahb_window_size = aspeed_smc_chip_set_segment(chip);
+
 	/*
 	 * base mode has not been optimized yet. use it for writes.
 	 */
@@ -739,6 +887,8 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 	if (IS_ERR(controller->ahb_base))
 		return PTR_ERR(controller->ahb_base);
 
+	controller->ahb_window_size = resource_size(res);
+
 	ret = aspeed_smc_setup_flash(controller, np, res);
 	if (ret)
 		dev_err(dev, "Aspeed SMC probe failed %d\n", ret);
-- 
2.7.4

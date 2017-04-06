Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwAkN-0000vQ-IY
 for linux-mtd@lists.infradead.org; Thu, 06 Apr 2017 16:59:02 +0000
Received: from player731.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 280767A534
 for <linux-mtd@lists.infradead.org>; Thu,  6 Apr 2017 18:58:39 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 10/10] mtd: spi-nor: aspeed: optimize read mode
Date: Thu,  6 Apr 2017 18:56:48 +0200
Message-Id: <1491497808-25487-11-git-send-email-clg@kaod.org>
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

This is only for SPI controllers as U-Boot should have done it already
for the FMC controller using DMAs.

The algo is based on the one found in the OpenPOWER pflash tool. It
first reads a golden buffer at low speed and then performs reads with
different clocks and delay cycles settings to find the fastest
configuration for the chip.

It can be deactivated at boot time with the kernel parameter :

	aspeed_smc.optimize_read=0

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 191 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 1b398303f039..875b029198fc 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -22,6 +22,7 @@
 #include <linux/mtd/spi-nor.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
 
 #define DEVICE_NAME	"aspeed-smc"
@@ -43,13 +44,17 @@ struct aspeed_smc_info {
 	bool hastype;		/* flash type field exists in config reg */
 	u8 we0;			/* shift for write enable bit for CE0 */
 	u8 ctl0;		/* offset in regs of ctl for CE0 */
+	u8 timing;		/* offset in regs of timing */
 	bool has_dma;
 
 	void (*set_4b)(struct aspeed_smc_chip *chip);
+	int (*optimize_read)(struct aspeed_smc_chip *chip, u32 max_freq);
 };
 
 static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip);
 static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
+static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
+				     u32 max_freq);
 
 static const struct aspeed_smc_info fmc_2400_info = {
 	.maxsize = 256 * 1024 * 1024,
@@ -57,6 +62,7 @@ static const struct aspeed_smc_info fmc_2400_info = {
 	.hastype = true,
 	.we0 = 16,
 	.ctl0 = 0x10,
+	.timing = 0x94,
 	.has_dma = true,
 	.set_4b = aspeed_smc_chip_set_4b,
 };
@@ -67,8 +73,10 @@ static const struct aspeed_smc_info spi_2400_info = {
 	.hastype = false,
 	.we0 = 0,
 	.ctl0 = 0x04,
+	.timing = 0x94,
 	.has_dma = false,
 	.set_4b = aspeed_smc_chip_set_4b_spi_2400,
+	.optimize_read = aspeed_smc_optimize_read,
 };
 
 static const struct aspeed_smc_info fmc_2500_info = {
@@ -77,6 +85,7 @@ static const struct aspeed_smc_info fmc_2500_info = {
 	.hastype = true,
 	.we0 = 16,
 	.ctl0 = 0x10,
+	.timing = 0x94,
 	.has_dma = true,
 	.set_4b = aspeed_smc_chip_set_4b,
 };
@@ -87,8 +96,10 @@ static const struct aspeed_smc_info spi_2500_info = {
 	.hastype = false,
 	.we0 = 16,
 	.ctl0 = 0x10,
+	.timing = 0x94,
 	.has_dma = false,
 	.set_4b = aspeed_smc_chip_set_4b,
+	.optimize_read = aspeed_smc_optimize_read,
 };
 
 enum aspeed_smc_ctl_reg_value {
@@ -249,6 +260,12 @@ module_param(min_dma_size, uint, 0644);
 static unsigned int dma_timeout = 200;
 module_param(dma_timeout, uint, 0644);
 
+/*
+ * Switch to turn off read optimisation if needed
+ */
+static bool optimize_read = true;
+module_param(optimize_read, bool, 0644);
+
 static void aspeed_smc_dma_done(struct aspeed_smc_controller *controller)
 {
 	writel(0, controller->regs + INTERRUPT_STATUS_REG);
@@ -865,6 +882,174 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 	return 0;
 }
 
+
+#define CALIBRATE_BUF_SIZE 16384
+
+static bool aspeed_smc_check_reads(struct aspeed_smc_chip *chip,
+				  const u8 *golden_buf, u8 *test_buf)
+{
+	int i;
+
+	for (i = 0; i < 10; i++) {
+		aspeed_smc_read_from_ahb(test_buf, chip->ahb_base,
+					 CALIBRATE_BUF_SIZE);
+		if (memcmp(test_buf, golden_buf, CALIBRATE_BUF_SIZE) != 0)
+			return false;
+	}
+	return true;
+}
+
+static int aspeed_smc_calibrate_reads(struct aspeed_smc_chip *chip, u32 hdiv,
+				      const u8 *golden_buf, u8 *test_buf)
+{
+	struct aspeed_smc_controller *controller = chip->controller;
+	const struct aspeed_smc_info *info = controller->info;
+	int i;
+	int good_pass = -1, pass_count = 0;
+	u32 shift = (hdiv - 1) << 2;
+	u32 mask = ~(0xfu << shift);
+	u32 fread_timing_val = 0;
+
+#define FREAD_TPASS(i)	(((i) / 2) | (((i) & 1) ? 0 : 8))
+
+	/* Try HCLK delay 0..5, each one with/without delay and look for a
+	 * good pair.
+	 */
+	for (i = 0; i < 12; i++) {
+		bool pass;
+
+		fread_timing_val &= mask;
+		fread_timing_val |= FREAD_TPASS(i) << shift;
+
+		writel(fread_timing_val, controller->regs + info->timing);
+		pass = aspeed_smc_check_reads(chip, golden_buf, test_buf);
+		dev_dbg(chip->nor.dev,
+			"  * [%08x] %d HCLK delay, %dns DI delay : %s",
+			fread_timing_val, i/2, (i & 1) ? 0 : 4,
+			pass ? "PASS" : "FAIL");
+		if (pass) {
+			pass_count++;
+			if (pass_count == 3) {
+				good_pass = i - 1;
+				break;
+			}
+		} else
+			pass_count = 0;
+	}
+
+	/* No good setting for this frequency */
+	if (good_pass < 0)
+		return -1;
+
+	/* We have at least one pass of margin, let's use first pass */
+	fread_timing_val &= mask;
+	fread_timing_val |= FREAD_TPASS(good_pass) << shift;
+	writel(fread_timing_val, controller->regs + info->timing);
+	dev_dbg(chip->nor.dev, " * -> good is pass %d [0x%08x]",
+		good_pass, fread_timing_val);
+	return 0;
+}
+
+static bool aspeed_smc_check_calib_data(const u8 *test_buf, u32 size)
+{
+	const u32 *tb32 = (const u32 *) test_buf;
+	u32 i, cnt = 0;
+
+	/* We check if we have enough words that are neither all 0
+	 * nor all 1's so the calibration can be considered valid.
+	 *
+	 * I use an arbitrary threshold for now of 64
+	 */
+	size >>= 2;
+	for (i = 0; i < size; i++) {
+		if (tb32[i] != 0 && tb32[i] != 0xffffffff)
+			cnt++;
+	}
+	return cnt >= 64;
+}
+
+static const uint32_t aspeed_smc_hclk_divs[] = {
+	0xf, /* HCLK */
+	0x7, /* HCLK/2 */
+	0xe, /* HCLK/3 */
+	0x6, /* HCLK/4 */
+	0xd, /* HCLK/5 */
+};
+#define ASPEED_SMC_HCLK_DIV(i) (aspeed_smc_hclk_divs[(i) - 1] << 8)
+
+static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
+				     u32 max_freq)
+{
+	u8 *golden_buf, *test_buf;
+	int i, rc, best_div = -1;
+	u32 save_read_val = chip->ctl_val[smc_read];
+	u32 ahb_freq = clk_get_rate(chip->controller->ahb_clk);
+
+	dev_dbg(chip->nor.dev, "AHB frequency: %d MHz", ahb_freq / 1000000);
+
+	test_buf = kmalloc(CALIBRATE_BUF_SIZE * 2, GFP_KERNEL);
+	golden_buf = test_buf + CALIBRATE_BUF_SIZE;
+
+	/* We start with the dumbest setting (keep 4Byte bit) and read
+	 * some data
+	 */
+	chip->ctl_val[smc_read] = (chip->ctl_val[smc_read] & 0x2000) |
+		(0x00 << 28) | /* Single bit */
+		(0x00 << 24) | /* CE# max */
+		(0x03 << 16) | /* use normal reads */
+		(0x00 <<  8) | /* HCLK/16 */
+		(0x00 <<  6) | /* no dummy cycle */
+		(0x00);        /* normal read */
+
+	writel(chip->ctl_val[smc_read], chip->ctl);
+
+	aspeed_smc_read_from_ahb(golden_buf, chip->ahb_base,
+				 CALIBRATE_BUF_SIZE);
+
+	/* Establish our read mode with freq field set to 0 (HCLK/16) */
+	chip->ctl_val[smc_read] = save_read_val & 0xfffff0ff;
+
+	/* Check if calibration data is suitable */
+	if (!aspeed_smc_check_calib_data(golden_buf, CALIBRATE_BUF_SIZE)) {
+		dev_info(chip->nor.dev,
+			 "Calibration area too uniform, using low speed");
+		writel(chip->ctl_val[smc_read], chip->ctl);
+		kfree(test_buf);
+		return 0;
+	}
+
+	/* Now we iterate the HCLK dividers until we find our breaking point */
+	for (i = ARRAY_SIZE(aspeed_smc_hclk_divs); i > 0; i--) {
+		u32 tv, freq;
+
+		/* Compare timing to max */
+		freq = ahb_freq / i;
+		if (freq >= max_freq)
+			continue;
+
+		/* Set the timing */
+		tv = chip->ctl_val[smc_read] | ASPEED_SMC_HCLK_DIV(i);
+		writel(tv, chip->ctl);
+		dev_dbg(chip->nor.dev, "Trying HCLK/%d...", i);
+		rc = aspeed_smc_calibrate_reads(chip, i, golden_buf, test_buf);
+		if (rc == 0)
+			best_div = i;
+	}
+	kfree(test_buf);
+
+	/* Nothing found ? */
+	if (best_div < 0)
+		dev_warn(chip->nor.dev, "No good frequency, using dumb slow");
+	else {
+		dev_dbg(chip->nor.dev, "Found good read timings at HCLK/%d",
+			best_div);
+		chip->ctl_val[smc_read] |= ASPEED_SMC_HCLK_DIV(best_div);
+	}
+
+	writel(chip->ctl_val[smc_read], chip->ctl);
+	return 0;
+}
+
 static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 {
 	struct aspeed_smc_controller *controller = chip->controller;
@@ -918,6 +1103,12 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 
 	dev_dbg(controller->dev, "read control register: %08x\n",
 		chip->ctl_val[smc_read]);
+
+	/*
+	 * TODO: get max freq from chip
+	 */
+	if (optimize_read && info->optimize_read)
+		info->optimize_read(chip, 104000000);
 	return 0;
 }
 
-- 
2.7.4

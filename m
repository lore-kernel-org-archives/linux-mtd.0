Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eSR8A-00010N-KZ
 for linux-mtd@lists.infradead.org; Fri, 22 Dec 2017 17:29:14 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Han Xu <han.xu@nxp.com>
Cc: linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH 2/2] mtd: nand: gpmi: Support ->setup_data_interface()
Date: Fri, 22 Dec 2017 18:28:53 +0100
Message-Id: <20171222172853.27710-3-miquel.raynal@free-electrons.com>
In-Reply-To: <20171222172853.27710-1-miquel.raynal@free-electrons.com>
References: <20171222172853.27710-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Until now the GPMI driver had its own timings logic while the core
already handles that and request the NAND controller drivers to support
the ->setup_data_interface() hook. Implement that hook by reusing the
already existing function. No real glue is necessary between core timing
delays and GPMI registers because the driver already translates the
ONFI timing modes into register values.

Make use of the core's tREA, tRLOH and tRHOH values that allow computing
more precise timings for mode [0-3] and get significantly better values
(+20% with an i.MX6 Sabre Auto board). Otherwise use the existing logic.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 266 ++++++++++-----------------------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  33 ++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 146 +++++++++---------
 3 files changed, 168 insertions(+), 277 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 97787246af41..ae47cd8414bf 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -151,8 +151,15 @@ static int __gpmi_enable_clk(struct gpmi_nand_data *this, bool v)
 	return ret;
 }
 
-#define gpmi_enable_clk(x) __gpmi_enable_clk(x, true)
-#define gpmi_disable_clk(x) __gpmi_enable_clk(x, false)
+inline int gpmi_enable_clk(struct gpmi_nand_data *this)
+{
+	return __gpmi_enable_clk(this, true);
+}
+
+inline int gpmi_disable_clk(struct gpmi_nand_data *this)
+{
+	return __gpmi_enable_clk(this, false);
+}
 
 int gpmi_init(struct gpmi_nand_data *this)
 {
@@ -326,11 +333,11 @@ static unsigned int ns_to_cycles(unsigned int time,
 #define DEF_MIN_PROP_DELAY	5
 #define DEF_MAX_PROP_DELAY	9
 /* Apply timing to current hardware conditions. */
-static int gpmi_nfc_compute_hardware_timing(struct gpmi_nand_data *this,
-					struct gpmi_nfc_hardware_timing *hw)
+static void
+gpmi_nfc_compute_hardware_timings(struct gpmi_nand_data *this)
 {
+	struct gpmi_nfc_hardware_timing *hw = &this->hw;
 	struct timing_threshold *nfc = &timing_default_threshold;
-	struct resources *r = &this->resources;
 	struct nand_chip *nand = &this->nand;
 	struct nand_timing target = this->timing;
 	bool improved_timing_is_available;
@@ -349,6 +356,9 @@ static int gpmi_nfc_compute_hardware_timing(struct gpmi_nand_data *this,
 	unsigned int min_prop_delay_in_ns = DEF_MIN_PROP_DELAY;
 	unsigned int max_prop_delay_in_ns = DEF_MAX_PROP_DELAY;
 
+	/* Clock rate for non-EDO modes */
+	hw->clk_rate = 22000000;
+
 	/*
 	 * If there are multiple chips, we need to relax the timings to allow
 	 * for signal distortion due to higher capacitance.
@@ -363,14 +373,8 @@ static int gpmi_nfc_compute_hardware_timing(struct gpmi_nand_data *this,
 		target.address_setup_in_ns += 5;
 	}
 
-	/* Check if improved timing information is available. */
-	improved_timing_is_available =
-		(target.tREA_in_ns  >= 0) &&
-		(target.tRLOH_in_ns >= 0) &&
-		(target.tRHOH_in_ns >= 0);
-
 	/* Inspect the clock. */
-	nfc->clock_frequency_in_hz = clk_get_rate(r->clock[0]);
+	nfc->clock_frequency_in_hz = hw->clk_rate;
 	clock_frequency_in_hz = nfc->clock_frequency_in_hz;
 	clock_period_in_ns    = NSEC_PER_SEC / clock_frequency_in_hz;
 
@@ -482,65 +486,6 @@ static int gpmi_nfc_compute_hardware_timing(struct gpmi_nand_data *this,
 	}
 
 	/*
-	 * Check if improved timing information is available. If not, we have to
-	 * use a less-sophisticated algorithm.
-	 */
-	if (!improved_timing_is_available) {
-		/*
-		 * Fold the read setup time required by the NFC into the ideal
-		 * sample delay.
-		 */
-		ideal_sample_delay_in_ns = target.gpmi_sample_delay_in_ns +
-						nfc->internal_data_setup_in_ns;
-
-		/*
-		 * The ideal sample delay may be greater than the maximum
-		 * allowed by the NFC. If so, we can trade off sample delay time
-		 * for more data setup time.
-		 *
-		 * In each iteration of the following loop, we add a cycle to
-		 * the data setup time and subtract a corresponding amount from
-		 * the sample delay until we've satisified the constraints or
-		 * can't do any better.
-		 */
-		while ((ideal_sample_delay_in_ns > max_sample_delay_in_ns) &&
-			(data_setup_in_cycles < nfc->max_data_setup_cycles)) {
-
-			data_setup_in_cycles++;
-			ideal_sample_delay_in_ns -= clock_period_in_ns;
-
-			if (ideal_sample_delay_in_ns < 0)
-				ideal_sample_delay_in_ns = 0;
-
-		}
-
-		/*
-		 * Compute the sample delay factor that corresponds most closely
-		 * to the ideal sample delay. If the result is too large for the
-		 * NFC, use the maximum value.
-		 *
-		 * Notice that we use the ns_to_cycles function to compute the
-		 * sample delay factor. We do this because the form of the
-		 * computation is the same as that for calculating cycles.
-		 */
-		sample_delay_factor =
-			ns_to_cycles(
-				ideal_sample_delay_in_ns << dll_delay_shift,
-							clock_period_in_ns, 0);
-
-		if (sample_delay_factor > nfc->max_sample_delay_factor)
-			sample_delay_factor = nfc->max_sample_delay_factor;
-
-		/* Skip to the part where we return our results. */
-		goto return_results;
-	}
-
-	/*
-	 * If control arrives here, we have more detailed timing information,
-	 * so we can use a better algorithm.
-	 */
-
-	/*
 	 * Fold the read setup time required by the NFC into the maximum
 	 * propagation delay.
 	 */
@@ -760,8 +705,6 @@ static int gpmi_nfc_compute_hardware_timing(struct gpmi_nand_data *this,
 			sample_delay_factor = nfc->max_sample_delay_factor;
 	}
 
-	/* Control arrives here when we're ready to return our results. */
-return_results:
 	hw->data_setup_in_cycles    = data_setup_in_cycles;
 	hw->data_hold_in_cycles     = data_hold_in_cycles;
 	hw->address_setup_in_cycles = address_setup_in_cycles;
@@ -769,9 +712,6 @@ static int gpmi_nfc_compute_hardware_timing(struct gpmi_nand_data *this,
 	hw->sample_delay_factor     = sample_delay_factor;
 	hw->device_busy_timeout     = GPMI_DEFAULT_BUSY_TIMEOUT;
 	hw->wrn_dly_sel             = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
-
-	/* Return success. */
-	return 0;
 }
 
 /*
@@ -857,12 +797,9 @@ static int gpmi_nfc_compute_hardware_timing(struct gpmi_nand_data *this,
  *       So we only support the mode 4 and mode 5. It is no need to
  *       support other modes.
  */
-static void gpmi_compute_edo_timing(struct gpmi_nand_data *this,
-			struct gpmi_nfc_hardware_timing *hw)
+static void gpmi_nfc_compute_edo_timings(struct gpmi_nand_data *this)
 {
-	struct resources *r = &this->resources;
-	unsigned long rate = clk_get_rate(r->clock[0]);
-	int mode = this->timing_mode;
+	struct gpmi_nfc_hardware_timing *hw = &this->hw;
 	int dll_threshold = this->devdata->max_chain_delay;
 	unsigned long delay;
 	unsigned long clk_period;
@@ -871,6 +808,9 @@ static void gpmi_compute_edo_timing(struct gpmi_nand_data *this,
 	int t_rp;
 	int rp;
 
+	/* Set the main clock to: 100MHz (mode 5) or 80MHz (mode 4) */
+	hw->clk_rate = (hw->timing_mode == 5) ? 100000000 : 80000000;
+
 	/*
 	 * [1] for GPMI_HW_GPMI_TIMING0:
 	 *     The async mode requires 40MHz for mode 4, 50MHz for mode 5.
@@ -880,7 +820,7 @@ static void gpmi_compute_edo_timing(struct gpmi_nand_data *this,
 	 */
 	hw->data_setup_in_cycles = 1;
 	hw->data_hold_in_cycles = 1;
-	hw->address_setup_in_cycles = ((mode == 5) ? 1 : 0);
+	hw->address_setup_in_cycles = (hw->timing_mode == 5) ? 1 : 0;
 
 	/* [2] for GPMI_HW_GPMI_TIMING1 */
 	hw->device_busy_timeout = 0x9000;
@@ -892,9 +832,9 @@ static void gpmi_compute_edo_timing(struct gpmi_nand_data *this,
 	 * Enlarge 10 times for the numerator and denominator in {3}.
 	 * This make us to get more accurate result.
 	 */
-	clk_period = NSEC_PER_SEC / (rate / 10);
+	clk_period = NSEC_PER_SEC / (hw->clk_rate / 10);
 	dll_threshold *= 10;
-	t_rea = ((mode == 5) ? 16 : 20) * 10;
+	t_rea = (hw->timing_mode == 5 ? 16 : 20) * 10;
 	c *= 10;
 
 	t_rp = clk_period * 1; /* DATA_SETUP is 1 */
@@ -917,123 +857,36 @@ static void gpmi_compute_edo_timing(struct gpmi_nand_data *this,
 	hw->sample_delay_factor = delay;
 }
 
-static int enable_edo_mode(struct gpmi_nand_data *this, int mode)
-{
-	struct resources  *r = &this->resources;
-	struct nand_chip *nand = &this->nand;
-	struct mtd_info	 *mtd = nand_to_mtd(nand);
-	uint8_t *feature;
-	unsigned long rate;
-	int ret;
-
-	feature = kzalloc(ONFI_SUBFEATURE_PARAM_LEN, GFP_KERNEL);
-	if (!feature)
-		return -ENOMEM;
-
-	nand->select_chip(mtd, 0);
-
-	/* [1] send SET FEATURE command to NAND */
-	feature[0] = mode;
-	ret = nand->onfi_set_features(mtd, nand,
-				ONFI_FEATURE_ADDR_TIMING_MODE, feature);
-	if (ret)
-		goto err_out;
-
-	/* [2] send GET FEATURE command to double-check the timing mode */
-	memset(feature, 0, ONFI_SUBFEATURE_PARAM_LEN);
-	ret = nand->onfi_get_features(mtd, nand,
-				ONFI_FEATURE_ADDR_TIMING_MODE, feature);
-	if (ret || feature[0] != mode)
-		goto err_out;
-
-	nand->select_chip(mtd, -1);
-
-	/* [3] set the main IO clock, 100MHz for mode 5, 80MHz for mode 4. */
-	rate = (mode == 5) ? 100000000 : 80000000;
-	clk_set_rate(r->clock[0], rate);
-
-	/* Let the gpmi_begin() re-compute the timing again. */
-	this->flags &= ~GPMI_TIMING_INIT_OK;
-
-	this->flags |= GPMI_ASYNC_EDO_ENABLED;
-	this->timing_mode = mode;
-	kfree(feature);
-	dev_info(this->dev, "enable the asynchronous EDO mode %d\n", mode);
-	return 0;
-
-err_out:
-	nand->select_chip(mtd, -1);
-	kfree(feature);
-	dev_err(this->dev, "mode:%d ,failed in set feature.\n", mode);
-	return -EINVAL;
-}
-
-int gpmi_extra_init(struct gpmi_nand_data *this)
-{
-	struct nand_chip *chip = &this->nand;
-
-	/* Enable the asynchronous EDO feature. */
-	if (GPMI_IS_MX6(this) && chip->onfi_version) {
-		int mode = onfi_get_async_timing_mode(chip);
-
-		/* We only support the timing mode 4 and mode 5. */
-		if (mode & ONFI_TIMING_MODE_5)
-			mode = 5;
-		else if (mode & ONFI_TIMING_MODE_4)
-			mode = 4;
-		else
-			return 0;
-
-		return enable_edo_mode(this, mode);
-	}
-	return 0;
-}
-
 /* Begin the I/O */
-void gpmi_begin(struct gpmi_nand_data *this)
+void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
 {
+	struct gpmi_nfc_hardware_timing *hw = &this->hw;
 	struct resources *r = &this->resources;
 	void __iomem *gpmi_regs = r->gpmi_regs;
 	unsigned int   clock_period_in_ns;
 	uint32_t       reg;
 	unsigned int   dll_wait_time_in_us;
-	struct gpmi_nfc_hardware_timing  hw;
-	int ret;
-
-	/* Enable the clock. */
-	ret = gpmi_enable_clk(this);
-	if (ret) {
-		dev_err(this->dev, "We failed in enable the clk\n");
-		goto err_out;
-	}
 
-	/* Only initialize the timing once */
-	if (this->flags & GPMI_TIMING_INIT_OK)
-		return;
-	this->flags |= GPMI_TIMING_INIT_OK;
-
-	if (this->flags & GPMI_ASYNC_EDO_ENABLED)
-		gpmi_compute_edo_timing(this, &hw);
-	else
-		gpmi_nfc_compute_hardware_timing(this, &hw);
+	/* [0] Set the main clock rate */
+	clk_set_rate(r->clock[0], hw->clk_rate);
 
 	/* [1] Set HW_GPMI_TIMING0 */
-	reg = BF_GPMI_TIMING0_ADDRESS_SETUP(hw.address_setup_in_cycles) |
-		BF_GPMI_TIMING0_DATA_HOLD(hw.data_hold_in_cycles)         |
-		BF_GPMI_TIMING0_DATA_SETUP(hw.data_setup_in_cycles);
+	reg = BF_GPMI_TIMING0_ADDRESS_SETUP(hw->address_setup_in_cycles) |
+		BF_GPMI_TIMING0_DATA_HOLD(hw->data_hold_in_cycles) |
+		BF_GPMI_TIMING0_DATA_SETUP(hw->data_setup_in_cycles);
 
 	writel(reg, gpmi_regs + HW_GPMI_TIMING0);
 
 	/* [2] Set HW_GPMI_TIMING1 */
-	writel(BF_GPMI_TIMING1_BUSY_TIMEOUT(hw.device_busy_timeout),
-		gpmi_regs + HW_GPMI_TIMING1);
+	writel(BF_GPMI_TIMING1_BUSY_TIMEOUT(hw->device_busy_timeout),
+	       gpmi_regs + HW_GPMI_TIMING1);
 
 	/* [3] The following code is to set the HW_GPMI_CTRL1. */
 
 	/* Set the WRN_DLY_SEL */
 	writel(BM_GPMI_CTRL1_WRN_DLY_SEL, gpmi_regs + HW_GPMI_CTRL1_CLR);
-	writel(BF_GPMI_CTRL1_WRN_DLY_SEL(hw.wrn_dly_sel),
-					gpmi_regs + HW_GPMI_CTRL1_SET);
+	writel(BF_GPMI_CTRL1_WRN_DLY_SEL(hw->wrn_dly_sel),
+	       gpmi_regs + HW_GPMI_CTRL1_SET);
 
 	/* DLL_ENABLE must be set to 0 when setting RDN_DELAY or HALF_PERIOD. */
 	writel(BM_GPMI_CTRL1_DLL_ENABLE, gpmi_regs + HW_GPMI_CTRL1_CLR);
@@ -1043,12 +896,12 @@ void gpmi_begin(struct gpmi_nand_data *this)
 	writel(reg, gpmi_regs + HW_GPMI_CTRL1_CLR);
 
 	/* If no sample delay is called for, return immediately. */
-	if (!hw.sample_delay_factor)
+	if (!hw->sample_delay_factor)
 		return;
 
 	/* Set RDN_DELAY or HALF_PERIOD. */
-	reg = ((hw.use_half_periods) ? BM_GPMI_CTRL1_HALF_PERIOD : 0)
-		| BF_GPMI_CTRL1_RDN_DELAY(hw.sample_delay_factor);
+	reg = ((hw->use_half_periods) ? BM_GPMI_CTRL1_HALF_PERIOD : 0)
+		| BF_GPMI_CTRL1_RDN_DELAY(hw->sample_delay_factor);
 
 	writel(reg, gpmi_regs + HW_GPMI_CTRL1_SET);
 
@@ -1060,7 +913,7 @@ void gpmi_begin(struct gpmi_nand_data *this)
 	 * we can use the GPMI. Calculate the amount of time we need to wait,
 	 * in microseconds.
 	 */
-	clock_period_in_ns = NSEC_PER_SEC / clk_get_rate(r->clock[0]);
+	clock_period_in_ns = NSEC_PER_SEC / hw->clk_rate;
 	dll_wait_time_in_us = (clock_period_in_ns * 64) / 1000;
 
 	if (!dll_wait_time_in_us)
@@ -1068,14 +921,45 @@ void gpmi_begin(struct gpmi_nand_data *this)
 
 	/* Wait for the DLL to settle. */
 	udelay(dll_wait_time_in_us);
-
-err_out:
-	return;
 }
 
-void gpmi_end(struct gpmi_nand_data *this)
+int gpmi_setup_data_interface(struct mtd_info *mtd, int chipnr,
+			      const struct nand_data_interface *conf)
 {
-	gpmi_disable_clk(this);
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct gpmi_nand_data *this = nand_get_controller_data(chip);
+	const struct nand_sdr_timings *sdr;
+
+	if (chip->onfi_timing_mode_default < 0 ||
+	    chip->onfi_timing_mode_default > 5)
+		return -ENOTSUPP;
+
+	/* Only MX6 GPMI controller can reach EDO timings */
+	if (chip->onfi_timing_mode_default >= 4 && !GPMI_IS_MX6(this))
+		return -ENOTSUPP;
+
+	if (chipnr < 0)
+		return 0;
+
+	this->hw.timing_mode = chip->onfi_timing_mode_default;
+
+	sdr = nand_get_sdr_timings(conf);
+	if (IS_ERR(sdr))
+		return PTR_ERR(sdr);
+
+	this->timing.tREA_in_ns = sdr->tREA_max / 1000;
+	this->timing.tRLOH_in_ns = sdr->tRLOH_min / 1000;
+	this->timing.tRHOH_in_ns = sdr->tRHOH_min / 1000;
+
+	/* Compute GPMI parameters depending on the mode */
+	if (this->hw.timing_mode >= 4)
+		gpmi_nfc_compute_edo_timings(this);
+	else
+		gpmi_nfc_compute_hardware_timings(this);
+
+	gpmi_nfc_apply_timings(this);
+
+	return 0;
 }
 
 /* Clears a BCH interrupt. */
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index b51db8c85405..04986cd89c99 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -938,11 +938,23 @@ static void gpmi_select_chip(struct mtd_info *mtd, int chipnr)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
+	int ret;
 
-	if ((this->current_chip < 0) && (chipnr >= 0))
-		gpmi_begin(this);
-	else if ((this->current_chip >= 0) && (chipnr < 0))
-		gpmi_end(this);
+	/*
+	 * This driver currently supports only one NAND chip. So once timings
+	 * have been decided, they will not change. Furthermore, dies share the
+	 * same configuration, so for power consumption matters, we only
+	 * disable/enable the clock.
+	 */
+	if (this->current_chip < 0 && chipnr >= 0) {
+		ret = gpmi_enable_clk(this);
+		if (ret)
+			dev_err(this->dev, "Failed to enable the clock\n");
+	} else if (this->current_chip >= 0 && chipnr < 0) {
+		ret = gpmi_disable_clk(this);
+		if (ret)
+			dev_err(this->dev, "Failed to disable the clock\n");
+	}
 
 	this->current_chip = chipnr;
 }
@@ -1947,14 +1959,6 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 		chip->options |= NAND_SUBPAGE_READ;
 	}
 
-	/*
-	 * Can we enable the extra features? such as EDO or Sync mode.
-	 *
-	 * We do not check the return value now. That's means if we fail in
-	 * enable the extra features, we still can run in the normal way.
-	 */
-	gpmi_extra_init(this);
-
 	return 0;
 }
 
@@ -1975,6 +1979,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	nand_set_controller_data(chip, this);
 	nand_set_flash_node(chip, this->pdev->dev.of_node);
 	chip->select_chip	= gpmi_select_chip;
+	chip->setup_data_interface = gpmi_setup_data_interface;
 	chip->cmd_ctrl		= gpmi_cmd_ctrl;
 	chip->dev_ready		= gpmi_dev_ready;
 	chip->read_byte		= gpmi_read_byte;
@@ -2133,7 +2138,6 @@ static int gpmi_pm_resume(struct device *dev)
 		return ret;
 
 	/* re-init the GPMI registers */
-	this->flags &= ~GPMI_TIMING_INIT_OK;
 	ret = gpmi_init(this);
 	if (ret) {
 		dev_err(this->dev, "Error setting GPMI : %d\n", ret);
@@ -2147,9 +2151,6 @@ static int gpmi_pm_resume(struct device *dev)
 		return ret;
 	}
 
-	/* re-init others */
-	gpmi_extra_init(this);
-
 	return 0;
 }
 #endif /* CONFIG_PM_SLEEP */
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index 06c1f993912c..4890e1378475 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -135,11 +135,77 @@ struct gpmi_devdata {
 	const int clks_count;
 };
 
+/**
+ * struct gpmi_nfc_hardware_timing - GPMI hardware timing parameters.
+ * @timing_mode:               The timing mode to comply with.
+ * @clk_rate:                  The clock rate that must be used to derive the
+ *                             following parameters.
+ * @data_setup_in_cycles:      The data setup time, in cycles.
+ * @data_hold_in_cycles:       The data hold time, in cycles.
+ * @address_setup_in_cycles:   The address setup time, in cycles.
+ * @device_busy_timeout:       The timeout waiting for NAND Ready/Busy,
+ *                             this value is the number of cycles multiplied
+ *                             by 4096.
+ * @use_half_periods:          Indicates the clock is running slowly, so the
+ *                             NFC DLL should use half-periods.
+ * @sample_delay_factor:       The sample delay factor.
+ * @wrn_dly_sel:               The delay on the GPMI write strobe.
+ */
+struct gpmi_nfc_hardware_timing {
+	unsigned int timing_mode;
+	unsigned long int clk_rate;
+
+	/* for HW_GPMI_TIMING0 */
+	u8 data_setup_in_cycles;
+	u8 data_hold_in_cycles;
+	u8 address_setup_in_cycles;
+
+	/* for HW_GPMI_TIMING1 */
+	u16 device_busy_timeout;
+#define GPMI_DEFAULT_BUSY_TIMEOUT	0x500 /* default busy timeout value.*/
+
+	/* for HW_GPMI_CTRL1 */
+	bool use_half_periods;
+	u8 sample_delay_factor;
+	u8 wrn_dly_sel;
+};
+
+/**
+ * struct timing_threshold - Timing threshold
+ * @max_data_setup_cycles:       The maximum number of data setup cycles that
+ *                               can be expressed in the hardware.
+ * @internal_data_setup_in_ns:   The time, in ns, that the NFC hardware requires
+ *                               for data read internal setup. In the Reference
+ *                               Manual, see the chapter "High-Speed NAND
+ *                               Timing" for more details.
+ * @max_sample_delay_factor:     The maximum sample delay factor that can be
+ *                               expressed in the hardware.
+ * @max_dll_clock_period_in_ns:  The maximum period of the GPMI clock that the
+ *                               sample delay DLL hardware can possibly work
+ *                               with (the DLL is unusable with longer periods).
+ *                               If the full-cycle period is greater than HALF
+ *                               this value, the DLL must be configured to use
+ *                               half-periods.
+ * @max_dll_delay_in_ns:         The maximum amount of delay, in ns, that the
+ *                               DLL can implement.
+ * @clock_frequency_in_hz:       The clock frequency, in Hz, during the current
+ *                               I/O transaction. If no I/O transaction is in
+ *                               progress, this is the clock frequency during
+ *                               the most recent I/O transaction.
+ */
+struct timing_threshold {
+	const unsigned int      max_chip_count;
+	const unsigned int      max_data_setup_cycles;
+	const unsigned int      internal_data_setup_in_ns;
+	const unsigned int      max_sample_delay_factor;
+	const unsigned int      max_dll_clock_period_in_ns;
+	const unsigned int      max_dll_delay_in_ns;
+	unsigned long           clock_frequency_in_hz;
+
+};
+
 struct gpmi_nand_data {
-	/* flags */
-#define GPMI_ASYNC_EDO_ENABLED	(1 << 0)
-#define GPMI_TIMING_INIT_OK	(1 << 1)
-	int			flags;
+	/* Devdata */
 	const struct gpmi_devdata *devdata;
 
 	/* System Interface */
@@ -152,6 +218,7 @@ struct gpmi_nand_data {
 	/* Flash Hardware */
 	struct nand_timing	timing;
 	int			timing_mode;
+	struct gpmi_nfc_hardware_timing hw;
 
 	/* BCH */
 	struct bch_geometry	bch_geometry;
@@ -204,69 +271,6 @@ struct gpmi_nand_data {
 	void			*private;
 };
 
-/**
- * struct gpmi_nfc_hardware_timing - GPMI hardware timing parameters.
- * @data_setup_in_cycles:      The data setup time, in cycles.
- * @data_hold_in_cycles:       The data hold time, in cycles.
- * @address_setup_in_cycles:   The address setup time, in cycles.
- * @device_busy_timeout:       The timeout waiting for NAND Ready/Busy,
- *                             this value is the number of cycles multiplied
- *                             by 4096.
- * @use_half_periods:          Indicates the clock is running slowly, so the
- *                             NFC DLL should use half-periods.
- * @sample_delay_factor:       The sample delay factor.
- * @wrn_dly_sel:               The delay on the GPMI write strobe.
- */
-struct gpmi_nfc_hardware_timing {
-	/* for HW_GPMI_TIMING0 */
-	uint8_t  data_setup_in_cycles;
-	uint8_t  data_hold_in_cycles;
-	uint8_t  address_setup_in_cycles;
-
-	/* for HW_GPMI_TIMING1 */
-	uint16_t device_busy_timeout;
-#define GPMI_DEFAULT_BUSY_TIMEOUT	0x500 /* default busy timeout value.*/
-
-	/* for HW_GPMI_CTRL1 */
-	bool     use_half_periods;
-	uint8_t  sample_delay_factor;
-	uint8_t  wrn_dly_sel;
-};
-
-/**
- * struct timing_threshold - Timing threshold
- * @max_data_setup_cycles:       The maximum number of data setup cycles that
- *                               can be expressed in the hardware.
- * @internal_data_setup_in_ns:   The time, in ns, that the NFC hardware requires
- *                               for data read internal setup. In the Reference
- *                               Manual, see the chapter "High-Speed NAND
- *                               Timing" for more details.
- * @max_sample_delay_factor:     The maximum sample delay factor that can be
- *                               expressed in the hardware.
- * @max_dll_clock_period_in_ns:  The maximum period of the GPMI clock that the
- *                               sample delay DLL hardware can possibly work
- *                               with (the DLL is unusable with longer periods).
- *                               If the full-cycle period is greater than HALF
- *                               this value, the DLL must be configured to use
- *                               half-periods.
- * @max_dll_delay_in_ns:         The maximum amount of delay, in ns, that the
- *                               DLL can implement.
- * @clock_frequency_in_hz:       The clock frequency, in Hz, during the current
- *                               I/O transaction. If no I/O transaction is in
- *                               progress, this is the clock frequency during
- *                               the most recent I/O transaction.
- */
-struct timing_threshold {
-	const unsigned int      max_chip_count;
-	const unsigned int      max_data_setup_cycles;
-	const unsigned int      internal_data_setup_in_ns;
-	const unsigned int      max_sample_delay_factor;
-	const unsigned int      max_dll_clock_period_in_ns;
-	const unsigned int      max_dll_delay_in_ns;
-	unsigned long           clock_frequency_in_hz;
-
-};
-
 /* Common Services */
 int common_nfc_set_geometry(struct gpmi_nand_data *);
 struct dma_chan *get_dma_chan(struct gpmi_nand_data *);
@@ -279,14 +283,16 @@ int start_dma_with_bch_irq(struct gpmi_nand_data *,
 
 /* GPMI-NAND helper function library */
 int gpmi_init(struct gpmi_nand_data *);
-int gpmi_extra_init(struct gpmi_nand_data *);
 void gpmi_clear_bch(struct gpmi_nand_data *);
 void gpmi_dump_info(struct gpmi_nand_data *);
 int bch_set_geometry(struct gpmi_nand_data *);
 int gpmi_is_ready(struct gpmi_nand_data *, unsigned chip);
 int gpmi_send_command(struct gpmi_nand_data *);
-void gpmi_begin(struct gpmi_nand_data *);
-void gpmi_end(struct gpmi_nand_data *);
+int gpmi_enable_clk(struct gpmi_nand_data *this);
+int gpmi_disable_clk(struct gpmi_nand_data *this);
+int gpmi_setup_data_interface(struct mtd_info *mtd, int chipnr,
+			      const struct nand_data_interface *conf);
+void gpmi_nfc_apply_timings(struct gpmi_nand_data *this);
 int gpmi_read_data(struct gpmi_nand_data *);
 int gpmi_send_data(struct gpmi_nand_data *);
 int gpmi_send_page(struct gpmi_nand_data *,
-- 
2.11.0

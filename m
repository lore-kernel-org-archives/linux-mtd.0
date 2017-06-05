Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dI1LW-00080Q-Bl
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 23:23:53 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v4 10/23] mtd: nand: denali: handle timing parameters by
 setup_data_interface()
Date: Tue,  6 Jun 2017 08:21:49 +0900
Message-Id: <1496704922-12261-11-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Handling timing parameters in a driver's own way should be avoided
because it duplicates efforts of drivers/mtd/nand/nand_timings.c
Besides, this driver hard-codes Intel specific parameters such as
CLK_X=5, CLK_MULTI=4.  Taking a certain device (Samsung K9WAG08U1A)
into account by get_samsung_nand_para() is weird as well.

Now, the core framework provides .setup_data_interface() hook, which
handles timing parameters in a generic manner.

While I am working on this, I found even more issues in the current
code, so fixed the following as well:

- In recent IP versions, WE_2_RE and TWHR2 share the same register.
  Likewise for ADDR_2_DATA and TCWAW, CS_SETUP_CNT and TWB.  When
  updating one, the other must be masked.  Otherwise, the other will
  be set to 0, then timing settings will be broken.

- The recent IP release expanded the ADDR_2_DATA to 7-bit wide.
  This register is related to tADL.  As commit 74a332e78e8f ("mtd:
  nand: timings: Fix tADL_min for ONFI 4.0 chips") addressed, the
  ONFi 4.0 increased the minimum of tADL to 400 nsec.  This may not
  fit in the 6-bit ADDR_2_DATA in older versions.  Check the IP
  revision and handle this correctly, otherwise the register value
  would wrap around.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c     | 351 +++++++++++++++---------------------------
 drivers/mtd/nand/denali.h     |  26 ++--
 drivers/mtd/nand/denali_dt.c  |   3 +-
 drivers/mtd/nand/denali_pci.c |   6 +-
 4 files changed, 142 insertions(+), 244 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index a289011..1bb57de 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -28,17 +28,6 @@
 
 MODULE_LICENSE("GPL");
 
-/*
- * We define a module parameter that allows the user to override
- * the hardware and decide what timing mode should be used.
- */
-#define NAND_DEFAULT_TIMINGS	-1
-
-static int onfi_timing_mode = NAND_DEFAULT_TIMINGS;
-module_param(onfi_timing_mode, int, S_IRUGO);
-MODULE_PARM_DESC(onfi_timing_mode,
-	   "Overrides default ONFI setting. -1 indicates use default timings");
-
 #define DENALI_NAND_NAME    "denali-nand"
 
 /*
@@ -63,12 +52,6 @@ MODULE_PARM_DESC(onfi_timing_mode,
 #define CHIP_SELECT_INVALID	-1
 
 /*
- * This macro divides two integers and rounds fractional values up
- * to the nearest integer value.
- */
-#define CEIL_DIV(X, Y) (((X)%(Y)) ? ((X)/(Y)+1) : ((X)/(Y)))
-
-/*
  * this macro allows us to convert from an MTD structure to our own
  * device context (denali) structure.
  */
@@ -103,6 +86,14 @@ static void denali_irq_enable(struct denali_nand_info *denali,
 static uint32_t read_interrupt_status(struct denali_nand_info *denali);
 
 /*
+ * The bus interface clock, clk_x, is phase aligned with the core clock.  The
+ * clk_x is an integral multiple N of the core clk.  The value N is configured
+ * at IP delivery time, and its available value is 4, 5, or 6.  We need to align
+ * to the largest value to make it work with any possible configuration.
+ */
+#define DENALI_CLK_X_MULT	6
+
+/*
  * Certain operations for the denali NAND controller use an indexed mode to
  * read/write data. The operation is performed by writing the address value
  * of the command to the device memory followed by the data. This function
@@ -196,148 +187,6 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 }
 
 /*
- * this routine calculates the ONFI timing values for a given mode and
- * programs the clocking register accordingly. The mode is determined by
- * the get_onfi_nand_para routine.
- */
-static void nand_onfi_timing_set(struct denali_nand_info *denali,
-								uint16_t mode)
-{
-	uint16_t Trea[6] = {40, 30, 25, 20, 20, 16};
-	uint16_t Trp[6] = {50, 25, 17, 15, 12, 10};
-	uint16_t Treh[6] = {30, 15, 15, 10, 10, 7};
-	uint16_t Trc[6] = {100, 50, 35, 30, 25, 20};
-	uint16_t Trhoh[6] = {0, 15, 15, 15, 15, 15};
-	uint16_t Trloh[6] = {0, 0, 0, 0, 5, 5};
-	uint16_t Tcea[6] = {100, 45, 30, 25, 25, 25};
-	uint16_t Tadl[6] = {200, 100, 100, 100, 70, 70};
-	uint16_t Trhw[6] = {200, 100, 100, 100, 100, 100};
-	uint16_t Trhz[6] = {200, 100, 100, 100, 100, 100};
-	uint16_t Twhr[6] = {120, 80, 80, 60, 60, 60};
-	uint16_t Tcs[6] = {70, 35, 25, 25, 20, 15};
-
-	uint16_t data_invalid_rhoh, data_invalid_rloh, data_invalid;
-	uint16_t dv_window = 0;
-	uint16_t en_lo, en_hi;
-	uint16_t acc_clks;
-	uint16_t addr_2_data, re_2_we, re_2_re, we_2_re, cs_cnt;
-
-	en_lo = CEIL_DIV(Trp[mode], CLK_X);
-	en_hi = CEIL_DIV(Treh[mode], CLK_X);
-#if ONFI_BLOOM_TIME
-	if ((en_hi * CLK_X) < (Treh[mode] + 2))
-		en_hi++;
-#endif
-
-	if ((en_lo + en_hi) * CLK_X < Trc[mode])
-		en_lo += CEIL_DIV((Trc[mode] - (en_lo + en_hi) * CLK_X), CLK_X);
-
-	if ((en_lo + en_hi) < CLK_MULTI)
-		en_lo += CLK_MULTI - en_lo - en_hi;
-
-	while (dv_window < 8) {
-		data_invalid_rhoh = en_lo * CLK_X + Trhoh[mode];
-
-		data_invalid_rloh = (en_lo + en_hi) * CLK_X + Trloh[mode];
-
-		data_invalid = data_invalid_rhoh < data_invalid_rloh ?
-					data_invalid_rhoh : data_invalid_rloh;
-
-		dv_window = data_invalid - Trea[mode];
-
-		if (dv_window < 8)
-			en_lo++;
-	}
-
-	acc_clks = CEIL_DIV(Trea[mode], CLK_X);
-
-	while (acc_clks * CLK_X - Trea[mode] < 3)
-		acc_clks++;
-
-	if (data_invalid - acc_clks * CLK_X < 2)
-		dev_warn(denali->dev, "%s, Line %d: Warning!\n",
-			 __FILE__, __LINE__);
-
-	addr_2_data = CEIL_DIV(Tadl[mode], CLK_X);
-	re_2_we = CEIL_DIV(Trhw[mode], CLK_X);
-	re_2_re = CEIL_DIV(Trhz[mode], CLK_X);
-	we_2_re = CEIL_DIV(Twhr[mode], CLK_X);
-	cs_cnt = CEIL_DIV((Tcs[mode] - Trp[mode]), CLK_X);
-	if (cs_cnt == 0)
-		cs_cnt = 1;
-
-	if (Tcea[mode]) {
-		while (cs_cnt * CLK_X + Trea[mode] < Tcea[mode])
-			cs_cnt++;
-	}
-
-#if MODE5_WORKAROUND
-	if (mode == 5)
-		acc_clks = 5;
-#endif
-
-	/* Sighting 3462430: Temporary hack for MT29F128G08CJABAWP:B */
-	if (ioread32(denali->flash_reg + MANUFACTURER_ID) == 0 &&
-		ioread32(denali->flash_reg + DEVICE_ID) == 0x88)
-		acc_clks = 6;
-
-	iowrite32(acc_clks, denali->flash_reg + ACC_CLKS);
-	iowrite32(re_2_we, denali->flash_reg + RE_2_WE);
-	iowrite32(re_2_re, denali->flash_reg + RE_2_RE);
-	iowrite32(we_2_re, denali->flash_reg + WE_2_RE);
-	iowrite32(addr_2_data, denali->flash_reg + ADDR_2_DATA);
-	iowrite32(en_lo, denali->flash_reg + RDWR_EN_LO_CNT);
-	iowrite32(en_hi, denali->flash_reg + RDWR_EN_HI_CNT);
-	iowrite32(cs_cnt, denali->flash_reg + CS_SETUP_CNT);
-}
-
-/* queries the NAND device to see what ONFI modes it supports. */
-static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
-{
-	int i;
-
-	/*
-	 * we needn't to do a reset here because driver has already
-	 * reset all the banks before
-	 */
-	if (!(ioread32(denali->flash_reg + ONFI_TIMING_MODE) &
-		ONFI_TIMING_MODE__VALUE))
-		return FAIL;
-
-	for (i = 5; i > 0; i--) {
-		if (ioread32(denali->flash_reg + ONFI_TIMING_MODE) &
-			(0x01 << i))
-			break;
-	}
-
-	nand_onfi_timing_set(denali, i);
-
-	/*
-	 * By now, all the ONFI devices we know support the page cache
-	 * rw feature. So here we enable the pipeline_rw_ahead feature
-	 */
-	/* iowrite32(1, denali->flash_reg + CACHE_WRITE_ENABLE); */
-	/* iowrite32(1, denali->flash_reg + CACHE_READ_ENABLE);  */
-
-	return PASS;
-}
-
-static void get_samsung_nand_para(struct denali_nand_info *denali,
-							uint8_t device_id)
-{
-	if (device_id == 0xd3) { /* Samsung K9WAG08U1A */
-		/* Set timing register values according to datasheet */
-		iowrite32(5, denali->flash_reg + ACC_CLKS);
-		iowrite32(20, denali->flash_reg + RE_2_WE);
-		iowrite32(12, denali->flash_reg + WE_2_RE);
-		iowrite32(14, denali->flash_reg + ADDR_2_DATA);
-		iowrite32(3, denali->flash_reg + RDWR_EN_LO_CNT);
-		iowrite32(2, denali->flash_reg + RDWR_EN_HI_CNT);
-		iowrite32(2, denali->flash_reg + CS_SETUP_CNT);
-	}
-}
-
-/*
  * Use the configuration feature register to determine the maximum number of
  * banks that the hardware supports.
  */
@@ -352,58 +201,6 @@ static void detect_max_banks(struct denali_nand_info *denali)
 		denali->max_banks <<= 1;
 }
 
-static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
-{
-	uint16_t status = PASS;
-	uint32_t id_bytes[8], addr;
-	uint8_t maf_id, device_id;
-	int i;
-
-	/*
-	 * Use read id method to get device ID and other params.
-	 * For some NAND chips, controller can't report the correct
-	 * device ID by reading from DEVICE_ID register
-	 */
-	addr = MODE_11 | BANK(denali->flash_bank);
-	index_addr(denali, addr | 0, 0x90);
-	index_addr(denali, addr | 1, 0);
-	for (i = 0; i < 8; i++)
-		index_addr_read_data(denali, addr | 2, &id_bytes[i]);
-	maf_id = id_bytes[0];
-	device_id = id_bytes[1];
-
-	if (ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_LUNS) &
-		ONFI_DEVICE_NO_OF_LUNS__ONFI_DEVICE) { /* ONFI 1.0 NAND */
-		if (FAIL == get_onfi_nand_para(denali))
-			return FAIL;
-	} else if (maf_id == 0xEC) { /* Samsung NAND */
-		get_samsung_nand_para(denali, device_id);
-	}
-
-	dev_info(denali->dev,
-			"Dump timing register values:\n"
-			"acc_clks: %d, re_2_we: %d, re_2_re: %d\n"
-			"we_2_re: %d, addr_2_data: %d, rdwr_en_lo_cnt: %d\n"
-			"rdwr_en_hi_cnt: %d, cs_setup_cnt: %d\n",
-			ioread32(denali->flash_reg + ACC_CLKS),
-			ioread32(denali->flash_reg + RE_2_WE),
-			ioread32(denali->flash_reg + RE_2_RE),
-			ioread32(denali->flash_reg + WE_2_RE),
-			ioread32(denali->flash_reg + ADDR_2_DATA),
-			ioread32(denali->flash_reg + RDWR_EN_LO_CNT),
-			ioread32(denali->flash_reg + RDWR_EN_HI_CNT),
-			ioread32(denali->flash_reg + CS_SETUP_CNT));
-
-	/*
-	 * If the user specified to override the default timings
-	 * with a specific ONFI mode, we apply those changes here.
-	 */
-	if (onfi_timing_mode != NAND_DEFAULT_TIMINGS)
-		nand_onfi_timing_set(denali, onfi_timing_mode);
-
-	return status;
-}
-
 static void denali_set_intr_modes(struct denali_nand_info *denali,
 					uint16_t INT_ENABLE)
 {
@@ -1209,7 +1006,122 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 		break;
 	}
 }
-/* end NAND core entry points */
+
+#define DIV_ROUND_DOWN_ULL(ll, d) \
+	({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
+
+static int denali_setup_data_interface(struct mtd_info *mtd,
+				       const struct nand_data_interface *conf,
+				       bool check_only)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	const struct nand_sdr_timings *timings;
+	unsigned long t_clk;
+	int acc_clks, re_2_we, re_2_re, we_2_re, addr_2_data;
+	int rdwr_en_lo, rdwr_en_hi, rdwr_en_lo_hi, cs_setup;
+	int addr_2_data_mask;
+	uint32_t tmp;
+
+	timings = nand_get_sdr_timings(conf);
+	if (IS_ERR(timings))
+		return PTR_ERR(timings);
+
+	/* clk_x period in picoseconds */
+	t_clk = DIV_ROUND_DOWN_ULL(1000000000000ULL, denali->clk_x_rate);
+	if (!t_clk)
+		return -EINVAL;
+
+	if (check_only)
+		return 0;
+
+	/* tREA -> ACC_CLKS */
+	acc_clks = DIV_ROUND_UP(timings->tREA_max, t_clk);
+	acc_clks = min_t(int, acc_clks, ACC_CLKS__VALUE);
+
+	tmp = ioread32(denali->flash_reg + ACC_CLKS);
+	tmp &= ~ACC_CLKS__VALUE;
+	tmp |= acc_clks;
+	iowrite32(tmp, denali->flash_reg + ACC_CLKS);
+
+	/* tRWH -> RE_2_WE */
+	re_2_we = DIV_ROUND_UP(timings->tRHW_min, t_clk);
+	re_2_we = min_t(int, re_2_we, RE_2_WE__VALUE);
+
+	tmp = ioread32(denali->flash_reg + RE_2_WE);
+	tmp &= ~RE_2_WE__VALUE;
+	tmp |= re_2_we;
+	iowrite32(tmp, denali->flash_reg + RE_2_WE);
+
+	/* tRHZ -> RE_2_RE */
+	re_2_re = DIV_ROUND_UP(timings->tRHZ_max, t_clk);
+	re_2_re = min_t(int, re_2_re, RE_2_RE__VALUE);
+
+	tmp = ioread32(denali->flash_reg + RE_2_RE);
+	tmp &= ~RE_2_RE__VALUE;
+	tmp |= re_2_re;
+	iowrite32(tmp, denali->flash_reg + RE_2_RE);
+
+	/* tWHR -> WE_2_RE */
+	we_2_re = DIV_ROUND_UP(timings->tWHR_min, t_clk);
+	we_2_re = min_t(int, we_2_re, TWHR2_AND_WE_2_RE__WE_2_RE);
+
+	tmp = ioread32(denali->flash_reg + TWHR2_AND_WE_2_RE);
+	tmp &= ~TWHR2_AND_WE_2_RE__WE_2_RE;
+	tmp |= we_2_re;
+	iowrite32(tmp, denali->flash_reg + TWHR2_AND_WE_2_RE);
+
+	/* tADL -> ADDR_2_DATA */
+
+	/* for older versions, ADDR_2_DATA is only 6 bit wide */
+	addr_2_data_mask = TCWAW_AND_ADDR_2_DATA__ADDR_2_DATA;
+	if (denali->revision < 0x0501)
+		addr_2_data_mask >>= 1;
+
+	addr_2_data = DIV_ROUND_UP(timings->tADL_min, t_clk);
+	addr_2_data = min_t(int, addr_2_data, addr_2_data_mask);
+
+	tmp = ioread32(denali->flash_reg + TCWAW_AND_ADDR_2_DATA);
+	tmp &= ~addr_2_data_mask;
+	tmp |= addr_2_data;
+	iowrite32(tmp, denali->flash_reg + TCWAW_AND_ADDR_2_DATA);
+
+	/* tREH, tWH -> RDWR_EN_HI_CNT */
+	rdwr_en_hi = DIV_ROUND_UP(max(timings->tREH_min, timings->tWH_min),
+				  t_clk);
+	rdwr_en_hi = min_t(int, rdwr_en_hi, RDWR_EN_HI_CNT__VALUE);
+
+	tmp = ioread32(denali->flash_reg + RDWR_EN_HI_CNT);
+	tmp &= ~RDWR_EN_HI_CNT__VALUE;
+	tmp |= rdwr_en_hi;
+	iowrite32(tmp, denali->flash_reg + RDWR_EN_HI_CNT);
+
+	/* tRP, tWP -> RDWR_EN_LO_CNT */
+	rdwr_en_lo = DIV_ROUND_UP(max(timings->tRP_min, timings->tWP_min),
+				  t_clk);
+	rdwr_en_lo_hi = DIV_ROUND_UP(max(timings->tRC_min, timings->tWC_min),
+				     t_clk);
+	rdwr_en_lo_hi = max(rdwr_en_lo_hi, DENALI_CLK_X_MULT);
+	rdwr_en_lo = max(rdwr_en_lo, rdwr_en_lo_hi - rdwr_en_hi);
+	rdwr_en_lo = min_t(int, rdwr_en_lo, RDWR_EN_LO_CNT__VALUE);
+
+	tmp = ioread32(denali->flash_reg + RDWR_EN_LO_CNT);
+	tmp &= ~RDWR_EN_LO_CNT__VALUE;
+	tmp |= rdwr_en_lo;
+	iowrite32(tmp, denali->flash_reg + RDWR_EN_LO_CNT);
+
+	/* tCS, tCEA -> CS_SETUP_CNT */
+	cs_setup = max3((int)DIV_ROUND_UP(timings->tCS_min, t_clk) - rdwr_en_lo,
+			(int)DIV_ROUND_UP(timings->tCEA_max, t_clk) - acc_clks,
+			0);
+	cs_setup = min_t(int, cs_setup, CS_SETUP_CNT__VALUE);
+
+	tmp = ioread32(denali->flash_reg + CS_SETUP_CNT);
+	tmp &= ~CS_SETUP_CNT__VALUE;
+	tmp |= cs_setup;
+	iowrite32(tmp, denali->flash_reg + CS_SETUP_CNT);
+
+	return 0;
+}
 
 /* Initialization code to bring the device up to a known good state */
 static void denali_hw_init(struct denali_nand_info *denali)
@@ -1241,7 +1153,6 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	/* Should set value for these registers when init */
 	iowrite32(0, denali->flash_reg + TWO_ROW_ADDR_CYCLES);
 	iowrite32(1, denali->flash_reg + ECC_ENABLE);
-	denali_nand_timing_set(denali);
 	denali_irq_init(denali);
 }
 
@@ -1432,17 +1343,6 @@ int denali_init(struct denali_nand_info *denali)
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int ret;
 
-	if (denali->platform == INTEL_CE4100) {
-		/*
-		 * Due to a silicon limitation, we can only support
-		 * ONFI timing mode 1 and below.
-		 */
-		if (onfi_timing_mode < -1 || onfi_timing_mode > 1) {
-			pr_err("Intel CE4100 only supports ONFI timing mode 1 or below\n");
-			return -EINVAL;
-		}
-	}
-
 	/* allocate a temporary buffer for nand_scan_ident() */
 	denali->buf.buf = devm_kzalloc(denali->dev, PAGE_SIZE,
 					GFP_DMA | GFP_KERNEL);
@@ -1473,6 +1373,9 @@ int denali_init(struct denali_nand_info *denali)
 	chip->cmdfunc = denali_cmdfunc;
 	chip->read_byte = denali_read_byte;
 	chip->waitfunc = denali_waitfunc;
+	/* clk rate info is needed for setup_data_interface */
+	if (denali->clk_x_rate)
+		chip->setup_data_interface = denali_setup_data_interface;
 
 	/*
 	 * scan for NAND devices attached to the controller
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 80767cf..f0f4d75 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -72,11 +72,14 @@
 #define GLOBAL_INT_ENABLE			0xf0
 #define     GLOBAL_INT_EN_FLAG				BIT(0)
 
-#define WE_2_RE					0x100
-#define     WE_2_RE__VALUE				GENMASK(5, 0)
+#define TWHR2_AND_WE_2_RE			0x100
+#define     TWHR2_AND_WE_2_RE__WE_2_RE			GENMASK(5, 0)
+#define     TWHR2_AND_WE_2_RE__TWHR2			GENMASK(13, 8)
 
-#define ADDR_2_DATA				0x110
-#define     ADDR_2_DATA__VALUE				GENMASK(5, 0)
+#define TCWAW_AND_ADDR_2_DATA			0x110
+/* The width of ADDR_2_DATA is 6 bit for old IP, 7 bit for new IP */
+#define     TCWAW_AND_ADDR_2_DATA__ADDR_2_DATA		GENMASK(6, 0)
+#define     TCWAW_AND_ADDR_2_DATA__TCWAW		GENMASK(13, 8)
 
 #define RE_2_WE					0x120
 #define     RE_2_WE__VALUE				GENMASK(5, 0)
@@ -128,6 +131,7 @@
 
 #define CS_SETUP_CNT				0x220
 #define     CS_SETUP_CNT__VALUE				GENMASK(4, 0)
+#define     CS_SETUP_CNT__TWB				GENMASK(17, 12)
 
 #define SPARE_AREA_SKIP_BYTES			0x230
 #define     SPARE_AREA_SKIP_BYTES__VALUE		GENMASK(5, 0)
@@ -294,16 +298,8 @@
 #define     CHNL_ACTIVE__CHANNEL2			BIT(2)
 #define     CHNL_ACTIVE__CHANNEL3			BIT(3)
 
-#define FAIL 1                  /*failed flag*/
 #define PASS 0                  /*success flag*/
 
-#define CLK_X  5
-#define CLK_MULTI 4
-
-#define ONFI_BLOOM_TIME         1
-#define MODE5_WORKAROUND        0
-
-
 #define MODE_00    0x00000000
 #define MODE_01    0x04000000
 #define MODE_10    0x08000000
@@ -316,14 +312,10 @@ struct nand_buf {
 	dma_addr_t dma_buf;
 };
 
-#define INTEL_CE4100	1
-#define INTEL_MRST	2
-#define DT		3
-
 struct denali_nand_info {
 	struct nand_chip nand;
+	unsigned long clk_x_rate;	/* bus interface clock rate */
 	int flash_bank; /* currently selected chip */
-	int platform;
 	struct nand_buf buf;
 	struct device *dev;
 	int page;
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 38800ae..56bfff0 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -105,7 +105,6 @@ static int denali_dt_probe(struct platform_device *pdev)
 		denali->stepinfo = &data->stepinfo;
 	}
 
-	denali->platform = DT;
 	denali->dev = &pdev->dev;
 	denali->irq = platform_get_irq(pdev, 0);
 	if (denali->irq < 0) {
@@ -130,6 +129,8 @@ static int denali_dt_probe(struct platform_device *pdev)
 	}
 	clk_prepare_enable(dt->clk);
 
+	denali->clk_x_rate = clk_get_rate(dt->clk);
+
 	ret = denali_init(denali);
 	if (ret)
 		goto out_disable_clk;
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index e0d50b6..8a66254 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -19,6 +19,9 @@
 
 #define DENALI_NAND_NAME    "denali-nand-pci"
 
+#define INTEL_CE4100	1
+#define INTEL_MRST	2
+
 /* List of platforms this NAND controller has be integrated into */
 static const struct pci_device_id denali_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x0701), INTEL_CE4100 },
@@ -52,13 +55,11 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	if (id->driver_data == INTEL_CE4100) {
-		denali->platform = INTEL_CE4100;
 		mem_base = pci_resource_start(dev, 0);
 		mem_len = pci_resource_len(dev, 1);
 		csr_base = pci_resource_start(dev, 1);
 		csr_len = pci_resource_len(dev, 1);
 	} else {
-		denali->platform = INTEL_MRST;
 		csr_base = pci_resource_start(dev, 0);
 		csr_len = pci_resource_len(dev, 0);
 		mem_base = pci_resource_start(dev, 1);
@@ -74,6 +75,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	denali->irq = dev->irq;
 	denali->stepinfo = &denali_pci_stepinfo;
 	denali->nand.ecc.options |= NAND_ECC_MAXIMIZE;
+	denali->clk_x_rate = 200000000;		/* 200 MHz */
 
 	ret = pci_request_regions(dev, DENALI_NAND_NAME);
 	if (ret) {
-- 
2.7.4

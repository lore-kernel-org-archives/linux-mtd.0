Received: from mail-he1eur01on061c.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::61c]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYMGN-0004gx-OW
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2016 23:21:05 +0000
From: Han Xu <han.xu@nxp.com>
To: <shijie.huang@arm.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <han.xu@nxp.com>, <standby24x7@gmail.com>,
 <jkosina@suse.cz>, <boris.brezillon@free-electrons.com>,
 <fabio.estevam@freescale.com>, <fransklaver@gmail.com>, <hofrat@osadl.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] mtd: nand: gpmi: add GPMI NAND support for i.MX7D
Date: Tue, 23 Feb 2016 17:04:49 -0600
Message-ID: <1456268693-8630-2-git-send-email-han.xu@nxp.com>
In-Reply-To: <1456268693-8630-1-git-send-email-han.xu@nxp.com>
References: <1456268693-8630-1-git-send-email-han.xu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Han Xu <b45815@freescale.com>

support GPMI NAND on i.MX7D

Signed-off-by: Han Xu <b45815@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/bch-regs.h  | 14 +++++++-------
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 10 ++++++----
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 27 ++++++++++++++++++++++-----
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  7 +++++--
 4 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
index 05bb91f..53e58bc 100644
--- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
+++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
@@ -1,7 +1,7 @@
 /*
  * Freescale GPMI NAND Flash Driver
  *
- * Copyright 2008-2011 Freescale Semiconductor, Inc.
+ * Copyright 2008-2015 Freescale Semiconductor, Inc.
  * Copyright 2008 Embedded Alley Solutions, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -54,7 +54,7 @@
 #define MX6Q_BP_BCH_FLASH0LAYOUT0_ECC0		11
 #define MX6Q_BM_BCH_FLASH0LAYOUT0_ECC0	(0x1f << MX6Q_BP_BCH_FLASH0LAYOUT0_ECC0)
 #define BF_BCH_FLASH0LAYOUT0_ECC0(v, x)				\
-	(GPMI_IS_MX6(x)					\
+	((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))				\
 		? (((v) << MX6Q_BP_BCH_FLASH0LAYOUT0_ECC0)	\
 			& MX6Q_BM_BCH_FLASH0LAYOUT0_ECC0)	\
 		: (((v) << BP_BCH_FLASH0LAYOUT0_ECC0)		\
@@ -65,7 +65,7 @@
 #define MX6Q_BM_BCH_FLASH0LAYOUT0_GF_13_14			\
 				(0x1 << MX6Q_BP_BCH_FLASH0LAYOUT0_GF_13_14)
 #define BF_BCH_FLASH0LAYOUT0_GF(v, x)				\
-	((GPMI_IS_MX6(x) && ((v) == 14))			\
+	(((GPMI_IS_MX6(x) || GPMI_IS_MX7(x)) && ((v) == 14))\
 		? (((1) << MX6Q_BP_BCH_FLASH0LAYOUT0_GF_13_14)	\
 			& MX6Q_BM_BCH_FLASH0LAYOUT0_GF_13_14)	\
 		: 0						\
@@ -77,7 +77,7 @@
 #define MX6Q_BM_BCH_FLASH0LAYOUT0_DATA0_SIZE	\
 			(0x3ff << BP_BCH_FLASH0LAYOUT0_DATA0_SIZE)
 #define BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(v, x)				\
-	(GPMI_IS_MX6(x)						\
+	((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))	\
 		? (((v) >> 2) & MX6Q_BM_BCH_FLASH0LAYOUT0_DATA0_SIZE)	\
 		: ((v) & BM_BCH_FLASH0LAYOUT0_DATA0_SIZE)		\
 	)
@@ -96,7 +96,7 @@
 #define MX6Q_BP_BCH_FLASH0LAYOUT1_ECCN		11
 #define MX6Q_BM_BCH_FLASH0LAYOUT1_ECCN	(0x1f << MX6Q_BP_BCH_FLASH0LAYOUT1_ECCN)
 #define BF_BCH_FLASH0LAYOUT1_ECCN(v, x)				\
-	(GPMI_IS_MX6(x)					\
+	((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))				\
 		? (((v) << MX6Q_BP_BCH_FLASH0LAYOUT1_ECCN)	\
 			& MX6Q_BM_BCH_FLASH0LAYOUT1_ECCN)	\
 		: (((v) << BP_BCH_FLASH0LAYOUT1_ECCN)		\
@@ -107,7 +107,7 @@
 #define MX6Q_BM_BCH_FLASH0LAYOUT1_GF_13_14			\
 				(0x1 << MX6Q_BP_BCH_FLASH0LAYOUT1_GF_13_14)
 #define BF_BCH_FLASH0LAYOUT1_GF(v, x)				\
-	((GPMI_IS_MX6(x) && ((v) == 14))			\
+	(((GPMI_IS_MX6(x) || GPMI_IS_MX7(x)) && ((v) == 14))\
 		? (((1) << MX6Q_BP_BCH_FLASH0LAYOUT1_GF_13_14)	\
 			& MX6Q_BM_BCH_FLASH0LAYOUT1_GF_13_14)	\
 		: 0						\
@@ -119,7 +119,7 @@
 #define MX6Q_BM_BCH_FLASH0LAYOUT1_DATAN_SIZE	\
 			(0x3ff << BP_BCH_FLASH0LAYOUT1_DATAN_SIZE)
 #define BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(v, x)				\
-	(GPMI_IS_MX6(x)						\
+	((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))	\
 		? (((v) >> 2) & MX6Q_BM_BCH_FLASH0LAYOUT1_DATAN_SIZE)	\
 		: ((v) & BM_BCH_FLASH0LAYOUT1_DATAN_SIZE)		\
 	)
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 0f68a99..8acbe04 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -1,7 +1,7 @@
 /*
  * Freescale GPMI NAND Flash Driver
  *
- * Copyright (C) 2008-2011 Freescale Semiconductor, Inc.
+ * Copyright (C) 2008-2015 Freescale Semiconductor, Inc.
  * Copyright (C) 2008 Embedded Alley Solutions, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -971,7 +971,8 @@ int gpmi_extra_init(struct gpmi_nand_data *this)
 	struct nand_chip *chip = &this->nand;
 
 	/* Enable the asynchronous EDO feature. */
-	if (GPMI_IS_MX6(this) && chip->onfi_version) {
+	if ((GPMI_IS_MX6(this) || GPMI_IS_MX7(this)) &&
+			chip->onfi_version) {
 		int mode = onfi_get_async_timing_mode(chip);
 
 		/* We only support the timing mode 4 and mode 5. */
@@ -1093,12 +1094,13 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
 	if (GPMI_IS_MX23(this)) {
 		mask = MX23_BM_GPMI_DEBUG_READY0 << chip;
 		reg = readl(r->gpmi_regs + HW_GPMI_DEBUG);
-	} else if (GPMI_IS_MX28(this) || GPMI_IS_MX6(this)) {
+	} else if (GPMI_IS_MX28(this) || GPMI_IS_MX6(this) ||
+			GPMI_IS_MX7(this)) {
 		/*
 		 * In the imx6, all the ready/busy pins are bound
 		 * together. So we only need to check chip 0.
 		 */
-		if (GPMI_IS_MX6(this))
+		if (GPMI_IS_MX6(this) || GPMI_IS_MX7(this))
 			chip = 0;
 
 		/* MX28 shares the same R/B register as MX6Q. */
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 8122c69..1aba6e6 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -77,6 +77,12 @@ static const struct gpmi_devdata gpmi_devdata_imx6sx = {
 	.max_chain_delay = 12,
 };
 
+static const struct gpmi_devdata gpmi_devdata_imx7d = {
+	.type = IS_MX7D,
+	.bch_max_ecc_strength = 62,
+	.max_chain_delay = 12,
+};
+
 static irqreturn_t bch_irq(int irq, void *cookie)
 {
 	struct gpmi_nand_data *this = cookie;
@@ -575,6 +581,10 @@ static char *extra_clks_for_mx6q[GPMI_CLK_MAX] = {
 	"gpmi_apb", "gpmi_bch", "gpmi_bch_apb", "per1_bch",
 };
 
+static char *extra_clks_for_mx7d[GPMI_CLK_MAX] = {
+	"gpmi_bch_apb",
+};
+
 static int gpmi_get_clks(struct gpmi_nand_data *this)
 {
 	struct resources *r = &this->resources;
@@ -592,6 +602,8 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
 	/* Get extra clocks */
 	if (GPMI_IS_MX6(this))
 		extra_clks = extra_clks_for_mx6q;
+	if (GPMI_IS_MX7(this))
+		extra_clks = extra_clks_for_mx7d;
 	if (!extra_clks)
 		return 0;
 
@@ -608,7 +620,7 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
 		r->clock[i] = clk;
 	}
 
-	if (GPMI_IS_MX6(this))
+	if (GPMI_IS_MX6(this) || GPMI_IS_MX7(this))
 		/*
 		 * Set the default value for the gpmi clock.
 		 *
@@ -1868,8 +1880,8 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	 *  (1) the chip is imx6, and
 	 *  (2) the size of the ECC parity is byte aligned.
 	 */
-	if (GPMI_IS_MX6(this) &&
-		((bch_geo->gf_len * bch_geo->ecc_strength) % 8) == 0) {
+	if ((GPMI_IS_MX6(this) || GPMI_IS_MX7(this)) &&
+			((bch_geo->gf_len * bch_geo->ecc_strength) % 8) == 0) {
 		ecc->read_subpage = gpmi_ecc_read_subpage;
 		chip->options |= NAND_SUBPAGE_READ;
 	}
@@ -1934,7 +1946,8 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
-	ret = nand_scan_ident(mtd, GPMI_IS_MX6(this) ? 2 : 1, NULL);
+	ret = nand_scan_ident(mtd, GPMI_IS_MX6(this) ||
+			GPMI_IS_MX7(this) ? 2 : 1, NULL);
 	if (ret)
 		goto err_out;
 
@@ -1977,7 +1990,11 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 	}, {
 		.compatible = "fsl,imx6sx-gpmi-nand",
 		.data = &gpmi_devdata_imx6sx,
-	}, {}
+	}, {
+		.compatible = "fsl,imx7d-gpmi-nand",
+		.data = (void *)&gpmi_devdata_imx7d,
+	}, { /* sentinel */ }
+
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
 
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index 4e49a1f..a82555f 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -1,7 +1,7 @@
 /*
  * Freescale GPMI NAND Flash Driver
  *
- * Copyright (C) 2010-2011 Freescale Semiconductor, Inc.
+ * Copyright (C) 2010-2015 Freescale Semiconductor, Inc.
  * Copyright (C) 2008 Embedded Alley Solutions, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -123,7 +123,8 @@ enum gpmi_type {
 	IS_MX23,
 	IS_MX28,
 	IS_MX6Q,
-	IS_MX6SX
+	IS_MX6SX,
+	IS_MX7D,
 };
 
 struct gpmi_devdata {
@@ -305,6 +306,8 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
 #define GPMI_IS_MX28(x)		((x)->devdata->type == IS_MX28)
 #define GPMI_IS_MX6Q(x)		((x)->devdata->type == IS_MX6Q)
 #define GPMI_IS_MX6SX(x)	((x)->devdata->type == IS_MX6SX)
+#define GPMI_IS_MX7D(x)		((x)->devdata->type == IS_MX7D)
 
 #define GPMI_IS_MX6(x)		(GPMI_IS_MX6Q(x) || GPMI_IS_MX6SX(x))
+#define GPMI_IS_MX7(x)		(GPMI_IS_MX7D(x))
 #endif
-- 
1.9.1

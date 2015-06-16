Received: from mail-wg0-f51.google.com ([74.125.82.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4nR3-0005kj-EY
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2015 09:45:40 +0000
Received: by wgbhy7 with SMTP id hy7so8066719wgb.2
 for <linux-mtd@lists.infradead.org>; Tue, 16 Jun 2015 02:45:14 -0700 (PDT)
MIME-Version: 1.0
From: Roy Spliet <r.spliet@ultimaker.com>
To: Linux MTD Mailinglist <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Baruch Siach <baruch@tkos.co.il>, Rafal Milecki <zajec5@gmail.com>
Subject: [RFC Patch  1/3] mtd: nand: Store actual timing in nand_chip
Date: Tue, 16 Jun 2015 11:45:02 +0200
Message-Id: <1434447904-31748-2-git-send-email-r.spliet@ultimaker.com>
In-Reply-To: <1434447904-31748-1-git-send-email-r.spliet@ultimaker.com>
References: <1434447904-31748-1-git-send-email-r.spliet@ultimaker.com>
Content-Type: text/plain; charset=US-ASCII
Cc: Roy Spliet <r.spliet@ultimaker.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This will pave the way for storing non-ONFI timing modes.
---
 drivers/mtd/nand/nand_base.c  |   7 ++-
 drivers/mtd/nand/sunxi_nand.c |   5 +-
 include/linux/mtd/nand.h      | 106 ++++++++++++++++++++----------------------
 3 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c2e1232..f561c68 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3611,6 +3611,8 @@ static inline bool is_full_id_nand(struct nand_flash_dev *type)
 static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 		   struct nand_flash_dev *type, u8 *id_data, int *busw)
 {
+	int mode;
+
 	if (!strncmp(type->id, id_data, type->id_len)) {
 		mtd->writesize = type->pagesize;
 		mtd->erasesize = type->erasesize;
@@ -3621,8 +3623,9 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->options |= type->options;
 		chip->ecc_strength_ds = NAND_ECC_STRENGTH(type);
 		chip->ecc_step_ds = NAND_ECC_STEP(type);
-		chip->onfi_timing_mode_default =
-					type->onfi_timing_mode_default;
+
+		mode = type->onfi_timing_mode_default;
+		chip->sdr_timings = onfi_async_timing_mode_to_sdr_timings(mode);
 
 		*busw = type->options & NAND_BUSWIDTH_16;
 
diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 5095a32..72e4135 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1083,7 +1083,7 @@ static int sunxi_nand_chip_init_timings(struct sunxi_nand_chip *chip,
 
 	mode = onfi_get_async_timing_mode(&chip->nand);
 	if (mode == ONFI_TIMING_MODE_UNKNOWN) {
-		mode = chip->nand.onfi_timing_mode_default;
+		timings = chip->nand.sdr_timings;
 	} else {
 		uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {};
 
@@ -1097,9 +1097,10 @@ static int sunxi_nand_chip_init_timings(struct sunxi_nand_chip *chip,
 						feature);
 		if (ret)
 			return ret;
+
+		timings = onfi_async_timing_mode_to_sdr_timings(mode);
 	}
 
-	timings = onfi_async_timing_mode_to_sdr_timings(mode);
 	if (IS_ERR(timings))
 		return PTR_ERR(timings);
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3d4ea7e..2eb92a3 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -536,6 +536,55 @@ struct nand_buffers {
 	uint8_t *databuf;
 };
 
+/*
+ * struct nand_sdr_timings - SDR NAND chip timings
+ *
+ * This struct defines the timing requirements of a SDR NAND chip.
+ * These informations can be found in every NAND datasheets and the timings
+ * meaning are described in the ONFI specifications:
+ * www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf (chapter 4.15 Timing
+ * Parameters)
+ *
+ * All these timings are expressed in picoseconds.
+ */
+
+struct nand_sdr_timings {
+	u32 tALH_min;
+	u32 tADL_min;
+	u32 tALS_min;
+	u32 tAR_min;
+	u32 tCEA_max;
+	u32 tCEH_min;
+	u32 tCH_min;
+	u32 tCHZ_max;
+	u32 tCLH_min;
+	u32 tCLR_min;
+	u32 tCLS_min;
+	u32 tCOH_min;
+	u32 tCS_min;
+	u32 tDH_min;
+	u32 tDS_min;
+	u32 tFEAT_max;
+	u32 tIR_min;
+	u32 tITC_max;
+	u32 tRC_min;
+	u32 tREA_max;
+	u32 tREH_min;
+	u32 tRHOH_min;
+	u32 tRHW_min;
+	u32 tRHZ_max;
+	u32 tRLOH_min;
+	u32 tRP_min;
+	u32 tRR_min;
+	u64 tRST_max;
+	u32 tWB_max;
+	u32 tWC_min;
+	u32 tWH_min;
+	u32 tWHR_min;
+	u32 tWP_min;
+	u32 tWW_min;
+};
+
 /**
  * struct nand_chip - NAND Private Flash Chip Data
  * @IO_ADDR_R:		[BOARDSPECIFIC] address to read the 8 I/O lines of the
@@ -600,11 +649,7 @@ struct nand_buffers {
  * @ecc_step_ds:	[INTERN] ECC step required by the @ecc_strength_ds,
  *                      also from the datasheet. It is the recommended ECC step
  *			size, if known; if unknown, set to zero.
- * @onfi_timing_mode_default: [INTERN] default ONFI timing mode. This field is
- *			      either deduced from the datasheet if the NAND
- *			      chip is not ONFI compliant or set to 0 if it is
- *			      (an ONFI chip is always configured in mode 0
- *			      after a NAND reset)
+ * @sdr_timings		[INTERN] Pointer to default timings for SDR NAND.
  * @numchips:		[INTERN] number of physical chips
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
  * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
@@ -689,7 +734,7 @@ struct nand_chip {
 	uint8_t bits_per_cell;
 	uint16_t ecc_strength_ds;
 	uint16_t ecc_step_ds;
-	int onfi_timing_mode_default;
+	const struct nand_sdr_timings *sdr_timings;
 	int badblockpos;
 	int badblockbits;
 
@@ -975,55 +1020,6 @@ static inline int jedec_feature(struct nand_chip *chip)
 		: 0;
 }
 
-/*
- * struct nand_sdr_timings - SDR NAND chip timings
- *
- * This struct defines the timing requirements of a SDR NAND chip.
- * These informations can be found in every NAND datasheets and the timings
- * meaning are described in the ONFI specifications:
- * www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf (chapter 4.15 Timing
- * Parameters)
- *
- * All these timings are expressed in picoseconds.
- */
-
-struct nand_sdr_timings {
-	u32 tALH_min;
-	u32 tADL_min;
-	u32 tALS_min;
-	u32 tAR_min;
-	u32 tCEA_max;
-	u32 tCEH_min;
-	u32 tCH_min;
-	u32 tCHZ_max;
-	u32 tCLH_min;
-	u32 tCLR_min;
-	u32 tCLS_min;
-	u32 tCOH_min;
-	u32 tCS_min;
-	u32 tDH_min;
-	u32 tDS_min;
-	u32 tFEAT_max;
-	u32 tIR_min;
-	u32 tITC_max;
-	u32 tRC_min;
-	u32 tREA_max;
-	u32 tREH_min;
-	u32 tRHOH_min;
-	u32 tRHW_min;
-	u32 tRHZ_max;
-	u32 tRLOH_min;
-	u32 tRP_min;
-	u32 tRR_min;
-	u64 tRST_max;
-	u32 tWB_max;
-	u32 tWC_min;
-	u32 tWH_min;
-	u32 tWHR_min;
-	u32 tWP_min;
-	u32 tWW_min;
-};
-
 /* get timing characteristics from ONFI timing mode. */
 const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode);
 #endif /* __LINUX_MTD_NAND_H */
-- 
2.4.3


-- 


IMAGINE IT >> MAKE IT

Meet us online at Twitter <http://twitter.com/ultimaker>, Facebook 
<http://facebook.com/ultimaker>, Google+ <http://google.com/+Ultimaker>

www.ultimaker.com

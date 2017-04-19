Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0jie-0008DJ-C5
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 07:08:06 +0000
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
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 1/2] mtd: nand: add generic helpers to check, match,
 maximize ECC settings
Date: Wed, 19 Apr 2017 16:06:57 +0900
Message-Id: <1492585618-13655-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1492585618-13655-1-git-send-email-yamada.masahiro@socionext.com>
References: <1492585618-13655-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each driver has been responsible for:
  - Check if ECC setting specified (mostly by DT) is valid
  - Meet the chip's required ECC strength
  - Maximize the strength when NAND_ECC_MAXIMIZE flag is set

The logic can be generalized by factoring out driver-specific
parameters.  A driver provides:
  - Array of (step_size, strength) supported on the controller
  - A hook that calculates ECC bytes from the combination of
    (step_size, strength).

Then, this commit provides 3 helper functions:
nand_check_ecc_caps - Check if preset (step_size, strength) is valid
nand_try_to_match_ecc_req - Match the chip's requirement
nand_try_to_maximize_ecc - Maximize the ECC strength

These helpers will save duplicated code among drivers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/nand_base.c | 178 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |  31 ++++++++
 2 files changed, 209 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0670e13..ee43e5e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4539,6 +4539,184 @@ static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
 	}
 }
 
+/**
+ * nand_check_ecc_caps - check if ECC step size and strength is supported
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @caps: ECC engine caps info structure
+ *
+ * When ECC step size and strength are set, check if the combination is really
+ * supported by the controller and fit within the chip's OOB.  On success,
+ * ECC bytes per step is set.
+ */
+int nand_check_ecc_caps(struct mtd_info *mtd, struct nand_chip *chip,
+			const struct nand_ecc_engine_caps *caps)
+{
+	const struct nand_ecc_setting *setting;
+	int preset_step = chip->ecc.size;
+	int preset_strength = chip->ecc.strength;
+	int ecc_bytes;
+
+	if (!preset_step || !preset_strength)
+		return -ENODATA;
+
+	for (setting = caps->ecc_settings; setting->step; setting++) {
+		if (setting->step != preset_step ||
+		    setting->strength != preset_strength)
+			continue;
+
+		ecc_bytes = caps->calc_ecc_bytes(setting);
+		if (WARN_ON_ONCE(ecc_bytes < 0))
+			continue;
+
+		if (ecc_bytes * mtd->writesize / setting->step >
+		    caps->avail_oobsize) {
+			pr_err("ECC (step, strength) = (%d, %d) does not fit in OOB",
+			       setting->step, setting->strength);
+			return -ENOSPC;
+		}
+
+		chip->ecc.bytes = ecc_bytes;
+		return 0;
+	}
+
+	pr_err("ECC (step, strength) = (%d, %d) not supported on this controller",
+	       preset_step, preset_strength);
+
+	return -ENOTSUPP;
+}
+
+/**
+ * nand_try_to_match_ecc_req - meet the chip's requirement with least ECC bytes
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @caps: ECC engine caps info structure
+ *
+ * If chip's ECC requirement is available, try to meet it with the least number
+ * number of ECC bytes (i.e. with the largest number of OOB-free bytes).
+ * On success, the chosen ECC settings are set.
+ */
+int nand_try_to_match_ecc_req(struct mtd_info *mtd, struct nand_chip *chip,
+			      const struct nand_ecc_engine_caps *caps)
+{
+	const struct nand_ecc_setting *setting, *best_setting = NULL;
+	int req_step = chip->ecc_step_ds;
+	int req_strength = chip->ecc_strength_ds;
+	int req_corr, steps, ecc_bytes, ecc_bytes_total;
+	int best_ecc_bytes, best_ecc_bytes_total = INT_MAX;
+
+	/* No information provided by the NAND chip */
+	if (!req_step || !req_strength)
+		return -ENOTSUPP;
+
+	/* number of correctable bits the chip requires in a page */
+	req_corr = mtd->writesize / req_step * req_strength;
+
+	for (setting = caps->ecc_settings; setting->step; setting++) {
+		/* If chip->ecc.size is already set, respect it. */
+		if (chip->ecc.size && setting->step != chip->ecc.size)
+			continue;
+
+		/* If chip->ecc.strength is already set, respect it. */
+		if (chip->ecc.strength &&
+		    setting->strength != chip->ecc.strength)
+			continue;
+
+		/*
+		 * If the controller's step size is smaller than the chip's
+		 * requirement, comparison of the strength is not simple.
+		 */
+		if (setting->step < req_step)
+			continue;
+
+		steps = mtd->writesize / setting->step;
+
+		ecc_bytes = caps->calc_ecc_bytes(setting);
+		if (WARN_ON_ONCE(ecc_bytes < 0))
+			continue;
+		ecc_bytes_total = ecc_bytes * steps;
+
+		if (ecc_bytes_total > caps->avail_oobsize ||
+		    setting->strength * steps < req_corr)
+			continue;
+
+		/*
+		 * We assume the best is to meet the chip's requrement
+		 * with the least number of ECC bytes.
+		 */
+		if (ecc_bytes_total < best_ecc_bytes_total) {
+			best_ecc_bytes_total = ecc_bytes_total;
+			best_setting = setting;
+			best_ecc_bytes = ecc_bytes;
+		}
+	}
+
+	if (!best_setting)
+		return -ENOTSUPP;
+
+	chip->ecc.size = best_setting->step;
+	chip->ecc.strength = best_setting->strength;
+	chip->ecc.bytes = best_ecc_bytes;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nand_try_to_match_ecc_req);
+
+/**
+ * nand_try_to_maximize_ecc - choose the max ECC strength available
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @caps: ECC engine caps info structure
+ *
+ * Choose the max ECC strength that is supported on the controller, and can fit
+ * within the chip's OOB.   * On success, the chosen ECC settings are set.
+ */
+int nand_try_to_maximize_ecc(struct mtd_info *mtd, struct nand_chip *chip,
+			     const struct nand_ecc_engine_caps *caps)
+{
+	const struct nand_ecc_setting *setting, *best_setting = NULL;
+	int steps, ecc_bytes, corr;
+	int best_corr = 0;
+	int best_ecc_bytes;
+
+	for (setting = caps->ecc_settings; setting->step; setting++) {
+		/* If chip->ecc.size is already set, respect it. */
+		if (chip->ecc.size && setting->step != chip->ecc.size)
+			continue;
+
+		steps = mtd->writesize / setting->step;
+		ecc_bytes = caps->calc_ecc_bytes(setting);
+		if (WARN_ON_ONCE(ecc_bytes < 0))
+			continue;
+
+		if (ecc_bytes * steps > caps->avail_oobsize)
+			continue;
+
+		corr = setting->strength * steps;
+
+		/*
+		 * If the number of correctable bits is the same,
+		 * bigger ecc_step has more reliability.
+		 */
+		if (corr > best_corr ||
+		    (corr == best_corr && setting->step > best_setting->step)) {
+			best_corr = corr;
+			best_setting = setting;
+			best_ecc_bytes = ecc_bytes;
+		}
+	}
+
+	if (!best_setting)
+		return -ENOTSUPP;
+
+	chip->ecc.size = best_setting->step;
+	chip->ecc.strength = best_setting->strength;
+	chip->ecc.bytes = best_ecc_bytes;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nand_try_to_maximize_ecc);
+
 /*
  * Check if the chip configuration meet the datasheet requirements.
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 2ae781e..394128f 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -486,6 +486,28 @@ static inline void nand_hw_control_init(struct nand_hw_control *nfc)
 }
 
 /**
+ * struct nand_ecc_setting - information of ECC step supported by ECC engine
+ * @step: data bytes per ECC step
+ * @bytes: ECC bytes per step
+ */
+struct nand_ecc_setting {
+	int step;
+	int strength;
+};
+
+/**
+ * struct nand_ecc_engine_caps - capability of ECC engine
+ * @ecc_settings: array of (step, strength) supported by this ECC engine
+ * @calc_ecc_bytes: driver's hook to calculate ECC bytes per step
+ * @avail_oobsize: OOB size that the ECC engine can use for ECC correction
+ */
+struct nand_ecc_engine_caps {
+	const struct nand_ecc_setting *ecc_settings;
+	int (*calc_ecc_bytes)(const struct nand_ecc_setting *ecc_setting);
+	int avail_oobsize;
+};
+
+/**
  * struct nand_ecc_ctrl - Control structure for ECC
  * @mode:	ECC mode
  * @algo:	ECC algorithm
@@ -1208,6 +1230,15 @@ int nand_check_erased_ecc_chunk(void *data, int datalen,
 				void *extraoob, int extraooblen,
 				int threshold);
 
+int nand_check_ecc_caps(struct mtd_info *mtd, struct nand_chip *chip,
+			const struct nand_ecc_engine_caps *caps);
+
+int nand_try_to_match_ecc_req(struct mtd_info *mtd, struct nand_chip *chip,
+			      const struct nand_ecc_engine_caps *caps);
+
+int nand_try_to_maximize_ecc(struct mtd_info *mtd, struct nand_chip *chip,
+			     const struct nand_ecc_engine_caps *caps);
+
 /* Default write_oob implementation */
 int nand_write_oob_std(struct mtd_info *mtd, struct nand_chip *chip, int page);
 
-- 
2.7.4

Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIZWu-0004Rk-5M
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 11:53:44 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v5 01/23] mtd: nand: add generic helpers to check, match,
 maximize ECC settings
Date: Wed,  7 Jun 2017 20:52:10 +0900
Message-Id: <1496836352-8016-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Driver are responsible for setting up ECC parameters correctly.
Those include:
  - Check if ECC parameters specified (usually by DT) are valid
  - Meet the chip's ECC requirement
  - Maximize ECC strength if NAND_ECC_MAXIMIZE flag is set

The logic can be generalized by factoring out common code.

This commit adds 3 helpers to the NAND framework:
nand_check_ecc_caps - Check if preset step_size and strength are valid
nand_match_ecc_req - Match the chip's requirement
nand_maximize_ecc - Maximize the ECC strength

To use the helpers above, a driver needs to provide:
  - Data array of supported ECC step size and strength
  - A hook that calculates ECC bytes from the combination of
    step_size and strength.

By using those helpers, code duplication among drivers will be
reduced.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v5:
  - Move oobavail from struct nand_ecc_caps to function argument
  - Do not use goto label
  - Drop mtd_info from func args
  - Remove extra blank line

Changes in v4:
  - Newly added

Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/nand_base.c | 220 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |  33 +++++++
 2 files changed, 253 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index bdfa903cd355..dc0db1011761 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4509,6 +4509,226 @@ static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
 	}
 }
 
+/**
+ * nand_check_ecc_caps - check the sanity of preset ECC settings
+ * @chip: nand chip info structure
+ * @caps: ECC caps info structure
+ * @oobavail: OOB size that the ECC engine can use
+ *
+ * When ECC step size and strength are already set, check if they are supported
+ * by the controller and the calculated ECC bytes fit within the chip's OOB.
+ * On success, the calculated ECC bytes is set.
+ */
+int nand_check_ecc_caps(struct nand_chip *chip,
+			const struct nand_ecc_caps *caps, int oobavail)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const struct nand_ecc_step_info *stepinfo;
+	int preset_step = chip->ecc.size;
+	int preset_strength = chip->ecc.strength;
+	int nsteps, ecc_bytes;
+	int i, j;
+
+	if (WARN_ON(oobavail < 0))
+		return -EINVAL;
+
+	if (!preset_step || !preset_strength)
+		return -ENODATA;
+
+	nsteps = mtd->writesize / preset_step;
+
+	for (i = 0; i < caps->nstepinfos; i++) {
+		stepinfo = &caps->stepinfos[i];
+
+		if (stepinfo->stepsize != preset_step)
+			continue;
+
+		for (j = 0; j < stepinfo->nstrengths; j++) {
+			if (stepinfo->strengths[j] != preset_strength)
+				continue;
+
+			ecc_bytes = caps->calc_ecc_bytes(preset_step,
+							 preset_strength);
+			if (WARN_ON_ONCE(ecc_bytes < 0))
+				return ecc_bytes;
+
+			if (ecc_bytes * nsteps > oobavail) {
+				pr_err("ECC (step, strength) = (%d, %d) does not fit in OOB",
+				       preset_step, preset_strength);
+				return -ENOSPC;
+			}
+
+			chip->ecc.bytes = ecc_bytes;
+
+			return 0;
+		}
+	}
+
+	pr_err("ECC (step, strength) = (%d, %d) not supported on this controller",
+	       preset_step, preset_strength);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(nand_check_ecc_caps);
+
+/**
+ * nand_match_ecc_req - meet the chip's requirement with least ECC bytes
+ * @chip: nand chip info structure
+ * @caps: ECC engine caps info structure
+ * @oobavail: OOB size that the ECC engine can use
+ *
+ * If a chip's ECC requirement is provided, try to meet it with the least
+ * number of ECC bytes (i.e. with the largest number of OOB-free bytes).
+ * On success, the chosen ECC settings are set.
+ */
+int nand_match_ecc_req(struct nand_chip *chip,
+		       const struct nand_ecc_caps *caps, int oobavail)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const struct nand_ecc_step_info *stepinfo;
+	int req_step = chip->ecc_step_ds;
+	int req_strength = chip->ecc_strength_ds;
+	int req_corr, step_size, strength, nsteps, ecc_bytes, ecc_bytes_total;
+	int best_step, best_strength, best_ecc_bytes;
+	int best_ecc_bytes_total = INT_MAX;
+	int i, j;
+
+	if (WARN_ON(oobavail < 0))
+		return -EINVAL;
+
+	/* No information provided by the NAND chip */
+	if (!req_step || !req_strength)
+		return -ENOTSUPP;
+
+	/* number of correctable bits the chip requires in a page */
+	req_corr = mtd->writesize / req_step * req_strength;
+
+	for (i = 0; i < caps->nstepinfos; i++) {
+		stepinfo = &caps->stepinfos[i];
+		step_size = stepinfo->stepsize;
+
+		for (j = 0; j < stepinfo->nstrengths; j++) {
+			strength = stepinfo->strengths[j];
+
+			/*
+			 * If both step size and strength are smaller than the
+			 * chip's requirement, it is not easy to compare the
+			 * resulted reliability.
+			 */
+			if (step_size < req_step && strength < req_strength)
+				continue;
+
+			if (mtd->writesize % step_size)
+				continue;
+
+			nsteps = mtd->writesize / step_size;
+
+			ecc_bytes = caps->calc_ecc_bytes(step_size, strength);
+			if (WARN_ON_ONCE(ecc_bytes < 0))
+				continue;
+			ecc_bytes_total = ecc_bytes * nsteps;
+
+			if (ecc_bytes_total > oobavail ||
+			    strength * nsteps < req_corr)
+				continue;
+
+			/*
+			 * We assume the best is to meet the chip's requrement
+			 * with the least number of ECC bytes.
+			 */
+			if (ecc_bytes_total < best_ecc_bytes_total) {
+				best_ecc_bytes_total = ecc_bytes_total;
+				best_step = step_size;
+				best_strength = strength;
+				best_ecc_bytes = ecc_bytes;
+			}
+		}
+	}
+
+	if (best_ecc_bytes_total == INT_MAX)
+		return -ENOTSUPP;
+
+	chip->ecc.size = best_step;
+	chip->ecc.strength = best_strength;
+	chip->ecc.bytes = best_ecc_bytes;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nand_match_ecc_req);
+
+/**
+ * nand_maximize_ecc - choose the max ECC strength available
+ * @chip: nand chip info structure
+ * @caps: ECC engine caps info structure
+ * @oobavail: OOB size that the ECC engine can use
+ *
+ * Choose the max ECC strength that is supported on the controller, and can fit
+ * within the chip's OOB.  On success, the chosen ECC settings are set.
+ */
+int nand_maximize_ecc(struct nand_chip *chip,
+		      const struct nand_ecc_caps *caps, int oobavail)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const struct nand_ecc_step_info *stepinfo;
+	int step_size, strength, nsteps, ecc_bytes, corr;
+	int best_corr = 0;
+	int best_step = 0;
+	int best_strength, best_ecc_bytes;
+	int i, j;
+
+	if (WARN_ON(oobavail < 0))
+		return -EINVAL;
+
+	for (i = 0; i < caps->nstepinfos; i++) {
+		stepinfo = &caps->stepinfos[i];
+		step_size = stepinfo->stepsize;
+
+		/* If chip->ecc.size is already set, respect it */
+		if (chip->ecc.size && step_size != chip->ecc.size)
+			continue;
+
+		for (j = 0; j < stepinfo->nstrengths; j++) {
+			strength = stepinfo->strengths[j];
+
+			if (mtd->writesize % step_size)
+				continue;
+
+			nsteps = mtd->writesize / step_size;
+
+			ecc_bytes = caps->calc_ecc_bytes(step_size, strength);
+			if (WARN_ON_ONCE(ecc_bytes < 0))
+				continue;
+
+			if (ecc_bytes * nsteps > oobavail)
+				continue;
+
+			corr = strength * nsteps;
+
+			/*
+			 * If the number of correctable bits is the same,
+			 * bigger step_size has more reliability.
+			 */
+			if (corr > best_corr ||
+			    (corr == best_corr && step_size > best_step)) {
+				best_corr = corr;
+				best_step = step_size;
+				best_strength = strength;
+				best_ecc_bytes = ecc_bytes;
+			}
+		}
+	}
+
+	if (!best_corr)
+		return -ENOTSUPP;
+
+	chip->ecc.size = best_step;
+	chip->ecc.strength = best_strength;
+	chip->ecc.bytes = best_ecc_bytes;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nand_maximize_ecc);
+
 /*
  * Check if the chip configuration meet the datasheet requirements.
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 8f67b1581683..c28a5792eed6 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -477,6 +477,30 @@ static inline void nand_hw_control_init(struct nand_hw_control *nfc)
 }
 
 /**
+ * struct nand_ecc_step_info - ECC step information of ECC engine
+ * @stepsize: data bytes per ECC step
+ * @strengths: array of supported strengths
+ * @nstrengths: number of supported strengths
+ */
+struct nand_ecc_step_info {
+	int stepsize;
+	const int *strengths;
+	int nstrengths;
+};
+
+/**
+ * struct nand_ecc_caps - capability of ECC engine
+ * @stepinfos: array of ECC step information
+ * @nstepinfos: number of ECC step information
+ * @calc_ecc_bytes: driver's hook to calculate ECC bytes per step
+ */
+struct nand_ecc_caps {
+	const struct nand_ecc_step_info *stepinfos;
+	int nstepinfos;
+	int (*calc_ecc_bytes)(int step_size, int strength);
+};
+
+/**
  * struct nand_ecc_ctrl - Control structure for ECC
  * @mode:	ECC mode
  * @algo:	ECC algorithm
@@ -1244,6 +1268,15 @@ int nand_check_erased_ecc_chunk(void *data, int datalen,
 				void *extraoob, int extraooblen,
 				int threshold);
 
+int nand_check_ecc_caps(struct nand_chip *chip,
+			const struct nand_ecc_caps *caps, int oobavail);
+
+int nand_match_ecc_req(struct nand_chip *chip,
+		       const struct nand_ecc_caps *caps,  int oobavail);
+
+int nand_maximize_ecc(struct nand_chip *chip,
+		      const struct nand_ecc_caps *caps, int oobavail);
+
 /* Default write_oob implementation */
 int nand_write_oob_std(struct mtd_info *mtd, struct nand_chip *chip, int page);
 
-- 
2.7.4

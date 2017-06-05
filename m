Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dI1LW-00080W-Bg
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 23:23:52 +0000
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
Subject: [PATCH v4 03/23] mtd: nand: add generic helpers to check, match,
 maximize ECC settings
Date: Tue,  6 Jun 2017 08:21:42 +0900
Message-Id: <1496704922-12261-4-git-send-email-yamada.masahiro@socionext.com>
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

Changes since the previous version:

 - Step size info holds an array of associated strengths
 - nand_match_ecc_req() does not take care of the case
   where ecc_size/strength is already set
 - Reflect more comments from Boris

Previous version:
http://patchwork.ozlabs.org/patch/752107/


Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/nand_base.c | 219 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |  35 +++++++
 2 files changed, 254 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index bdfa903..f2da4f2 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4509,6 +4509,225 @@ static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
 	}
 }
 
+/**
+ * nand_check_ecc_caps - check the sanity of preset ECC settings
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @caps: ECC caps info structure
+ *
+ * When ECC step size and strength are already set, check if they are supported
+ * by the controller and the calculated ECC bytes fit within the chip's OOB.
+ * On success, the calculated ECC bytes is set.
+ */
+int nand_check_ecc_caps(struct mtd_info *mtd, struct nand_chip *chip,
+			const struct nand_ecc_caps *caps)
+{
+	const struct nand_ecc_step_info *stepinfo;
+	int avail_oobsize = mtd->oobsize - caps->oob_reserve_bytes;
+	int preset_step = chip->ecc.size;
+	int preset_strength = chip->ecc.strength;
+	int ecc_bytes;
+	int i, j;
+
+	if (WARN_ON(avail_oobsize < 0))
+		return -EINVAL;
+
+	if (!preset_step || !preset_strength)
+		return -ENODATA;
+
+	for (i = 0; i < caps->nstepinfos; i++) {
+		stepinfo = &caps->stepinfos[i];
+
+		if (stepinfo->stepsize != preset_step)
+			continue;
+
+		for (j = 0; j < stepinfo->nstrengths; j++) {
+			if (stepinfo->strengths[j] == preset_strength)
+				goto found;
+		}
+	}
+
+	pr_err("ECC (step, strength) = (%d, %d) not supported on this controller",
+	       preset_step, preset_strength);
+
+	return -ENOTSUPP;
+
+found:
+	ecc_bytes = caps->calc_ecc_bytes(preset_step, preset_strength);
+	if (WARN_ON_ONCE(ecc_bytes < 0))
+		return ecc_bytes;
+
+	if (ecc_bytes * mtd->writesize / preset_step > avail_oobsize) {
+		pr_err("ECC (step, strength) = (%d, %d) does not fit in OOB",
+		       preset_step, preset_strength);
+		return -ENOSPC;
+	}
+
+	chip->ecc.bytes = ecc_bytes;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nand_check_ecc_caps);
+
+/**
+ * nand_match_ecc_req - meet the chip's requirement with least ECC bytes
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @caps: ECC engine caps info structure
+ *
+ * If a chip's ECC requirement is provided, try to meet it with the least
+ * number of ECC bytes (i.e. with the largest number of OOB-free bytes).
+ * On success, the chosen ECC settings are set.
+ */
+int nand_match_ecc_req(struct mtd_info *mtd, struct nand_chip *chip,
+		       const struct nand_ecc_caps *caps)
+{
+	const struct nand_ecc_step_info *stepinfo;
+	int avail_oobsize = mtd->oobsize - caps->oob_reserve_bytes;
+	int req_step = chip->ecc_step_ds;
+	int req_strength = chip->ecc_strength_ds;
+	int req_corr, step_size, strength, steps, ecc_bytes, ecc_bytes_total;
+	int best_step, best_strength, best_ecc_bytes;
+	int best_ecc_bytes_total = INT_MAX;
+	int i, j;
+
+	if (WARN_ON(avail_oobsize < 0))
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
+			steps = mtd->writesize / step_size;
+
+			ecc_bytes = caps->calc_ecc_bytes(step_size, strength);
+			if (WARN_ON_ONCE(ecc_bytes < 0))
+				continue;
+			ecc_bytes_total = ecc_bytes * steps;
+
+			if (ecc_bytes_total > avail_oobsize ||
+			    strength * steps < req_corr)
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
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @caps: ECC engine caps info structure
+ *
+ * Choose the max ECC strength that is supported on the controller, and can fit
+ * within the chip's OOB.  On success, the chosen ECC settings are set.
+ */
+int nand_maximize_ecc(struct mtd_info *mtd, struct nand_chip *chip,
+		      const struct nand_ecc_caps *caps)
+{
+	const struct nand_ecc_step_info *stepinfo;
+	int avail_oobsize = mtd->oobsize - caps->oob_reserve_bytes;
+	int step_size, strength, steps, ecc_bytes, corr;
+	int best_corr = 0;
+	int best_step = 0;
+	int best_strength, best_ecc_bytes;
+	int i, j;
+
+	if (WARN_ON(avail_oobsize < 0))
+		return -EINVAL;
+
+	for (i = 0; i < caps->nstepinfos; i++) {
+		stepinfo = &caps->stepinfos[i];
+		step_size = stepinfo->stepsize;
+
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
+			steps = mtd->writesize / step_size;
+
+			ecc_bytes = caps->calc_ecc_bytes(step_size, strength);
+			if (WARN_ON_ONCE(ecc_bytes < 0))
+				continue;
+
+			if (ecc_bytes * steps > avail_oobsize)
+				continue;
+
+			corr = strength * steps;
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
index 8f67b15..97ccb76 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -477,6 +477,32 @@ static inline void nand_hw_control_init(struct nand_hw_control *nfc)
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
+ * @oob_reserve_bytes: number of bytes in OOB that must be reserved
+ */
+struct nand_ecc_caps {
+	const struct nand_ecc_step_info *stepinfos;
+	int nstepinfos;
+	int (*calc_ecc_bytes)(int step_size, int strength);
+	int oob_reserve_bytes;
+};
+
+/**
  * struct nand_ecc_ctrl - Control structure for ECC
  * @mode:	ECC mode
  * @algo:	ECC algorithm
@@ -1244,6 +1270,15 @@ int nand_check_erased_ecc_chunk(void *data, int datalen,
 				void *extraoob, int extraooblen,
 				int threshold);
 
+int nand_check_ecc_caps(struct mtd_info *mtd, struct nand_chip *chip,
+			const struct nand_ecc_caps *caps);
+
+int nand_match_ecc_req(struct mtd_info *mtd, struct nand_chip *chip,
+		       const struct nand_ecc_caps *caps);
+
+int nand_maximize_ecc(struct mtd_info *mtd, struct nand_chip *chip,
+		      const struct nand_ecc_caps *caps);
+
 /* Default write_oob implementation */
 int nand_write_oob_std(struct mtd_info *mtd, struct nand_chip *chip, int page);
 
-- 
2.7.4

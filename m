Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEDEN-0007a0-IB
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 12:21:05 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andy Gross <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 01/14] mtd: rawnand: helper function for setting up ECC
 parameters
Date: Thu,  3 May 2018 17:50:28 +0530
Message-Id: <1525350041-22995-2-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit 2c8f8afa7f92 ("mtd: nand: add generic helpers to check,
match, maximize ECC settings") provides generic helpers which
drivers can use for setting up ECC parameters.

Since same board can have different ECC strength nand chips so
following is the logic for setting up ECC strength and ECC step
size, which can be used by most of the drivers.

1. If both ECC step size and ECC strength are already set
   (usually by DT) then just check whether this setting
   is supported by NAND controller.
2. If NAND_ECC_MAXIMIZE is set, then select maximum ECC strength
   supported by NAND controller.
3. Otherwise, try to match the ECC step size and ECC strength closest
   to the chip's requirement. If available OOB size can't fit the chip
   requirement then select maximum ECC strength which can be fit with
   available OOB size with warning.

This patch introduces nand_ecc_param_setup function which calls the
required helper functions for the above logic. The drivers can use
this single function instead of calling the 3 helper functions
individually.

CC: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
* Changes from v1:

  NEW PATCH

 drivers/mtd/nand/raw/nand_base.c | 42 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 72f3a89..dd7a984 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6249,6 +6249,48 @@ int nand_maximize_ecc(struct nand_chip *chip,
 }
 EXPORT_SYMBOL_GPL(nand_maximize_ecc);
 
+/**
+ * nand_ecc_param_setup - Set the ECC strength and ECC step size
+ * @chip: nand chip info structure
+ * @caps: ECC engine caps info structure
+ * @oobavail: OOB size that the ECC engine can use
+ *
+ * Choose the ECC strength according to following logic
+ *
+ * 1. If both ECC step size and ECC strength are already set (usually by DT)
+ *    then check if it is supported by this controller.
+ * 2. If NAND_ECC_MAXIMIZE is set, then select maximum ECC strength.
+ * 3. Otherwise, try to match the ECC step size and ECC strength closest
+ *    to the chip's requirement. If available OOB size can't fit the chip
+ *    requirement then fallback to the maximum ECC step size and ECC strength
+ *    and print the warning.
+ *
+ * On success, the chosen ECC settings are set.
+ */
+int nand_ecc_param_setup(struct nand_chip *chip,
+			 const struct nand_ecc_caps *caps, int oobavail)
+{
+	int ret;
+
+	if (chip->ecc.size && chip->ecc.strength)
+		return nand_check_ecc_caps(chip, caps, oobavail);
+
+	if (chip->ecc.options & NAND_ECC_MAXIMIZE)
+		return nand_maximize_ecc(chip, caps, oobavail);
+
+	if (!nand_match_ecc_req(chip, caps, oobavail))
+		return 0;
+
+	ret = nand_maximize_ecc(chip, caps, oobavail);
+	if (!ret)
+		pr_warn("ECC (step, strength) = (%d, %d) not supported on this controller. Fallback to (%d, %d)\n",
+			chip->ecc_step_ds, chip->ecc_strength_ds,
+			chip->ecc.size, chip->ecc.strength);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(nand_ecc_param_setup);
+
 /*
  * Check if the chip configuration meet the datasheet requirements.
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5dad59b..afc7447 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1627,6 +1627,9 @@ int nand_match_ecc_req(struct nand_chip *chip,
 int nand_maximize_ecc(struct nand_chip *chip,
 		      const struct nand_ecc_caps *caps, int oobavail);
 
+int nand_ecc_param_setup(struct nand_chip *chip,
+			 const struct nand_ecc_caps *caps, int oobavail);
+
 /* Default write_oob implementation */
 int nand_write_oob_std(struct mtd_info *mtd, struct nand_chip *chip, int page);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation

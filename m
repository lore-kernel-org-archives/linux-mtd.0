Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMBjR-0005lk-TU
 for linux-mtd@lists.infradead.org; Fri, 25 May 2018 12:22:07 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andy Gross <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 01/16] mtd: rawnand: helper function for setting up ECC
 configuration
Date: Fri, 25 May 2018 17:51:29 +0530
Message-Id: <1527250904-21988-2-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
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
   available OOB size.

This patch introduces nand_ecc_choose_conf function which calls the
required helper functions for the above logic. The drivers can use
this single function instead of calling the 3 helper functions
individually.

CC: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
* Changes from v2:

  1. Renamed function to nand_ecc_choose_conf.
  2. Minor code reorganization to remove warning and 2 function calls
     for nand_maximize_ecc.

* Changes from v1:
  NEW PATCH

 drivers/mtd/nand/raw/nand_base.c | 42 ++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/raw/nand_base.c | 31 +++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 72f3a89..e52019d 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6249,6 +6249,37 @@ int nand_maximize_ecc(struct nand_chip *chip,
 }
 EXPORT_SYMBOL_GPL(nand_maximize_ecc);
 
+/**
+ * nand_ecc_choose_conf - Set the ECC strength and ECC step size
+ * @chip: nand chip info structure
+ * @caps: ECC engine caps info structure
+ * @oobavail: OOB size that the ECC engine can use
+ *
+ * Choose the ECC configuration according to following logic
+ *
+ * 1. If both ECC step size and ECC strength are already set (usually by DT)
+ *    then check if it is supported by this controller.
+ * 2. If NAND_ECC_MAXIMIZE is set, then select maximum ECC strength.
+ * 3. Otherwise, try to match the ECC step size and ECC strength closest
+ *    to the chip's requirement. If available OOB size can't fit the chip
+ *    requirement then fallback to the maximum ECC step size and ECC strength.
+ *
+ * On success, the chosen ECC settings are set.
+ */
+int nand_ecc_choose_conf(struct nand_chip *chip,
+			 const struct nand_ecc_caps *caps, int oobavail)
+{
+	if (chip->ecc.size && chip->ecc.strength)
+		return nand_check_ecc_caps(chip, caps, oobavail);
+
+	if (!(chip->ecc.options & NAND_ECC_MAXIMIZE) &&
+	    !nand_match_ecc_req(chip, caps, oobavail))
+		return 0;
+
+	return nand_maximize_ecc(chip, caps, oobavail);
+}
+EXPORT_SYMBOL_GPL(nand_ecc_choose_conf);
+
 /*
  * Check if the chip configuration meet the datasheet requirements.
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5dad59b..89889fa 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1627,6 +1627,9 @@ int nand_match_ecc_req(struct nand_chip *chip,
 int nand_maximize_ecc(struct nand_chip *chip,
 		      const struct nand_ecc_caps *caps, int oobavail);
 
+int nand_ecc_choose_conf(struct nand_chip *chip,
+			 const struct nand_ecc_caps *caps, int oobavail);
+
 /* Default write_oob implementation */
 int nand_write_oob_std(struct mtd_info *mtd, struct nand_chip *chip, int page);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation

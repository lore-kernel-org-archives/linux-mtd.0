Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVXY7-0001dc-NV
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 07:30:26 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 15/15] mtd: rawnand: provide only single helper function
 for ECC conf
Date: Wed, 20 Jun 2018 12:57:42 +0530
Message-Id: <1529479662-4026-16-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1529479662-4026-1-git-send-email-absahu@codeaurora.org>
References: <1529479662-4026-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Function nand_ecc_choose_conf() will be help for all the cases, so
other helper functions can be made static.

nand_check_ecc_caps(): Invoke nand_ecc_choose_conf() with
                       both chip->ecc.size and chip->ecc.strength
                       value set.

nand_maximize_ecc(): Invoke nand_ecc_choose_conf() with
                     NAND_ECC_MAXIMIZE flag.

nand_match_ecc_req(): Invoke nand_ecc_choose_conf() with either
                      chip->ecc.size or chip->ecc.strength value
                      set and without NAND_ECC_MAXIMIZE flag.

CC: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
Changes from v3:

NEW PATCH

 drivers/mtd/nand/raw/nand_base.c | 39 +++++++++++++++------------------------
 include/linux/mtd/rawnand.h      |  9 ---------
 2 files changed, 15 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c64e3fc..f620236 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6077,24 +6077,17 @@ static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
  * by the controller and the calculated ECC bytes fit within the chip's OOB.
  * On success, the calculated ECC bytes is set.
  */
-int nand_check_ecc_caps(struct nand_chip *chip,
-			const struct nand_ecc_caps *caps, int oobavail)
+static int
+nand_check_ecc_caps(struct nand_chip *chip,
+		    const struct nand_ecc_caps *caps, int oobavail)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	const struct nand_ecc_step_info *stepinfo;
 	int preset_step = chip->ecc.size;
 	int preset_strength = chip->ecc.strength;
-	int nsteps, ecc_bytes;
+	int ecc_bytes, nsteps = mtd->writesize / preset_step;
 	int i, j;
 
-	if (WARN_ON(oobavail < 0))
-		return -EINVAL;
-
-	if (!preset_step || !preset_strength)
-		return -ENODATA;
-
-	nsteps = mtd->writesize / preset_step;
-
 	for (i = 0; i < caps->nstepinfos; i++) {
 		stepinfo = &caps->stepinfos[i];
 
@@ -6127,7 +6120,6 @@ int nand_check_ecc_caps(struct nand_chip *chip,
 
 	return -ENOTSUPP;
 }
-EXPORT_SYMBOL_GPL(nand_check_ecc_caps);
 
 /**
  * nand_match_ecc_req - meet the chip's requirement with least ECC bytes
@@ -6139,8 +6131,9 @@ int nand_check_ecc_caps(struct nand_chip *chip,
  * number of ECC bytes (i.e. with the largest number of OOB-free bytes).
  * On success, the chosen ECC settings are set.
  */
-int nand_match_ecc_req(struct nand_chip *chip,
-		       const struct nand_ecc_caps *caps, int oobavail)
+static int
+nand_match_ecc_req(struct nand_chip *chip,
+		   const struct nand_ecc_caps *caps, int oobavail)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	const struct nand_ecc_step_info *stepinfo;
@@ -6151,9 +6144,6 @@ int nand_match_ecc_req(struct nand_chip *chip,
 	int best_ecc_bytes_total = INT_MAX;
 	int i, j;
 
-	if (WARN_ON(oobavail < 0))
-		return -EINVAL;
-
 	/* No information provided by the NAND chip */
 	if (!req_step || !req_strength)
 		return -ENOTSUPP;
@@ -6212,7 +6202,6 @@ int nand_match_ecc_req(struct nand_chip *chip,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(nand_match_ecc_req);
 
 /**
  * nand_maximize_ecc - choose the max ECC strength available
@@ -6223,8 +6212,9 @@ int nand_match_ecc_req(struct nand_chip *chip,
  * Choose the max ECC strength that is supported on the controller, and can fit
  * within the chip's OOB.  On success, the chosen ECC settings are set.
  */
-int nand_maximize_ecc(struct nand_chip *chip,
-		      const struct nand_ecc_caps *caps, int oobavail)
+static int
+nand_maximize_ecc(struct nand_chip *chip,
+		  const struct nand_ecc_caps *caps, int oobavail)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	const struct nand_ecc_step_info *stepinfo;
@@ -6234,9 +6224,6 @@ int nand_maximize_ecc(struct nand_chip *chip,
 	int best_strength, best_ecc_bytes;
 	int i, j;
 
-	if (WARN_ON(oobavail < 0))
-		return -EINVAL;
-
 	for (i = 0; i < caps->nstepinfos; i++) {
 		stepinfo = &caps->stepinfos[i];
 		step_size = stepinfo->stepsize;
@@ -6285,7 +6272,6 @@ int nand_maximize_ecc(struct nand_chip *chip,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(nand_maximize_ecc);
 
 /**
  * nand_ecc_choose_conf - Set the ECC strength and ECC step size
@@ -6307,6 +6293,11 @@ int nand_maximize_ecc(struct nand_chip *chip,
 int nand_ecc_choose_conf(struct nand_chip *chip,
 			 const struct nand_ecc_caps *caps, int oobavail)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	if (WARN_ON(oobavail < 0 || oobavail > mtd->oobsize))
+		return -EINVAL;
+
 	if (chip->ecc.size && chip->ecc.strength)
 		return nand_check_ecc_caps(chip, caps, oobavail);
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 03a0061..0945868 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1641,15 +1641,6 @@ int nand_check_erased_ecc_chunk(void *data, int datalen,
 				void *extraoob, int extraooblen,
 				int threshold);
 
-int nand_check_ecc_caps(struct nand_chip *chip,
-			const struct nand_ecc_caps *caps, int oobavail);
-
-int nand_match_ecc_req(struct nand_chip *chip,
-		       const struct nand_ecc_caps *caps,  int oobavail);
-
-int nand_maximize_ecc(struct nand_chip *chip,
-		      const struct nand_ecc_caps *caps, int oobavail);
-
 int nand_ecc_choose_conf(struct nand_chip *chip,
 			 const struct nand_ecc_caps *caps, int oobavail);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation

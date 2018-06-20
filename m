Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVXX9-0001Bg-Ed
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 07:28:05 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 02/15] mtd: rawnand: denali: use helper function for ecc
 setup
Date: Wed, 20 Jun 2018 12:57:29 +0530
Message-Id: <1529479662-4026-3-git-send-email-absahu@codeaurora.org>
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

Use the NAND core helper function nand_ecc_choose_conf to tune
the ECC parameters instead of the function locally defined.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
* Changes from v3:
 NONE

* Changes from v2:

  1. Changed commit message

* Changes from v1:
  NEW PATCH

 drivers/mtd/nand/raw/denali.c | 30 ++----------------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 2a302a1..a586a1d 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1120,33 +1120,6 @@ int denali_calc_ecc_bytes(int step_size, int strength)
 }
 EXPORT_SYMBOL(denali_calc_ecc_bytes);
 
-static int denali_ecc_setup(struct mtd_info *mtd, struct nand_chip *chip,
-			    struct denali_nand_info *denali)
-{
-	int oobavail = mtd->oobsize - denali->oob_skip_bytes;
-	int ret;
-
-	/*
-	 * If .size and .strength are already set (usually by DT),
-	 * check if they are supported by this controller.
-	 */
-	if (chip->ecc.size && chip->ecc.strength)
-		return nand_check_ecc_caps(chip, denali->ecc_caps, oobavail);
-
-	/*
-	 * We want .size and .strength closest to the chip's requirement
-	 * unless NAND_ECC_MAXIMIZE is requested.
-	 */
-	if (!(chip->ecc.options & NAND_ECC_MAXIMIZE)) {
-		ret = nand_match_ecc_req(chip, denali->ecc_caps, oobavail);
-		if (!ret)
-			return 0;
-	}
-
-	/* Max ECC strength is the last thing we can do */
-	return nand_maximize_ecc(chip, denali->ecc_caps, oobavail);
-}
-
 static int denali_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *oobregion)
 {
@@ -1317,7 +1290,8 @@ int denali_init(struct denali_nand_info *denali)
 	chip->ecc.mode = NAND_ECC_HW_SYNDROME;
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
-	ret = denali_ecc_setup(mtd, chip, denali);
+	ret = nand_ecc_choose_conf(chip, denali->ecc_caps,
+				   mtd->oobsize - denali->oob_skip_bytes);
 	if (ret) {
 		dev_err(denali->dev, "Failed to setup ECC settings.\n");
 		goto disable_irq;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation

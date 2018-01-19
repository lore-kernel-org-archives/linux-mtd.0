Received: from mail.free-electrons.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ecSx8-0000YX-1I
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 09:27:16 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH v2 1/2] mtd: nand: Check ONFI timings have been acked by the
 chip
Date: Fri, 19 Jan 2018 10:25:46 +0100
Message-Id: <20180119092547.26873-2-miquel.raynal@free-electrons.com>
In-Reply-To: <20180119092547.26873-1-miquel.raynal@free-electrons.com>
References: <20180119092547.26873-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Choosing ONFI timings when ->onfi_set/get_features() calls are supported
by the NAND chip is a matter of reading the chip's ONFI parameter page
and telling the chip the chosen mode (between all of the supported ones)
with ->onfi_set_feature().

Add a check on whether the chip "acked" the timing mode or not.

This can be a problem for NAND chips that do not follow entirely the
ONFI specification. These chips actually support other modes than
"mode 0", but do not update the parameter page once a timing mode has
been selected. This issue will be addressed in another patch that will
add the feature to overwrite NAND chips features within the parameter
page, from the NAND chip driver.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 41 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 96c97588e1ba..e209a65a17e0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1231,15 +1231,47 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 			chip->onfi_timing_mode_default,
 		};
 
+		chip->select_chip(mtd, chipnr);
 		ret = chip->onfi_set_features(mtd, chip,
 				ONFI_FEATURE_ADDR_TIMING_MODE,
 				tmode_param);
+		chip->select_chip(mtd, -1);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	ret = chip->setup_data_interface(mtd, chipnr, &chip->data_interface);
-err:
+	if (ret)
+		return ret;
+
+	if (chip->onfi_version &&
+	    (le16_to_cpu(chip->onfi_params.opt_cmd) &
+	     ONFI_OPT_CMD_SET_GET_FEATURES)) {
+		u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {};
+
+		chip->select_chip(mtd, chipnr);
+		ret = chip->onfi_get_features(mtd, chip,
+					      ONFI_FEATURE_ADDR_TIMING_MODE,
+					      tmode_param);
+		chip->select_chip(mtd, -1);
+		if (ret)
+			goto err_reset_chip;
+
+		if (tmode_param[0] != chip->onfi_timing_mode_default) {
+			pr_warn("timings mode %d not acknowledged by the NAND chip\n",
+				chip->onfi_timing_mode_default);
+			goto err_reset_chip;
+		}
+	}
+
+	return 0;
+
+err_reset_chip:
+	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
+	chip->select_chip(mtd, chipnr);
+	nand_reset_op(chip);
+	chip->select_chip(mtd, -1);
+
 	return ret;
 }
 
@@ -2738,10 +2770,8 @@ int nand_reset(struct nand_chip *chip, int chipnr)
 	if (ret)
 		return ret;
 
-	chip->select_chip(mtd, chipnr);
 	chip->data_interface = saved_data_intf;
 	ret = nand_setup_data_interface(chip, chipnr);
-	chip->select_chip(mtd, -1);
 	if (ret)
 		return ret;
 
@@ -6571,10 +6601,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 	/* Enter fastest possible mode on all dies. */
 	for (i = 0; i < chip->numchips; i++) {
-		chip->select_chip(mtd, i);
 		ret = nand_setup_data_interface(chip, i);
-		chip->select_chip(mtd, -1);
-
 		if (ret)
 			goto err_nand_manuf_cleanup;
 	}
-- 
2.11.0

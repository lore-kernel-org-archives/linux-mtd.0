Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erlce-0004rI-VO
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 14:25:33 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 05/14] mtd: rawnand: check ONFI timings have been acked by
 the chip
Date: Fri,  2 Mar 2018 15:24:13 +0100
Message-Id: <20180302142422.2543-6-miquel.raynal@bootlin.com>
In-Reply-To: <20180302142422.2543-1-miquel.raynal@bootlin.com>
References: <20180302142422.2543-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Choosing ONFI timings when ->set/get_features() calls are supported
by the NAND chip is a matter of reading the chip's ONFI parameter page
and telling the chip the chosen mode (between all of the supported ones)
with ->set_feature().

Add a check on whether the chip "acked" the timing mode or not.

This can be a problem for NAND chips that do not follow entirely the
ONFI specification. These chips actually support other modes than
"mode 0", but do not update the parameter page once a timing mode has
been selected. This issue will be addressed in another patch that will
add the feature to overwrite NAND chips features within the parameter
page, from the NAND chip driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/raw/nand_base.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 8e48f08d8496..47f77e846edc 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1237,11 +1237,42 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 					 tmode_param);
 		chip->select_chip(mtd, -1);
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
+		ret = chip->get_features(mtd, chip,
+					 ONFI_FEATURE_ADDR_TIMING_MODE,
+					 tmode_param);
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
+	/* Fallback to timing mode 0 */
+	nand_reset_data_interface(chip, chipnr);
+	chip->select_chip(mtd, chipnr);
+	nand_reset_op(chip);
+	chip->select_chip(mtd, -1);
+
 	return ret;
 }
 
-- 
2.14.1

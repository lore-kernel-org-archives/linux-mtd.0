Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exrFV-0006Ad-KM
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 09:38:53 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 06/13] mtd: rawnand: check ONFI timings have been acked by
 the chip
Date: Mon, 19 Mar 2018 10:38:04 +0100
Message-Id: <20180319093811.18351-7-miquel.raynal@bootlin.com>
In-Reply-To: <20180319093811.18351-1-miquel.raynal@bootlin.com>
References: <20180319093811.18351-1-miquel.raynal@bootlin.com>
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
"mode 0", but either:
1/ do not update the timing mode register once a timing mode has been
   selected.
or
2/ do not support the TIMING_MODE featured and thus do not require users
   to change the timing mode at all.

These issues will be addressed in another patch that will add the
feature to overwrite NAND chips features within the parameter page, from
the NAND chip driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/raw/nand_base.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 400d4bc85bc0..281c4e1daa29 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1284,7 +1284,45 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 		return ret;
 
 	/* Change the mode on the controller side */
-	return chip->setup_data_interface(mtd, chipnr, &chip->data_interface);
+	ret = chip->setup_data_interface(mtd, chipnr, &chip->data_interface);
+	if (ret)
+		return ret;
+
+	/* Check the mode has been accepted by the chip */
+	memset(tmode_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
+	chip->select_chip(mtd, chipnr);
+	ret = nand_get_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
+				tmode_param);
+	chip->select_chip(mtd, -1);
+	if (ret && ret != -ENOTSUPP)
+		goto err_reset_chip;
+
+	/*
+	 * Do not fail because the mode could not be checked. However, skip the
+	 * comparison block that would probably raise an error.
+	 */
+	if (ret == -ENOTSUPP)
+		return 0;
+
+	if (tmode_param[0] != chip->onfi_timing_mode_default) {
+		pr_warn("timing mode %d not acknowledged by the NAND chip\n",
+			chip->onfi_timing_mode_default);
+		goto err_reset_chip;
+	}
+
+	return 0;
+
+err_reset_chip:
+	/*
+	 * Fallback to mode 0 if the chip explicitly did not ack the chosen
+	 * timing mode.
+	 */
+	nand_reset_data_interface(chip, chipnr);
+	chip->select_chip(mtd, chipnr);
+	nand_reset_op(chip);
+	chip->select_chip(mtd, -1);
+
+	return ret;
 }
 
 /**
-- 
2.14.1

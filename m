Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exv9S-0004gK-Do
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 13:48:42 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 12/14] mtd: rawnand: macronix: nack the support of changing
 timings for one chip
Date: Mon, 19 Mar 2018 14:47:29 +0100
Message-Id: <20180319134731.22605-13-miquel.raynal@bootlin.com>
In-Reply-To: <20180319134731.22605-1-miquel.raynal@bootlin.com>
References: <20180319134731.22605-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The MX30LF2G18AC chip declares in its parameter page supporting
SET/GET_FEATURES but when it comes to timings, experience shows that it
is not the case.

Unflag this feature for this particular chip in the nand_parameters
structure to avoid unnecessary errors and downturns.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_macronix.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index d290ff2a6d2f..7ed1f87e742a 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -22,6 +22,19 @@ static int macronix_nand_init(struct nand_chip *chip)
 	if (nand_is_slc(chip))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
+	/*
+	 * MX30LF2G18AC chip does not support using SET/GET_FEATURES to change
+	 * the timings unlike what is declared in the parameter page. Unflag
+	 * this feature to avoid unnecessary downturns.
+	 */
+	if (chip->parameters.supports_set_get_features &&
+	    !strcmp("MX30LF2G18AC", chip->parameters.model)) {
+		bitmap_clear(chip->parameters.get_feature_list,
+			     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
+		bitmap_clear(chip->parameters.set_feature_list,
+			     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
+	}
+
 	return 0;
 }
 
-- 
2.14.1

Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erlcv-0005Qu-Aw
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 14:25:56 +0000
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
Subject: [PATCH v3 12/14] mtd: rawnand: macronix: nack the support of changing
 timings for one chip
Date: Fri,  2 Mar 2018 15:24:20 +0100
Message-Id: <20180302142422.2543-13-miquel.raynal@bootlin.com>
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

The MX30LF2G18AC chip declares in its parameter page supporting
SET/GET_FEATURES but when it comes to timings, experience shows that it
is not the case.

Unflag this feature for this particular chip in the nand_parameters
structure to avoid unnecessary errors and downturns.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_macronix.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index d290ff2a6d2f..deae93d590b5 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -22,6 +22,16 @@ static int macronix_nand_init(struct nand_chip *chip)
 	if (nand_is_slc(chip))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
+	/*
+	 * MX30LF2G18AC chip does not support using SET/GET_FEATURES to change
+	 * the timings unlike what is declared in the parameter page. Unflag
+	 * this feature to avoid unnecessary downturns.
+	 */
+	if (chip->parameters.supports_set_get_features &&
+	    !strcmp("MX30LF2G18AC", chip->parameters.model))
+		bitmap_clear(chip->parameters.get_feature_list,
+			     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
+
 	return 0;
 }
 
-- 
2.14.1

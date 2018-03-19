Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exv9S-0004fX-Dg
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 13:48:43 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 06/14] mtd: rawnand: move calls to ->select_chip() in
 nand_setup_data_interface()
Date: Mon, 19 Mar 2018 14:47:23 +0100
Message-Id: <20180319134731.22605-7-miquel.raynal@bootlin.com>
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

After a ->set_features(TIMINGS), the chip is supposed to be working at a
new speed. In order for all the transactions to be perperly handled, the
NAND controller should also be configured to this same speed. Calling
->setup_data_interface() is not enough and the chip should be
de-asserted/re-asserted through calls to ->select_chip().

Prepare the next change in nand_setup_data_interface() where timings
will be checked after being applied. Because assertions of the CS pin
will be needed from within this function, move the calls to
->select_chip() inside nand_setup_data_interface() for later
consistency.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index dbab57547a54..1721a73fe2dd 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1273,8 +1273,10 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 
 	/* Change the mode on the chip side (if supported by the NAND chip) */
 	if (nand_supports_set_get_features(chip)) {
+		chip->select_chip(mtd, chipnr);
 		ret = nand_set_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
 					tmode_param);
+		chip->select_chip(mtd, -1);
 		if (ret)
 			return ret;
 	}
@@ -2779,10 +2781,8 @@ int nand_reset(struct nand_chip *chip, int chipnr)
 	if (ret)
 		return ret;
 
-	chip->select_chip(mtd, chipnr);
 	chip->data_interface = saved_data_intf;
 	ret = nand_setup_data_interface(chip, chipnr);
-	chip->select_chip(mtd, -1);
 	if (ret)
 		return ret;
 
@@ -6504,10 +6504,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 
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
2.14.1

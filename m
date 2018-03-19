Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exrFV-0006Ac-Kz
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 09:38:54 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 05/13] mtd: rawnand: move calls to ->select_chip() in
 nand_setup_data_interface()
Date: Mon, 19 Mar 2018 10:38:03 +0100
Message-Id: <20180319093811.18351-6-miquel.raynal@bootlin.com>
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
index 0fd2b8ab69c7..400d4bc85bc0 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1270,8 +1270,10 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 		return 0;
 
 	/* Change the mode on the chip side */
+	chip->select_chip(mtd, chipnr);
 	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
 				tmode_param);
+	chip->select_chip(mtd, -1);
 
 	/*
 	 * Do not fail because the mode cannot explicitly be set. If the NAND
@@ -2781,10 +2783,8 @@ int nand_reset(struct nand_chip *chip, int chipnr)
 	if (ret)
 		return ret;
 
-	chip->select_chip(mtd, chipnr);
 	chip->data_interface = saved_data_intf;
 	ret = nand_setup_data_interface(chip, chipnr);
-	chip->select_chip(mtd, -1);
 	if (ret)
 		return ret;
 
@@ -6506,10 +6506,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 
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

Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erlce-0004oA-VE
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 14:25:35 +0000
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
Subject: [PATCH v3 04/14] mtd: rawnand: move calls to ->select_chip() in
 nand_setup_data_interface()
Date: Fri,  2 Mar 2018 15:24:12 +0100
Message-Id: <20180302142422.2543-5-miquel.raynal@bootlin.com>
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
index 802cd9ed44a1..8e48f08d8496 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1231,9 +1231,11 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 			chip->onfi_timing_mode_default,
 		};
 
+		chip->select_chip(mtd, chipnr);
 		ret = chip->set_features(mtd, chip,
 					 ONFI_FEATURE_ADDR_TIMING_MODE,
 					 tmode_param);
+		chip->select_chip(mtd, -1);
 		if (ret)
 			goto err;
 	}
@@ -2739,10 +2741,8 @@ int nand_reset(struct nand_chip *chip, int chipnr)
 	if (ret)
 		return ret;
 
-	chip->select_chip(mtd, chipnr);
 	chip->data_interface = saved_data_intf;
 	ret = nand_setup_data_interface(chip, chipnr);
-	chip->select_chip(mtd, -1);
 	if (ret)
 		return ret;
 
@@ -6474,10 +6474,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 
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

Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exv9F-0004dZ-Qs
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 13:48:27 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 04/14] mtd: rawnand: handle differently chip/controller
 errors about timings
Date: Mon, 19 Mar 2018 14:47:21 +0100
Message-Id: <20180319134731.22605-5-miquel.raynal@bootlin.com>
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

Usually, the source of the error when setting/getting features does not
matter (if the controller does not support sending the command or if
the chip does not support the operation).

When it comes to timings, if the controller fails it is an error while
if the chip does not support the operation, it can be silently supposed
that it already works with the maximum supported timings.

Introduce some logic in nand_setup_data_interface() to handle that
difference.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 68cea38491e4..dbab57547a54 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1271,11 +1271,13 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 	if (!chip->setup_data_interface)
 		return 0;
 
-	/* Change the mode on the chip side */
-	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
-				tmode_param);
-	if (ret)
-		return ret;
+	/* Change the mode on the chip side (if supported by the NAND chip) */
+	if (nand_supports_set_get_features(chip)) {
+		ret = nand_set_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
+					tmode_param);
+		if (ret)
+			return ret;
+	}
 
 	/* Change the mode on the controller side */
 	return chip->setup_data_interface(mtd, chipnr, &chip->data_interface);
-- 
2.14.1

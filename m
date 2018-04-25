Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBJvn-0001U0-Di
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2018 12:53:57 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz <oferh@marvell.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org
Subject: [PATCH 2/3] mtd: rawnand: marvell: fix CS pin count with old bindings
Date: Wed, 25 Apr 2018 14:53:30 +0200
Message-Id: <20180425125331.8234-3-miquel.raynal@bootlin.com>
In-Reply-To: <20180425125331.8234-1-miquel.raynal@bootlin.com>
References: <20180425125331.8234-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For both the old bindings and the new bindings the same logic was
applied to retrieve the number of CS lines: using of_get_property() to
get a size in bytes, converted in the actual number of lines by dividing
it per sizeof(u32) (4 bytes).

This is fine for the 'reg' property which is a list of the CS IDs but
not for the 'num-cs' property which is directly the value of the number
of CS.

Anyway, no existing DT uses another value than 'num-cs = <1>' and no
other value has ever been supported by the old driver (pxa3xx_nand.c).
Remove this condition and apply a number of 1 CS anyway, as already
described in the bindings.

Fixes: 02f26ecf8c772 ("mtd: nand: add reworked Marvell NAND controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 2a467c72bbfb..c33ebc2cc024 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2299,29 +2299,23 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	/*
 	 * The legacy "num-cs" property indicates the number of CS on the only
 	 * chip connected to the controller (legacy bindings does not support
-	 * more than one chip). CS are only incremented one by one while the RB
-	 * pin is always the #0.
+	 * more than one chip). The CS and RB pins are always the #0.
 	 *
 	 * When not using legacy bindings, a couple of "reg" and "nand-rb"
 	 * properties must be filled. For each chip, expressed as a subnode,
 	 * "reg" points to the CS lines and "nand-rb" to the RB line.
 	 */
-	if (pdata) {
+	if (pdata || nfc->caps->legacy_of_bindings) {
 		nsels = 1;
-	} else if (nfc->caps->legacy_of_bindings) {
-		if (!of_get_property(np, "num-cs", &nsels)) {
-			dev_err(dev, "missing num-cs property\n");
-			return -EINVAL;
-		}
 	} else {
 		if (!of_get_property(np, "reg", &nsels)) {
 			dev_err(dev, "missing reg property\n");
 			return -EINVAL;
 		}
-	}
 
-	if (!pdata)
 		nsels /= sizeof(u32);
+	}
+
 	if (!nsels) {
 		dev_err(dev, "invalid reg property size\n");
 		return -EINVAL;
-- 
2.14.1

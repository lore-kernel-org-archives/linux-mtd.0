Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBJvn-0001U2-KA
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2018 12:53:58 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz <oferh@marvell.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/3] mtd: rawnand: marvell: use OF helper to read a property
 element count
Date: Wed, 25 Apr 2018 14:53:31 +0200
Message-Id: <20180425125331.8234-4-miquel.raynal@bootlin.com>
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

The 'reg' property of a 'nand' node (with the new bindings) gives the
IDs of each CS line in use. marvell_nand.c driver first look at the
number of CS lines that are present in this property.

Better use of_property_count_elems_of_size() than dividing by 4 the size
of the number of bytes returned by of_get_property().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index c33ebc2cc024..1d779a35ac8e 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2308,17 +2308,11 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	if (pdata || nfc->caps->legacy_of_bindings) {
 		nsels = 1;
 	} else {
-		if (!of_get_property(np, "reg", &nsels)) {
-			dev_err(dev, "missing reg property\n");
+		nsels = of_property_count_elems_of_size(np, "reg", sizeof(u32));
+		if (nsels <= 0) {
+			dev_err(dev, "missing/invalid reg property\n");
 			return -EINVAL;
 		}
-
-		nsels /= sizeof(u32);
-	}
-
-	if (!nsels) {
-		dev_err(dev, "invalid reg property size\n");
-		return -EINVAL;
 	}
 
 	/* Alloc the nand chip structure */
-- 
2.14.1

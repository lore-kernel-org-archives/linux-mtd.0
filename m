Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBJvn-0001Tx-KA
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2018 12:53:59 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz <oferh@marvell.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org
Subject: [PATCH 1/3] mtd: rawnand: marvell: fix the chip-select DT parsing
 logic
Date: Wed, 25 Apr 2018 14:53:29 +0200
Message-Id: <20180425125331.8234-2-miquel.raynal@bootlin.com>
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

The block responsible of parsing the DT for the number of chip-select
lines uses an 'if/else if/else if' block. The content of the second and
third 'else if' conditions are:
        1/ the actual condition to enter the sub-block and
        2/ the operation to do in this sub-block.

        [...]
        else if (condition1_to_enter && action1() == failed)
                raise_error();
        else if (condition2_to_enter && action2() == failed)
                raise_error();
        [...]

In case of failure, the sub-block is entered and an error raised.
Otherwise, in case of success, the code would continue erroneously in
the next 'else if' statement because it did not failed (and did not
enter the first 'else if' sub-block).

The first 'else if' refers to legacy bindings while the second 'else if'
refers to new bindings. The second 'else if', which is entered
erroneously, checks for the 'reg' property, which, for old bindings,
does not mean anything because it would not be the number of CS
available, but the regular register map of almost any DT node. This
being said, the content of the 'reg' property being the register map
offset and length, it has '2' values, so the number of CS in this
situation is assumed to be '2'.

When running nand_scan_ident() with 2 CS, the core will check for an
array of chips. It will first issue a RESET and then a READ_ID. Of
course this will trigger two timeouts because there is no chip in front
of the second CS:

[    1.367460] marvell-nfc f2720000.nand: Timeout on CMDD (NDSR: 0x00000080)
[    1.474292] marvell-nfc f2720000.nand: Timeout on CMDD (NDSR: 0x00000280)

Indeed, this is harmless and the core will then assume there is only one
valid CS.

Fix the logic in the whole block by entering each sub-block just on the
'is legacy' condition, doing the action inside the sub-block. This way,
when the action succeeds, the whole block is left.

Fixes: 02f26ecf8c772 ("mtd: nand: add reworked Marvell NAND controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 10e953218948..2a467c72bbfb 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2308,13 +2308,16 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	 */
 	if (pdata) {
 		nsels = 1;
-	} else if (nfc->caps->legacy_of_bindings &&
-		   !of_get_property(np, "num-cs", &nsels)) {
-		dev_err(dev, "missing num-cs property\n");
-		return -EINVAL;
-	} else if (!of_get_property(np, "reg", &nsels)) {
-		dev_err(dev, "missing reg property\n");
-		return -EINVAL;
+	} else if (nfc->caps->legacy_of_bindings) {
+		if (!of_get_property(np, "num-cs", &nsels)) {
+			dev_err(dev, "missing num-cs property\n");
+			return -EINVAL;
+		}
+	} else {
+		if (!of_get_property(np, "reg", &nsels)) {
+			dev_err(dev, "missing reg property\n");
+			return -EINVAL;
+		}
 	}
 
 	if (!pdata)
-- 
2.14.1

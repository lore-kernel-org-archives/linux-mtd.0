From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-mtd@lists.infradead.org, <linux-arm-kernel@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd: nand: sunxi: Fix ECC strength choice
Date: Wed, 24 Jan 2018 23:49:31 +0100
Message-Id: <20180124224931.14392-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the requested ECC strength does not exactly match the strengths
supported by the ECC engine, the driver is selecting the closest
strength meeting the 'selected_strength > requested_strength'
constraint. Fix the fact that, in this particular case, ecc->strength
value was not updated to match the 'selected_strength'.

For instance, one can encounter this issue when no ECC requirement is
filled in the device tree while the NAND chip minimum requirement is not
a strength/step_size combo natively supported by the ECC engine.

Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/sunxi_nand.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 82244be3e766..958974821582 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1853,8 +1853,14 @@ static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
 
 	/* Add ECC info retrieval from DT */
 	for (i = 0; i < ARRAY_SIZE(strengths); i++) {
-		if (ecc->strength <= strengths[i])
+		if (ecc->strength <= strengths[i]) {
+			/*
+			 * Update ecc->strength value with the actual strength
+			 * that will be used by the ECC engine.
+			 */
+			ecc->strength = strengths[i];
 			break;
+		}
 	}
 
 	if (i >= ARRAY_SIZE(strengths)) {
-- 
2.11.0

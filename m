Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZz2c-0000Cj-72
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 14:11:11 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] mtd: rawnand: sunxi: Handle the tREA > tRC / 2 case
Date: Thu, 20 Dec 2018 15:10:47 +0100
Message-Id: <20181220141047.31733-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In non-EDO, tREA should be less than tRP to guarantee that the
controller does not sample the IO lines too early. Unfortunately, the
sunxi NAND controller does not allow us to have different values for
tRP and tREH (tRP = tREH = tRW / 2).

We have 2 options to overcome this limitation:

1/ Extend tRC to fulfil the tREA <= tRC / 2 constraint
2/ Use EDO mode (only works if timings->tRLOH > 0)

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4fd1f8da6906..4282bc477761 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1442,6 +1442,20 @@ static int sunxi_nfc_setup_data_interface(struct nand_chip *nand, int csline,
 	if (timings->tRHW_min > (min_clk_period * 20))
 		min_clk_period = DIV_ROUND_UP(timings->tRHW_min, 20);
 
+	/*
+	 * In non-EDO, tREA should be less than tRP to guarantee that the
+	 * controller does not sample the IO lines too early. Unfortunately,
+	 * the sunxi NAND controller does not allow us to have different
+	 * values for tRP and tREH (tRP = tREH = tRW / 2).
+	 *
+	 * We have 2 options to overcome this limitation:
+	 *
+	 * 1/ Extend tRC to fulfil the tREA <= tRC / 2 constraint
+	 * 2/ Use EDO mode (only works if timings->tRLOH > 0)
+	 */
+	if (timings->tREA_max > min_clk_period && !timings->tRLOH_min)
+		min_clk_period = timings->tREA_max;
+
 	tWB  = sunxi_nand_lookup_timing(tWB_lut, timings->tWB_max,
 					min_clk_period);
 	if (tWB < 0) {
@@ -1497,14 +1511,16 @@ static int sunxi_nfc_setup_data_interface(struct nand_chip *nand, int csline,
 		return -EINVAL;
 	}
 
+	sunxi_nand->timing_ctl = 0;
+
 	/*
 	 * ONFI specification 3.1, paragraph 4.15.2 dictates that EDO data
 	 * output cycle timings shall be used if the host drives tRC less than
-	 * 30 ns.
+	 * 30 ns. We should also use EDO mode if tREA is bigger than tRP.
 	 */
 	min_clk_period = NSEC_PER_SEC / real_clk_rate;
-	sunxi_nand->timing_ctl = ((min_clk_period * 2) < 30) ?
-				 NFC_TIMING_CTL_EDO : 0;
+	if (min_clk_period * 2 < 30 || min_clk_period * 1000 < timings->tREA_max)
+		sunxi_nand->timing_ctl = NFC_TIMING_CTL_EDO;
 
 	return 0;
 }
-- 
2.17.1

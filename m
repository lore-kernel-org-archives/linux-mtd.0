From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 04/16] mtd: nand: sunxi: adapt clk_rate to tWB, tADL,
 tWHR and tRHW timings
Date: Mon,  7 Mar 2016 17:18:21 +0100
Message-Id: <1457367513-26069-5-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1457367513-26069-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1457367513-26069-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adapt the NAND controller clk rate to the tWB, tADL, tWHR and tRHW
timings instead of returning an error when the maximum clk divisor is
not big enough to provide an appropriate timing.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/sunxi_nand.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index a270720..2914785 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1164,6 +1164,18 @@ static int sunxi_nand_chip_set_timings(struct sunxi_nand_chip *chip,
 		min_clk_period = DIV_ROUND_UP(timings->tWC_min, 2);
 
 	/* T16 - T19 + tCAD */
+	if (timings->tWB_max > (min_clk_period * 20))
+		min_clk_period = DIV_ROUND_UP(timings->tWB_max, 20);
+
+	if (timings->tADL_min > (min_clk_period * 32))
+		min_clk_period = DIV_ROUND_UP(timings->tADL_min, 32);
+
+	if (timings->tWHR_min > (min_clk_period * 32))
+		min_clk_period = DIV_ROUND_UP(timings->tWHR_min, 32);
+
+	if (timings->tRHW_min > (min_clk_period * 20))
+		min_clk_period = DIV_ROUND_UP(timings->tRHW_min, 20);
+
 	tWB  = sunxi_nand_lookup_timing(tWB_lut, timings->tWB_max,
 					min_clk_period);
 	if (tWB < 0) {
-- 
2.1.4

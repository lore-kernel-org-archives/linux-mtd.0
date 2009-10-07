From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] pxa3xx_nand: fix time calculation
Date: Wed,  7 Oct 2009 11:31:43 +0200
Message-Id: <1254907903-11797-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: eric.y.miao@gmail.com, mreimer@vpop.net, dwmw2@infradead.org,
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use DIV_ROUND_UP to calculate number of clocks.  Else, calculated clocks
are nearly always to low and for times < 10ns, they will be negative on
PXA320  (which has a nand clock of 104 MHz).

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 drivers/mtd/nand/pxa3xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 6ea520a..32cb4d1 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -316,7 +316,7 @@ static struct pxa3xx_nand_flash *builtin_flash_types[] = {
 #define tAR_NDTR1(r)	(((r) >> 0) & 0xf)
 
 /* convert nano-seconds to nand flash controller clock cycles */
-#define ns2cycle(ns, clk)	(int)(((ns) * (clk / 1000000) / 1000) - 1)
+#define ns2cycle(ns, clk)	(int)(DIV_ROUND_UP((ns) * (clk / 1000000), 1000) - 1)
 
 /* convert nand flash controller clock cycles to nano-seconds */
 #define cycle2ns(c, clk)	((((c) + 1) * 1000000 + clk / 500) / (clk / 1000))
-- 
1.6.2.5

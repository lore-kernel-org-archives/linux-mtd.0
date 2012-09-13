From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH v2 7/9] mtd: gpmi: do not set the default values for the extra
 clocks
Date: Thu, 13 Sep 2012 14:57:58 +0800
Message-ID: <1347519480-31106-8-git-send-email-b32955@freescale.com>
In-Reply-To: <1347519480-31106-1-git-send-email-b32955@freescale.com>
References: <1347519480-31106-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: vikram186@gmail.com, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The default frequencies of the extra clocks are 200MHz.
The current code sets the extra clocks to 44.5MHz.

When i add the EDO feature to gpmi, i have to revert the extra clocks
to 200MHz.

So it is better that we do not set the default values for the extra
clocks. The driver runs well even when we do not set the default values for
extra clocks.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   15 +++++----------
 1 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index c46be6c..cc74ebf 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -513,20 +513,15 @@ static int __devinit gpmi_get_clks(struct gpmi_nand_data *this)
 		r->clock[i] = clk;
 	}
 
-	if (GPMI_IS_MX6Q(this)) {
+	if (GPMI_IS_MX6Q(this))
 		/*
-		 * Set the default values for the clocks in mx6q:
-		 *    The main clock(enfc) : 22MHz
-		 *    The others           : 44.5MHz
+		 * Set the default value for the gpmi clock in mx6q:
 		 *
-		 * These are just the default values. If you want to use
-		 * the ONFI nand which is in the Synchronous Mode, you should
-		 * change the clocks's frequencies as you need.
+		 * If you want to use the ONFI nand which is in the
+		 * Synchronous Mode, you should change the clock as you need.
 		 */
 		clk_set_rate(r->clock[0], 22000000);
-		for (i = 1; i < GPMI_CLK_MAX && r->clock[i]; i++)
-			clk_set_rate(r->clock[i], 44500000);
-	}
+
 	return 0;
 
 err_clock:
-- 
1.7.0.4

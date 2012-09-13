From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH v2 6/9] mtd: gpmi: simplify the setting DLL code
Date: Thu, 13 Sep 2012 14:57:57 +0800
Message-ID: <1347519480-31106-7-git-send-email-b32955@freescale.com>
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

The setting DLL code is a little mess.
Just simplify the code and the comments.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c |   22 +++++++++-------------
 1 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 2d1f77c..010665c 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -779,30 +779,26 @@ void gpmi_begin(struct gpmi_nand_data *this)
 	writel(BM_GPMI_CTRL1_DLL_ENABLE, gpmi_regs + HW_GPMI_CTRL1_CLR);
 
 	/* Clear out the DLL control fields. */
-	writel(BM_GPMI_CTRL1_RDN_DELAY,   gpmi_regs + HW_GPMI_CTRL1_CLR);
-	writel(BM_GPMI_CTRL1_HALF_PERIOD, gpmi_regs + HW_GPMI_CTRL1_CLR);
+	reg = BM_GPMI_CTRL1_RDN_DELAY | BM_GPMI_CTRL1_HALF_PERIOD;
+	writel(reg, gpmi_regs + HW_GPMI_CTRL1_CLR);
 
 	/* If no sample delay is called for, return immediately. */
 	if (!hw.sample_delay_factor)
 		return;
 
-	/* Configure the HALF_PERIOD flag. */
-	if (hw.use_half_periods)
-		writel(BM_GPMI_CTRL1_HALF_PERIOD,
-						gpmi_regs + HW_GPMI_CTRL1_SET);
+	/* Set RDN_DELAY or HALF_PERIOD. */
+	reg = ((hw.use_half_periods) ? BM_GPMI_CTRL1_HALF_PERIOD : 0)
+		| BF_GPMI_CTRL1_RDN_DELAY(hw.sample_delay_factor);
 
-	/* Set the delay factor. */
-	writel(BF_GPMI_CTRL1_RDN_DELAY(hw.sample_delay_factor),
-						gpmi_regs + HW_GPMI_CTRL1_SET);
+	writel(reg, gpmi_regs + HW_GPMI_CTRL1_SET);
 
-	/* Enable the DLL. */
+	/* At last, we enable the DLL. */
 	writel(BM_GPMI_CTRL1_DLL_ENABLE, gpmi_regs + HW_GPMI_CTRL1_SET);
 
 	/*
 	 * After we enable the GPMI DLL, we have to wait 64 clock cycles before
-	 * we can use the GPMI.
-	 *
-	 * Calculate the amount of time we need to wait, in microseconds.
+	 * we can use the GPMI. Calculate the amount of time we need to wait,
+	 * in microseconds.
 	 */
 	clock_period_in_ns = NSEC_PER_SEC / clk_get_rate(r->clock[0]);
 	dll_wait_time_in_us = (clock_period_in_ns * 64) / 1000;
-- 
1.7.0.4

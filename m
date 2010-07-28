MIME-Version: 1.0
Date: Wed, 28 Jul 2010 13:58:26 +0800
Message-ID: <AANLkTi=m7GS0gLZLGp6OrGwA0cmZvvCqK3Fyd-zhC5BP@mail.gmail.com>
Subject: [PATCH 23/29] pxa3xx_nand: add advanced timing tuning feature
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	David Woodhouse <david.woodhouse@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
	Lei Wen <leiwen@marvell.com>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 9ccab1da20d41cfe45c2921bd13e920121c44e98 Mon Sep 17 00:00:00 2001
From: Lei Wen <leiwen@marvell.com>
Date: Tue, 22 Jun 2010 23:09:03 +0800
Subject: [PATCH 23/29] pxa3xx_nand: add advanced timing tuning feature

For new controller, it has more power at more precise timing
tuning.

Signed-off-by: Lei Wen <leiwen@marvell.com>
---
 arch/arm/plat-pxa/include/plat/pxa3xx_nand.h |    2 +
 drivers/mtd/nand/pxa3xx_nand.c               |   91 ++++++++++++++++++--------
 2 files changed, 65 insertions(+), 28 deletions(-)

diff --git a/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
b/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
index 2f1a1cf..f7c16d3 100644
--- a/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
+++ b/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
@@ -11,6 +11,7 @@ enum {
 };

 struct pxa3xx_nand_timing {
+	unsigned int	tADL; /* Adress to Write Data delay */
 	unsigned int	tCH;  /* Enable signal hold time */
 	unsigned int	tCS;  /* Enable signal setup time */
 	unsigned int	tWH;  /* ND_nWE high duration */
@@ -18,6 +19,7 @@ struct pxa3xx_nand_timing {
 	unsigned int	tRH;  /* ND_nRE high duration */
 	unsigned int	tRP;  /* ND_nRE pulse width */
 	unsigned int	tR;   /* ND_nWE high to ND_nRE low for read */
+	unsigned int	tRHW; /* delay for next command issue */
 	unsigned int	tWHR; /* ND_nWE high to ND_nRE low for status read */
 	unsigned int	tAR;  /* ND_ALE low to ND_nRE low delay */
 };
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 8f7ab2d..9a37517 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -246,10 +246,10 @@ static struct pxa3xx_nand_cmdset default_cmdset = {
 };

 static struct pxa3xx_nand_timing __devinitdata timing[] = {
-	{ 40, 80, 60, 100, 80, 100, 90000, 400, 40, },
-	{ 10,  0, 20,  40, 30,  40, 11123, 110, 10, },
-	{ 10, 25, 15,  25, 15,  30, 25000,  60, 10, },
-	{ 10, 35, 15,  25, 15,  25, 25000,  60, 10, },
+	{   0, 40, 80, 60, 100, 80, 100, 90000,  0, 400, 40, },
+	{ 200, 10,  0, 20,  40, 30,  40, 11123, 20, 110, 10, },
+	{   0, 10, 25, 15,  25, 15,  30, 25000,  0,  60, 10, },
+	{   0, 10, 35, 15,  25, 15,  25, 25000,  0,  60, 10, },
 };

 #define NAND_SETTING_DEFAULT     &default_cmdset, &timing[0]
@@ -272,16 +272,20 @@ static struct pxa3xx_nand_flash __devinitdata
builtin_flash_types[] = {

 static const char *mtd_names[] = {"pxa3xx_nand-0", "pxa3xx_nand-1", NULL};

-#define NDTR0_tCH(c)	(min((c), 7) << 19)
-#define NDTR0_tCS(c)	(min((c), 7) << 16)
-#define NDTR0_tWH(c)	(min((c), 7) << 11)
-#define NDTR0_tWP(c)	(min((c), 7) << 8)
-#define NDTR0_tRH(c)	(min((c), 7) << 3)
-#define NDTR0_tRP(c)	(min((c), 7) << 0)
-
-#define NDTR1_tR(c)	(min((c), 65535) << 16)
-#define NDTR1_tWHR(c)	(min((c), 15) << 4)
-#define NDTR1_tAR(c)	(min((c), 15) << 0)
+#define NDTR0_tADL(c)		(min_t(uint32_t, (c), 31) << 27)
+#define NDTR0_tCH(c)		(min_t(uint32_t, (c), 7) << 19)
+#define NDTR0_tCS(c)		(min_t(uint32_t, (c), 7) << 16)
+#define NDTR0_tWH(c)		(min_t(uint32_t, (c), 7) << 11)
+#define NDTR0_tWP(c)		(min_t(uint32_t, (c), 7) << 8)
+#define NDTR0_ETRP		(0x1 << 6)
+#define NDTR0_tRH(c)		(min_t(uint32_t, (c), 7) << 3)
+#define NDTR0_tRP(c)		(min_t(uint32_t, (c), 7) << 0)
+
+#define NDTR1_tR(c)		(min_t(uint32_t, (c), 65535) << 16)
+#define NDTR1_PRESCALE		(0x1 << 14)
+#define NDTR1_tRHW(c)		(min_t(uint32_t, (c), 3) << 8)
+#define NDTR1_tWHR(c)		(min_t(uint32_t, (c), 15) << 4)
+#define NDTR1_tAR(c)		(min_t(uint32_t, (c), 15) << 0)

 /* convert nano-seconds to nand flash controller clock cycles */
 #define ns2cycle(ns, clk)	(int)((ns) * (clk / 1000000) / 1000)
@@ -290,20 +294,51 @@ static void pxa3xx_nand_set_timing(struct
pxa3xx_nand_info *info,
 				   const struct pxa3xx_nand_timing *t)
 {
 	struct pxa3xx_nand *nand = info->nand_data;
-	unsigned long nand_clk;
-	uint32_t ndtr0, ndtr1;
-
-	nand_clk = clk_get_rate(nand->clk);
-	ndtr0 = NDTR0_tCH(ns2cycle(t->tCH, nand_clk)) |
-		NDTR0_tCS(ns2cycle(t->tCS, nand_clk)) |
-		NDTR0_tWH(ns2cycle(t->tWH, nand_clk)) |
-		NDTR0_tWP(ns2cycle(t->tWP, nand_clk)) |
-		NDTR0_tRH(ns2cycle(t->tRH, nand_clk)) |
-		NDTR0_tRP(ns2cycle(t->tRP, nand_clk));
-
-	ndtr1 = NDTR1_tR(ns2cycle(t->tR, nand_clk)) |
-		NDTR1_tWHR(ns2cycle(t->tWHR, nand_clk)) |
-		NDTR1_tAR(ns2cycle(t->tAR, nand_clk));
+	struct platform_device *pdev = nand->pdev;
+	struct pxa3xx_nand_platform_data *pdata = pdev->dev.platform_data;
+	unsigned long nand_clk = clk_get_rate(nand->clk);
+	uint32_t ndtr0, ndtr1, tRP, tR, tRHW, tADL;
+
+	tR = ns2cycle(t->tR, nand_clk);
+	tRP = ns2cycle(t->tRP, nand_clk);
+	tRHW = tADL = ndtr0 = ndtr1 = 0;
+	if (pdata->controller_attrs & PXA3XX_NAKED_CMD_EN)
+		tR = 0;
+	if (pdata->controller_attrs & PXA3XX_ADV_TIME_TUNING) {
+		if (tRP > 0x7) {
+			ndtr0 |= NDTR0_ETRP;
+			tRP -= 0x7;
+		}
+		if (tR > 0xffff) {
+			ndtr1 |= NDTR1_PRESCALE;
+			tR /= 16;
+		}
+		if (t->tRHW > 0) {
+			tRHW = ns2cycle(t->tRHW, nand_clk);
+			if (tRHW < 16)
+				tRHW = 1;
+			else {
+				if (tRHW < 32)
+					tRHW = 2;
+				else
+					tRHW = 3;
+			}
+		}
+		tADL = ns2cycle(t->tADL, nand_clk);
+	}
+
+	ndtr0 |= NDTR0_tADL(tADL)
+		| NDTR0_tCH(ns2cycle(t->tCH, nand_clk))
+		| NDTR0_tCS(ns2cycle(t->tCS, nand_clk))
+		| NDTR0_tWH(ns2cycle(t->tWH, nand_clk))
+		| NDTR0_tWP(ns2cycle(t->tWP, nand_clk))
+		| NDTR0_tRH(ns2cycle(t->tRH, nand_clk))
+		| NDTR0_tRP(tRP);
+
+	ndtr1 |= NDTR1_tR(tR)
+		| NDTR1_tRHW(tRHW)
+		| NDTR1_tWHR(ns2cycle(t->tWHR, nand_clk))
+		| NDTR1_tAR(ns2cycle(t->tAR, nand_clk));

 	info->ndtr0cs0 = ndtr0;
 	info->ndtr1cs0 = ndtr1;
-- 
1.7.0.4

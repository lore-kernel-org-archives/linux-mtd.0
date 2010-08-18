MIME-Version: 1.0
Date: Wed, 18 Aug 2010 22:35:55 +0800
Message-ID: <AANLkTinR_6ZL61tNC2W=_+UMcCGtW+b1cQEmedY6wCPh@mail.gmail.com>
Subject: [PATCH 1/5] pxa3xx_nand: update ns2cycle calculation method
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 946e6bed3610de3d53e7e1e7ac2ed0d0c1cdd41e Mon Sep 17 00:00:00 2001
From: Lei Wen <leiwen@marvell.com>
Date: Tue, 17 Aug 2010 17:24:06 +0800
Subject: [PATCH 1/5] pxa3xx_nand: update ns2cycle calculation method

For the original method change from plus 1 to minus 1,
this way make the default timing like tCS become 0 after calculation,
although we set the timing as 0xa...

Change the method to no plus and minus, and make the result
closer to what the timing specified in the NAND chip spec.

Signed-off-by: Lei Wen <leiwen@marvell.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index e02fa4f..4d89f37 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -363,7 +363,7 @@ static struct pxa3xx_nand_flash *builtin_flash_types[] = {
 #define tAR_NDTR1(r)	(((r) >> 0) & 0xf)

 /* convert nano-seconds to nand flash controller clock cycles */
-#define ns2cycle(ns, clk)	(int)(((ns) * (clk / 1000000) / 1000) - 1)
+#define ns2cycle(ns, clk)	(int)((ns) * (clk / 1000000) / 1000)

 /* convert nand flash controller clock cycles to nano-seconds */
 #define cycle2ns(c, clk)	((((c) + 1) * 1000000 + clk / 500) / (clk / 1000))
-- 
1.7.0.4

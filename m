MIME-Version: 1.0
Date: Wed, 28 Jul 2010 13:58:01 +0800
Message-ID: <AANLkTimopoTQVJusuKkVz6=sFF+yeRWkOGQBOP-zNpL0@mail.gmail.com>
Subject: [PATCH 19/29] pxa3xx_nand: update ns2cycle calculation method
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

>From 00038338c35050bcb6523a02befd576b3b8ac9ae Mon Sep 17 00:00:00 2001
From: Lei Wen <leiwen@marvell.com>
Date: Tue, 22 Jun 2010 22:32:54 +0800
Subject: [PATCH 19/29] pxa3xx_nand: update ns2cycle calculation method

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
index 45c9660..50f653b 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -279,7 +279,7 @@ static const char *mtd_names[] = {"pxa3xx_nand-0",
"pxa3xx_nand-1", NULL};
 #define NDTR1_tAR(c)	(min((c), 15) << 0)

 /* convert nano-seconds to nand flash controller clock cycles */
-#define ns2cycle(ns, clk)	(int)(((ns) * (clk / 1000000) / 1000) - 1)
+#define ns2cycle(ns, clk)	(int)((ns) * (clk / 1000000) / 1000)

 static void pxa3xx_nand_set_timing(struct pxa3xx_nand_info *info,
 				   const struct pxa3xx_nand_timing *t)
-- 
1.7.0.4

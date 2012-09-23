Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFqxT-0006rI-6T
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2012 18:31:11 +0000
Received: by ggnm2 with SMTP id m2so1432146ggn.36
 for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2012 11:31:10 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: artem.bityutskiy@linux.intel.com
Subject: [PATCH] nand: gpmi-nand: Fix clock registration
Date: Sun, 23 Sep 2012 15:31:02 -0300
Message-Id: <1348425062-17427-1-git-send-email-festevam@gmail.com>
Cc: marex@denx.de, b32955@freescale.com, shawn.guo@linaro.org,
 linux-mtd@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

On a mx28 board the following error happens since commit 638064e56c 
(mtd: gpmi: change the code for clocks):

gpmi-nand: probe of 8000c000.gpmi-nand failed with error -12

Acquire the clock using "NULL" as it was done previously, so that the driver
can register on mx23/mx28 as well.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index c46be6c..1f23cb4 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -492,7 +492,7 @@ static int __devinit gpmi_get_clks(struct gpmi_nand_data *this)
 	int i;
 
 	/* The main clock is stored in the first. */
-	r->clock[0] = clk_get(this->dev, "gpmi_io");
+	r->clock[0] = clk_get(this->dev, NULL);
 	if (IS_ERR(r->clock[0]))
 		goto err_clock;
 
-- 
1.7.9.5

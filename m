Received: from mail-qc0-x230.google.com ([2607:f8b0:400d:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vea5y-000766-Ba
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 00:38:43 +0000
Received: by mail-qc0-f176.google.com with SMTP id s19so1148027qcw.7
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 16:38:20 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: gpmi: Use devm_clk_get()
Date: Thu,  7 Nov 2013 22:32:38 -0200
Message-Id: <1383870758-29777-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Using devm_clk_get() can make the code smaller and cleaner.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 7ac2280..43d25ec 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -579,21 +579,6 @@ acquire_err:
 	return -EINVAL;
 }
 
-static void gpmi_put_clks(struct gpmi_nand_data *this)
-{
-	struct resources *r = &this->resources;
-	struct clk *clk;
-	int i;
-
-	for (i = 0; i < GPMI_CLK_MAX; i++) {
-		clk = r->clock[i];
-		if (clk) {
-			clk_put(clk);
-			r->clock[i] = NULL;
-		}
-	}
-}
-
 static char *extra_clks_for_mx6q[GPMI_CLK_MAX] = {
 	"gpmi_apb", "gpmi_bch", "gpmi_bch_apb", "per1_bch",
 };
@@ -606,7 +591,7 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
 	int err, i;
 
 	/* The main clock is stored in the first. */
-	r->clock[0] = clk_get(this->dev, "gpmi_io");
+	r->clock[0] = devm_clk_get(this->dev, "gpmi_io");
 	if (IS_ERR(r->clock[0])) {
 		err = PTR_ERR(r->clock[0]);
 		goto err_clock;
@@ -622,7 +607,7 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
 		if (extra_clks[i - 1] == NULL)
 			break;
 
-		clk = clk_get(this->dev, extra_clks[i - 1]);
+		clk = devm_clk_get(this->dev, extra_clks[i - 1]);
 		if (IS_ERR(clk)) {
 			err = PTR_ERR(clk);
 			goto err_clock;
@@ -644,7 +629,6 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
 
 err_clock:
 	dev_dbg(this->dev, "failed in finding the clocks.\n");
-	gpmi_put_clks(this);
 	return err;
 }
 
@@ -684,7 +668,6 @@ exit_regs:
 
 static void release_resources(struct gpmi_nand_data *this)
 {
-	gpmi_put_clks(this);
 	release_register_block(this);
 	release_bch_irq(this);
 	release_dma_channels(this);
-- 
1.8.1.2

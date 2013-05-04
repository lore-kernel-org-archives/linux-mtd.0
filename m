Received: from rere6.qmqm.pl ([2001:6a0:181::1] helo=rere.qmqm.pl)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UYcNi-0007cO-F9
 for linux-mtd@lists.infradead.org; Sat, 04 May 2013 13:20:07 +0000
Message-Id: <135ba9f94ed78b589a8576dc14f8b720d8425891.1367673436.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] mxs/gpmi-nand: fix error return from gpmi_get_clks()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: linux-mtd@lists.infradead.org
Date: Sat,  4 May 2013 15:19:35 +0200 (CEST)
Cc: Huang Shijie <b32955@freescale.com>, Shawn Guo <shawn.guo@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Bill Pemberton <wfp5p@virginia.edu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 25ecfa1..1d18efc 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -473,12 +473,14 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
 	struct resources *r = &this->resources;
 	char **extra_clks = NULL;
 	struct clk *clk;
-	int i;
+	int err, i;
 
 	/* The main clock is stored in the first. */
 	r->clock[0] = clk_get(this->dev, "gpmi_io");
-	if (IS_ERR(r->clock[0]))
+	if (IS_ERR(r->clock[0])) {
+		err = PTR_ERR(r->clock[0]);
 		goto err_clock;
+	}
 
 	/* Get extra clocks */
 	if (GPMI_IS_MX6Q(this))
@@ -491,8 +493,10 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
 			break;
 
 		clk = clk_get(this->dev, extra_clks[i - 1]);
-		if (IS_ERR(clk))
+		if (IS_ERR(clk)) {
+			err = PTR_ERR(clk);
 			goto err_clock;
+		}
 
 		r->clock[i] = clk;
 	}
@@ -511,7 +515,7 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
 err_clock:
 	dev_dbg(this->dev, "failed in finding the clocks.\n");
 	gpmi_put_clks(this);
-	return -ENOMEM;
+	return err;
 }
 
 static int acquire_resources(struct gpmi_nand_data *this)
-- 
1.7.10.4

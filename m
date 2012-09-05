Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9GyB-0003u6-93
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 14:52:43 +0000
Received: by ghbf20 with SMTP id f20so96285ghb.36
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2012 07:52:41 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: artem.bityutskiy@linux.intel.com
Subject: [PATCH] mtd: mxc_nand: Adapt the clock name to the new clock framework
Date: Wed,  5 Sep 2012 11:52:27 -0300
Message-Id: <1346856747-32694-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

With the new i.mx clock framework the mxc_nand clock is registered as:
    
clk_register_clkdev(clk[nfc_gate], NULL, "mxc_nand");0")
    
So we do not need to pass "nfc" string and can use NULL instead.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/mxc_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index cc8b1e1..b0c81bf 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1425,7 +1425,7 @@ static int __devinit mxcnd_probe(struct platform_device *pdev)
 	this->write_buf = mxc_nand_write_buf;
 	this->read_buf = mxc_nand_read_buf;
 
-	host->clk = devm_clk_get(&pdev->dev, "nfc");
+	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk))
 		return PTR_ERR(host->clk);
 
-- 
1.7.9.5

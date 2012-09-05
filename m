Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9Ghx-0001a3-Tf
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 14:35:58 +0000
Received: by yenq9 with SMTP id q9so91286yen.36
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2012 07:35:56 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: artem.bityutskiy@linux.intel.com
Subject: [PATCH 2/2] mtd: mxc_nand: Convert to platform driver
Date: Wed,  5 Sep 2012 11:35:25 -0300
Message-Id: <1346855725-31726-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1346855725-31726-1-git-send-email-festevam@gmail.com>
References: <1346855725-31726-1-git-send-email-festevam@gmail.com>
Cc: marex@denx.de, b32955@freescale.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Using module_platform_driver() makes the code smaller and cleaner.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/mxc_nand.c |   18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index e59a45f..cc8b1e1 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1389,7 +1389,7 @@ static int __init mxcnd_probe_pdata(struct mxc_nand_host *host)
 	return 0;
 }
 
-static int __init mxcnd_probe(struct platform_device *pdev)
+static int __devinit mxcnd_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
 	struct mtd_info *mtd;
@@ -1581,22 +1581,10 @@ static struct platform_driver mxcnd_driver = {
 		   .owner = THIS_MODULE,
 		   .of_match_table = of_match_ptr(mxcnd_dt_ids),
 	},
+	.probe = mxcnd_probe,
 	.remove = __devexit_p(mxcnd_remove),
 };
-
-static int __init mxc_nd_init(void)
-{
-	return platform_driver_probe(&mxcnd_driver, mxcnd_probe);
-}
-
-static void __exit mxc_nd_cleanup(void)
-{
-	/* Unregister the device structure */
-	platform_driver_unregister(&mxcnd_driver);
-}
-
-module_init(mxc_nd_init);
-module_exit(mxc_nd_cleanup);
+module_platform_driver(mxcnd_driver);
 
 MODULE_AUTHOR("Freescale Semiconductor, Inc.");
 MODULE_DESCRIPTION("MXC NAND MTD driver");
-- 
1.7.9.5

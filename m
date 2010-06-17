From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: 
Subject: [PATCH v2] mtd/mxc_nand: don't call mtd->{suspend,resume} explicitly
Date: Thu, 17 Jun 2010 20:59:04 +0200
Message-Id: <1276801147-4103-4-git-send-email-eric@eukrea.com>
In-Reply-To: <1276801147-4103-3-git-send-email-eric@eukrea.com>
References: <1276801147-4103-1-git-send-email-eric@eukrea.com>
	<1276801147-4103-2-git-send-email-eric@eukrea.com>
	<1276801147-4103-3-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd layer is responsible to call mtd->{suspend,resume}.  Doing it
again in the driver is wrong and results in a warning:

	nand_resume called for a chip which is not in suspended state

at resume time.  Removing the calls from the resume and suspend
functions makes them empty allowing them to be deleted completely.

Signed-off-by: Eric Bénard <eric@eukrea.com>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mtd@lists.infradead.org
---
v2:
	fix commit log (writen by Uwe Kleine-König)

 drivers/mtd/nand/mxc_nand.c |   44 +------------------------------------------
 1 files changed, 1 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 0d76b16..ad19dc6 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -873,53 +873,11 @@ static int __devexit mxcnd_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
-{
-	struct mtd_info *mtd = platform_get_drvdata(pdev);
-	struct nand_chip *nand_chip = mtd->priv;
-	struct mxc_nand_host *host = nand_chip->priv;
-	int ret = 0;
-
-	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND suspend\n");
-
-	ret = mtd->suspend(mtd);
-
-	/*
-	 * nand_suspend locks the device for exclusive access, so
-	 * the clock must already be off.
-	 */
-	BUG_ON(!ret && host->clk_act);
-
-	return ret;
-}
-
-static int mxcnd_resume(struct platform_device *pdev)
-{
-	struct mtd_info *mtd = platform_get_drvdata(pdev);
-	struct nand_chip *nand_chip = mtd->priv;
-	struct mxc_nand_host *host = nand_chip->priv;
-	int ret = 0;
-
-	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
-
-	mtd->resume(mtd);
-
-	return ret;
-}
-
-#else
-# define mxcnd_suspend   NULL
-# define mxcnd_resume    NULL
-#endif				/* CONFIG_PM */
-
 static struct platform_driver mxcnd_driver = {
 	.driver = {
 		   .name = DRIVER_NAME,
-		   },
+	},
 	.remove = __devexit_p(mxcnd_remove),
-	.suspend = mxcnd_suspend,
-	.resume = mxcnd_resume,
 };
 
 static int __init mxc_nd_init(void)
-- 
1.6.3.3

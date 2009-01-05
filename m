Received: from mail.karo-electronics.de ([213.146.116.110])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LJsni-0003Ur-Dw
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 16:59:39 +0000
From: Lothar Waﬂmann <LW@KARO-electronics.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Bugfixes for drivers/mtd/nand/mxc_nand.c
Date: Mon,  5 Jan 2009 17:31:37 +0100
Message-Id: <12311730973665-git-send-email->
Cc: Lothar Wassmann <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Lothar Wassmann <LW@KARO-electronics.de>

Fix a bogus Flash ID returned upon successive READID commands

The driver does not initialize host->col_addr (which is used as a byte
index into the flash read buffer) upon a READID command. This leads
to reading bogus data from the flash buffer after issuing the second
and further successive READID commands.

This patch also fixes some other issues:
 - compile error when CONFIG_PM is enabled
 - pass on the error code from clk_get()
 - return -ENOMEM in case of failed ioremap()
 - pass on the return value of platform_driver_probe() instead of inventing -ENODEV

This patch has been Acked-By Sascha Hauer as the author of the driver on the
linux-arm-kernel mailing list: <20081223144414.GI1614@pengutronix.de>

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Lothar Wassmann <LW@KARO-electronics.de>
---
 drivers/mtd/nand/mxc_nand.c |   43 ++++++++++++++++++++++++++++---------------
 1 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 21fd4f1..82e5882 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -831,6 +831,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 		break;
 
 	case NAND_CMD_READID:
+		host->col_addr = 0;
 		send_read_id(host);
 		break;
 
@@ -881,8 +882,10 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	this->verify_buf = mxc_nand_verify_buf;
 
 	host->clk = clk_get(&pdev->dev, "nfc_clk");
-	if (IS_ERR(host->clk))
+	if (IS_ERR(host->clk)) {
+		err = PTR_ERR(host->clk);
 		goto eclk;
+	}
 
 	clk_enable(host->clk);
 	host->clk_act = 1;
@@ -895,7 +898,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 
 	host->regs = ioremap(res->start, res->end - res->start + 1);
 	if (!host->regs) {
-		err = -EIO;
+		err = -ENOMEM;
 		goto eres;
 	}
 
@@ -1010,30 +1013,38 @@ static int __devexit mxcnd_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM
 static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
 {
-	struct mtd_info *info = platform_get_drvdata(pdev);
+	struct mtd_info *mtd = platform_get_drvdata(pdev);
+	struct nand_chip *nand_chip = mtd->priv;
+	struct mxc_nand_host *host = nand_chip->priv;
 	int ret = 0;
 
 	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND suspend\n");
-	if (info)
-		ret = info->suspend(info);
+	if (mtd)
+		ret = mtd->suspend(mtd);
 
-	/* Disable the NFC clock */
-	clk_disable(nfc_clk);	/* FIXME */
+	if (host->clk_act) {
+		/* Disable the NFC clock */
+		clk_disable(host->clk);
+	}
 
 	return ret;
 }
 
 static int mxcnd_resume(struct platform_device *pdev)
 {
-	struct mtd_info *info = platform_get_drvdata(pdev);
+	struct mtd_info *mtd = platform_get_drvdata(pdev);
+	struct nand_chip *nand_chip = mtd->priv;
+	struct mxc_nand_host *host = nand_chip->priv;
 	int ret = 0;
 
 	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
-	/* Enable the NFC clock */
-	clk_enable(nfc_clk);	/* FIXME */
 
-	if (info)
-		info->resume(info);
+	if (host->clk_act) {
+		/* Enable the NFC clock */
+		clk_enable(host->clk);
+	}
+	if (mtd)
+		mtd->resume(mtd);
 
 	return ret;
 }
@@ -1054,13 +1065,15 @@ static struct platform_driver mxcnd_driver = {
 
 static int __init mxc_nd_init(void)
 {
+	int ret;
+
 	/* Register the device driver structure. */
 	pr_info("MXC MTD nand Driver\n");
-	if (platform_driver_probe(&mxcnd_driver, mxcnd_probe) != 0) {
+	ret = platform_driver_probe(&mxcnd_driver, mxcnd_probe);
+	if (ret != 0) {
 		printk(KERN_ERR "Driver register failed for mxcnd_driver\n");
-		return -ENODEV;
 	}
-	return 0;
+	return ret;
 }
 
 static void __exit mxc_nd_cleanup(void)
-- 
1.4.4.4

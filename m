Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UfSny-00080O-4S
 for linux-mtd@lists.infradead.org; Thu, 23 May 2013 10:31:32 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MN800DVKYJDAFY0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 23 May 2013 19:31:07 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>
Subject: [PATCH] mtd: nand: use platform_{get,set}_drvdata()
Date: Thu, 23 May 2013 19:31:07 +0900
Message-id: <002b01ce57a0$a29c4fe0$e7d4efa0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'David Woodhouse' <dwmw2@infradead.org>, Jingoo Han <jg1.han@samsung.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the wrapper functions for getting and setting the driver data using
platform_device instead of using dev_{get,set}_drvdata() with &pdev->dev,
so we can directly pass a struct platform_device.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    2 +-
 drivers/mtd/nand/fsl_ifc_nand.c  |    2 +-
 drivers/mtd/nand/fsl_upm.c       |    4 ++--
 drivers/mtd/nand/ndfc.c          |    4 ++--
 drivers/mtd/nand/socrates_nand.c |    6 ++----
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 2065720..44d2073 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -915,7 +915,7 @@ err:
 static int fsl_elbc_nand_remove(struct platform_device *pdev)
 {
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
-	struct fsl_elbc_mtd *priv = dev_get_drvdata(&pdev->dev);
+	struct fsl_elbc_mtd *priv = platform_get_drvdata(pdev);
 
 	fsl_elbc_chip_remove(priv);
 
diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 317a771..f20986b 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -1050,7 +1050,7 @@ err:
 
 static int fsl_ifc_nand_remove(struct platform_device *dev)
 {
-	struct fsl_ifc_mtd *priv = dev_get_drvdata(&dev->dev);
+	struct fsl_ifc_mtd *priv = platform_get_drvdata(dev);
 
 	fsl_ifc_chip_remove(priv);
 
diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 04e0725..e5b7597 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -303,7 +303,7 @@ static int fun_probe(struct platform_device *ofdev)
 	if (ret)
 		goto err2;
 
-	dev_set_drvdata(&ofdev->dev, fun);
+	platform_set_drvdata(ofdev, fun);
 
 	return 0;
 err2:
@@ -320,7 +320,7 @@ err1:
 
 static int fun_remove(struct platform_device *ofdev)
 {
-	struct fsl_upm_nand *fun = dev_get_drvdata(&ofdev->dev);
+	struct fsl_upm_nand *fun = platform_get_drvdata(ofdev);
 	int i;
 
 	nand_release(&fun->mtd);
diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 8e148f1..fa65c1b 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -223,7 +223,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	spin_lock_init(&ndfc->ndfc_control.lock);
 	init_waitqueue_head(&ndfc->ndfc_control.wq);
 	ndfc->ofdev = ofdev;
-	dev_set_drvdata(&ofdev->dev, ndfc);
+	platform_set_drvdata(ofdev, ndfc);
 
 	ndfc->ndfcbase = of_iomap(ofdev->dev.of_node, 0);
 	if (!ndfc->ndfcbase) {
@@ -258,7 +258,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 
 static int ndfc_remove(struct platform_device *ofdev)
 {
-	struct ndfc_controller *ndfc = dev_get_drvdata(&ofdev->dev);
+	struct ndfc_controller *ndfc = platform_get_drvdata(ofdev);
 
 	nand_release(&ndfc->mtd);
 	kfree(ndfc->mtd.name);
diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index 09dde7d..5090c8c 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -190,7 +190,7 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	/* TODO: I have no idea what real delay is. */
 	nand_chip->chip_delay = 20;		/* 20us command delay time */
 
-	dev_set_drvdata(&ofdev->dev, host);
+	platform_set_drvdata(ofdev, host);
 
 	/* first scan to find the device and get the page size */
 	if (nand_scan_ident(mtd, 1, NULL)) {
@@ -211,7 +211,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	nand_release(mtd);
 
 out:
-	dev_set_drvdata(&ofdev->dev, NULL);
 	iounmap(host->io_base);
 	kfree(host);
 	return res;
@@ -222,12 +221,11 @@ out:
  */
 static int socrates_nand_remove(struct platform_device *ofdev)
 {
-	struct socrates_nand_host *host = dev_get_drvdata(&ofdev->dev);
+	struct socrates_nand_host *host = platform_get_drvdata(ofdev);
 	struct mtd_info *mtd = &host->mtd;
 
 	nand_release(mtd);
 
-	dev_set_drvdata(&ofdev->dev, NULL);
 	iounmap(host->io_base);
 	kfree(host);
 
-- 
1.7.10.4

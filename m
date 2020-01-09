Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B67C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 17:10:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB8212067D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 17:10:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t1ce1edp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB8212067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=BHR9y2WUkcbwzVKao83G/HDYfCz2jUy6mfc07mhrnQc=; b=t1c
	e1edpeFisyLrS9v1/NuDYFVOJjd39dhPHg7GeZqrN7sjwILSOs6U0NmjrLA+ysOMdqvF2KQO+L41n
	hFMaUNragy9L+R1IgBYGR6RlbSBuFPw3clPem/uN/PhPBIn+7zCPtir5BZ33Z/716uaLMaM1CH5A0
	o5QsXs9g51y9VGbXyw1kW3Mk33xWS6klo13iOE+93/CvBIsDp9UyxVvpUPuzCAc/0qcTAgvCShKDQ
	AktGEC29bBhrZG/iYJgLmLE6LhoEUtYNphPatEg/NaxgJ+4t7Ss6gvCrIQIc8mtsQCcxNKz5brSfC
	PCHlpWgbYs9565Yf4C14CM4bwLFFY6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipbJp-00082O-Iu; Thu, 09 Jan 2020 17:10:01 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipbJm-00081e-ES
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 17:10:00 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 323CB2004D4;
 Thu,  9 Jan 2020 18:09:55 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D80A32011B9;
 Thu,  9 Jan 2020 18:09:49 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 719D9402AF;
 Fri, 10 Jan 2020 01:09:43 +0800 (SGT)
From: Han Xu <han.xu@nxp.com>
To: esben@geanix.com, linux-mtd@lists.infradead.org, s.hauer@pengutronix.de,
 boris.brezillon@collabora.com, miquel.raynal@bootlin.com, han.xu@nxp.com,
 richard@nod.at, vigneshr@ti.com
Subject: [PATCH] mtd: rawnand: gpmi: fix the suspend/resume issue
Date: Fri, 10 Jan 2020 01:05:56 +0800
Message-Id: <1578589556-683-1-git-send-email-han.xu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_090958_762428_EF1DC2FD 
X-CRM114-Status: GOOD (  13.03  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: martin@geanix.com, sean@geanix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

fix several issues when system suspend/resume,

- leverage the runtime pm for system suspend/resume
- enable the clock before register access
- re-apply timing settings
- set the proper pinctrl state

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 59 ++++++++++++++++------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 334fe3130285..37437d47ab9a 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/dma/mxs-dma.h>
 #include "gpmi-nand.h"
 #include "gpmi-regs.h"
@@ -146,7 +147,11 @@ static int __gpmi_enable_clk(struct gpmi_nand_data *this, bool v)
 static int gpmi_init(struct gpmi_nand_data *this)
 {
 	struct resources *r = &this->resources;
-	int ret;
+	int ret = 0;
+
+	ret = pm_runtime_get_sync(this->dev);
+	if (ret < 0)
+		return ret;
 
 	ret = gpmi_reset_block(r->gpmi_regs, false);
 	if (ret)
@@ -179,8 +184,10 @@ static int gpmi_init(struct gpmi_nand_data *this)
 	 */
 	writel(BM_GPMI_CTRL1_DECOUPLE_CS, r->gpmi_regs + HW_GPMI_CTRL1_SET);
 
-	return 0;
 err_out:
+	pm_runtime_mark_last_busy(this->dev);
+	pm_runtime_put_autosuspend(this->dev);
+
 	return ret;
 }
 
@@ -528,7 +535,7 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
 static int bch_set_geometry(struct gpmi_nand_data *this)
 {
 	struct resources *r = &this->resources;
-	int ret;
+	int ret = 0;
 
 	ret = common_nfc_set_geometry(this);
 	if (ret)
@@ -550,7 +557,6 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 	/* Set *all* chip selects to use layout 0. */
 	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
 
-	ret = 0;
 err_out:
 	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
@@ -2676,7 +2682,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	return 0;
 
 exit_nfc_init:
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	release_resources(this);
 exit_acquire_resources:
@@ -2688,7 +2694,6 @@ static int gpmi_nand_remove(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this = platform_get_drvdata(pdev);
 
-	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	nand_release(&this->nand);
@@ -2700,10 +2705,12 @@ static int gpmi_nand_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int gpmi_pm_suspend(struct device *dev)
 {
-	struct gpmi_nand_data *this = dev_get_drvdata(dev);
+	int ret;
 
-	release_dma_channels(this);
-	return 0;
+	pinctrl_pm_select_sleep_state(dev);
+	ret = pm_runtime_force_suspend(dev);
+
+	return ret;
 }
 
 static int gpmi_pm_resume(struct device *dev)
@@ -2711,9 +2718,13 @@ static int gpmi_pm_resume(struct device *dev)
 	struct gpmi_nand_data *this = dev_get_drvdata(dev);
 	int ret;
 
-	ret = acquire_dma_channels(this);
-	if (ret < 0)
+	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_err(this->dev, "Error in resume %d\n", ret);
 		return ret;
+	}
+
+	pinctrl_pm_select_default_state(dev);
 
 	/* re-init the GPMI registers */
 	ret = gpmi_init(this);
@@ -2729,22 +2740,40 @@ static int gpmi_pm_resume(struct device *dev)
 		return ret;
 	}
 
+	/* re-apply the timing setting */
+	this->hw.must_apply_timings = true;
+
 	return 0;
 }
 #endif /* CONFIG_PM_SLEEP */
 
-static int __maybe_unused gpmi_runtime_suspend(struct device *dev)
+#define gpmi_enable_clk(x)	__gpmi_enable_clk(x, true)
+#define gpmi_disable_clk(x)	__gpmi_enable_clk(x, false)
+
+static int gpmi_runtime_suspend(struct device *dev)
 {
 	struct gpmi_nand_data *this = dev_get_drvdata(dev);
 
-	return __gpmi_enable_clk(this, false);
+	gpmi_disable_clk(this);
+	release_dma_channels(this);
+
+	return 0;
 }
 
-static int __maybe_unused gpmi_runtime_resume(struct device *dev)
+static int gpmi_runtime_resume(struct device *dev)
 {
 	struct gpmi_nand_data *this = dev_get_drvdata(dev);
+	int ret;
 
-	return __gpmi_enable_clk(this, true);
+	ret = gpmi_enable_clk(this);
+	if (ret)
+		return ret;
+
+	ret = acquire_dma_channels(this);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static const struct dev_pm_ops gpmi_pm_ops = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18928C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PWG6Q98N19nAHvOP44KBsSZt5qbf4CgOTEEFxm4i9WA=; b=GluBPYwAtwhFbF
	tw+fvPkvjCa+GntckiqebYuxlOieIvwRpObzz9VLXUeyOyZfyNDUfLQrEZTC6Y/RLsGN9vl7b7AJw
	muPjiTJGRIAN5H1VwucPVxf/BLM/sv6QwBfvmIdy+zAaHo7P5pA4ZU5xZRGVJKN7xlbfh3ISWfKGJ
	6qo1d4XHOGSLRr5gMZSdNXrnaI4Hb7YwWyamQ3XZWZxcU3uLeZ5PM1tTBT6YXrRxRkeaJv8RVYq5G
	8sWSmI4vjOjn11myQxXMDLyEpBNvuQ3jT3G2gVb+SdTC16TiqmHU22J+KlqLV70yFKCxdN9f4IN1z
	wCOcAJPby0QQQZeqZm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8esM-00GiEy-Bq; Tue, 05 Jul 2022 09:29:46 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8epc-00GgR4-Od; Tue, 05 Jul 2022 09:27:00 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BA32C1A0AE9;
	Tue,  5 Jul 2022 11:26:46 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 57A301A08BC;
	Tue,  5 Jul 2022 11:26:46 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E9385180222D;
	Tue,  5 Jul 2022 17:26:43 +0800 (+08)
From: haibo.chen@nxp.com
To: ashish.kumar@nxp.com,
	yogeshgaur.83@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	han.xu@nxp.com,
	singh.kuldeep87k@gmail.com,
	tudor.ambarus@microchip.com,
	p.yadav@ti.com,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	haibo.chen@nxp.com,
	zhengxunli@mxic.com.tw
Subject: [PATCH 01/11] spi: spi-nxp-fspi: enable runtime pm for fspi
Date: Tue,  5 Jul 2022 17:11:33 +0800
Message-Id: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_022657_129290_C9C9EC52 
X-CRM114-Status: GOOD (  20.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Haibo Chen <haibo.chen@nxp.com>

Enable the runtime PM in fspi driver.
Also for system PM, On some board like i.MX8ULP-EVK board,
after system suspend, IOMUX module will lost power, so all
the pinctrl setting will lost when system resume back, need
driver to save/restore the pinctrl setting.

Signed-off-by: Han Xu <han.xu@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/spi/spi-nxp-fspi.c | 111 ++++++++++++++++++++++++++++++++-----
 1 file changed, 97 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index 2b0301fc971c..b2cd8e06f374 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -49,6 +49,8 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pm_runtime.h>
 #include <linux/pm_qos.h>
 #include <linux/regmap.h>
 #include <linux/sizes.h>
@@ -58,6 +60,8 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 
+/* runtime pm timeout */
+#define FSPI_RPM_TIMEOUT 50	/* 50ms */
 /*
  * The driver only uses one single LUT entry, that is updated on
  * each call of exec_op(). Index 0 is preset at boot with a basic
@@ -375,6 +379,8 @@ struct nxp_fspi {
 	struct mutex lock;
 	struct pm_qos_request pm_qos_req;
 	int selected;
+#define FSPI_INITILIZED		(1 << 0)
+	int flags;
 };
 
 static inline int needs_ip_only(struct nxp_fspi *f)
@@ -866,6 +872,12 @@ static int nxp_fspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 
 	mutex_lock(&f->lock);
 
+	err = pm_runtime_get_sync(f->dev);
+	if (err < 0) {
+		dev_err(f->dev, "Failed to enable clock %d\n", __LINE__);
+		goto err_mutex;
+	}
+
 	/* Wait for controller being ready. */
 	err = fspi_readl_poll_tout(f, f->iobase + FSPI_STS0,
 				   FSPI_STS0_ARB_IDLE, 1, POLL_TOUT, true);
@@ -894,8 +906,14 @@ static int nxp_fspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	/* Invalidate the data in the AHB buffer. */
 	nxp_fspi_invalid(f);
 
+	pm_runtime_mark_last_busy(f->dev);
+	pm_runtime_put_autosuspend(f->dev);
+
 	mutex_unlock(&f->lock);
+	return err;
 
+err_mutex:
+	mutex_unlock(&f->lock);
 	return err;
 }
 
@@ -1141,12 +1159,17 @@ static int nxp_fspi_probe(struct platform_device *pdev)
 			ret = PTR_ERR(f->clk);
 			goto err_put_ctrl;
 		}
+	}
 
-		ret = nxp_fspi_clk_prep_enable(f);
-		if (ret) {
-			dev_err(dev, "can not enable the clock\n");
-			goto err_put_ctrl;
-		}
+	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, FSPI_RPM_TIMEOUT);
+	pm_runtime_use_autosuspend(dev);
+
+	/* enable clock */
+	ret = pm_runtime_get_sync(f->dev);
+	if (ret < 0) {
+		dev_err(f->dev, "Failed to enable clock %d\n", __LINE__);
+		goto err_put_ctrl;
 	}
 
 	/* Clear potential interrupts */
@@ -1180,13 +1203,19 @@ static int nxp_fspi_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_destroy_mutex;
 
+	pm_runtime_mark_last_busy(f->dev);
+	pm_runtime_put_autosuspend(f->dev);
+
+	/* indicate the controller has been initialized */
+	f->flags |= FSPI_INITILIZED;
+
 	return 0;
 
 err_destroy_mutex:
 	mutex_destroy(&f->lock);
 
 err_disable_clk:
-	nxp_fspi_clk_disable_unprep(f);
+	pm_runtime_disable(dev);
 
 err_put_ctrl:
 	spi_controller_put(ctlr);
@@ -1212,20 +1241,79 @@ static int nxp_fspi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int nxp_fspi_suspend(struct device *dev)
+#ifdef CONFIG_PM
+static int nxp_fspi_initialized(struct nxp_fspi *f)
+{
+	return f->flags & FSPI_INITILIZED;
+}
+
+static int nxp_fspi_need_reinit(struct nxp_fspi *f)
+{
+	/*
+	 * we always use the controller in combination mode, so we check
+	 * this register bit to determine if the controller once lost power,
+	 * such as suspend/resume, and need to be re-init.
+	 */
+
+	return !(readl(f->iobase + FSPI_MCR0) & FSPI_MCR0_OCTCOMB_EN);
+}
+
+static int nxp_fspi_runtime_suspend(struct device *dev)
 {
+	struct nxp_fspi *f = dev_get_drvdata(dev);
+
+	nxp_fspi_clk_disable_unprep(f);
+
 	return 0;
 }
 
-static int nxp_fspi_resume(struct device *dev)
+static int nxp_fspi_runtime_resume(struct device *dev)
 {
 	struct nxp_fspi *f = dev_get_drvdata(dev);
 
-	nxp_fspi_default_setup(f);
+	nxp_fspi_clk_prep_enable(f);
+
+	if (nxp_fspi_initialized(f) && nxp_fspi_need_reinit(f))
+		nxp_fspi_default_setup(f);
 
 	return 0;
 }
 
+static int nxp_fspi_suspend(struct device *dev)
+{
+	int ret;
+
+	ret = pinctrl_pm_select_sleep_state(dev);
+	if (ret) {
+		dev_err(dev, "select flexspi sleep pinctrl failed!\n");
+		return ret;
+	}
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static int nxp_fspi_resume(struct device *dev)
+{
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret)
+		dev_err(dev, "select flexspi default pinctrl failed!\n");
+
+	return ret;
+}
+
+
+static const struct dev_pm_ops nxp_fspi_pm_ops = {
+	SET_RUNTIME_PM_OPS(nxp_fspi_runtime_suspend, nxp_fspi_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(nxp_fspi_suspend, nxp_fspi_resume)
+};
+#endif	/* CONFIG_PM */
+
 static const struct of_device_id nxp_fspi_dt_ids[] = {
 	{ .compatible = "nxp,lx2160a-fspi", .data = (void *)&lx2160a_data, },
 	{ .compatible = "nxp,imx8mm-fspi", .data = (void *)&imx8mm_data, },
@@ -1244,11 +1332,6 @@ static const struct acpi_device_id nxp_fspi_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, nxp_fspi_acpi_ids);
 #endif
 
-static const struct dev_pm_ops nxp_fspi_pm_ops = {
-	.suspend	= nxp_fspi_suspend,
-	.resume		= nxp_fspi_resume,
-};
-
 static struct platform_driver nxp_fspi_driver = {
 	.driver = {
 		.name	= "nxp-fspi",
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

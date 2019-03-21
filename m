Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE83CC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 17:46:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9907521902
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 17:46:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nZBlo7Qx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HTYcrrvG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9907521902
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWhcFm3xE8lSM93+7TJu7veWzY6MnRtRtu5ZWxQQP/o=; b=nZBlo7QxAW18H1
	ukrJPJGAAub6XoeKcTMzMXbGEI7uYa/FFfRxioAmkU9bievoF3PyxfK2bXLGanj4JkL71kcxTKSPK
	RTFYjIt7vS7gBNEwY6v2n/sVBq94fLQHwHQn5zvM1CHjMovCUpGxuwFlYbiWWMLJwS39Fwxa5HPvK
	RwW0OK5quP+4a4Uzcd5uFsPlzHr1wKoAULzy1CEgz2NmsI01iPjKENDuynDyJWPzB38XvJG7jQiQU
	ji4bpbaE5bwKLWtqvLFxJPMTGSM5pyZqiwCGlmSRZN92qAuOqL2dZPieA8clynqalk19A04lKApbE
	3L1QFzstHEjSUgzrxY1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h71m4-0002I1-Fg; Thu, 21 Mar 2019 17:46:40 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h71kw-0000l7-7E; Thu, 21 Mar 2019 17:45:43 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LHjLQF124779;
 Thu, 21 Mar 2019 12:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1553190321;
 bh=VCFswOP9m176b3VL5yVpVFWVJnFKwvHaDa1u6d0m3Yc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=HTYcrrvGoXNDu1xs22CGcVrRP5DJBaT9zUtrR9uk79M4ul1/lhEufg4/2TRV/1ar/
 Z0oOgQ1vYuuDI67fPODfh/p6pMAMLc23HRRCBJfQyj3dBOCTedlU3oW2JctUDjl+bO
 DzQfRTayU80bG5vh5zZNuUbrDl20qAIGA3zdSDGI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LHjLLY006279
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 Mar 2019 12:45:21 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 21
 Mar 2019 12:45:21 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend Transport;
 Thu, 21 Mar 2019 12:45:21 -0500
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LHiq2Z018392;
 Thu, 21 Mar 2019 12:45:16 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh R <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH v2 5/5] mtd: hyperbus: Add driver for TI's Hyperbus memory
 controller
Date: Thu, 21 Mar 2019 23:15:48 +0530
Message-ID: <20190321174548.9288-6-vigneshr@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190321174548.9288-1-vigneshr@ti.com>
References: <20190321174548.9288-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_104531_090767_CFD10AC4 
X-CRM114-Status: GOOD (  22.02  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Arnd Bergmann <arnd@arndb.de>, tudor.ambarus@microchip.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add driver for Hyperbus memory controller on TI's AM654 SoC. Programming
IP is pretty simple and provides direct memory mapped access to
connected Flash devices.

Add basic support for the IP without DMA. Second ChipSelect is not
supported for now.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/hyperbus/Kconfig      |  10 +++
 drivers/mtd/hyperbus/Makefile     |   1 +
 drivers/mtd/hyperbus/hbmc_am654.c | 108 ++++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 drivers/mtd/hyperbus/hbmc_am654.c

diff --git a/drivers/mtd/hyperbus/Kconfig b/drivers/mtd/hyperbus/Kconfig
index febbb4cdc25f..4e026eb0f045 100644
--- a/drivers/mtd/hyperbus/Kconfig
+++ b/drivers/mtd/hyperbus/Kconfig
@@ -9,3 +9,13 @@ menuconfig MTD_HYPERBUS
 	  the Hyperbus Controller driver to communicate with
 	  Hyperflash. See Cypress Hyperbus specification for more
 	  details
+
+if MTD_HYPERBUS
+
+config HBMC_AM654
+	tristate "Hyperbus controller driver for AM65x SoC"
+	help
+	 This is the driver for Hyperbus controller on TI's AM65x and
+	 other SoCs
+
+endif # MTD_HYPERBUS
diff --git a/drivers/mtd/hyperbus/Makefile b/drivers/mtd/hyperbus/Makefile
index ca61dedd730d..24abd1d43ade 100644
--- a/drivers/mtd/hyperbus/Makefile
+++ b/drivers/mtd/hyperbus/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus-core.o
+obj-$(CONFIG_HBMC_AM654)	+= hbmc_am654.o
diff --git a/drivers/mtd/hyperbus/hbmc_am654.c b/drivers/mtd/hyperbus/hbmc_am654.c
new file mode 100644
index 000000000000..abf2b0959a35
--- /dev/null
+++ b/drivers/mtd/hyperbus/hbmc_am654.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+// Author: Vignesh Raghavendra <vigneshr@ti.com>
+
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mtd/hyperbus.h>
+#include <linux/mtd/mtd.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/types.h>
+
+struct am654_hbmc_priv {
+	struct hyperbus_ctlr ctlr;
+	struct hyperbus_device hbdev;
+	void __iomem	*regbase;
+};
+
+static const struct hyperbus_ops am654_hbmc_ops = {
+	.calibrate = hyperbus_calibrate,
+};
+
+static int am654_hbmc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct am654_hbmc_priv *priv;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "failed to get memory resource\n");
+		return -ENOENT;
+	}
+
+	priv->regbase = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regbase))
+		return PTR_ERR(priv->regbase);
+
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(&pdev->dev);
+		goto disable_pm;
+	}
+
+	priv->ctlr.dev = &pdev->dev;
+	priv->ctlr.ops = &am654_hbmc_ops;
+	priv->hbdev.ctlr = &priv->ctlr;
+	priv->hbdev.np = of_get_next_child(dev->of_node, NULL);
+	ret = hyperbus_register_device(&priv->hbdev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register controller\n");
+		pm_runtime_put_sync(&pdev->dev);
+		goto disable_pm;
+	}
+
+	return 0;
+disable_pm:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
+}
+
+static int am654_hbmc_remove(struct platform_device *pdev)
+{
+	struct am654_hbmc_priv *priv = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = hyperbus_unregister_device(&priv->hbdev);
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static const struct of_device_id am654_hbmc_dt_ids[] = {
+	{
+		.compatible = "ti,am654-hbmc",
+	},
+	{ /* end of table */ }
+};
+
+MODULE_DEVICE_TABLE(of, am654_hbmc_dt_ids);
+
+static struct platform_driver am654_hbmc_platform_driver = {
+	.probe = am654_hbmc_probe,
+	.remove = am654_hbmc_remove,
+	.driver = {
+		.name = "hbmc-am654",
+		.of_match_table = am654_hbmc_dt_ids,
+	},
+};
+
+module_platform_driver(am654_hbmc_platform_driver);
+
+MODULE_DESCRIPTION("HBMC driver for AM654 SoC");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:hbmc-am654");
+MODULE_AUTHOR("Vignesh Raghavendra <vigneshr@ti.com>");
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

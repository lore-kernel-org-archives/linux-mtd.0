Return-Path: <SRS0=Ifuc=SO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D4FC10F14
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2019 09:30:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 415002171F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2019 09:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pgcY5BqM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="X9Jd+VWP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 415002171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxXgZLGcNI39a1fxBT7o5A8UBoRNrqpdQuHiADAJpNI=; b=pgcY5BqM4FfdPe
	cudvs5GeKvQqXGDeXdyI9fbT4E4ZSPl9Ua/TQCtw7+HMZegygP7YZtf28BBhobvOKjeg8yYD2T93b
	6YDV7EByBDDdO0pVWGErZTXalPXsU5z/MKrQ4tGdN4exVF8YLM6A7m/sDsQyldmT5G1JoyewSsg5D
	46cA2aCn+b2R+nShjEuGSvJ9d2HRDvtOy0bF+LTFsMBNFk4GWHR2xszU5xFCEr1UxKRQVtpgxaaJC
	Dtt4OtujGRHpl+RvK/KZ4+jrMbQYX4tKbNo9Ewjt0+Bw5W4ppk720xPHQFzTG5w6ELaKfQVlSgUs+
	rY7b2E7486tcJhumH5mQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEsWE-0000qK-3B; Fri, 12 Apr 2019 09:30:46 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEsUz-0006RG-5k; Fri, 12 Apr 2019 09:30:09 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3C9TIJk043599;
 Fri, 12 Apr 2019 04:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1555061358;
 bh=SOs+/lKbDYt47rJCWasS94Bi1lRmC3XqCD8X2v2hPkE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=X9Jd+VWPNoegTB/l2Fkd2Jp1vqvOdBaed35rGOt+Jnd3qedytgtK6Dwl1y+BTu7hq
 YqipMNs9f7+uUX6HAxOF0gmRDfR8TnMWJ/NjmoW3qKZbsPkJYkKwdqdTjLCfMokJBa
 9KdZCw+2XHB0s5mWveNH1vjYtkm8x3wIMdjWVnxs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3C9TI9W020768
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Apr 2019 04:29:18 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 12
 Apr 2019 04:29:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 12 Apr 2019 04:29:18 -0500
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3C9SWmI093202;
 Fri, 12 Apr 2019 04:29:12 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 5/5] mtd: hyperbus: Add driver for TI's HyperBus memory
 controller
Date: Fri, 12 Apr 2019 14:59:23 +0530
Message-ID: <20190412092923.24919-6-vigneshr@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190412092923.24919-1-vigneshr@ti.com>
References: <20190412092923.24919-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_022930_235316_6AFEC81E 
X-CRM114-Status: GOOD (  21.19  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add driver for HyperBus memory controller on TI's AM654 SoC. Programming
IP is pretty simple and provides direct memory mapped access to
connected Flash devices.

Add basic support for the IP without DMA. Second chipSelect is not
supported for now.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/hyperbus/Kconfig      |  12 ++++
 drivers/mtd/hyperbus/Makefile     |   1 +
 drivers/mtd/hyperbus/hbmc-am654.c | 115 ++++++++++++++++++++++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 drivers/mtd/hyperbus/hbmc-am654.c

diff --git a/drivers/mtd/hyperbus/Kconfig b/drivers/mtd/hyperbus/Kconfig
index 98147e28caa0..cff6bbd226f5 100644
--- a/drivers/mtd/hyperbus/Kconfig
+++ b/drivers/mtd/hyperbus/Kconfig
@@ -9,3 +9,15 @@ menuconfig MTD_HYPERBUS
 	  the HyperBus Controller driver to communicate with
 	  HyperFlash. See Cypress HyperBus specification for more
 	  details
+
+if MTD_HYPERBUS
+
+config HBMC_AM654
+	tristate "HyperBus controller driver for AM65x SoC"
+	select MULTIPLEXER
+	select MUX_MMIO
+	help
+	 This is the driver for HyperBus controller on TI's AM65x and
+	 other SoCs
+
+endif # MTD_HYPERBUS
diff --git a/drivers/mtd/hyperbus/Makefile b/drivers/mtd/hyperbus/Makefile
index ca61dedd730d..8a936e066f48 100644
--- a/drivers/mtd/hyperbus/Makefile
+++ b/drivers/mtd/hyperbus/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus-core.o
+obj-$(CONFIG_HBMC_AM654)	+= hbmc-am654.o
diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
new file mode 100644
index 000000000000..f458d7226df9
--- /dev/null
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -0,0 +1,115 @@
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
+#include <linux/mux/consumer.h>
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
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->regbase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regbase))
+		return PTR_ERR(priv->regbase);
+
+	if (of_property_read_bool(dev->of_node, "mux-controls")) {
+		struct mux_control *control = devm_mux_control_get(dev, NULL);
+
+		if (IS_ERR(control))
+			return PTR_ERR(control);
+
+		ret = mux_control_select(control, 1);
+		if (ret) {
+			dev_err(dev, "Failed to select HBMC mux\n");
+			return ret;
+		}
+	}
+
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
+		goto disable_pm;
+	}
+
+	priv->ctlr.dev = dev;
+	priv->ctlr.ops = &am654_hbmc_ops;
+	priv->hbdev.ctlr = &priv->ctlr;
+	priv->hbdev.np = of_get_next_child(dev->of_node, NULL);
+	ret = hyperbus_register_device(&priv->hbdev);
+	if (ret) {
+		dev_err(dev, "failed to register controller\n");
+		pm_runtime_put_sync(&pdev->dev);
+		goto disable_pm;
+	}
+
+	return 0;
+disable_pm:
+	pm_runtime_disable(dev);
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

Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48916C76190
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 22:05:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1499A22CB9
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 22:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dn8VetjX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="pOAiQLoB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1499A22CB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bk1ZQAP68YnsqKaGpJCHAFOYpBt9mmtq1aPel0jJfpI=; b=dn8VetjXGA0obr
	dgveCLsYuj3kXTys8mDyQ8E0fl0bruk37vYlTQ9Tg+75P+wDa6sw3cU5YL5rcyxVjhXgsVXAm5lUi
	p3zptoRxPp62Dxwu1kj5Ixciy6KwUmHsGDPTlW/gyEZFEIyh0ur3iteGy4gQnzE10A2vMDnWMgAtL
	PTTOqHpmiRhmHve13su1ZWyY8xMc4c3DMZErnNo50qZxNwyPjqk7jRTbq9uWnQaEaTiOC5DQJxQsZ
	7S5bHyCZa7618l1rZtY/OC0he2nYdry6gMeVltcIT/DJgbzg+VJ+KK+hnpr3pHsd+JLfBULuAVY3s
	WRobpxYObQTEja3S/TiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqlru-00068z-5g; Thu, 25 Jul 2019 22:05:46 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqlqH-0003XP-MP
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 22:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1564092241; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPvTCBtp17vremzTfloiFFchmNAtLBkbM57vwCCuUL0=;
 b=pOAiQLoB3Wt9GzMqQUCzIZerPlU4Qxn8n6bdYD0cBOdbg4ArYiDUvSWX1H2cLCB8vHLFyy
 UyyvwFz3a3QdimCz9jc9fqm0H4Z/hhwf8wc1h2lv9+sxADTFKpxUc6irP3c7WG43sSfxTg
 ADFiHgZEkBK+PqWHp0heZnG95Xer7HM=
From: Paul Cercueil <paul@crapouillou.net>
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vkoul@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Lee Jones <lee.jones@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Sebastian Reichel <sre@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 09/11] hwmon: Drop obsolete JZ4740 driver
Date: Thu, 25 Jul 2019 18:02:13 -0400
Message-Id: <20190725220215.460-10-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-1-paul@crapouillou.net>
References: <20190725220215.460-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_150406_173774_1E0F0731 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The JZ4740 boards now use the iio-hwmon driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---
 drivers/hwmon/Kconfig        |  10 ---
 drivers/hwmon/Makefile       |   1 -
 drivers/hwmon/jz4740-hwmon.c | 135 -----------------------------------
 3 files changed, 146 deletions(-)
 delete mode 100644 drivers/hwmon/jz4740-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 650dd71f9724..2199ac1d0ba7 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -660,16 +660,6 @@ config SENSORS_IT87
 	  This driver can also be built as a module. If so, the module
 	  will be called it87.
 
-config SENSORS_JZ4740
-	tristate "Ingenic JZ4740 SoC ADC driver"
-	depends on MACH_JZ4740 && MFD_JZ4740_ADC
-	help
-	  If you say yes here you get support for reading adc values from the ADCIN
-	  pin on Ingenic JZ4740 SoC based boards.
-
-	  This driver can also be built as a module. If so, the module will be
-	  called jz4740-hwmon.
-
 config SENSORS_JC42
 	tristate "JEDEC JC42.4 compliant memory module temperature sensors"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 8db472ea04f0..1e82e912a5c4 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -85,7 +85,6 @@ obj-$(CONFIG_SENSORS_INA2XX)	+= ina2xx.o
 obj-$(CONFIG_SENSORS_INA3221)	+= ina3221.o
 obj-$(CONFIG_SENSORS_IT87)	+= it87.o
 obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
-obj-$(CONFIG_SENSORS_JZ4740)	+= jz4740-hwmon.o
 obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
 obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
 obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
diff --git a/drivers/hwmon/jz4740-hwmon.c b/drivers/hwmon/jz4740-hwmon.c
deleted file mode 100644
index bec5befd1d8b..000000000000
--- a/drivers/hwmon/jz4740-hwmon.c
+++ /dev/null
@@ -1,135 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
- * JZ4740 SoC HWMON driver
- */
-
-#include <linux/err.h>
-#include <linux/interrupt.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/io.h>
-
-#include <linux/completion.h>
-#include <linux/mfd/core.h>
-
-#include <linux/hwmon.h>
-
-struct jz4740_hwmon {
-	void __iomem *base;
-	int irq;
-	const struct mfd_cell *cell;
-	struct platform_device *pdev;
-	struct completion read_completion;
-	struct mutex lock;
-};
-
-static irqreturn_t jz4740_hwmon_irq(int irq, void *data)
-{
-	struct jz4740_hwmon *hwmon = data;
-
-	complete(&hwmon->read_completion);
-	return IRQ_HANDLED;
-}
-
-static ssize_t in0_input_show(struct device *dev,
-			      struct device_attribute *dev_attr, char *buf)
-{
-	struct jz4740_hwmon *hwmon = dev_get_drvdata(dev);
-	struct platform_device *pdev = hwmon->pdev;
-	struct completion *completion = &hwmon->read_completion;
-	long t;
-	unsigned long val;
-	int ret;
-
-	mutex_lock(&hwmon->lock);
-
-	reinit_completion(completion);
-
-	enable_irq(hwmon->irq);
-	hwmon->cell->enable(pdev);
-
-	t = wait_for_completion_interruptible_timeout(completion, HZ);
-
-	if (t > 0) {
-		val = readw(hwmon->base) & 0xfff;
-		val = (val * 3300) >> 12;
-		ret = sprintf(buf, "%lu\n", val);
-	} else {
-		ret = t ? t : -ETIMEDOUT;
-	}
-
-	hwmon->cell->disable(pdev);
-	disable_irq(hwmon->irq);
-
-	mutex_unlock(&hwmon->lock);
-
-	return ret;
-}
-
-static DEVICE_ATTR_RO(in0_input);
-
-static struct attribute *jz4740_attrs[] = {
-	&dev_attr_in0_input.attr,
-	NULL
-};
-
-ATTRIBUTE_GROUPS(jz4740);
-
-static int jz4740_hwmon_probe(struct platform_device *pdev)
-{
-	int ret;
-	struct device *dev = &pdev->dev;
-	struct jz4740_hwmon *hwmon;
-	struct device *hwmon_dev;
-
-	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
-	if (!hwmon)
-		return -ENOMEM;
-
-	hwmon->cell = mfd_get_cell(pdev);
-
-	hwmon->irq = platform_get_irq(pdev, 0);
-	if (hwmon->irq < 0) {
-		dev_err(&pdev->dev, "Failed to get platform irq: %d\n",
-			hwmon->irq);
-		return hwmon->irq;
-	}
-
-	hwmon->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(hwmon->base))
-		return PTR_ERR(hwmon->base);
-
-	hwmon->pdev = pdev;
-	init_completion(&hwmon->read_completion);
-	mutex_init(&hwmon->lock);
-
-	ret = devm_request_irq(dev, hwmon->irq, jz4740_hwmon_irq, 0,
-			       pdev->name, hwmon);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
-		return ret;
-	}
-	disable_irq(hwmon->irq);
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, "jz4740", hwmon,
-							   jz4740_groups);
-	return PTR_ERR_OR_ZERO(hwmon_dev);
-}
-
-static struct platform_driver jz4740_hwmon_driver = {
-	.probe	= jz4740_hwmon_probe,
-	.driver = {
-		.name = "jz4740-hwmon",
-	},
-};
-
-module_platform_driver(jz4740_hwmon_driver);
-
-MODULE_DESCRIPTION("JZ4740 SoC HWMON driver");
-MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:jz4740-hwmon");
-- 
2.21.0.593.g511ec345e18


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

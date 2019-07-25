Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A77C76190
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 22:17:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D60BF22C7B
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 22:17:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hWGA+4SU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBxt6As/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D60BF22C7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iId9DAcMu6T9cGP4d22+9cc86Ju5Ju8fCIfTpLzs85s=; b=hWGA+4SUWaJ+0v
	6bjjcrnztt7JndwG+HoUxJptfMBah4RALFov4sHJg9S17ZYHS1BHert6gMGlkJRiuo8sWcazhygFC
	9Xhog7h3B7M61xjeog9GVtt0de8q/n3v8JjJmZiRZpYvnJYI9Hs+9HeJkdYO+zydH48erxLvw8ohB
	0XM5LDq0BNE98QNW05/C0PFgINve+iSNYaBpaoALcNoEf0iCSzTx83hkKej1kJtKp7VsPrkJzM/qz
	IHqnZ8ykePJfhvSRoMXJIUDW/VER34slNfUmnQQVnScAB2xoNXOOYm6Elmo23CFyVsXTL8REp5kzV
	YcD1k3iNTm23EutNSTBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqm2k-0001Wp-U2; Thu, 25 Jul 2019 22:16:58 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqm2h-0001WM-VU
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 22:16:57 +0000
Received: by mail-pl1-x642.google.com with SMTP id t14so23896882plr.11
 for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2019 15:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f+t6jbc1e2fwX6vAlkrzuMXuLiicaUEhNVvQHHY1xA0=;
 b=tBxt6As/HYsgjOazvloK9O0Mjop6Bn56B5HpXHSoqdI5WVRldDkFUpbbjL4TopoZd2
 J7vYPmE/m4aVBfZE48gzykZH2pLoAk/ENWS8OsjZL5gyAcIWf8nMAkci8B/raK29BWFO
 KIDyd+zcF3jL6kQ4DqoI8CLwuCWFnpLEyoQ+wSyHr2322Q940asEEMMtPIRQWBf3NA5t
 vy386+OJGM44cNKMiWm5wKAzU3beuPa1wWQ16i4RAA3464n6OjLqHnJ9EooueRxK3ARL
 j24WiDLZH/M2wWET5e+S7Sl2S5dFOBOX6VnaGI6RVLNjfHZelJxZkuRmG+E0Wx/w36dm
 yf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=f+t6jbc1e2fwX6vAlkrzuMXuLiicaUEhNVvQHHY1xA0=;
 b=ocTiTXae5+2VRX3X6Jfgr4zP7dLzR3rQJ/6LWLvlkgoh1+TYWF+7ThznmFCuDVnFGg
 n/4eLI7U7ft5C2LSodW78iSgvuarXig1JBJjTOX2hTlnvu7CsftFvSoc870Hj9joNylz
 TbdWTaeEgv69zzXH3Qp4ZaiRr3qedLiyjFYOdaZ7IOUacdXJ7j2uaQnSeQxiJsA/1n6q
 m+oxWrFO9OCuG7U1/bmJnspLxE9UC3PRGHX3+0yf7A/L9hLbNzBQwKnl0rae0C/quGGk
 1v1iRFMqZyJ1x2XBbT6YbTUvWp02lwWcvlbso8jTDyqVUA4g4OM6tqJRUdP4SVz+ne41
 fS8g==
X-Gm-Message-State: APjAAAVv02wMEcQW+EytdvTuOklo+slkPKwKLZLyxWlVnalsQKBfAGOx
 70PSwoCnyMgOHbY93pHytso=
X-Google-Smtp-Source: APXvYqy5sOalZc7jCdn8Z9ZMzKMzw/2OyExZAds1bLvX/QRXsNnz9PyIEHHW8gjFX8wSRsOEm/5AsQ==
X-Received: by 2002:a17:902:d917:: with SMTP id
 c23mr93058293plz.248.1564093014781; 
 Thu, 25 Jul 2019 15:16:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id g8sm49495815pgk.1.2019.07.25.15.16.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 15:16:53 -0700 (PDT)
Date: Thu, 25 Jul 2019 15:16:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 09/11] hwmon: Drop obsolete JZ4740 driver
Message-ID: <20190725221652.GA31672@roeck-us.net>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-10-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725220215.460-10-paul@crapouillou.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_151656_046038_2AB3D87E 
X-CRM114-Status: GOOD (  19.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>, Artur Rojek <contact@artur-rojek.eu>,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jul 25, 2019 at 06:02:13PM -0400, Paul Cercueil wrote:
> The JZ4740 boards now use the iio-hwmon driver.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/hwmon/Kconfig        |  10 ---
>  drivers/hwmon/Makefile       |   1 -
>  drivers/hwmon/jz4740-hwmon.c | 135 -----------------------------------
>  3 files changed, 146 deletions(-)
>  delete mode 100644 drivers/hwmon/jz4740-hwmon.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 650dd71f9724..2199ac1d0ba7 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -660,16 +660,6 @@ config SENSORS_IT87
>  	  This driver can also be built as a module. If so, the module
>  	  will be called it87.
>  
> -config SENSORS_JZ4740
> -	tristate "Ingenic JZ4740 SoC ADC driver"
> -	depends on MACH_JZ4740 && MFD_JZ4740_ADC
> -	help
> -	  If you say yes here you get support for reading adc values from the ADCIN
> -	  pin on Ingenic JZ4740 SoC based boards.
> -
> -	  This driver can also be built as a module. If so, the module will be
> -	  called jz4740-hwmon.
> -
>  config SENSORS_JC42
>  	tristate "JEDEC JC42.4 compliant memory module temperature sensors"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 8db472ea04f0..1e82e912a5c4 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -85,7 +85,6 @@ obj-$(CONFIG_SENSORS_INA2XX)	+= ina2xx.o
>  obj-$(CONFIG_SENSORS_INA3221)	+= ina3221.o
>  obj-$(CONFIG_SENSORS_IT87)	+= it87.o
>  obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
> -obj-$(CONFIG_SENSORS_JZ4740)	+= jz4740-hwmon.o
>  obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
>  obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
>  obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
> diff --git a/drivers/hwmon/jz4740-hwmon.c b/drivers/hwmon/jz4740-hwmon.c
> deleted file mode 100644
> index bec5befd1d8b..000000000000
> --- a/drivers/hwmon/jz4740-hwmon.c
> +++ /dev/null
> @@ -1,135 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
> - * JZ4740 SoC HWMON driver
> - */
> -
> -#include <linux/err.h>
> -#include <linux/interrupt.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/mutex.h>
> -#include <linux/platform_device.h>
> -#include <linux/slab.h>
> -#include <linux/io.h>
> -
> -#include <linux/completion.h>
> -#include <linux/mfd/core.h>
> -
> -#include <linux/hwmon.h>
> -
> -struct jz4740_hwmon {
> -	void __iomem *base;
> -	int irq;
> -	const struct mfd_cell *cell;
> -	struct platform_device *pdev;
> -	struct completion read_completion;
> -	struct mutex lock;
> -};
> -
> -static irqreturn_t jz4740_hwmon_irq(int irq, void *data)
> -{
> -	struct jz4740_hwmon *hwmon = data;
> -
> -	complete(&hwmon->read_completion);
> -	return IRQ_HANDLED;
> -}
> -
> -static ssize_t in0_input_show(struct device *dev,
> -			      struct device_attribute *dev_attr, char *buf)
> -{
> -	struct jz4740_hwmon *hwmon = dev_get_drvdata(dev);
> -	struct platform_device *pdev = hwmon->pdev;
> -	struct completion *completion = &hwmon->read_completion;
> -	long t;
> -	unsigned long val;
> -	int ret;
> -
> -	mutex_lock(&hwmon->lock);
> -
> -	reinit_completion(completion);
> -
> -	enable_irq(hwmon->irq);
> -	hwmon->cell->enable(pdev);
> -
> -	t = wait_for_completion_interruptible_timeout(completion, HZ);
> -
> -	if (t > 0) {
> -		val = readw(hwmon->base) & 0xfff;
> -		val = (val * 3300) >> 12;
> -		ret = sprintf(buf, "%lu\n", val);
> -	} else {
> -		ret = t ? t : -ETIMEDOUT;
> -	}
> -
> -	hwmon->cell->disable(pdev);
> -	disable_irq(hwmon->irq);
> -
> -	mutex_unlock(&hwmon->lock);
> -
> -	return ret;
> -}
> -
> -static DEVICE_ATTR_RO(in0_input);
> -
> -static struct attribute *jz4740_attrs[] = {
> -	&dev_attr_in0_input.attr,
> -	NULL
> -};
> -
> -ATTRIBUTE_GROUPS(jz4740);
> -
> -static int jz4740_hwmon_probe(struct platform_device *pdev)
> -{
> -	int ret;
> -	struct device *dev = &pdev->dev;
> -	struct jz4740_hwmon *hwmon;
> -	struct device *hwmon_dev;
> -
> -	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
> -	if (!hwmon)
> -		return -ENOMEM;
> -
> -	hwmon->cell = mfd_get_cell(pdev);
> -
> -	hwmon->irq = platform_get_irq(pdev, 0);
> -	if (hwmon->irq < 0) {
> -		dev_err(&pdev->dev, "Failed to get platform irq: %d\n",
> -			hwmon->irq);
> -		return hwmon->irq;
> -	}
> -
> -	hwmon->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(hwmon->base))
> -		return PTR_ERR(hwmon->base);
> -
> -	hwmon->pdev = pdev;
> -	init_completion(&hwmon->read_completion);
> -	mutex_init(&hwmon->lock);
> -
> -	ret = devm_request_irq(dev, hwmon->irq, jz4740_hwmon_irq, 0,
> -			       pdev->name, hwmon);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> -		return ret;
> -	}
> -	disable_irq(hwmon->irq);
> -
> -	hwmon_dev = devm_hwmon_device_register_with_groups(dev, "jz4740", hwmon,
> -							   jz4740_groups);
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> -}
> -
> -static struct platform_driver jz4740_hwmon_driver = {
> -	.probe	= jz4740_hwmon_probe,
> -	.driver = {
> -		.name = "jz4740-hwmon",
> -	},
> -};
> -
> -module_platform_driver(jz4740_hwmon_driver);
> -
> -MODULE_DESCRIPTION("JZ4740 SoC HWMON driver");
> -MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:jz4740-hwmon");
> -- 
> 2.21.0.593.g511ec345e18
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

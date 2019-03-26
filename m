Return-Path: <SRS0=gzro=R5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D05DC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 10:41:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1593120857
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 10:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E6jGywPY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="D38VNIIZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1593120857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LmjTJdzfnZucmgNKoS9Ay1yFeb9KWp8t3p3r83XampE=; b=E6jGywPY2nHEKp
	B5CocdwtpraXtnXJvnFHlivxVlxyTaa2bcAVZHzio+xUeJO+6GYCfJEF61LW9CHm+pWds7wMuRQ2H
	kAFw9Is7FBSWF/xzghsgswmdhlq0wAIXXJRJtWZifcVZrjDlLAfxgr2dtAqwScSmw7dOzs2LJh5vr
	LSHR2ObCWxTWUk4nkexKoU+VfSjnITD9WZduVLnOGCqg+cbfWN1UIRsUHoJE437JjI2CuyIl7jJRA
	yLfukmCnnGKMqjkw8PhoA1AjYYNAFcUo8Xz3E7Jr1Imohf6RpS6XiEFN/TC+p17AhdcCRoVJieIgK
	rOGr9V+KkzVembp8GLQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8jVs-0008QS-3Q; Tue, 26 Mar 2019 10:41:00 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8jVn-0008P8-Uk
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2019 10:40:58 +0000
Received: by mail-lj1-x244.google.com with SMTP id t13so10593522lji.2
 for <linux-mtd@lists.infradead.org>; Tue, 26 Mar 2019 03:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2I5YsJACu9UfaNajNSsnu4SMBqpXNXMYkE2FLhEbmaM=;
 b=D38VNIIZKSqHTwYQUV29eGcZ8NlGzdsaUnYdDSoZDtO31XwJsUWJyWymp8fTPPG/fD
 rwsEzsp9AkLah4WMsvFs2MISy+ICJq/+JosWd4CVd/Hj2r2z1mAQ2uOcOP21LqVI4KLY
 S37K2mWVqHZVkmAPMbMbvHnlyqiPdCx7XX6Fh82useYa1LC8awRUV5whcKrbANFRmfJo
 9lta8QAcnxOYRpHzDKWK+2lL3IcBc2DvymTvm0fKfNJfMdlm43G+/hAJzCZGrNscz1rE
 Tq7Ap2hFRyHXhoG0owTmAebzv+GM+IB/MJ85MS5AUOzxuYoonmB3K7NnX0W5RNl5qn1F
 6Pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2I5YsJACu9UfaNajNSsnu4SMBqpXNXMYkE2FLhEbmaM=;
 b=KbS2nzA7mp9vsygWFPVpaH059b53jUKOdtqbDtNA6qHav8QQeps0LVrBKCz/Vgf3st
 962UqxE5sefrC8gFqz+5yaph9t3nvTd297RqeC0JRGD0Kfe9mDDOsCpNROE/mRCxrnaI
 j6Fzxda4QONgbKE5z0RLYmGkumeXxuOXYNjpg2oE/vm77mcmr4fAtCg8D9q1CgOT480Y
 LKybyPIdFwsAVS59EIkhS1MzIrjHbG6L1YYgQ9u2fBk1oBhl5io6/w57c2zo88mq/196
 v+iDMGFZTWBxxHug+UsFGT7yRVDRXVLbyVqTDKoeOq3vlzZ/ygCwqYjVc34fsHiCIjnl
 1fWQ==
X-Gm-Message-State: APjAAAWsWI7nlNXKRFqNB9Mi/Aw+CL+m1Jzh3309PNF1GT779WiQsReo
 QqPibR+2tj+gXUtpxHD8U13mPg==
X-Google-Smtp-Source: APXvYqzvZnrjqonjXJsxQ53xUAesmAmpB0WB8n+Yl5J0VBvPLIe21YmezU7TOIGzp9ggl5FDeKpiLQ==
X-Received: by 2002:a2e:8016:: with SMTP id j22mr4718280ljg.189.1553596847668; 
 Tue, 26 Mar 2019 03:40:47 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.80.243])
 by smtp.gmail.com with ESMTPSA id f1sm3956556ljf.40.2019.03.26.03.40.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Mar 2019 03:40:47 -0700 (PDT)
Subject: Re: [RFC PATCH v2 5/5] mtd: hyperbus: Add driver for TI's Hyperbus
 memory controller
To: Vignesh Raghavendra <vigneshr@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-6-vigneshr@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <c537220a-63bd-9279-bbf0-fbbb1b4eb10a@cogentembedded.com>
Date: Tue, 26 Mar 2019 13:40:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190321174548.9288-6-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_034055_998752_D1156088 
X-CRM114-Status: GOOD (  22.63  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 tudor.ambarus@microchip.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 03/21/2019 08:45 PM, Vignesh Raghavendra wrote:

> Add driver for Hyperbus memory controller on TI's AM654 SoC. Programming
> IP is pretty simple and provides direct memory mapped access to
> connected Flash devices.
> 
> Add basic support for the IP without DMA. Second ChipSelect is not
> supported for now.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
[...]
> diff --git a/drivers/mtd/hyperbus/Makefile b/drivers/mtd/hyperbus/Makefile
> index ca61dedd730d..24abd1d43ade 100644
> --- a/drivers/mtd/hyperbus/Makefile
> +++ b/drivers/mtd/hyperbus/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus-core.o
> +obj-$(CONFIG_HBMC_AM654)	+= hbmc_am654.o
> diff --git a/drivers/mtd/hyperbus/hbmc_am654.c b/drivers/mtd/hyperbus/hbmc_am654.c
> new file mode 100644
> index 000000000000..abf2b0959a35
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/hbmc_am654.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> +// Author: Vignesh Raghavendra <vigneshr@ti.com>
> +
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mtd/hyperbus.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/types.h>
> +
> +struct am654_hbmc_priv {
> +	struct hyperbus_ctlr ctlr;
> +	struct hyperbus_device hbdev;
> +	void __iomem	*regbase;
> +};
> +
> +static const struct hyperbus_ops am654_hbmc_ops = {
> +	.calibrate = hyperbus_calibrate,
> +};
> +
> +static int am654_hbmc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct am654_hbmc_priv *priv;
> +	struct resource *res;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {

   This is redundant as devm_ioremap_resource() checks for !res anyway.

> +		dev_err(&pdev->dev, "failed to get memory resource\n");
> +		return -ENOENT;
> +	}
> +
> +	priv->regbase = devm_ioremap_resource(dev, res);

   BTW, there's devm_platform_ioremap_resource() now...

[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

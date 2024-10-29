Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D08D2AB14
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 10:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYADoKqUW2b5qfMWPDZdx6C4zk9K4jVZK8aDKNx2ZXc=; b=hfBQlbGXi9EcfC
	dVMQyztwjhn962mx+0vyFYISEndsKbe68wToS5cI3yAjJbYMAny/2bZPcnf2L1SYNHnAhO/cpqGVG
	LZd4QzQ5OAAdRnK2iDMC4z8ieYqKzKmg2+ewEiwk/Fzvp/FMStdwPaXLQPsHJ+x8OVodhC53Unvp1
	kX6Aaar2sSJmpLAuo02knEkwWxwj1rgZ213k36LkMos2oxHa0RpfYqPhYSdDEWmLu75dvw/OdDYgJ
	gNQC1tYh85OeYe0K5nHKpBwE9PHKAUg4M5+1b7lOBlPSjp519pg9X+EVY46RnHOvrexdmVcYjR2HH
	dow+tPwC6OpSapNdXP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5j4V-0000000DyRs-1yyL;
	Tue, 29 Oct 2024 10:03:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iyl-0000000Dwms-1AhK
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 09:57:36 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d63a79bb6so3702108f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2024 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730195853; x=1730800653; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DN7KbVPzR0Ss7/4UGrf+xZAi7oyW24SdUifFCTdR8uM=;
        b=YI2+Ge3BGlGPXEroEROUfjmUkYb7KHpWbiLB7ygP87rXqwWAaf/Xtv00/EG1GxIP0j
         uKeQO8uUxfqT4I/sl65rATZl5nVUJZdZRbUk6lUDR0N4UD5ThojQkhpPoXA8No+p9Utc
         25ZWCIURqYhGzRO3GvIOhnKv6QKbUSPvhLFFwMBNKvETlBtB1G2LohheBqrdw0+3bUcx
         lE1koo6fRdRy6c7k6f1An7dnH+ycJwXplahkj91XgAVd/FL6nOGpKU1qcgZHEoaB8Q21
         DXYv3P0shGiys8EkesVuIA8Prk8yN1/KQm3j8Q8HB+lzyTsVI8PZfmuoOGpJgwaKJBGh
         5xzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730195853; x=1730800653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DN7KbVPzR0Ss7/4UGrf+xZAi7oyW24SdUifFCTdR8uM=;
        b=J8Nz3S56hHrE8gSnXjApJorDKYRk+mFlurvZMyiUAyVUXC7gGkuIn+ogAx3LOnH9aU
         tENSnGPIPN74l+dARACBWJKm/NxCEBPoMASpW3PyMDGOLtnAvThJaEDE31DO+kXVEMqB
         6f4/yk5/DH0v5qvPjzdbNr65Njwn1HmjoqyHZtVLKMnWFSnIX8bmU601Gs1PhzsB+Ny6
         ojrBtablwQrf5sXIsh4HdMeqGq2AlF5ff+rh9OoZY6fUtl6bj4Ik2VO9KiLw3Avd9WxE
         lFaJdTuClrGJ2N5MESlK9iSctR5M2fZStGG8K6YgFbg38GPkyRSd6l5UGg33E5+XJ7jt
         WwwQ==
X-Gm-Message-State: AOJu0YxKXJ2Mlkl7Igksl7d1xzrHnB+DV1d20KOXjopnrWEBT8EnNW1Q
	Y1U/0VdU8SiOyaFsrX82Y6a167nEfWRfNC64uPLf5q8Pv9rMlDpIN7pFLnPx54c=
X-Google-Smtp-Source: AGHT+IHhmgSstrKyHX2Iwez/d7VdkcjXlscKVW8yRli6oSKJ8qbcBw12V0iO42/emHYeLXIDzokkEw==
X-Received: by 2002:a05:6000:bd0:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-380611850a0mr8235479f8f.31.1730195853404;
        Tue, 29 Oct 2024 02:57:33 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bde6sm12026123f8f.40.2024.10.29.02.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 02:57:33 -0700 (PDT)
Message-ID: <470c0b52-17d1-44e4-9a70-5b410ead9500@linaro.org>
Date: Tue, 29 Oct 2024 09:57:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: support vcc-supply regulator
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
References: <20241027-spi-v3-0-42e81723bbcc@nxp.com>
 <20241027-spi-v3-2-42e81723bbcc@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241027-spi-v3-2-42e81723bbcc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_025735_337529_4609A4EC 
X-CRM114-Status: GOOD (  17.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/27/24 12:16 PM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> SPI NOR flashes needs power supply to work properly. The power supply
> maybe software controllable per board design. So add the support
> for an vcc-supply regulator.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/mtd/spi-nor/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b6f374ded390a0c0429a61dd0579204e0e98bfa1..d95427c4f4d0839c5df348eeddea59582ef99d9d 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -17,6 +17,7 @@
>  #include <linux/mtd/spi-nor.h>
>  #include <linux/mutex.h>
>  #include <linux/of_platform.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> @@ -3465,6 +3466,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (!nor->bouncebuf)
>  		return -ENOMEM;
>  
> +	ret = devm_regulator_get_enable(dev, "vcc");
> +	if (ret)
> +		return ret;

This is all looking good, but please move it to spi_nor_probe().

All the SPI NOR controllers need to move to spi/. We stopped adding
support for the SPI NOR controllers few years ago.

> +
>  	ret = spi_nor_hw_reset(nor);
>  	if (ret)
>  		return ret;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

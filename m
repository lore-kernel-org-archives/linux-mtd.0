Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91786C001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqYxDORsUW1mmkL1d4bPsxK9eSVjny0QjNdLQSY4ASE=; b=IsvID9qnpFDFKz
	CbQ2fnYGL5/OObzWLtdlAxTU90A6cWmWCw/JsRZzVptyIvsoqCmMTQc3nRZcddMQun5LpkCQm3eV7
	pt6WdvuEgVNyJHg+N908iFReuh3KyRikJwkgzGSJ+x9YwdxRZBzivxQFmpmNUtd/pMf2qvRe39VbB
	tGqTKoS1QNK2wO//jqx8jJoLDLtTbv5aLKt9Hqg+R9jTbGzNyDREtt7EE3R9Sh/zIm7XQ7T0Fqlqm
	0B1rv3OPFou/3je5784cT/2S6nUIlfVVVy9yiC7V6k4GkgwjXYS5NdC7Xie/wLKccvlkbamf+vArT
	ah4hRosA7Wd8lrcdiOhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8xF-007u9x-03;
	Wed, 19 Jul 2023 15:19:05 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8xB-007u8o-0m
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 15:19:02 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-992ace062f3so982562366b.2
        for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2023 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689779939; x=1692371939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRytqqaUij9ITxwuW9TkWneQ35h5ghdHjnPfZyd8QPk=;
        b=cEeuCOZmAZMNyWJot6nkcxlg6qzkB7TQp9dOEsSi8lg2FXG7D56vDcVuv31IwxPV77
         Pn3XHtx82y3nbrDap7j9JqDSLch/iOViVVefBkB4h9RdKFOarUb/yvIavrrr1LMx2mn9
         Y+QmIS0j5UvhJRrKvvl7OaBk2lOR6TklRkSt6okJfxboG3aw5ToSv/xnyKHR5hl/SqoI
         VahpYVOGowdfOP2A20dHQ+im51dHiI7lEOdozNGPwEzQcIKhijBhaoeh2prTAT5Unkn9
         Im4ifAErsEGMqneWeaURYohWIspUhbWJDD/4QqGFsNVjaO3N6KDhv8eJ7XaIoaBNPCq2
         /Tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689779939; x=1692371939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pRytqqaUij9ITxwuW9TkWneQ35h5ghdHjnPfZyd8QPk=;
        b=QEKaHSGjMwZFG/VHGsSqKuBBTA7hFGkw8cuojBGtC2yZQxdMII3l/hFcPQYBzr4QjP
         3MGCpcfNDcCP3whSg5LlBPIeD7/iiQmahBJyvnJwgzVXXzR64HLw9L50Uu06r2e/qFZQ
         /shsK5GqVveGoa/ROpMB71aK203bKZJd3fCIGzdmbnffVsYIAyWvvO3inE5SGwa0t2+u
         BcprG1yKyukv6g+MfWV4rOCbrAwI+f6RaYrbr5wq81XrfzzfTY1YRDQL4hsP2TPSxDfI
         trrUqLl1s3OdDdrc9wqkxdEvVk3z4jt9CZNu6wKoAqR55l/k/mJeLVaa76g6ftTS765s
         JZEA==
X-Gm-Message-State: ABy/qLZ/abKg4+rjDiaAVC0IIP+LQW4F53hBuv04jCYccQQpfFnN+28w
	KG0Ht5x2hFfrzTZfxs68xVNLZA==
X-Google-Smtp-Source: APBJJlGnBoh183JIh6x7QGF4A72MAlgN9ApNDAEYcr2MZ0wsAYZslRQwsTGMxjgyAjRO7tEXpQVNzg==
X-Received: by 2002:a17:907:86a7:b0:992:4e20:bca4 with SMTP id qa39-20020a17090786a700b009924e20bca4mr3023326ejc.42.1689779939047;
        Wed, 19 Jul 2023 08:18:59 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id jp16-20020a170906f75000b00997cce73cc7sm2453190ejb.29.2023.07.19.08.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 08:18:58 -0700 (PDT)
Message-ID: <b6725f64-7d08-5966-e0bc-17c5b2e846ad@linaro.org>
Date: Wed, 19 Jul 2023 16:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1] mtd: spi-nor: macronix: Add support for MX77U25650F
To: mahesh.r.vaidya@intel.com, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: andriy.shevchenko@linux.intel.com, jarkko.nikula@intel.com,
 furong.zhou@intel.com, mallikarjunappa.sangannavar@intel.com,
 nandhini.srikandan@intel.com, rashmi.a@intel.com
References: <20230719132700.15274-1-mahesh.r.vaidya@intel.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230719132700.15274-1-mahesh.r.vaidya@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_081901_313322_F19F9BDE 
X-CRM114-Status: GOOD (  18.59  )
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

Hi,

On 7/19/23 14:27, mahesh.r.vaidya@intel.com wrote:
> From: Mahesh R Vaidya <mahesh.r.vaidya@intel.com>
> 
> The MX7725650F is production chip for new design from Macronix
> with a lesser memory of 256Mbit with unique security features
> like Permanent 4 I/O RPMC, Secured 8K OTP support.
> 
> Validated by read, erase, write and read back.
> Tested on Intel RPL, PASS.
> Tested-by: Mahesh R Vaidya <mahesh.r.vaidya@intel.com>
> 
> Signed-off-by: Mahesh R Vaidya <mahesh.r.vaidya@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 04888258e891..995936ba58e2 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -103,6 +103,9 @@ static const struct flash_info macronix_nor_parts[] = {
>  	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +	{ "mx77u25650f",  INFO(0xc27539, 0, 64 * 1024, 512)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>  };
>  

Does this flash support SFDP tables? Here's how you can
determine that:
https://lore.kernel.org/linux-mtd/cover.1686557139.git.Takahiro.Kuwano@infineon.com/

If yes, then you could use the generic spi-nor driver,
thus you won't need to explicitly define a flash entry,
See:
773bbe104497 mtd: spi-nor: add generic flash driver

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

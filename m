Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E910EC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQl/ltJZVNED05oDMevq7F2mL36s6HUFjBb3YPnJU5U=; b=XwyDR9sPXy44/9
	m5lzpcGbOoK+vR+YH/cZKD06HB8DAjFJchL3eV4dPMeji4Py4ihRugGMVT9evc6+p985yxza3a44c
	AJc4/5NhKpFQlpY7QgKkETBq08ikcLIh/7B8JEheeHlFftwx/gn34UFB3x1Y789i/Q74CJ5FImzvz
	iBw7F3ov07i6RxMLjnLBhYB9igjuTrUmWdcZoev7SFfrFDBhgsth6WtDTaja/L0mrI8t2ka9iyPnT
	NI9kWrR1QW64DFLL8aJGSP68HHwoBdvfGe//1MVz9EIyN6TschphVRcvEmhjxVG2flGE4FvKy0bZG
	C7Ei9w/lwFydLQa4FtCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0QC-005b0o-0h;
	Wed, 19 Jul 2023 06:12:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0QA-005azv-2K
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ofXBG0otArMnc0xQL0OFzIyI9NYt0Dof1HcC6jOBs8Y=; b=OkKYhjFWetws5DuhPWvJWjEEY2
	fkDC6LVNwfnASrLFX2AyRiTDvaCnKN8td0KPvOnC8BMGZtvpmgpY9aEPYj2Ob8eQAx4xvAXnxZ5Ao
	y5TUSUN+Di9SiKuqRxFQsVp7aSWqIuKKusVyAAOPsdpjTwaOVk4/yyy7psYbnzlQt2snpZhxnKOq4
	r2/1fhrn0Ls1MeFaWhEqQ072qGt73lRdCxLai5EY+9zV2IzBY007jddrr7HVlzR7F9Ugc9B0iyCuE
	hzjpq3kq8ilBtg4VXrzww/Z66QKYxaqsWiMo+518lWg3ki5HS0HJKabI4bM4po6JYvd+FM2f3PBEQ
	e0s3bktA==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLoqd-00BpBd-1p
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 17:50:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so62506655e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 10:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689702591; x=1692294591;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ofXBG0otArMnc0xQL0OFzIyI9NYt0Dof1HcC6jOBs8Y=;
        b=RmdSF9nfYWZzYHJ21z0iaWahjaKyna5bsyQyHUvlIye253yvu2J9yg6nJv/Fb8jvmy
         HsXhDXpkgUAGWMK3vrmDCUiH3GlWF3XgsochVvAN+RUAys2SgqPZL0dgWCd07tQtmUpr
         SvJztgApBqrQ+tvZSNvvIchHyneQBW1T6z2/pPmNC69Kvx76sjslbuzRz5g8+Jnz/gBB
         zRdcERfYIYR8pPiV2IOl/qNjrg4zgEXxHXFxpM2LJXYSeXNOn6Q4tM+bmiCIs0S+c7qS
         gTQRyXH0Ph58bMg/Riod3Idp9zvdfDm9yc/4VPQ2A9M1+OsxlC5DmARbKzpcAQpyC28u
         YDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689702591; x=1692294591;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ofXBG0otArMnc0xQL0OFzIyI9NYt0Dof1HcC6jOBs8Y=;
        b=Kj4ugx13hbDsSaLNoYgB55JeY6hAdR8xTVt7MPPCxvPy/6tIIDyVXh6fADy7oWeLPA
         bFIAf0r67U6qSD/zbsV0wzjD3+muDSF6XJkwbIRdCGYkffnwAIOLM0jPfxy0wfberzMu
         7KHopVLcIeF3F1QQ7BqU3wb7FYc4T12d/1foy5JBu7OL5JVs4NGUNqXq6vfGOkSZ0vcl
         TtJ69jHVlmmh2e6Wtv3ktbo9+WkKq0cjZJuKwBIca2/cIkdow5E6/87d/8l4s6xULaPq
         prisg3L680qY7QTnxk3ksqNqoKOj1TNW8Mmylkrez0XY1NGp6wbdq60vELARVrjviqEz
         PNkw==
X-Gm-Message-State: ABy/qLYDaC9dvWvWhwYksfKJ0J0BbPXNhJXSRvy0btt46Fhty0sYardC
	VuwXb250VxIYs1BpvAMLIjUj+A==
X-Google-Smtp-Source: APBJJlH6bu15zpd8KmGi1f4dcWUKy7fVGvqG5SkHl32pxLFEF7Ic/hK2AzT3FFt3fPEgsvfH0Ij9kQ==
X-Received: by 2002:a05:600c:b54:b0:3fa:91d2:55b6 with SMTP id k20-20020a05600c0b5400b003fa91d255b6mr2669045wmr.9.1689702591411;
        Tue, 18 Jul 2023 10:49:51 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d4850000000b00313e4d02be8sm2964713wrs.55.2023.07.18.10.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 10:49:50 -0700 (PDT)
Message-ID: <23fd0aed-784d-85a8-1c45-15ac0f8afe91@linaro.org>
Date: Tue, 18 Jul 2023 20:49:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] mtd: spi-nor: gigadevice: Add support for gd25lb256
To: Hao Yao <hao.yao@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Md Sadre Alam <mdalam@codeaurora.org>
References: <1612869079-19593-1-git-send-email-mdalam@codeaurora.org>
 <20230613045313.2690342-1-hao.yao@intel.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20230613045313.2690342-1-hao.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_185055_943386_C1412864 
X-CRM114-Status: GOOD (  14.84  )
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

Hi!

On 13.06.2023 07:53, Hao Yao wrote:

You need some commit message here describing your changes. Please read
https://www.kernel.org/doc/html/latest/process/submitting-patches.html
before submitting v3.

We require contributors that submit flash additions or updates to dump
the SFDP tables and do some sanity checks. Here's an example on how to
do it:
https://lore.kernel.org/linux-mtd/20230712161503.448024-1-miquel.raynal@bootlin.com/

> Signed-off-by: Hao Yao <hao.yao@intel.com>
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
> index d57ddaf1525b..d56c1876549f 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -62,6 +62,10 @@ static const struct flash_info gigadevice_nor_parts[] = {
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> +	{ "gd25lb256", INFO(0xc86719, 0, 64 * 1024, 512)

INFO(0xc86719, 0, 0, 0) please, those params can be retrieved at SFDP
parsing time.


> +		PARSE_SFDP
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
> +		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },

Is the SPI_NOR_4B_OPCODES really needed, isn't the support determined at
SFDP parsing time?

>  	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512)
>  		PARSE_SFDP
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

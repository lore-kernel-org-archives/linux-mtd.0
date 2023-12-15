Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000A4C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXpX6DZkHSybS4CP4nM32vnRwwjAaFu2lIHGFFtSGaQ=; b=ibe3+C44m+FQEG
	lGL0VpwaroIowTw/5VtPGUno/qPCq+0VY1P2UuL2SXEzPTuHi14Toxf/RO/tvSWRClcaNT98qWSYl
	QBm/7tIgXbhkIVIbzkB+yhRt0Vvs4iRHQWJr8hZXIlMYdIlKAul/ZmFqRRvtIStd/nFfipnmbTids
	UTi6FoajpzHtzaeOd1RLgCrV+5nuYXLfjZXQ+giptmpOGfSY1iVrNv6Dw32b7s4VZ69e+lK9tW23p
	IMMKb6rRZXqvK+DYhPCpI7Y0unAGTtgBZ3j9HsNFirictkNSHGKFKAiQyi3DXcKM7Oz7okjtc7bjO
	2JgQC12jd13C9L1Era8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE23x-002EQF-0i;
	Fri, 15 Dec 2023 06:52:45 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE23u-002EPt-28
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 06:52:44 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-55114c073b8so337067a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2023 22:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702623159; x=1703227959; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yTHfAjSRpK6NaIPS6e3HQWcJpPcz4/l2D6cbEOFhxb8=;
        b=qOk44IndxjfkEp/l4S+eDlOCz+r5JG2BhXOZMJEuRY3ZDNXERf9XXy+ugU1hJ3wT4Z
         C8gclWOHFx8io19ILaCz8lajQGP6GREhMtlp7yVaNjZoTi5OtxSzaooPhFYnE0qdxO+Z
         4zk01GcodtKEOYpjHiPPK3/cfG53xa2Xlf/Gvx439QpynMhZrItC8qdK+4epeYGvdNYj
         vTgaiiJRMyHLUrMw4nzw4kXeij2yDNVMnvIOVqrtnuKpiups0GvUqMYSv2qqaKNoVmVI
         PxHHzqB6PFqLUXT+P4wdLTq341VUFFp/3OzWroFohzZyzLBhbyI3Vd2+G63+FgKTradP
         fUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702623159; x=1703227959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTHfAjSRpK6NaIPS6e3HQWcJpPcz4/l2D6cbEOFhxb8=;
        b=Zne6YOchpFzLFY6/p4amRArDEII6JFHxxlbjWKJSS3lTSyZ7FitmCE7OfMN/Gfl1ae
         hAk7wdpCJBStTSiOVT163kN/1gb6ui/CvYzhzdWiTcEFxQFAmgFHxgrL1NmTlc9Ento9
         /ZldSwthPwvoGMTNxhcxctuAK6rgBLptmXV9gigJh5xVZlv+ky5HE2zoL1XZLJO+j444
         ea7NcyEscvzzcnGz7FleYdnFQ5QrPUYcx580aJU/hBTzQ1pXu10swG/0n+0kU/SwY09+
         xDUf6j5KeLl7a6UjN4NPcMFaMJ3xe4YGd3AxCprhZQM5ae7DUDnXH7gW6lPW/KPzItET
         /Oyg==
X-Gm-Message-State: AOJu0YwOED4FMZLXXXaB9DbAoGY1eDvaE8ceDsUv5l0oVpGEwtVwc4oS
	3QFIiFlX5RoIz3w/YVvKdClu1w==
X-Google-Smtp-Source: AGHT+IGSK3JVsGJnLvAxgSDp2L8U99Pr3WXDe/LbSJxtCUy29uNzSz++TZ8dyQHicGykRJ61h6ZCIg==
X-Received: by 2002:a17:906:2206:b0:a22:e619:d846 with SMTP id s6-20020a170906220600b00a22e619d846mr2039506ejs.42.1702623159274;
        Thu, 14 Dec 2023 22:52:39 -0800 (PST)
Received: from [192.168.2.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id un7-20020a170907cb8700b00a1b65249053sm10321318ejc.128.2023.12.14.22.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 22:52:38 -0800 (PST)
Message-ID: <6a0cf9e4-8870-434e-8c7f-10c57b604df6@linaro.org>
Date: Fri, 15 Dec 2023 08:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: macronix: add support for Macronix
 octaflash mx25uw51345g
Content-Language: en-US
To: haibo.chen@nxp.com, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-imx@nxp.com, han.xu@nxp.com
References: <20231213084820.932217-1-haibo.chen@nxp.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231213084820.932217-1-haibo.chen@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_225242_727756_A24E012C 
X-CRM114-Status: GOOD (  21.50  )
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

Hi, Haibo,

Please read the following before sending v2:
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/Documentation/driver-api/mtd/spi-nor.rst?h=spi-nor/next

On 13.12.2023 10:48, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> The octaflash mx25uw51345g is an xSPI compliant octal DTR flash. Here add
> support for using it in octal DTR mode.
> 
> Try to verify the flash ID to check whether the flash memory in octal
> DTR mode and SPI mode are correct. When reading ID in OCTAL DTR mode,
> ID will appear in a repeated manner. ex: ID[0] = 0xc2, ID[1] = 0xc2,
> ID[2] = 0x94, ID[3] = 0x94... Rearrange the order so that the ID check
> can pass.
> 
> Based on the following patch:
> https://patchwork.ozlabs.org/project/linux-mtd/patch/1621232088-12567-2-git-send-email-zhengxunli@mxic.com.tw/

I would have taken the patch from above if I considered it ready to be
integrated. Please sync with Zhengxun/Jaime and find out what's missing.
> 
> Signed-off-by: Zhengxun Li <zhengxunli@mxic.com.tw>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 91 ++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index ea6be95e75a5..8a1ce17cff3f 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,11 @@
>  
> 
cut

> +
>  static const struct flash_info macronix_nor_parts[] = {
>  	{
>  		.id = SNOR_ID(0xc2, 0x20, 0x10),
> @@ -177,6 +261,13 @@ static const struct flash_info macronix_nor_parts[] = {
>  		.name = "mx25uw51245g",
>  		.n_banks = 4,
>  		.flags = SPI_NOR_RWW,
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x84, 0x3a),
> +		.name = "mx25uw51345g",

we'll obsolete the name on new flash additions, drop it.
> +		.size = SZ_64M,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,

should be discovered by sfdp, isn't it?
> +		.fixup_flags = SPI_NOR_4B_OPCODES,

these too.
> +		.fixups = &octaflash_fixups,
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x9e, 0x16),
>  		.name = "mx25l3255e",

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

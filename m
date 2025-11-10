Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF18CCF9E3
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Nov 2025 06:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cR3zYXZzh+ckbho9Px2PlZwAmAAIQS7tW2wuwUgEDfo=; b=33w/fBGi0Yhopg
	ccF9/Hdz9vuG5AmxK0xX4iY1stAiQmGtKBuaYqgXV0Tntwd0D+/6dKnH2zyWLQZRc65Pp3QpEECd3
	82DbywJAqsP3KuycVSQ4I/A4p5Fd7kCItRy9v5A2JJLsOh6LKctq8uSY3dxa+4PtbIQ+x2xynHkx4
	1DZU4nRhPapQOniXYDieuXEMTf3pA1SgfL0O2b7zdMeH4T3TrhuisSfvRu3mtJSMqB3MVLH1a7iGi
	YJmMnPB3ORIeFOfh3cENSAkrkUDNwMK06TfEU7xrN4/6ZATsvYHsdn5VtMY89XyXTG7B8qEogX6Am
	cGlwPggzf9PXBDr6ZoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILfE-00000004qoa-21sW;
	Mon, 10 Nov 2025 06:46:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILf9-00000004qnR-1LUX
	for linux-mtd@lists.infradead.org;
	Mon, 10 Nov 2025 06:46:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so20257615e9.3
        for <linux-mtd@lists.infradead.org>; Sun, 09 Nov 2025 22:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762757161; x=1763361961; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pu1XhH2ZxG6Wd4en1D4CkiVWQG6H8ikgU7y2tqQz8Z4=;
        b=nCLzDAYi7vCy4Xwx5Vre3W8a1oxE9bHI0tqVTrhk/+RjucxqIQiLXrLr31DR1zpyZj
         lkXAQgZSMEITLGhgeOjLUGEPxAzS6Zp4brfh1YX/js0+tXlFHJ7FZXcF5zknYycJ69by
         dfEEqoHodhNC0zMfLmXjU/QibdgpRmaOlXQ0uP8MCAiTD47obSRc2Er+Jmi/PqMjynow
         4FAbThYALID18IjX38vw/F+2LULoZBEQIj0ek51KLEQaQjbAnUBHheDLqWL2BtKQZqWR
         sbS7fznGxgtAbDnhPfZVcq825xrub++NyHUGO6S4jiaffjcPyCBZzynYgUFZlkde8V9E
         BR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762757161; x=1763361961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pu1XhH2ZxG6Wd4en1D4CkiVWQG6H8ikgU7y2tqQz8Z4=;
        b=p/z/+5qC8e1nFKFcAGMroEve2LWgyEdfIzbcfDlqtMfpl8VY8n2ls//zhYKBKURQ0J
         k2Y6FEQVheO1CLw7XSrVYPgcTJBcSiAZiYulQrCMaz2sw/s/vf+1pHDchkwz8em0Zhgz
         sd0Bq7uCuHQibsCkMWdeZBxECeJeJkOPSlStl9nCmIPTEWyYdSGjqv9uqNM+wTrRUP2t
         FDYjIAvGe3G9RoGLZ5wJwS72hjH0EaBrZBpGgYUkO+AFp7HIo/kawUTkFr2ooD++4JXV
         RiTZEB3QShPUyNe69H8CKP5UmfLrqT4dFDFMohmMDYMORy/+6qcJ8KWuYOEi8lebyNZn
         eCxQ==
X-Gm-Message-State: AOJu0YwZ6wh6t8fBM08JceCAoWHIKgaR8vV2iFxKAebeaBmZTFqHsEuL
	qV+/Y7juAXDCsuca52CZUCRUEBTRyYIriwMfJB4ZhIGN4+iWHxgA4ElpsHaj5PlQAXk=
X-Gm-Gg: ASbGncsOqoMyNstyJfxL1wuMQCy/bOVE1Bw3lU6jbRPd58rDDF0UeQ2EmbGNqmspGqd
	zT6npn3bpzmmVa6vm6AiQx6lfuvwmmEuBhWMzDkSRaBiI/LDw7s7UAYwgN5abmsWmAO9hAw0du3
	7Ep8jn4dAdYJp5pLj52rcEYzM1Rqs8QInNR8A18DkHnWN3RT11dS2GGshSyeP2N4OySCroGJOjR
	RRWd97X3ArkwysKrK+dDB7hmP5Owk17+AORWI5FKvhyZFor+26/Rl11DS+eBKLsNEpigX7itBTO
	fBDZGig/vQQCLv3pE8FROJPrUEPFnD/U8xTkiHPJwoL4TX/T0v4xgFN/khg6EwoMX5MpN3XbObK
	E2F4v15gr9kQmPIGkpbCkMjZzheBhoALV7yLtIx4tIXohQazgJL/oV9xveouYHnyLBfsWiZUWaE
	oIKaR0Z+fdsPp0LKdI
X-Google-Smtp-Source: AGHT+IH7hyQPKhcZy8yzJus1HIGOBdpu+NzRSyrvlskw5IUKjuHbd1YMpjBQn0eJHTMLn2IbItWT0w==
X-Received: by 2002:a05:6000:1847:b0:429:cf88:f7ac with SMTP id ffacd0b85a97d-42b2dca2e52mr5114061f8f.44.1762757161534;
        Sun, 09 Nov 2025 22:46:01 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927d5sm13577288f8f.24.2025.11.09.22.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 22:46:01 -0800 (PST)
Message-ID: <7d8b0062-a6ec-43a9-ab00-3e11f0e2fb26@linaro.org>
Date: Mon, 10 Nov 2025 08:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mtd: spi-nor: micron-st: enable 8D-8D-8D mode and die
 erase for mt35xu02gcba
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251110-nor-v1-0-cde50c81db05@nxp.com>
 <20251110-nor-v1-4-cde50c81db05@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251110-nor-v1-4-cde50c81db05@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_224604_574061_C3FA08ED 
X-CRM114-Status: GOOD (  18.20  )
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



On 11/10/25 6:02 AM, Haibo Chen wrote:
> mt35xu02gcba is similar with mt35xu01gbba and mt35xu512aba, but with
> four dies inside. And it also support 8D-8D-8D mode, but SFDP lack
> SNOR_F_IO_MODE_EN_VOLATILE, so add this fixup flags here.
> 
> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

please dump the SFDP data for every flash that you touch, it helps
us with the sfdp database

>  drivers/mtd/spi-nor/micron-st.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index f724313f4dd3720908968c670e8d3d58f41c099c..b36174436b7aa0f7768dbe48e4ad4927c08a3d6d 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -214,6 +214,12 @@ static const struct spi_nor_fixups mt35xu01gbba_fixups = {
>  	.late_init = micron_st_nor_two_die_late_init,
>  };
>  
> +static const struct spi_nor_fixups mt35xu02gcba_fixups = {
> +	.default_init = mt35xu512aba_default_init,
> +	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
> +	.late_init = micron_st_nor_four_die_late_init,
> +};
> +
>  static const struct flash_info micron_nor_parts[] = {
>  	{
>  		.id = SNOR_ID(0x2c, 0x5b, 0x1a),
> @@ -237,12 +243,13 @@ static const struct flash_info micron_nor_parts[] = {
>  		.fixups = &mt35xu01gbba_fixups,
>  	}, {
>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
> -		.name = "mt35xu02g",
> +		.name = "mt35xu02gcba",

we don't care about the name, drop the name and add it as a comment.

>  		.sector_size = SZ_128K,
>  		.size = SZ_256M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
>  		.mfr_flags = USE_FSR,
> -		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,

Whenever you can, remove the non-sfdp static data and rely on the SFDP
driver to handle it. Can you please drop sector_size, no_sfdp_flags and
SPI_NOR_4B_OPCODES?

Then do the testing and sysfs/debugfs dumps to prove the flash works okay.
Thanks!
ta> +		.fixups = &mt35xu02gcba_fixups,
>  	},
>  };
>  
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

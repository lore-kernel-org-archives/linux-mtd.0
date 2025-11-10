Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1F6CCFA1A
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Nov 2025 06:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCp1rZPynLhQFxlWP20sLOY0HKlMfpItUuDqRfOX440=; b=RCS9IsFgyvDAGn
	qKArKKkamw8QT8HCq9YO3mjocdtX6n/FaTmojLZ7SHKycoOr/lj7qlTYNM04HWYY7ZdUZ6K0Uiqq7
	cexEBdk3lWiFv6TCzo09bla7/XxPh+Eb61oBDWvTljWh/9JH/pULgCsjYDRRzB0FDZvkh8uQqiXwQ
	8pkdUKgVGtZ3nsP5CMTnfLMfCHPDGv1icE1EtQKXEZTuHnbo0iuIOkhsJntd/l338jbH4sF/naTFZ
	oRWRWwPhf3OyKv+HkX6EekLzy9WwXfTKhyHjdeIypxlOD0JxbbAuOeYGD7ATkHl1SSMMRxLvJP90O
	BcxiFcKzTMx1O5dqaUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILbT-00000004qQz-08e3;
	Mon, 10 Nov 2025 06:42:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILbP-00000004qQM-0dWU
	for linux-mtd@lists.infradead.org;
	Mon, 10 Nov 2025 06:42:14 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4775ae77516so31304555e9.1
        for <linux-mtd@lists.infradead.org>; Sun, 09 Nov 2025 22:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762756929; x=1763361729; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l6bovgW6M7IaME8m+3MWwurxo5DAnDQ6F4m1f8PyL1M=;
        b=vMgsJ0VLVNDDokQGq76IIEhqaJ5Mz9TpXAC0QOTLQi645TO6ckG5cVTM+DvA5+nDK3
         QQjxQAsnqwvWYK9EKPTqjUlrkLmJWSk9py9dQ1BhJTcScOkvFrklhZ434TvljtdXeSQv
         tEJBq1dUTdqbAUjoytOlc7s0stL1eI1of7FCrMihqtZCKAFOFgpUp+vK4nm4GMvc0thK
         8XxUnM9OARajHd2B4Xo/fi/FTLvDFHeELA4nZiaDLLU974pakK9BG6lBUaAO9yQ7N5px
         nlD/Rd+eQ1hxfXirWKIJJxY04F5wo17S6tfGjFidf9lqQCVHO65FfcBWAIicaAdDnCts
         z/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762756929; x=1763361729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6bovgW6M7IaME8m+3MWwurxo5DAnDQ6F4m1f8PyL1M=;
        b=WmW4lsxC5X5JQFSzmvTmCsGnsV02/fSs3NTxNPKs1mYArVRycDTgQxwYQgY2Yuk9y4
         sBiAi41z3g9L2FTC+fKXPHoCogddEQ2qVgRPUhVNbXuOlV/S/bofo7VrZZqHlPMH4kEg
         e7qINWHoMVRtlaPnyoAq9FkS472KlLkjyGWveTPUdZdWayJP/SvBfQyJl4DrMQzrpYsr
         SnTrPZ++86qtjR7XVYM/KOnPrnokojoKogm9+af557daCxTq9OYNmGYYuV/BxVWTvq+L
         fnRim/2xnU0gweuq5AzDIsLZvsaJxQDA5pc8y8PAoghdLsvtFET6o04xEi1M6mt1hwHe
         5kag==
X-Gm-Message-State: AOJu0YxthGAgolds6w1T4lHgTkt7mrUjy4eBmaYWdff7XavrHDUPBzJN
	+90s278UCW9Dp2kV1BaHv5R98ByTgtl1Y6U3/WVtfAmoBTTOscSRb5UqCf3jjRamojQsCWMVAQ5
	W/epQ
X-Gm-Gg: ASbGncuHOpP7m/iA9LHg2q62vG61Ne2df/zebRUF+5IVoEe63vorHNYyRC2gubknHR6
	X1JQ1X3qDdWIR2jsCwx8VG97rdggHYT0S7wAJeySU0MnCgdcqbCPx5BvSBz++Wafam5fIFIO+iL
	ahaCImCdbJ9cc1ItHRppeWI/Pi/TK9xUMZgIwfbu5/lRFFgxmajeiJdTKCmM8EJPLFYwJbXktAS
	iVrJp04khLFeXlkwecKq/DCDGI9IB6ushQHgvCnAW6LH53FTGciFltYLKKHuGVTvEfJuEGa1qsd
	ZxdMKgKNr3ZqN2aCgtqXvo8KIF2Id2F8gxaxOw2FKmWFddho3SBH0a6CMBwNC3acAnTV+oWo+7K
	IOWA6nMKBnQo++shtsxyf8+2Wjux//jMP1ijPddHKTdi9/ThVHW1sPzzKIq6NJlB0W4YmDcuHFI
	jciNOKk80aDNYO0HnqeouCxX3bq08=
X-Google-Smtp-Source: AGHT+IFeQlHe6Lgxh0t0G+yg4ltlGLrSe2rLWiTzLA7NtqazJKMqLz3Vmd4kQU1Tog7Gnfuon0XUgA==
X-Received: by 2002:a05:600c:1c8e:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-47773288fa6mr64526045e9.34.1762756929296;
        Sun, 09 Nov 2025 22:42:09 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm20193170f8f.19.2025.11.09.22.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 22:42:08 -0800 (PST)
Message-ID: <b046d19f-6e55-47db-b7a8-6c8766da2e7f@linaro.org>
Date: Mon, 10 Nov 2025 08:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mtd: spi-nor: micron-st: add mt35xu01gbba support
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251110-nor-v1-0-cde50c81db05@nxp.com>
 <20251110-nor-v1-3-cde50c81db05@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251110-nor-v1-3-cde50c81db05@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_224211_252610_F38CDD4F 
X-CRM114-Status: GOOD (  13.23  )
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
> mt35xu01gbba is similar with mt35xu512aba, but with two dies.
> SFDP contain the wrong size, so define the size dierctly in
> the flash info. And it also support 8D-8D-8D mode, but SFDP
> lack SNOR_F_IO_MODE_EN_VOLATILE, so add this fixup flags here.
> 
> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> 
> ---
> 1) This mt35xu01gbba is populated on the imx95-19x19-evk board, was
>    tested at 200MHz using nxp,imx95-fspi SPI controller.
> 2) root@imx95evk:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/partname
>    mt35xu01gbba
>    root@imx95evk:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_id
>    2c5b1b
>    root@imx95evk:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/manufacturer
>    micron
>    root@imx95evk:~# hexdump -Cv /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
>    00000000  53 46 44 50 0a 01 03 ff  00 08 01 17 30 00 00 ff  |SFDP........0...|
>    00000010  84 00 01 02 90 00 00 ff  05 01 01 06 a0 00 00 ff  |................|
>    00000020  0a 00 01 08 b0 00 00 ff  ff ff ff ff ff ff ff ff  |................|
>    00000030  e5 20 8a ff ff ff ff 3f  00 00 00 00 00 00 00 00  |. .....?........|
>    00000040  ee ff ff ff ff ff 00 00  ff ff 00 00 0c 20 11 d8  |............. ..|
>    00000050  0f 52 00 00 39 61 99 00  87 8e 03 d3 ac a1 27 3d  |.R..9a........'=|
>    00000060  7a 75 7a 75 fb bd d5 5c  00 00 70 ff 81 50 f8 a1  |zuzu...\..p..P..|
>    00000070  2f cb 27 8b 00 00 04 01  00 06 01 00 ff ff ff 8e  |/.'.............|
>    00000080  00 00 00 00 00 00 00 00  00 00 00 00 ff ff ff ff  |................|
>    00000090  43 0e ff ff 21 dc 5c ff  ff ff ff ff ff ff ff ff  |C...!.\.........|
>    000000a0  00 0b 80 9e b1 81 b5 85  00 f0 ff 9f 00 0a 00 00  |................|
>    000000b0  00 0a 1a 88 10 00 00 00  ff ff ff ff ff ff ff ff  |................|
>    000000c0  00 00 06 01 00 00 00 00  14 01 81 03 00 00 00 00  |................|
>    000000d0

you have SFDP here

cut

> +	}, {
> +		.id = SNOR_ID(0x2c, 0x5b, 0x1b),
> +		.name = "mt35xu01gbba",

drop the name field and add it as a comment. See recent flash additions commits.> +		.sector_size = SZ_128K,
> +		.size = SZ_128M,

drop these, SFDP shall handle them.

> +		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
> +				 SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,

Drop this line, let SFDP handle it

> +		.mfr_flags = USE_FSR,
> +		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,

can we drop SPI_NOR_4B_OPCODES?

> +		.fixups = &mt35xu01gbba_fixups,
>  	}, {
>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
>  		.name = "mt35xu02g",
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

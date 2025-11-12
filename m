Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D723BCCFA1A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 09:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTGn0U79lzRFOoV9ApB512Ln8jaYUDZCZMHWykpTujc=; b=IAP2A8xIOCW4T3
	z4REESNuhuPVKPTnQECL9aD0MwcrzNPuI91pMw6rby0u9DMmhwOWRTpyNsB3IfeHCq9kq9QulGWgh
	xJARh8ICdRlhmhZ0dMHYmqS+XATZZDhf4uEVL3dsPkXRHCWdCp4lKMEvsM3LCzpJTkQRScVf4rYT7
	sCkIFHgQjeUpUDVpuH3TAM6/XVLos8g5Z0NT+3Uu+hury1sadha9l0ep7N4TzhfwpIBk1CS4r0psP
	juypIGSmsfyWJFliVjAQhFA5z8Qh/dRSc7rlbgla2lCow32OAPYh6De8sVwv9zA8OYtYGx0oH+LM2
	KngcQlr+pWHRlVJEa7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6pV-00000008QrW-3dAu;
	Wed, 12 Nov 2025 09:07:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6pT-00000008Qr2-02EP
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 09:07:52 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42b379cd896so296286f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2025 01:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762938469; x=1763543269; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZGbcTOXFvtZxg3sMQLwS6prNPL/GN53EHQzV1EWATA=;
        b=nISvIMOakIhOrEL4+V/KrhPis0TGu5tGuofKGXeUi92S73Tn27cUHmwzRDaITqw0P9
         d/T+W/m4LAbm9KbCokxzKvfKl0f/YL93GyyOHDk7PpupMcuR1iE7Cgv4lT12H6pm8Saq
         CHZBE4UHlGTnGCpoq/OG7NMbAN8VMHFgveWTUmWnedQ7wGIkn9y1wsXCeaXKYcTYVIbs
         vizABGMS637qtdH29xgLgRLUqtbJrLhM0a75O3lo0aGfDmqmwbqBI4ZqIVdigvzyRCnv
         z94aDh0TpCjn1yGXaiIGnJKaHr4/LsPRHaH35pKDY0VXBCE1+bOiCQXqjbuhNaELCPVL
         AXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762938469; x=1763543269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZGbcTOXFvtZxg3sMQLwS6prNPL/GN53EHQzV1EWATA=;
        b=PIQI5eJi1YoXu/hpFUdFc0bHbUZg6t1qnZv09P3pMhF7XL44zyCFNhueaboPfUx4bo
         jbd0XgxAfNoG1GfHq12b2H+I0QEHW0dVhtu5YVrAvWa6naJ3A+HMhu5GrhgAN21fuIQY
         eTbl48LHyIdWYoN0F7xATaWWRUGzOSX61T8QyTPfagLHhS/PuxwHOxHS+k2pZwHbg+Yd
         OAwvEh5KmW0YVB5n+gYPJSPKER/cNRC4ioWzM8sPkV1Z72JIG1ksd7bTLiHuFWYQveWU
         GXmlKiQEPqAA3j1ZZ6DwCeMm+19B0T7HpYrZHa7WxY9ixXnIjqvqwVHPJStZDt5nm5cC
         RgXw==
X-Gm-Message-State: AOJu0YyKu54hFLCLPG4ySaQcPO03qtq1IKEN5yJAmfQKK2qwjvJ+yapC
	5h5/xZx43wtj+iq5ulLhStEQtxPrexMrBJl9n8fYrZaIu5Q2nTejCfDtYpuRItrXrvY=
X-Gm-Gg: ASbGncuMVqMtaQOGYKV8R+j3cok8cQJCqXvQzR4T3CJDIwuOhsqMrPTRKsI/zKlcOKe
	CONPngii+/o4+P/rDj4TMny1jDApC4cIHjvljBXZSu//kC5BWR6wP4EJP2L/ZsXy7b/Mog5H6rL
	y6vq1Va1RtEGLdtdsujst1NBs0Ns0bci01H3Srup0Yh5QNBO+ilo6wvCJtgQ0kKfiKoQQE7Jvie
	Jn5aDcnXlyttFyEU54yyXjkqo8q24ipF94+kEetvx08jHEGrUDbN8mSnnAWk/V/nXfaTgBPryqB
	uz8OQs6aKLF2qKVU1f3XcTBm7ghTrFk3kfP5oELm9en05Zkpqsfj70NORuWROC0lKa8CLWrBBGc
	9Hc0/xjedrCOPNKdeoXgnDwQoMa0SGpHfFaS1DQG3eEw9ANe8DEjUzio7ksRy19KRKrcGYrtQkS
	ktyQhAYA==
X-Google-Smtp-Source: AGHT+IHJgyfCXCMoxcj7q8e/XHfaH+bqMlUfgAoObC86lK/8KAn1X6MgJ15lw0a/KRXGwmsb0fiiFg==
X-Received: by 2002:a05:6000:228a:b0:42b:2e39:6d45 with SMTP id ffacd0b85a97d-42b4bb98862mr2197431f8f.15.1762938469076;
        Wed, 12 Nov 2025 01:07:49 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm33109625f8f.20.2025.11.12.01.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:07:48 -0800 (PST)
Message-ID: <76970e66-7191-4e33-9def-4f28c414a125@linaro.org>
Date: Wed, 12 Nov 2025 11:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] mtd: spi-nor: micron-st: add mt35xu01gbba support
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v3-0-20aaff727c7d@nxp.com>
 <20251112-nor-v3-4-20aaff727c7d@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251112-nor-v3-4-20aaff727c7d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_010751_090911_B819CCB8 
X-CRM114-Status: GOOD (  12.97  )
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



On 11/12/25 8:48 AM, Haibo Chen wrote:
> mt35xu01gbba is similar with mt35xu512aba, but with two dies.
> mt35xu01gbba has SFDP and support 8D-8D-8D mode, but SFDP
> lack SNOR_F_IO_MODE_EN_VOLATILE, so add this fixup flags here.
> Besides, mt35xu01gbba do not support chip erase, but support
> die erase, so add that in late_init().
> 
> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> 
> ---
> 1) This mt35xu01gbba is populated on the imx95-19x19-evk board, was
>    tested at 200MHz using nxp,imx95-fspi SPI controller.
> 2) root@imx95evk:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_id
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

SFDP above

>  		/* MT35XU512ABA */
> @@ -193,6 +198,13 @@ static const struct flash_info micron_nor_parts[] = {
>  		.mfr_flags = USE_FSR,
>  		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
>  		.fixups = &mt35xu512aba_fixups,
> +	}, {
> +		/* MT35XU01GBBA */
> +		.id = SNOR_ID(0x2c, 0x5b, 0x1b),
> +		.sector_size = SZ_128K,

you can drop sector_size, can't you?

> +		.mfr_flags = USE_FSR,
> +		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
> +		.fixups = &mt35xu01gbba_fixups,
>  	}, {
>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
>  		.name = "mt35xu02g",
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

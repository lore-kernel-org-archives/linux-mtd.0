Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8897C4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 10:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1e/gnx1iOpcCKVUYW4kCv+unbvNUbEkx03ow74+7nc=; b=S8EwkMEw8cZzlc
	Sx97HaqwpNK54K+ciQ67I1rxDBAGOLRG3wUEt4tMTHvLKs2pIjhSxlYBq10ywyZQs0tnnepuNm3QY
	RLtwhA2c68oXHrPRRxZx7tZXhDKrhNmnfFO2rRBbCUxB6tGH0AReNeRh3cs2Ax2QiCH/KHDA1J+19
	jvwGNmGn8vkXtoHIzzXflaKdM/5MSHJcy/noUEX0O4Tc12df6GRNHZ6TkUsndEzOhLuefvqa6QP0M
	oNuaQIeLYEojuAfgB4q/J7quuSV57Q/YIrGrZjQypI6iJEi99sgDNuig9jpvRmMyG3vwNmqqe2++J
	7J9hyPCZhC98LIbHnfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOEWN-002SIz-2c;
	Fri, 12 Jan 2024 10:12:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOEWK-002SFT-2g
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 10:12:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40e60e137aaso15093945e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2024 02:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705054324; x=1705659124; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DhprdGBBaGg3tGsHtPSJtaO0eKJ0B0oNQM9z7hnsptA=;
        b=RYQntiTPrXW8Sfvgj2vmgVrSoFGYCOqq2rZhP+1gjSKNuTapvqvMOCUaUnZRf+kX1n
         tx/kTHRoZxvg/1ohxUNWwquSM4lsvYHayUcSr7Fv46QI1xHBkIf7svJqv8bD691MjwOi
         e+ui4ngpVWrUBrPmg84OY/GmqTNzQJvaPY/yhqyHY5a1Qso0xOSpXVXpZgUg8Q5EsMG+
         EdD4w0XcDg1TaenHli7Iefib7+tJoJcjNYwSP2OEtw+IOnmx6EiC9lJlHnAvuYwwTEgz
         SOWYDt0AHoVuoMRhnvV9TywHZamzbioz0/FTLPcIFWpt6pe/gsTm0FkNNgQxuc1P5Sxu
         gxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705054324; x=1705659124;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DhprdGBBaGg3tGsHtPSJtaO0eKJ0B0oNQM9z7hnsptA=;
        b=kDA1MIemB7buoiclBmYMQXa6Y0Lu0IGFP9s5w+MdbRHbSDDB1EBCIPmGHznOz7WFHR
         3bfxpp731TJIVa+12qAvcDkFbj/3CUxQ3tOXgmHlc2VwVfebVW0pheOIX3p/ODTWjVbV
         2tA9DwqkMmDPSnC3BF3mgcb4sykTeDzoHr+wT+HhPDQf9etVh9QvUo5mMiJQNXu+idu7
         Zsj/4B121PkftIyH8mlUDtrRGKOYrIPvdl8g+girYZJJNf/MG2vcA0jN5aOszOwliQvY
         D/fmctG8I9iEObNO9Po6Z87efvslHQvkcoAzL8wa4e71aCKt0GrgAEOiOde42N5l0+3J
         IJog==
X-Gm-Message-State: AOJu0Yz0PDwmwd2D7iBZwjy33jzng7qdoR7t246xQ49Y3vX+os1Q/20x
	v8MELfpsplVCkzk06soetG7OESsG1aS6SQ==
X-Google-Smtp-Source: AGHT+IFrg/eo2ig/RuFL29cLCy9+AQUPzbaCCbsHaL0axKebTvJY+5MCR9mfVkFt0LIABrwSbNyHew==
X-Received: by 2002:a05:600c:a3a1:b0:40d:3a32:7d51 with SMTP id hn33-20020a05600ca3a100b0040d3a327d51mr607188wmb.119.1705054324042;
        Fri, 12 Jan 2024 02:12:04 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id l8-20020adfe588000000b0033662c2820bsm3421866wrm.117.2024.01.12.02.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 02:12:03 -0800 (PST)
Message-ID: <bb98a601-5c76-4273-820e-2b1c9b449820@linaro.org>
Date: Fri, 12 Jan 2024 10:12:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform
 erase map
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
Content-Language: en-US
In-Reply-To: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_021212_873614_8D34C21C 
X-CRM114-Status: GOOD (  26.22  )
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



On 12/25/23 08:03, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Some of Infineon SPI NOR flash devices support hybrid sector layout that
> overlays 4KB sectors on a 256KB sector and SPI NOR framework recognizes
> that by parsing SMPT and construct params->erase_map. The hybrid sector
> layout is similar to CFI flash devices that have small sectors on top
> and/or bottom address. In case of CFI flash devices, the erase map
> information is parsed through CFI table and populated into
> mtd->eraseregions so that users can create MTD partitions that aligned with
> small sector boundaries. This patch provides the same capability to SPI
> NOR flash devices that have non-uniform erase map.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> The s25hs512t has 32 x 4KB, 1 x 128KB, and 255 x 256KB sectors by default.
> Let's think about creating three MTD partitions that align to region
> boundary.
> 
> BEFORE applying this patch, 1st and 2nd region are forced to read-only:
> 
> ---kernel log---
> ...
> spi-nor spi0.0: s25hs512t (65536 Kbytes)
> 3 fixed-partitions partitions found on MTD device spi0.0
> Creating 3 MTD partitions on "spi0.0":
> 0x000000000000-0x000000020000 : "4KB x 32"
> mtd: partition "4KB x 32" doesn't end on an erase/write block -- force read-only
> 0x000000020000-0x000000040000 : "128KB x 1"
> mtd: partition "128KB x 1" doesn't start on an erase/write block boundary -- force read-only
> 0x000000040000-0x000004000000 : "256KB x 255"
> ...
> 
> ---MTD Info---
> zynq> mtd_debug info /dev/mtd0
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_ROM
> mtd.size = 131072 (128K)
> mtd.erasesize = 262144 (256K)
> mtd.writesize = 16
> mtd.oobsize = 0
> regions = 0
> 
> zynq> mtd_debug info /dev/mtd1
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_ROM
> mtd.size = 131072 (128K)
> mtd.erasesize = 262144 (256K)
> mtd.writesize = 16
> mtd.oobsize = 0
> regions = 0
> 
> zynq> mtd_debug info /dev/mtd2
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_NANDFLASH
> mtd.size = 66846720 (63M)
> mtd.erasesize = 262144 (256K)
> mtd.writesize = 16
> mtd.oobsize = 0
> regions = 0
> 
> 
> 
> AFTER applying this patch, erasesize is correctly informed and no read-only:
> 
> ---kernel log---
> ...
> spi-nor spi0.0: s25hs512t (65536 Kbytes)
> 3 fixed-partitions partitions found on MTD device spi0.0
> Creating 3 MTD partitions on "spi0.0":
> 0x000000000000-0x000000020000 : "4KB x 32"
> 0x000000020000-0x000000040000 : "128KB x 1"
> 0x000000040000-0x000004000000 : "256KB x 255"
> ...
> 
> ---MTD Info---
> zynq> mtd_debug info /dev/mtd0
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_NANDFLASH
> mtd.size = 131072 (128K)
> mtd.erasesize = 4096 (4K)
> mtd.writesize = 16
> mtd.oobsize = 0
> regions = 0
> 
> zynq> mtd_debug info /dev/mtd1
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_NANDFLASH
> mtd.size = 131072 (128K)
> mtd.erasesize = 131072 (128K)
> mtd.writesize = 16
> mtd.oobsize = 0
> regions = 0
> 
> zynq> mtd_debug info /dev/mtd2
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_NANDFLASH
> mtd.size = 66846720 (63M)
> mtd.erasesize = 262144 (256K)
> mtd.writesize = 16
> mtd.oobsize = 0
> regions = 0
> 

nice!

> ---
>  drivers/mtd/spi-nor/core.c | 55 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1b0c6770c14e..e512491733a8 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3408,7 +3408,51 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>  	return info;
>  }
>  
> -static void spi_nor_set_mtd_info(struct spi_nor *nor)
> +static int spi_nor_set_mtd_eraseregions(struct spi_nor *nor)
> +{
> +	struct spi_nor_erase_map *map = &nor->params->erase_map;
> +	struct spi_nor_erase_region *region = map->regions;

shall we have some consts above?

> +	struct mtd_info *mtd = &nor->mtd;

some prefer a reverse xmas tree, thus put the definition from above
below the declaration from below.

> +	struct mtd_erase_region_info *mtd_region;
> +	u32 erase_size;
> +	u8 erase_mask;

put the u8 last to avoid stack padding

> +	int n_regions, i, j;

unsigned int

> +
> +	for (i = 0; !spi_nor_region_is_last(&region[i]); i++)
> +		;
> +
> +	n_regions = i + 1;

all this just to get the number of regions? how about saving the number
of regions somewhere and use it everywhere?

> +	mtd_region = devm_kcalloc(nor->dev, n_regions, sizeof(*mtd_region),
> +				  GFP_KERNEL);
> +	if (!mtd_region)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < n_regions; i++) {
> +		if (region[i].offset & SNOR_OVERLAID_REGION) {
> +			erase_size = region[i].size;
> +		} else {
> +			erase_mask = region[i].offset & SNOR_ERASE_TYPE_MASK;
> +
> +			for (j = SNOR_ERASE_TYPE_MAX - 1; j >= 0; j--) {
> +				if (erase_mask & BIT(j)) {
> +					erase_size = map->erase_type[j].size;
> +					break;
> +				}
> +			}

this for, determining the erase size, deserves a dedicated method. Too
many indentation levels.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F2BC4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 09:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zATDk+av4HTY3prb+avP3tgmim41rtQazk1CyoqxtNk=; b=xgbnwkW1z7P+pr
	GP7LNY1oLoLBnylbBTeN6zKgwWyFIqAkYgASVU+VKMarcg3g6jjhjlUjVT2wHutBmZ9k4GTQnK4AW
	PqyCuXhqKEtFpLqTzLdKYMIxAr441mkhChyYCegF+fzrugO/AcseAuaXwrgrpo3jRSF9UUmn5fd8b
	/bkMDgZ6wedslblemu12XrbbhHl2aDofExI2Od9ny2DxwJD6FLEz/9KNk9aIgLszbPyJM2G0jpyaL
	mKhaI4I0sXLuA+6vLICesV4yz42jcKOEUugnzZcYNJMoDydru6ZUskxB8XUcSZhHQ3HD6sR/KgzfP
	OFN0LHtzVWIpQTVx3bgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE4l-002MNO-0i;
	Fri, 12 Jan 2024 09:43:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE4i-002MLa-1W
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 09:43:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-337874b8164so1231548f8f.2
        for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2024 01:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705052617; x=1705657417; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YBzRXt2Ez623oyr7wOzaIZMRhx6i9DthZ3CivOZ8D9M=;
        b=TsHPUryy5t3Unydlu0IXjpUvIuuDtqN/6ZZfe0rEOGTs3moBVdxCIU2pIL6pXhN+Hz
         7+hds8uMd6cEnD8JaDoBDpczjt7dpPEwtCrb4jPHcQvtNVA3b+TLLRhazOEojAbm0ueH
         hn8FvUje6Yze+aLAr0Wa+74E9n1KIL4v0m4aG/auvxcwmFTy2VNJzljXqC8gP1plH7BJ
         nkKnJedGfxZYyM1AQu46cpWU/049HrLXD8CBp9TbaeVlENmSm9ZXvv2pst2qEmkoSDzO
         B2ZsrYPNJ00scwvX8nJ0nK3ieGsAEQ2rfs9WkXvIjVliafE2Mca02ldhALGCyYD/Htcl
         B2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705052617; x=1705657417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YBzRXt2Ez623oyr7wOzaIZMRhx6i9DthZ3CivOZ8D9M=;
        b=c48xPrr6o2lDUAcqlwedMUMuSullAhryRY2k+b7EdygTmdkLfeezJidHLgRi9t5Hay
         ECxU0hK5RZ2c5Nqh7DgfhjFzJ70OIZKnmztmzOiOkpX2IMqZD8e1wA+UryGTfbQWLyc4
         sRM6pXVBvu4Ul/FVzelKBXu1yiZBAayQSc9tE36sanDi5FouuK6/ypgV5wx4mSN2fekx
         OvFb4lp60Oe3LdKdzy5SEN7am826W1EPmIbUmfuPSassvVgr8XZ/YG0pCrabFRWixhjj
         PbOWkUbr4Vvb5xyZWDYhMoQEeo3A2yM5DC3PcL5C/DhoepONhmfTm4W4BGwqYRHU+sFE
         ce6w==
X-Gm-Message-State: AOJu0YwrBAw1lYb7vMxVZiADOvw4gTc8MNVTQpLlXop1mzF6L/B63f9I
	0fCYlJT6qz3Ws6MHYuxQlns/TcwcU61bTg==
X-Google-Smtp-Source: AGHT+IGCEMAu2OnQOE8O8AkM73XVE84ZH6Igz2BN/S8edONtgssRnXJptTrdrm/fYt0sIiqIe0C2tg==
X-Received: by 2002:a05:6000:1145:b0:336:7051:8400 with SMTP id d5-20020a056000114500b0033670518400mr559146wrx.23.1705052616708;
        Fri, 12 Jan 2024 01:43:36 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id q15-20020adfea0f000000b00336e6014263sm3346719wrm.98.2024.01.12.01.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 01:43:36 -0800 (PST)
Message-ID: <e908c29a-1997-4c76-a3e4-556fec018de1@linaro.org>
Date: Fri, 12 Jan 2024 09:43:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform
 erase map
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014340_511611_8ADFA8E2 
X-CRM114-Status: GOOD (  30.55  )
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

> +		}
> +		mtd_region[i].erasesize = erase_size;
> +		mtd_region[i].numblocks = div64_ul(region[i].size, erase_size);
> +		mtd_region[i].offset = region[i].offset &
> +				       ~SNOR_ERASE_FLAGS_MASK;
> +	}
> +
> +	mtd->numeraseregions = n_regions;
> +	mtd->eraseregions = mtd_region;
> +
> +	return 0;
> +}
> +
> +static int spi_nor_set_mtd_info(struct spi_nor *nor)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  	struct device *dev = nor->dev;
> @@ -3439,6 +3483,11 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
>  	mtd->_resume = spi_nor_resume;
>  	mtd->_get_device = spi_nor_get_device;
>  	mtd->_put_device = spi_nor_put_device;
> +
> +	if (spi_nor_has_uniform_erase(nor))
> +		return 0;
> +
> +	return spi_nor_set_mtd_eraseregions(nor);
>  }
>  
>  static int spi_nor_hw_reset(struct spi_nor *nor)
> @@ -3531,7 +3580,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		return ret;
>  
>  	/* No mtd_info fields should be used up to this point. */
> -	spi_nor_set_mtd_info(nor);
> +	ret = spi_nor_set_mtd_info(nor);
> +	if (ret)
> +		return ret;
>  
>  	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>  			(long long)mtd->size >> 10);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

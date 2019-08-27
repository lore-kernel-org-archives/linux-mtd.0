Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37A0C3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 07:35:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A564922CF8
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 07:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BOnAFnVV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uDCe1MHZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A564922CF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Tg8+bblehxgYFBoMbDnlx8wM9GFvVlLWY9hD7VtAJsE=; b=BOnAFnVVY5dKuKjIKKrhdHHvBq
	wdRDK8T6wWgMIHaFqltlII9cGuUNpmgaFZJNUxK5nTQwwP46gNCTkyhQwyOgwJrdpS+eNyzjgNUxp
	8JJPe2nrOCunGHaO3I54qWLZyLa7V9onOOMXIXBq01N8L019NaZ05lX2UAQ8rYtaDCgopAMyM5mcu
	E+6faH7gZRfeKtyE1Hmt6fqbhnjIbeJk2xKqYiH2st9Bmr0TUNUWnKyARXPOQKtcEOMlNhSJzpO0n
	OujvjrxEgu8pXExUN80+W++jE5FHWOxzG/yKe4QniJMnL05Ji1P8qDPVmeofFHlVTZsrminFT86O7
	FiBImJaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2W0d-0002q1-Fg; Tue, 27 Aug 2019 07:35:19 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2W0a-0002pZ-1t
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 07:35:17 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R7ZAHa007452;
 Tue, 27 Aug 2019 02:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566891311;
 bh=hNVhNHj8qHC8UmvonFDQOIu7WE6IQ22VBVLwAPXCF0c=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=uDCe1MHZXlQy8p82J0dM21jwBV8H6bNt9n8hCJ8OSxCPONCHvogCn5RPtBNKMf5Th
 2KAQGd32S8nCg9fwCTQm1kQFOZ7+OREaa6IHY7JZY02+PBJ/aGfl+kH6xBtAUBVEhB
 ZnnCF0pY6VXliuD3jD0Pe0++rjO3qnS0aEsHsoC0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R7ZAeH098299
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 02:35:10 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 02:35:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 02:35:10 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R7Z6Nw071178;
 Tue, 27 Aug 2019 02:35:07 -0500
Subject: Re: [RESEND PATCH v3 17/20] mtd: spi-nor: Bring flash params init
 together
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-18-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <ac7d3f7d-b396-f011-a045-98f85819c968@ti.com>
Date: Tue, 27 Aug 2019 13:05:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826120821.16351-18-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_003516_177203_6786D716 
X-CRM114-Status: GOOD (  18.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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



On 26/08/19 5:39 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Bring all flash parameters default initialization in
> spi_nor_legacy_params_init().
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh


> v3: collect R-b
> 
>  drivers/mtd/spi-nor/spi-nor.c | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 2699e999d21a..dcda96a20f6c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4453,6 +4453,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>  	struct spi_nor_flash_parameter *params = &nor->params;
>  	struct spi_nor_erase_map *map = &params->erase_map;
>  	const struct flash_info *info = nor->info;
> +	struct device_node *np = spi_nor_get_flash_node(nor);
>  	u8 i, erase_mask;
>  
>  	/* Initialize legacy flash parameters and settings. */
> @@ -4464,18 +4465,25 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>  	params->size = (u64)info->sector_size * info->n_sectors;
>  	params->page_size = info->page_size;
>  
> +	if (!(info->flags & SPI_NOR_NO_FR)) {
> +		/* Default to Fast Read for DT and non-DT platform devices. */
> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
> +
> +		/* Mask out Fast Read if not requested at DT instantiation. */
> +		if (np && !of_property_read_bool(np, "m25p,fast-read"))
> +			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> +	}
> +
>  	/* (Fast) Read settings. */
>  	params->hwcaps.mask |= SNOR_HWCAPS_READ;
>  	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
>  				  0, 0, SPINOR_OP_READ,
>  				  SNOR_PROTO_1_1_1);
>  
> -	if (!(info->flags & SPI_NOR_NO_FR)) {
> -		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
> +	if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
>  		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
>  					  0, 8, SPINOR_OP_READ_FAST,
>  					  SNOR_PROTO_1_1_1);
> -	}
>  
>  	if (info->flags & SPI_NOR_DUAL_READ) {
>  		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
> @@ -4864,24 +4872,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	nor->page_size = params->page_size;
>  	mtd->writebufsize = nor->page_size;
>  
> -	if (np) {
> -		/* If we were instantiated by DT, use it */
> -		if (of_property_read_bool(np, "m25p,fast-read"))
> -			params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
> -		else
> -			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> -	} else {
> -		/* If we weren't instantiated by DT, default to fast-read */
> -		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
> -	}
> -
>  	if (of_property_read_bool(np, "broken-flash-reset"))
>  		nor->flags |= SNOR_F_BROKEN_RESET;
>  
> -	/* Some devices cannot do fast-read, no matter what DT tells us */
> -	if (info->flags & SPI_NOR_NO_FR)
> -		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> -
>  	/*
>  	 * Configure the SPI memory:
>  	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

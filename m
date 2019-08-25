Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB34C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 12:39:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FFC9206BA
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 12:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uzVndrWe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FFC9206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcKXPXBClvys4mSoM1syy/frSdnVYuu6Bmge7aZDVGE=; b=uzVndrWebvNELO
	Y4FSIzBtwvamXb3J1GU5HWFsT4phOETHbvP54idRuHJ+qsPG4cS39tFdV3HZf7K6+BQt0cinNUEP0
	aiM4aQHsPLnSOQA8jqbTFCvLTTWolf5OVfGi3JQ6qDiOQY4VQgnkXSvllzLdF991T9ZHBizWOSugR
	IlCs3mVauddpa5n4PWv/U4BoE6S+IL0ls0aR4sdulEnVxJIcgJzbguUnR/b+QH6mdPWfrogrEck6t
	Zr6lqkW1wbBkbPbPetKEoui81eaCkDc2sZdN2mGjtxfQ8j5EE7aOX+xUId/+cdMijxWQkV4o8Pylq
	wo6hVWt7NA9Bj2nsb8sA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1rnj-0003Ry-1H; Sun, 25 Aug 2019 12:39:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1rng-0003Rd-Li
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 12:39:18 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1E80B28A1AB;
 Sun, 25 Aug 2019 13:39:15 +0100 (BST)
Date: Sun, 25 Aug 2019 14:39:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: Bring flash params init together
Message-ID: <20190825143912.7fccd9bd@collabora.com>
In-Reply-To: <20190824121910.15267-2-tudor.ambarus@microchip.com>
References: <20190824121910.15267-1-tudor.ambarus@microchip.com>
 <20190824121910.15267-2-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_053916_973473_3975EF73 
X-CRM114-Status: GOOD (  16.79  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 24 Aug 2019 12:19:20 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Bring all flash parameters default initialization in
> spi_nor_legacy_params_init().
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index e76c23d1c54a..7e6da0ace2c7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4469,6 +4469,7 @@ static void spi_nor_legacy_init_params(struct spi_nor *nor)
>  	struct spi_nor_flash_parameter *params = &nor->params;
>  	struct spi_nor_erase_map *map = &params->erase_map;
>  	const struct flash_info *info = nor->info;
> +	struct device_node *np = spi_nor_get_flash_node(nor);
>  	u8 i, erase_mask;
>  
>  	/* Initialize legacy flash parameters and settings. */
> @@ -4480,18 +4481,25 @@ static void spi_nor_legacy_init_params(struct spi_nor *nor)
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
> @@ -4897,24 +4905,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

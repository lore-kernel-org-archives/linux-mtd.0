Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EB8C19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:46:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB11206A2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oAM2TFAr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EB11206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fm2GKJUNSjcYyfc2Hgsf2OJZCkghF4JxKZaMyVoB914=; b=oAM2TFArnopjyf
	Joqbwcb4+RxtRofP8gVIF1hq88DEMAw0sFgkmBJt72NFQnKbOqxnGBNCcnNsqq2durkqGiVOp31Wn
	aQQx+kLPobBLxoA0/uYguMjhXb1x7+Uo1FYScYjr17GXKkkSTFerrTNQqbNHr9NRTydwq9jjETWNZ
	IiyaIxkFy9py7PgokqS0lBrfz7iFlmQ2ScQ7OAXRLx7NrCiqTa2PzApeY57O4mCtb1vEoWxj7L7xo
	3/OZcH044sLOJnzu1jEJ0vH2yBEE0tSdTcgnpsFWgeUVxWrexvNju9kGr7vQ0BCoRaHH1BwDXK2ij
	xvH3Ll/UjyDw5aGrbD8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht4qw-0006eu-Sl; Thu, 01 Aug 2019 06:46:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht4qu-0006eY-3S
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 06:46:17 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ACDC42604D6;
 Thu,  1 Aug 2019 07:46:14 +0100 (BST)
Date: Thu, 1 Aug 2019 08:46:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: Bring flash params init together
Message-ID: <20190801084612.26633b65@collabora.com>
In-Reply-To: <20190731091835.27766-2-tudor.ambarus@microchip.com>
References: <20190731091835.27766-1-tudor.ambarus@microchip.com>
 <20190731091835.27766-2-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_234616_398392_9BD2D1CF 
X-CRM114-Status: GOOD (  16.94  )
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
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 31 Jul 2019 09:18:45 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Bring all flash parameters default initialization in
> spi_nor_default_params_init().
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 01be6d49ce3b..fba941a932cc 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4319,6 +4319,7 @@ static void spi_nor_default_init_params(struct spi_nor *nor,
>  {
>  	struct spi_nor_erase_map *map = &nor->erase_map;
>  	const struct flash_info *info = nor->info;
> +	struct device_node *np = spi_nor_get_flash_node(nor);
>  	u8 i, erase_mask;
>  
>  	/* Set legacy flash parameters as default. */
> @@ -4328,18 +4329,25 @@ static void spi_nor_default_init_params(struct spi_nor *nor,
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
> @@ -4876,24 +4884,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	nor->page_size = params.page_size;
>  	mtd->writebufsize = nor->page_size;
>  
> -	if (np) {
> -		/* If we were instantiated by DT, use it */
> -		if (of_property_read_bool(np, "m25p,fast-read"))
> -			params.hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
> -		else
> -			params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> -	} else {
> -		/* If we weren't instantiated by DT, default to fast-read */
> -		params.hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
> -	}
> -
>  	if (of_property_read_bool(np, "broken-flash-reset"))
>  		nor->flags |= SNOR_F_BROKEN_RESET;
>  
> -	/* Some devices cannot do fast-read, no matter what DT tells us */
> -	if (info->flags & SPI_NOR_NO_FR)
> -		params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> -
>  	if (nor->locking_ops) {
>  		mtd->_lock = spi_nor_lock;
>  		mtd->_unlock = spi_nor_unlock;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

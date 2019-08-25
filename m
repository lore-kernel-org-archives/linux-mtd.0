Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FD3C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 11:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 151482173E
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 11:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J6dTuv8/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 151482173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLJjOMbSMjQCwh1KdTd8T+3EAiUgyL/4pdZXBvqCOmo=; b=J6dTuv8/bmzJGj
	GYkOLljJfhfhT9zBcVZgpTosWkiO5utO+Yqdtl5EfjWKLKC7y2K6Ux9SzX1FHxzSJbOlVUA4Ik6ca
	xueqnTpJQyp7gQsvkRvtI2aEMObRsy2DLQ2sAdX8xs1y/6bQVemxN2nugkedfe92Re1gsFtEOWYQN
	CS3uUcwemmxH+LBhRR+k7EtmWognwe4KQ1k4bCCPQ98dOAWXLbni6WNSS4agPkdux/dimXjQXMGIR
	LuR0m3Fz6ti8XGQCz1dNQNfVrWkW43P4wsv86AA8tPjRrqpBtp782oGOlSKOGTO0mxt0+x0NqwCp+
	hPglC1LEV4D92tWm6GyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1qzI-0002sj-Ck; Sun, 25 Aug 2019 11:47:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1qzE-0002sO-RE
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 11:47:10 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 69EE82787E3;
 Sun, 25 Aug 2019 12:47:07 +0100 (BST)
Date: Sun, 25 Aug 2019 13:47:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 3/7] mtd: spi_nor: Move manufacturer quad_enable() in
 ->default_init()
Message-ID: <20190825134704.677c83d6@collabora.com>
In-Reply-To: <20190824120027.14452-4-tudor.ambarus@microchip.com>
References: <20190824120027.14452-1-tudor.ambarus@microchip.com>
 <20190824120027.14452-4-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_044709_144182_39CAAA91 
X-CRM114-Status: GOOD (  20.27  )
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

On Sat, 24 Aug 2019 12:00:41 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> The goal is to move the quad_enable manufacturer specific init in the
> nor->manufacturer->fixups->default_init()
> 
> The legacy quad_enable() implementation is spansion_quad_enable(),
> select this method by default.
> 
> Set specific manufacturer fixups->default_init() hooks to overwrite
> the default quad_enable() implementation when needed.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 48 ++++++++++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 27951e5a01e2..c9514dfd7d6d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4150,13 +4150,38 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  	return err;
>  }
>  
> +static void macronix_set_default_init(struct spi_nor *nor)
> +{
> +	nor->params.quad_enable = macronix_quad_enable;

Since it's now supposed to be the default QE implementation I'd
recommend renaming the function into default_quad_enable() (this can be
done in a separate patch).

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +}
> +
> +static void st_micron_set_default_init(struct spi_nor *nor)
> +{
> +	nor->params.quad_enable = NULL;
> +}
> +
>  /**
>   * spi_nor_manufacturer_init_params() - Initialize the flash's parameters and
> - * settings based on ->default_init() hook.
> + * settings based on MFR register and ->default_init() hook.
>   * @nor:	pointer to a 'struct spi-nor'.
>   */
>  static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
>  {
> +	/* Init flash parameters based on MFR */
> +	switch (JEDEC_MFR(nor->info)) {
> +	case SNOR_MFR_MACRONIX:
> +		macronix_set_default_init(nor);
> +		break;
> +
> +	case SNOR_MFR_ST:
> +	case SNOR_MFR_MICRON:
> +		st_micron_set_default_init(nor);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
>  	if (nor->info->fixups && nor->info->fixups->default_init)
>  		nor->info->fixups->default_init(nor);
>  }
> @@ -4168,6 +4193,9 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  	const struct flash_info *info = nor->info;
>  	u8 i, erase_mask;
>  
> +	/* Initialize legacy flash parameters and settings. */
> +	params->quad_enable = spansion_quad_enable;
> +
>  	/* Set SPI NOR sizes. */
>  	params->size = (u64)info->sector_size * info->n_sectors;
>  	params->page_size = info->page_size;
> @@ -4233,24 +4261,6 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  			       SPINOR_OP_SE);
>  	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
>  
> -	/* Select the procedure to set the Quad Enable bit. */
> -	if (params->hwcaps.mask & (SNOR_HWCAPS_READ_QUAD |
> -				   SNOR_HWCAPS_PP_QUAD)) {
> -		switch (JEDEC_MFR(info)) {
> -		case SNOR_MFR_MACRONIX:
> -			params->quad_enable = macronix_quad_enable;
> -			break;
> -
> -		case SNOR_MFR_ST:
> -		case SNOR_MFR_MICRON:
> -			break;
> -
> -		default:
> -			/* Kept only for backward compatibility purpose. */
> -			params->quad_enable = spansion_quad_enable;
> -			break;
> -		}
> -	}
>  
>  	spi_nor_manufacturer_init_params(nor);
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

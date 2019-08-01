Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3392C19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:32:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56A922089E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:32:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FLXxZ4mo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56A922089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVodEDc7cMvD73SaCcvhsl6KAyeWCNbCZay+rwTd3pA=; b=FLXxZ4moQ6ophB
	8fuR3CNBsYA+JoDzoXdeLqBC7l08eFSzsw6XHImvwQbOeJ/pmG6Fx61+dphWAPlDfowiOyIqKNTaN
	Nqx2wSIsi0aVID/4IfZxjsFDwRwzEZ3cjHYvlPx1uPFWxUtyUPPTO99urNipz79Hf9GVUqcZkEsTD
	piPOBi/x9PUTVjC9QedUEEc1zgAynD69NrIR+Q4SwAkqrWCT+KCyelktLrnaGjGwQ+lZQdUXEt79N
	IdPpCBiUs1D09O7MyUZWl76dedN0kgSiMQh4WO5/OF2Z6gfzdH12luSxu17tsuFZQ59uZe5Wh6REb
	3BnFgH5Osruhax3CUrUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht4d3-0008TL-S5; Thu, 01 Aug 2019 06:31:57 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht4d0-0008Sw-Ow
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 06:31:56 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5FCA728AC4D;
 Thu,  1 Aug 2019 07:31:53 +0100 (BST)
Date: Thu, 1 Aug 2019 08:31:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 4/7] mtd: spi-nor: Split spi_nor_init_params()
Message-ID: <20190801083151.5c96741d@collabora.com>
In-Reply-To: <20190731090315.26798-5-tudor.ambarus@microchip.com>
References: <20190731090315.26798-1-tudor.ambarus@microchip.com>
 <20190731090315.26798-5-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_233155_067930_D77443C3 
X-CRM114-Status: GOOD (  17.51  )
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

On Wed, 31 Jul 2019 09:03:33 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Add functions to delimit what the chunks of code do:
> 
> static void spi_nor_init_params()
> {
> 	spi_nor_default_init_params()
> 	spi_nor_manufacturer_init_params()
> 	spi_nor_sfdp_init_params()
> }
> 
> spi_nor_init_params() becomes of type void, as all its children
> return void.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 58 ++++++++++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index a906c36260c8..b2e72668e7ab 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4312,6 +4312,25 @@ static void spi_nor_mfr_init_params(struct spi_nor *nor,
>  	}
>  }
>  
> +static void spi_nor_sfdp_init_params(struct spi_nor *nor,
> +				     struct spi_nor_flash_parameter *params)
> +{
> +	struct spi_nor_flash_parameter sfdp_params;
> +	struct spi_nor_erase_map prev_map;
> +
> +	memcpy(&sfdp_params, params, sizeof(sfdp_params));
> +	memcpy(&prev_map, &nor->erase_map, sizeof(prev_map));
> +
> +	if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
> +		nor->addr_width = 0;
> +		nor->flags &= ~SNOR_F_4B_OPCODES;
> +		/* restore previous erase map */
> +		memcpy(&nor->erase_map, &prev_map, sizeof(nor->erase_map));
> +	} else {
> +		memcpy(params, &sfdp_params, sizeof(*params));
> +	}
> +}
> +
>  static void
>  spi_nor_manufacturer_init_params(struct spi_nor *nor,
>  				 struct spi_nor_flash_parameter *params)
> @@ -4323,8 +4342,8 @@ spi_nor_manufacturer_init_params(struct spi_nor *nor,
>  		return nor->info->fixups->default_init(nor, params);
>  }
>  
> -static int spi_nor_init_params(struct spi_nor *nor,
> -			       struct spi_nor_flash_parameter *params)
> +static void spi_nor_default_init_params(struct spi_nor *nor,
> +					struct spi_nor_flash_parameter *params)
>  {
>  	struct spi_nor_erase_map *map = &nor->erase_map;
>  	const struct flash_info *info = nor->info;
> @@ -4397,29 +4416,18 @@ static int spi_nor_init_params(struct spi_nor *nor,
>  	spi_nor_set_erase_type(&map->erase_type[i], info->sector_size,
>  			       SPINOR_OP_SE);
>  	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
> +}
>  
> -	spi_nor_manufacturer_init_params(nor, params);
> -
> -	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
> -	    !(info->flags & SPI_NOR_SKIP_SFDP)) {
> -		struct spi_nor_flash_parameter sfdp_params;
> -		struct spi_nor_erase_map prev_map;
> -
> -		memcpy(&sfdp_params, params, sizeof(sfdp_params));
> -		memcpy(&prev_map, &nor->erase_map, sizeof(prev_map));
> +static void spi_nor_init_params(struct spi_nor *nor,
> +				struct spi_nor_flash_parameter *params)
> +{
> +	spi_nor_default_init_params(nor, params);
>  
> -		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
> -			nor->addr_width = 0;
> -			nor->flags &= ~SNOR_F_4B_OPCODES;
> -			/* restore previous erase map */
> -			memcpy(&nor->erase_map, &prev_map,
> -			       sizeof(nor->erase_map));
> -		} else {
> -			memcpy(params, &sfdp_params, sizeof(*params));
> -		}
> -	}
> +	spi_nor_manufacturer_init_params(nor, params);
>  
> -	return 0;
> +	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
> +	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
> +		spi_nor_sfdp_init_params(nor, params);
>  }
>  
>  static int spi_nor_select_read(struct spi_nor *nor,
> @@ -4794,10 +4802,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	/* Kept only for backward compatibility purpose. */
>  	nor->quad_enable = spansion_quad_enable;
>  
> -	/* Parse the Serial Flash Discoverable Parameters table. */
> -	ret = spi_nor_init_params(nor, &params);
> -	if (ret)
> -		return ret;
> +	/* Init flash parameters based on flash_info struct and SFDP */
> +	spi_nor_init_params(nor, &params);
>  
>  	if (!mtd->name)
>  		mtd->name = dev_name(dev);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

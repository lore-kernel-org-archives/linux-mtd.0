Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEC2C19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:49:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 083FE206A2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:49:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c0RdqU/F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 083FE206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdfCIa3kpm4IxJ5rNTsnOOykQeyHN6SdEdh3CzQfXN4=; b=c0RdqU/FVat1vf
	cjyYwSCZ4pm/yn6fMdfPOCIulDQQNkvEODoNJCyl7jeQqutnKIDbCwBJzoBO3ldnMYudvUMgQVHum
	bIJh6WDurQkVyTvQTRSP6nqHv++ME8ANC1FRIGlVwbaY+U9DnGwkuKPgxLUvhA4H3q0fAAKCsBTIJ
	Wm5vhIb+Lr4smVWpPgutb0Y2a1RvvHfY2mCeVmWP92Ld2GwFXUJV9xRXAzrV+pgAJaQGCOr/PGBSu
	Vzl5lsle4MrIQam1gngsjrTysbCRZs5Y//h6X5jFbFB5kIgxmif+3sigSmnm2BmgMT/5laMiZH0fA
	dbyBi5R+pUdWoVlFxyRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht4th-0007Cq-Rx; Thu, 01 Aug 2019 06:49:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht4te-0007CS-Gx
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 06:49:08 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 28AF92604D6;
 Thu,  1 Aug 2019 07:49:05 +0100 (BST)
Date: Thu, 1 Aug 2019 08:49:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: Introduce spi_nor_get_flash_info()
Message-ID: <20190801084902.0cddd236@collabora.com>
In-Reply-To: <20190731091835.27766-4-tudor.ambarus@microchip.com>
References: <20190731091835.27766-1-tudor.ambarus@microchip.com>
 <20190731091835.27766-4-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_234906_824486_7452B300 
X-CRM114-Status: GOOD (  18.98  )
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

On Wed, 31 Jul 2019 09:18:49 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Dedicate a function for getting the pointer to the flash_info
> const struct. Trim a bit the spi_nor_scan() huge function.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 52 ++++++++++++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index c322d7cd8216..636f065cc869 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4800,25 +4800,10 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>  	return 0;
>  }
>  
> -int spi_nor_scan(struct spi_nor *nor, const char *name,
> -		 const struct spi_nor_hwcaps *hwcaps)
> +static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
> +						       const char *name)
>  {
> -	struct spi_nor_flash_parameter params;
>  	const struct flash_info *info = NULL;
> -	struct device *dev = nor->dev;
> -	struct mtd_info *mtd = &nor->mtd;
> -	struct device_node *np = spi_nor_get_flash_node(nor);
> -	int ret;
> -	int i;
> -
> -	ret = spi_nor_check(nor);
> -	if (ret)
> -		return ret;
> -
> -	/* Reset SPI protocol for all commands. */
> -	nor->reg_proto = SNOR_PROTO_1_1_1;
> -	nor->read_proto = SNOR_PROTO_1_1_1;
> -	nor->write_proto = SNOR_PROTO_1_1_1;
>  
>  	if (name)
>  		info = spi_nor_match_id(name);
> @@ -4826,7 +4811,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (!info)
>  		info = spi_nor_read_id(nor);
>  	if (IS_ERR_OR_NULL(info))
> -		return -ENOENT;
> +		return ERR_PTR(-ENOENT);
>  
>  	/*
>  	 * If caller has specified name of flash model that can normally be
> @@ -4837,7 +4822,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  
>  		jinfo = spi_nor_read_id(nor);
>  		if (IS_ERR(jinfo)) {
> -			return PTR_ERR(jinfo);
> +			return jinfo;
>  		} else if (jinfo != info) {
>  			/*
>  			 * JEDEC knows better, so overwrite platform ID. We
> @@ -4846,12 +4831,39 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  			 * marked read-only, and we don't want to lose that
>  			 * information, even if it's not 100% accurate.
>  			 */
> -			dev_warn(dev, "found %s, expected %s\n",
> +			dev_warn(nor->dev, "found %s, expected %s\n",
>  				 jinfo->name, info->name);
>  			info = jinfo;
>  		}
>  	}
>  
> +	return info;
> +}
> +
> +int spi_nor_scan(struct spi_nor *nor, const char *name,
> +		 const struct spi_nor_hwcaps *hwcaps)
> +{
> +	struct spi_nor_flash_parameter params;
> +	const struct flash_info *info;
> +	struct device *dev = nor->dev;
> +	struct mtd_info *mtd = &nor->mtd;
> +	struct device_node *np = spi_nor_get_flash_node(nor);
> +	int ret;
> +	int i;
> +
> +	ret = spi_nor_check(nor);
> +	if (ret)
> +		return ret;
> +
> +	/* Reset SPI protocol for all commands. */
> +	nor->reg_proto = SNOR_PROTO_1_1_1;
> +	nor->read_proto = SNOR_PROTO_1_1_1;
> +	nor->write_proto = SNOR_PROTO_1_1_1;
> +
> +	info = spi_nor_get_flash_info(nor, name);
> +	if (IS_ERR(info))
> +		return PTR_ERR(info);
> +
>  	nor->info = info;
>  
>  	mutex_init(&nor->lock);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

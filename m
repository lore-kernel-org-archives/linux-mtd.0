Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB20C433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:48:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68E7C206A2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d8D7SUl1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68E7C206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfElp6dZEq20aentQcLCQOm9L95tZC37pLMlfRQUdNk=; b=d8D7SUl1JxTg61
	lgtLcT2vT/1Bsmw8U2ZV6Ou+2bKFQE6e3kkayIPm5AL3/tCYeQW//yIcJk4twyOjMeAoPwOE9Kdu6
	BEQUHGAphbu9d3EB7NYRsdoZ0SFeWPrIIJHCIWvCUwJS2jeOvjFysLlL/jQLh0MhDSfRfkLwVLdn7
	HkIoqxaG38zMMx1DpUWuA1TudBliLuWKNpm7PBgV9xKe3HPFn9MvuhJ0uD9KSF/+iBb+aYTbuofvV
	2Dc9+DqhvoukkOlC9R1yTcQpoZieu/8vSZk15J166+UX5e8iJEYZqZHtjbnCHnQHjjV/U0xtjEkOQ
	YtvscSw07ZDP6E+fvGWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht4sT-0006ux-N8; Thu, 01 Aug 2019 06:47:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht4sQ-0006uc-Vj
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 06:47:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 71A762604D6;
 Thu,  1 Aug 2019 07:47:49 +0100 (BST)
Date: Thu, 1 Aug 2019 08:47:46 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 2/3] mtd: spi_nor: Introduce spi_nor_set_addr_width()
Message-ID: <20190801084746.638eae0b@collabora.com>
In-Reply-To: <20190731091835.27766-3-tudor.ambarus@microchip.com>
References: <20190731091835.27766-1-tudor.ambarus@microchip.com>
 <20190731091835.27766-3-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_234751_156174_52EA5EF7 
X-CRM114-Status: GOOD (  17.47  )
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

On Wed, 31 Jul 2019 09:18:47 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Parsing of flash parameters were interleaved with setting of the
> nor addr width. Dedicate a function for setting nor addr width.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 50 ++++++++++++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index fba941a932cc..c322d7cd8216 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4773,6 +4773,33 @@ static const struct flash_info *spi_nor_match_id(const char *name)
>  	return NULL;
>  }
>  
> +static int spi_nor_set_addr_width(struct spi_nor *nor)
> +{
> +	if (nor->addr_width) {
> +		/* already configured from SFDP */
> +	} else if (nor->info->addr_width) {
> +		nor->addr_width = nor->info->addr_width;
> +	} else if (nor->mtd.size > 0x1000000) {
> +		/* enable 4-byte addressing if the device exceeds 16MiB */
> +		nor->addr_width = 4;
> +	} else {
> +		nor->addr_width = 3;
> +	}
> +
> +	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
> +		dev_err(nor->dev, "address width is too large: %u\n",
> +			nor->addr_width);
> +		return -EINVAL;
> +	}
> +
> +	/* Set 4byte opcodes when possible. */
> +	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
> +	    !(nor->flags & SNOR_F_HAS_4BAIT))
> +		spi_nor_set_4byte_opcodes(nor);
> +
> +	return 0;
> +}
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps)
>  {
> @@ -4903,29 +4930,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (ret)
>  		return ret;
>  
> -	if (nor->addr_width) {
> -		/* already configured from SFDP */
> -	} else if (info->addr_width) {
> -		nor->addr_width = info->addr_width;
> -	} else if (mtd->size > 0x1000000) {
> -		/* enable 4-byte addressing if the device exceeds 16MiB */
> -		nor->addr_width = 4;
> -	} else {
> -		nor->addr_width = 3;
> -	}
> -
>  	if (info->flags & SPI_NOR_4B_OPCODES)
>  		nor->flags |= SNOR_F_4B_OPCODES;
>  
> -	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
> -	    !(nor->flags & SNOR_F_HAS_4BAIT))
> -		spi_nor_set_4byte_opcodes(nor);
> -
> -	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
> -		dev_err(dev, "address width is too large: %u\n",
> -			nor->addr_width);
> -		return -EINVAL;
> -	}
> +	ret = spi_nor_set_addr_width(nor);
> +	if (ret)
> +		return ret;
>  
>  	/* Send all the required SPI flash commands to initialize device */
>  	ret = spi_nor_init(nor);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

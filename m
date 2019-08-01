Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F6BC433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:42:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43119214DA
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WZD9H+uk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43119214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJfMVJyTeGC0+DJu65+Oavq3OeQfICoAX+EJz8XBM6w=; b=WZD9H+ukHMAEHf
	pDb0hNaDsy+JCU9EWkgnOKyH+mhOXcrWQb/eCKyf7wBIv0nnZr0iqxRmCKlKWb9vWLr01n7ZBSNg+
	AAs4MNZW4uHj9FxluFWq3fJkGMpMETZy+Nvj1pH1dfa4YliSipdKoqtdxrjOqLcq9YNW//+9RwUro
	uY9xG2mCtE20gR/w8+GkGWkN4ruP3F8TNj7Pg1ZAGW2Aryz9raPthNREFRDSEB2udfiQ+2P965jPO
	ZsfW8KilJ4XY4XDjsSBALWPEAdY8UJW/17WvokwmULaSJg5BmGgWqBGCeUJhdEF3KEoMhVbTGFmpP
	IjPkc20GdxLHAkS1ytqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht4nP-0004Zl-Ap; Thu, 01 Aug 2019 06:42:39 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht4nH-0004E5-HG
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 06:42:33 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9160528BFE1;
 Thu,  1 Aug 2019 07:42:29 +0100 (BST)
Date: Thu, 1 Aug 2019 08:42:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 5/6] mtd: spi-nor: Add s3an_post_sfdp_fixups()
Message-ID: <20190801084226.27572bb6@collabora.com>
In-Reply-To: <20190731091145.27374-6-tudor.ambarus@microchip.com>
References: <20190731091145.27374-1-tudor.ambarus@microchip.com>
 <20190731091145.27374-6-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_234231_869220_2995560A 
X-CRM114-Status: GOOD (  18.73  )
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

On Wed, 31 Jul 2019 09:12:16 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> s3an_nor_scan() was overriding the opcode selection done in
> spi_nor_default_setup(). Set nor->setup() method in order to
> avoid unnecessary call to spi_nor_default_setup().
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 0ff474e5e4f5..5fea5d7ce2cb 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2795,7 +2795,9 @@ static int spi_nor_check(struct spi_nor *nor)
>  	return 0;
>  }
>  
> -static int s3an_nor_scan(struct spi_nor *nor)
> +static int s3an_nor_setup(struct spi_nor *nor,
> +			  const struct spi_nor_flash_parameter *params,
> +			  const struct spi_nor_hwcaps *hwcaps)
>  {
>  	int ret;
>  	u8 val;
> @@ -4393,6 +4395,11 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
>  	nor->mtd.erasesize = nor->info->sector_size;
>  }
>  
> +static void s3an_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	nor->setup = s3an_nor_setup;
> +}
> +
>  static void
>  spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
>  				      struct spi_nor_flash_parameter *params)
> @@ -4405,6 +4412,9 @@ spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
>  	default:
>  		break;
>  	}
> +
> +	if (nor->info->flags & SPI_S3AN)
> +		s3an_post_sfdp_fixups(nor);
>  }
>  
>  static void spi_nor_post_sfdp_fixups(struct spi_nor *nor,
> @@ -4582,9 +4592,9 @@ static int spi_nor_select_erase(struct spi_nor *nor, u32 wanted_size)
>  	return 0;
>  }
>  
> -static int spi_nor_setup(struct spi_nor *nor,
> -			 const struct spi_nor_flash_parameter *params,
> -			 const struct spi_nor_hwcaps *hwcaps)
> +static int spi_nor_default_setup(struct spi_nor *nor,
> +				 const struct spi_nor_flash_parameter *params,
> +				 const struct spi_nor_hwcaps *hwcaps)
>  {
>  	u32 ignored_mask, shared_mask;
>  	int err;
> @@ -4641,6 +4651,16 @@ static int spi_nor_setup(struct spi_nor *nor,
>  	return err;
>  }
>  
> +static int spi_nor_setup(struct spi_nor *nor,
> +			 const struct spi_nor_flash_parameter *params,
> +			 const struct spi_nor_hwcaps *hwcaps)
> +{
> +	if (!nor->setup)
> +		return 0;
> +
> +	return nor->setup(nor, params, hwcaps);
> +}
> +
>  static int spi_nor_disable_write_protection(struct spi_nor *nor)
>  {
>  	if (!nor->disable_write_protection)
> @@ -4804,6 +4824,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	/* Kept only for backward compatibility purpose. */
>  	nor->quad_enable = spansion_quad_enable;
>  	nor->set_4byte = spansion_set_4byte;
> +	nor->setup = spi_nor_default_setup;
>  
>  	/* Default locking operations. */
>  	if (info->flags & SPI_NOR_HAS_LOCK) {
> @@ -4905,12 +4926,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		return -EINVAL;
>  	}
>  
> -	if (info->flags & SPI_S3AN) {
> -		ret = s3an_nor_scan(nor);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	/* Send all the required SPI flash commands to initialize device */
>  	ret = spi_nor_init(nor);
>  	if (ret)

Almost all of this (except the s3an specific bits) should be done in
the previous patch. So I'll put a condition on the R-b I placed on patch
4: some of this code should be moved there.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

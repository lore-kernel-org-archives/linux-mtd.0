Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3303AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 18:53:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E77B5633A6
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 18:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E77B5633A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3Rf/6XzQ8kkppkoOscQgNwNy5TjOHV3O72AQEeKk/Q=; b=lHi8mc9cmTEPwC
	U4+TgsoOQfYVJLOLPhJb3q03GTTSlgzJjmJBODOh2zmYdLmxZ1N4lsrxrb5h31bTafuOtoST15JkJ
	b+6t+oTGJDACOk1sZQf24D0f+mtPpHcbXm+omBSyLgqks9kUNMVdafFmF8dxBbGGahph2c9KY6jQS
	8ovTtrq+kxRQGZdii+WbhSN5WUhjssMqhqZUkYeIg4vGm9t0xDLAtcS5IrQpoBPwGHehXBTSf3/TR
	K0QS3i7i7bQ9DLUD5t/9zNkugIMRhMh2Bf5/xFJdW/8MNzdG6ZM0ujef+onYkUgSQWLmTopKc39/r
	Ypsx27qhwkGVfJk6FhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmh6J-00GmML-7j; Mon, 15 Nov 2021 18:53:07 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmh6E-00GmLH-IG; Mon, 15 Nov 2021 18:53:05 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AFIqV7E018480;
 Mon, 15 Nov 2021 12:52:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1637002351;
 bh=jw6S1PHOM9m3uq0yvBhM870Mp1bzfDDWiQD/IYlh9Ws=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=gP1HTcJISdv2eh/eUFfLg1k0lGuRhSx9lg66Qn2NPCHCV7b4VFy/qUULj01a+NuDg
 IR1jM7rNtikczOZdsdi+sBZeyhklNGzndHsC41XGya7enC99ihUSkrIQsFsGi7+Xdq
 4gMU3+FFZgbnBAkAiPB5dPBpa+0BwQc+RRW8kMis=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AFIqVAe079612
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Nov 2021 12:52:31 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 15
 Nov 2021 12:52:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 15 Nov 2021 12:52:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AFIqUNp058719;
 Mon, 15 Nov 2021 12:52:30 -0600
Date: Tue, 16 Nov 2021 00:22:29 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 03/25] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Message-ID: <20211115185227.4b4gjnf5zi5bdw56@ti.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-4-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211029172633.886453-4-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_105302_778392_2BB5BEC0 
X-CRM114-Status: GOOD (  25.46  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29/10/21 08:26PM, Tudor Ambarus wrote:
> Used to init all the mtd_info fields. Move the mtd_info init
> the last thing in the spi_nor_scan(), so that we avoid superfluous
> initialization of the mtd_info fields in case of errors.
> 
> While here use common naming scheme for functions that are setting
> mtd_info fields:
> s/spi_nor_register_locking_ops/spi_nor_set_mtd_locking_ops
> s/spi_nor_otp_init/spi_nor_set_mtd_otp_ops
> The functions names are self explanatory, get rid of the comment
> for the OTP function.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 54 +++++++++++++++++++++-----------------
>  drivers/mtd/spi-nor/core.h |  4 +--
>  drivers/mtd/spi-nor/otp.c  |  2 +-
>  drivers/mtd/spi-nor/swp.c  |  2 +-
>  4 files changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 277d1fde84c8..ae971c773334 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3071,6 +3071,35 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>  	return info;
>  }
>  
> +static void spi_nor_set_mtd_info(struct spi_nor *nor)
> +{
> +	struct mtd_info *mtd = &nor->mtd;
> +	struct device *dev = nor->dev;
> +
> +	spi_nor_set_mtd_locking_ops(nor);
> +	spi_nor_set_mtd_otp_ops(nor);
> +
> +	mtd->dev.parent = dev;
> +	if (!mtd->name)
> +		mtd->name = dev_name(dev);
> +	mtd->type = MTD_NORFLASH;
> +	mtd->flags = MTD_CAP_NORFLASH;
> +	if (nor->info->flags & SPI_NOR_NO_ERASE)
> +		mtd->flags |= MTD_NO_ERASE;
> +	mtd->writesize = nor->params->writesize;
> +	mtd->writebufsize = nor->page_size;
> +	mtd->size = nor->params->size;
> +	mtd->_erase = spi_nor_erase;
> +	mtd->_read = spi_nor_read;
> +	/* Might be already set by some SST flashes. */
> +	if (!mtd->_write)
> +		mtd->_write = spi_nor_write;
> +	mtd->_suspend = spi_nor_suspend;
> +	mtd->_resume = spi_nor_resume;
> +	mtd->_get_device = spi_nor_get_device;
> +	mtd->_put_device = spi_nor_put_device;

You should also merge in spi_nor_debugfs_init() in here which 
initializes mtd->dbg.

> +}
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps)
>  {
> @@ -3125,26 +3154,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (info->flags & SPI_NOR_HAS_LOCK)
>  		nor->flags |= SNOR_F_HAS_LOCK;
>  
> -	mtd->_write = spi_nor_write;
> -
>  	/* Init flash parameters based on flash_info struct and SFDP */
>  	ret = spi_nor_init_params(nor);
>  	if (ret)
>  		return ret;
>  
> -	if (!mtd->name)
> -		mtd->name = dev_name(dev);
> -	mtd->type = MTD_NORFLASH;
> -	mtd->writesize = nor->params->writesize;
> -	mtd->flags = MTD_CAP_NORFLASH;
> -	mtd->size = nor->params->size;
> -	mtd->_erase = spi_nor_erase;
> -	mtd->_read = spi_nor_read;
> -	mtd->_suspend = spi_nor_suspend;
> -	mtd->_resume = spi_nor_resume;
> -	mtd->_get_device = spi_nor_get_device;
> -	mtd->_put_device = spi_nor_put_device;
> -
>  	if (info->flags & USE_FSR)
>  		nor->flags |= SNOR_F_USE_FSR;
>  	if (info->flags & SPI_NOR_HAS_TB) {
> @@ -3166,12 +3180,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
>  	}
>  
> -	if (info->flags & SPI_NOR_NO_ERASE)
> -		mtd->flags |= MTD_NO_ERASE;
> -
> -	mtd->dev.parent = dev;
>  	nor->page_size = nor->params->page_size;
> -	mtd->writebufsize = nor->page_size;
>  
>  	if (of_property_read_bool(np, "broken-flash-reset"))
>  		nor->flags |= SNOR_F_BROKEN_RESET;
> @@ -3196,15 +3205,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (ret)
>  		return ret;
>  
> -	spi_nor_register_locking_ops(nor);
> -
>  	/* Send all the required SPI flash commands to initialize device */
>  	ret = spi_nor_init(nor);
>  	if (ret)
>  		return ret;
>  
> -	/* Configure OTP parameters and ops */
> -	spi_nor_otp_init(nor);
> +	spi_nor_set_mtd_info(nor);

This will break multiple things.

- spi_nor_set_addr_width(), which is called by spi_nor-setup(). It 
  checks for nor->mtd.size which has not been set yet.
- spi_nor_spimem_check_op(), which is called (indirectly) by 
  spi_nor_default_setup(). It check for nor->mtd.size.
- spi_nor_try_unlock_all(), which is called by spi_nor_init(). I don't 
  think it actually uses any values you initialize here but still worth 
  pointing out.

>  
>  	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>  			(long long)mtd->size >> 10);
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 223a03769950..48f26d3f1b3c 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -548,8 +548,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>  
>  void spi_nor_init_default_locking_ops(struct spi_nor *nor);
>  void spi_nor_try_unlock_all(struct spi_nor *nor);
> -void spi_nor_register_locking_ops(struct spi_nor *nor);
> -void spi_nor_otp_init(struct spi_nor *nor);
> +void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
> +void spi_nor_set_mtd_otp_ops(struct spi_nor *nor);
>  
>  static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
>  {
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 983e40b19134..fa63d8571218 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -480,7 +480,7 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
>  	return ret;
>  }
>  
> -void spi_nor_otp_init(struct spi_nor *nor)
> +void spi_nor_set_mtd_otp_ops(struct spi_nor *nor)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 8594bcbb7dbe..1f178313ba8f 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -414,7 +414,7 @@ void spi_nor_try_unlock_all(struct spi_nor *nor)
>  		dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
>  }
>  
> -void spi_nor_register_locking_ops(struct spi_nor *nor)
> +void spi_nor_set_mtd_locking_ops(struct spi_nor *nor)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

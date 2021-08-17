Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD5CC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:25:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4689604D7
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4689604D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cinS74UkNNlLCj5WngeHuFgnH3bcBmpWZDJCbchkKQI=; b=NepWNJVP9E+cZc
	HkZiAAX8fEctT4UMYSoFa1wFTTZp1msjeAk4IWZjwKqtfOt0J2SGJkU3J96Hv64uCt2sBjBxrCDYy
	L9+XHvLPzfQ7DfJrIki+F91bxvvLaR8sGoXPhzxFgR6nwJ8lGZtgGpy2ezJPzQaMKAjtTPYXkr69B
	PwxkHcG2DJW1n+rfsmCDcaO7NoKHK8dsVaXsN4I8PDru91wIV6rc3LSfdp8MXWCr6NVUyC3bO8Meo
	jUKb5frh9sIUi+cpszsPnmi79S+lDgMi5orrrfLWsy3Sw7dnlu3CtlVpaYwyTgwPr7tTm+c8oSkLo
	I1CtWqKZ5q49fdcYUhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG1t4-002wnp-Kx; Tue, 17 Aug 2021 16:24:26 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG1sz-002wnE-9D; Tue, 17 Aug 2021 16:24:25 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17HGNoM2073556;
 Tue, 17 Aug 2021 11:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629217430;
 bh=cN5iFeVFpicQKjG7RjUFM+zl6SbIQDdHi15T2ZRoOF0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=vlQWF1ZGlEgr4UCKGnxdFW1CWItk1jCQkSE7F73Q1XbYBCEjn16s+mfnb5ZEso412
 CaNFbGrYv2ecA44JPHTr4c26q39PLDHpCvK03KS+SHyvSncwJi08CbvLVVl0IWUqo6
 nQLx373pJUxOm7Ty+HwyN0mi6BybsCPLcuY3q2Io=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17HGNol0022506
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Aug 2021 11:23:50 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 17
 Aug 2021 11:23:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 17 Aug 2021 11:23:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17HGNn2o007737;
 Tue, 17 Aug 2021 11:23:49 -0500
Date: Tue, 17 Aug 2021 21:53:48 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 21/35] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Message-ID: <20210817162346.bsxdbf7we5sg5qfp@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-22-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-22-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_092421_492323_D11E88DD 
X-CRM114-Status: GOOD (  19.37  )
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

On 27/07/21 07:52AM, Tudor Ambarus wrote:
> Used to init all the mtd_info fields. Move the mtd_info init
> the last thing in the spi_nor_scan(), so that we avoid superfluous
> initialization of the mtd_info fields in case of errors.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 55 +++++++++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 5c8cffb5e6f2..26acfc9901db 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3124,6 +3124,36 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>  	return info;
>  }
>  
> +static void spi_nor_set_mtd_info(struct spi_nor *nor)
> +{
> +	struct mtd_info *mtd = &nor->mtd;
> +	struct device *dev = nor->dev;
> +
> +	spi_nor_register_locking_ops(nor);
> +
> +	/* Configure OTP parameters and ops */
> +	spi_nor_otp_init(nor);
> +
> +	mtd->dev.parent = dev;
> +	if (!mtd->name)
> +		mtd->name = dev_name(dev);
> +	mtd->priv = nor;

You remove the lines setting mtd->priv in the previous patch. Why add it 
back?

Other than this,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> +	mtd->type = MTD_NORFLASH;
> +	mtd->flags = MTD_CAP_NORFLASH;
> +	if (nor->info->flags & SPI_NOR_NO_ERASE)
> +		mtd->flags |= MTD_NO_ERASE;
> +	mtd->writesize = nor->params->writesize;
> +	mtd->writebufsize = nor->page_size;
> +	mtd->size = nor->params->size;
> +	mtd->_erase = spi_nor_erase;
> +	mtd->_read = spi_nor_read;
> +	mtd->_write = spi_nor_write;
> +	mtd->_suspend = spi_nor_suspend;
> +	mtd->_resume = spi_nor_resume;
> +	mtd->_get_device = spi_nor_get_device;
> +	mtd->_put_device = spi_nor_put_device;
> +}
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps)
>  {
> @@ -3166,32 +3196,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  
>  	mutex_init(&nor->lock);
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
> -	if (info->flags & SPI_NOR_NO_ERASE)
> -		mtd->flags |= MTD_NO_ERASE;
> -
> -	mtd->dev.parent = dev;
>  	nor->page_size = nor->params->page_size;
> -	mtd->writebufsize = nor->page_size;
>  
>  	/*
>  	 * Configure the SPI memory:
> @@ -3207,15 +3217,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
>  
>  	if (!nor->name)
>  		nor->name = info->name;
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

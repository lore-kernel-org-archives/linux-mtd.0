Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF965C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 10:26:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A349C60551
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 10:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A349C60551
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4K6QHUzX34+tdc3tRtE07ztrYTxv8KzB22xeXJ/nK7M=; b=Xpr6arc1HvtqoF
	8+0zNWyv0QUT+F2YFWb0I40YqpFBn7mAWSmVQyG/eoTBmhxDCcLsnKuFKWZVFR10FOu+6Zke8z8Jr
	+OnLkI3uGNC/ta/gsz4KVs8C8YkLliT+VBd29ZVyXFxdz5qgFDk1lw6c+EyUY3G/H1RJ/NOhYitHl
	3gNNqHy27KjMMQyyMrE2ZBkiKb0RQqHQdJxtS1i63512L6l5BabA8sx9SRJBJreAs3AQkLoKzd0xn
	XK0vkeCC9bkdALh8E+TwxyaCGWOyynccdV7ggwEiFaYhlaVRWjzBGsAWCBGLAsE94ykiFWcVb3Vy4
	CPAof2sK/CzYmNLBZuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFwHP-0027BI-1J; Tue, 17 Aug 2021 10:25:11 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFwHJ-00279y-0K; Tue, 17 Aug 2021 10:25:08 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17HAOXIj060895;
 Tue, 17 Aug 2021 05:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629195873;
 bh=6xJaBZ5dWpSzYsnBuMMB6sCsnG2SCTvQ+g/d300Edis=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=jn/1DoHFLyJHi711umxYohrwZUzjvmn/m9SQrIGBU1fuuEJjvFlbL3TRWP+Ec/Opd
 5iYMx+dbkQPuJ9iP43DIEa6FYjVdPurGVTZH5A1k4TO+GHadCD0sTtkBy4v6gLxVhf
 JS/rtrYo/a1y/FChEJHWif1GOij/YtkQOa2TLJYE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17HAOXwS117605
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Aug 2021 05:24:33 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 17
 Aug 2021 05:24:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 17 Aug 2021 05:24:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17HAOWvd029694;
 Tue, 17 Aug 2021 05:24:32 -0500
Date: Tue, 17 Aug 2021 15:54:31 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
Message-ID: <20210817102429.kmhuef5hxumllxjj@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-18-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-18-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_032505_242076_D5119E4C 
X-CRM114-Status: GOOD (  30.80  )
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
> Used to initialize the NOR flags for settings that are not defined
> in the JESD216 SFDP standard, thus can not be retrieved when parsing
> SFDP. No functional change.

I am worried if the order in which these flags are set can cause some 
subtle bugs.

I can see one instance of it with SNOR_F_HAS_LOCK. 
spi_nor_late_init_params() checks for SNOR_F_HAS_LOCK and if there are 
no locking ops specified, it sets the default locking ops. This works 
fine before this patch because the flag is set before the function is 
called. But now, the flag will be set _after_ the function is called, 
and so you will never be able to set the default flags.

This is one bug I can spot but I fear some others might be hiding 
somewhere as well. SPI NOR has accumulated a lot of spaghetti code over 
the years and I certainly felt it when working on my Octal DTR series. 
It caused an address width selection bug that was not obvious at all, 
and was not even caught during the rc cycles.

I think this series does clean up that spaghetti a lot. But you need to 
be careful of such bugs. I think you should definitely let this series 
cook in next for some time so it gets some exposure and hopefully some 
testing.

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 88 ++++++++++++++++++++++----------------
>  1 file changed, 52 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1f38fa8ab2fa..6a8617346764 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2687,6 +2687,56 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>  		spi_nor_init_default_locking_ops(nor);
>  }
>  
> +/**
> + * spi_nor_nonsfdp_flags_init() - Initialize NOR flags for settings that are not
> + * defined in the JESD216 SFDP standard, thus can not be retrieved when parsing
> + * SFDP.
> + * @nor:	pointer to a 'struct spi_nor'
> + */
> +static void spi_nor_nonsfdp_flags_init(struct spi_nor *nor)
> +{
> +	const struct flash_info *info = nor->info;
> +	struct device_node *np = spi_nor_get_flash_node(nor);
> +
> +	if (of_property_read_bool(np, "broken-flash-reset"))
> +		nor->flags |= SNOR_F_BROKEN_RESET;
> +
> +	if (info->flags & SPI_NOR_SWP_IS_VOLATILE)
> +		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
> +
> +	if (info->flags & SPI_NOR_HAS_LOCK)
> +		nor->flags |= SNOR_F_HAS_LOCK;

As mentioned above, this would cause a bug.

> +
> +	if (info->flags & SPI_NOR_HAS_TB) {
> +		nor->flags |= SNOR_F_HAS_SR_TB;
> +		if (info->flags & SPI_NOR_TB_SR_BIT6)
> +			nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
> +	}
> +
> +	if (info->flags & SPI_NOR_4BIT_BP) {
> +		nor->flags |= SNOR_F_HAS_4BIT_BP;
> +		if (info->flags & SPI_NOR_BP3_SR_BIT6)
> +			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
> +	}
> +
> +	if (info->flags & NO_CHIP_ERASE)
> +		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> +
> +	if (info->flags & USE_FSR)
> +		nor->flags |= SNOR_F_USE_FSR;
> +
> +	if (info->flags & USE_CLSR)
> +		nor->flags |= SNOR_F_USE_CLSR;
> +
> +	/*
> +	 * Make sure the XSR_RDY flag is set before calling
> +	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
> +	 * with Atmel SPI NOR.
> +	 */
> +	if (info->flags & SPI_NOR_XSR_RDY)
> +		nor->flags |=  SNOR_F_READY_XSR_RDY;
> +}
> +
>  /**
>   * spi_nor_init_params() - Initialize the flash's parameters and settings.
>   * @nor:	pointer to a 'struct spi_nor'.
> @@ -2736,6 +2786,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  
>  	spi_nor_late_init_params(nor);
>  
> +	spi_nor_nonsfdp_flags_init(nor);
> +
>  	return 0;
>  }
>  
> @@ -3078,7 +3130,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	const struct flash_info *info;
>  	struct device *dev = nor->dev;
>  	struct mtd_info *mtd = &nor->mtd;
> -	struct device_node *np = spi_nor_get_flash_node(nor);
>  	int ret;
>  	int i;
>  
> @@ -3115,17 +3166,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  
>  	mutex_init(&nor->lock);
>  
> -	/*
> -	 * Make sure the XSR_RDY flag is set before calling
> -	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
> -	 * with Atmel SPI NOR.
> -	 */
> -	if (info->flags & SPI_NOR_XSR_RDY)
> -		nor->flags |=  SNOR_F_READY_XSR_RDY;
> -
> -	if (info->flags & SPI_NOR_HAS_LOCK)
> -		nor->flags |= SNOR_F_HAS_LOCK;
> -
>  	mtd->_write = spi_nor_write;
>  
>  	/* Init flash parameters based on flash_info struct and SFDP */
> @@ -3147,27 +3187,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	mtd->_get_device = spi_nor_get_device;
>  	mtd->_put_device = spi_nor_put_device;
>  
> -	if (info->flags & USE_FSR)
> -		nor->flags |= SNOR_F_USE_FSR;
> -	if (info->flags & SPI_NOR_HAS_TB) {
> -		nor->flags |= SNOR_F_HAS_SR_TB;
> -		if (info->flags & SPI_NOR_TB_SR_BIT6)
> -			nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
> -	}
> -
> -	if (info->flags & NO_CHIP_ERASE)
> -		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> -	if (info->flags & USE_CLSR)
> -		nor->flags |= SNOR_F_USE_CLSR;
> -	if (info->flags & SPI_NOR_SWP_IS_VOLATILE)
> -		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
> -
> -	if (info->flags & SPI_NOR_4BIT_BP) {
> -		nor->flags |= SNOR_F_HAS_4BIT_BP;
> -		if (info->flags & SPI_NOR_BP3_SR_BIT6)
> -			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
> -	}
> -
>  	if (info->flags & SPI_NOR_NO_ERASE)
>  		mtd->flags |= MTD_NO_ERASE;
>  
> @@ -3175,9 +3194,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	nor->page_size = nor->params->page_size;
>  	mtd->writebufsize = nor->page_size;
>  
> -	if (of_property_read_bool(np, "broken-flash-reset"))
> -		nor->flags |= SNOR_F_BROKEN_RESET;
> -

As I pointed out above, I think this patch is certainly going in the 
right direction. We just need to be careful of the bugs that slip 
through.

>  	/*
>  	 * Configure the SPI memory:
>  	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
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

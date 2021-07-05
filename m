Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E27C07E99
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 13:14:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31B461376
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 13:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F31B461376
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHl8Ocxw5ZjA8DzUhKaaq7mYoR2MmG9riW2+veEImyA=; b=NUOfBPFQPI2yL6
	oybzb4c4c5h6aLKJqBJIQYLJV+A3rrYfelegu0Gb0JcRgb29LmRa3ABXnHy5P5zbTrjM24UFVnNB+
	1xk7LZiN55TrYGxnTFykDwjOzfUA8cV1hm8H5SRM7Bs4G+j8fwk4UnD3pYmcPSQAxNViY68qB2XPj
	YbAzNSKxN6nznCxLkgROWiIrQDug7Mo18yuWruzHgKyVA4jeYJxyXzrPX82ssBJGLZCoq4B9E9gxK
	zAfhnPGcwH1YrCqsa9BkKAd3GOGIDtm2WPi8wVL4oaxZR37/vE1SyWF8qT35vcVdW3yMHF5wHr5yQ
	PwgQ567deormsnR8dKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0OQJ-008zPe-20; Mon, 05 Jul 2021 13:14:07 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0OQC-008zOx-H9
 for linux-mtd@lists.infradead.org; Mon, 05 Jul 2021 13:14:03 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 165DDWVA111583;
 Mon, 5 Jul 2021 08:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1625490812;
 bh=ZYLlpvhN8FfdCb+58l+E3Uc8rAPwRQ0c6l4mtkvWMRY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=k8MqDplp+MZmPYiSij9YVi1qgMko4wZD059BCFWIuYfNXS+YQmqPxszhkLoo6LPmA
 pDfaYl0+x8lDNJV7z64kNKW7OBoJ5VO5/l5qJA5KZY1M4L/AIZNqriM/P/ZD023IJf
 nHppgELQxNoiB3Qfyl8DTDF/LWK4OLObX1Z4nIo0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 165DDWFl027908
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Jul 2021 08:13:32 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 5 Jul
 2021 08:13:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 5 Jul 2021 08:13:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 165DDVCP057457;
 Mon, 5 Jul 2021 08:13:31 -0500
Date: Mon, 5 Jul 2021 18:43:30 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/7] mtd: spi-nor: core: Report correct name in case of
 ID collisions
Message-ID: <20210705131328.ik765ywjryr44pyv@ti.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-3-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702144110.250481-3-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_061400_696948_09F31535 
X-CRM114-Status: GOOD (  26.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/07/21 05:41PM, Tudor Ambarus wrote:
> Provide a way to report the correct flash name in case of ID collisions.
> There will be a single flash_info entry when flash IDs collide, and the
> differentiation between the flash types will be made at runtime
> if possible.

I am not sure if having one entry for all flashes with a collision is a 
good idea. For example, say we have one flash which supports SFDP and 
that's all we need for it. Another flash with the same ID does not 
support SFDP so it needs the SPI_NOR_DUAL_READ, etc. flags. How would 
you handle this case with the same entry? You would have to set all the 
flags in the disambiguation function. And nor->info is declared as const 
so you can't change the flags in there. Any code checking for 
info->flags would not work properly for these type of flashes. Wouldn't 
it be better to have multiple entries with the same ID and just pick the 
one we need in the disambiguation function?

Anyway, if you do decide to go with this approach, comments below.

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 5 ++++-
>  include/linux/mtd/spi-nor.h | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 3d9f3698fb7b..d528e28995c6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3208,7 +3208,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	/* Configure OTP parameters and ops */
>  	spi_nor_otp_init(nor);
>  
> -	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
> +	if (!nor->name)
> +		nor->name = info->name;
> +
> +	dev_info(dev, "%s (%lld Kbytes)\n", nor->name,
>  			(long long)mtd->size >> 10);

You also need to update the usage of info->name in 
spi_nor_debugfs_init() and partname_show() in sysfs.c

>  
>  	dev_dbg(dev,
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index f67457748ed8..bd92acdd1899 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -369,6 +369,7 @@ struct spi_nor_flash_parameter;
>   * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
>   *                      layer is not DMA-able
>   * @bouncebuf_size:	size of the bounce buffer
> + * @name:		used to point to correct name in case of ID collisions.
>   * @info:		SPI NOR part JEDEC MFR ID and other info
>   * @manufacturer:	SPI NOR manufacturer
>   * @page_size:		the page size of the SPI NOR
> @@ -399,6 +400,7 @@ struct spi_nor {
>  	struct spi_mem		*spimem;
>  	u8			*bouncebuf;
>  	size_t			bouncebuf_size;
> +	const char *name;
>  	const struct flash_info	*info;
>  	const struct spi_nor_manufacturer *manufacturer;
>  	u32			page_size;
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

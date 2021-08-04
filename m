Return-Path: <SRS0=SwGG=M3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4412C4338F
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Aug 2021 08:25:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8524560F25
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Aug 2021 08:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8524560F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAtIG7EAzJ2CuOud5qACHy9YIcCl+diTuZNqLlFWSgo=; b=iSISJbCP7dobXc
	vjHWAONUROArT0yBVHU1F3ssfG88sFPYzMIgIVQW60cgNMtcgYhcGnfhuqcRG0Cmml8E2kjSnkGHm
	fLihZh/QoNapXwVtiug5zemSLVyd1CLGidj/mNp6kAEhr25sdJD36MPE3reEbc97H4PJNQ9/r6kFf
	wphO1uTcJmPHV2LncSSpuZ+oe54pOD2ieFIfeDoWJfbHnMvrtExPbd7S1ivyPN4k8sTj77Lq87iY8
	gBM1eoOm/Pu8xzctKKSG+5i+k1Twlkr+WTBEW5VhROQwIqZyrrg8oQ1x2rflEHz03pPrLNJ0IH1XA
	rTS9Lrp0tMcItgvNu1lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBCCM-0058Lc-UL; Wed, 04 Aug 2021 08:24:23 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBCCJ-0058J9-8b; Wed, 04 Aug 2021 08:24:20 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1748NnCH068945;
 Wed, 4 Aug 2021 03:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1628065429;
 bh=UfhUD0Q+1JYuvQppNDYTGX3uZoZpdq1w8hc/lDyOa4U=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=an3OjBgiOQ1DGQDl8b+IcBM9Vs4th/PFGpmFBRmiv5CY/8+5JUqglp7xA46K97X7y
 r7FdFCPcOG/cvsoxy6CC7wQowHz1X+aWNF1n/rtSugK4kfa/J2TZpJnU1xKnTRJY/K
 SYWcFI3YDgtVkVaGBsz1d7ICblUZJ4GgYrTydN4E=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1748NnVT011095
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 4 Aug 2021 03:23:49 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 4 Aug
 2021 03:23:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 4 Aug 2021 03:23:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1748Nlqg016772;
 Wed, 4 Aug 2021 03:23:48 -0500
Date: Wed, 4 Aug 2021 13:53:47 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 02/35] mtd: spi-nor: core: Report correct name in case
 of ID collisions
Message-ID: <20210804082345.ztciqvdeljvyx5by@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-3-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-3-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_012419_433894_3855511F 
X-CRM114-Status: GOOD (  26.48  )
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

On 27/07/21 07:51AM, Tudor Ambarus wrote:
> Provide a way to report the correct flash name in case of ID collisions.
> There will be a single flash_info entry when flash IDs collide, and the
> differentiation between the flash types will be made at runtime
> if possible.

I have the same comments as last time around. I am not convinced that 
this approach is better than having multiple entries, one for each 
colliding flash. I wonder how you will handle different fixups for the 
colliding flashes for example, since nor->info is const.

Maybe I will change my mind once I read through the rest of the series, 
in which case I will report back here.

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 7 +++++--
>  drivers/mtd/spi-nor/sysfs.c | 2 +-
>  include/linux/mtd/spi-nor.h | 2 ++
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 3d9f3698fb7b..1a278d33b02d 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3027,7 +3027,7 @@ static void spi_nor_debugfs_init(struct spi_nor *nor,
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  
> -	mtd->dbg.partname = info->name;
> +	mtd->dbg.partname = nor->name;
>  	mtd->dbg.partid = devm_kasprintf(nor->dev, GFP_KERNEL, "spi-nor:%*phN",
>  					 info->id_len, info->id);
>  }
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
>  
>  	dev_dbg(dev,
> diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
> index 9aec9d8a98ad..017119768f32 100644
> --- a/drivers/mtd/spi-nor/sysfs.c
> +++ b/drivers/mtd/spi-nor/sysfs.c
> @@ -25,7 +25,7 @@ static ssize_t partname_show(struct device *dev,
>  	struct spi_mem *spimem = spi_get_drvdata(spi);
>  	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
>  
> -	return sysfs_emit(buf, "%s\n", nor->info->name);
> +	return sysfs_emit(buf, "%s\n", nor->name);
>  }
>  static DEVICE_ATTR_RO(partname);
>  
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

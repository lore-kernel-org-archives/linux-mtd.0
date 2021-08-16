Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA728C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 790DF60F35
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 790DF60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoR/Qnv06a7zRvUJB1yqT2Pynkvr0fmLvlECyFUCPng=; b=bV0TTOvw8WHXPu
	NM878bB/XEQ4EsQkU/fAhA6EL4AIi7RQZXI1qnImoI96nK4ojP2RnHZKa1gfs9zeBUJBidPR/0rUV
	g9Qp9lUyBOjDK5cCA+LDW3fieCuz3IjACAbt8ffVy5E3efSF3CHwtiDFQ5PEaIpuR2Hbz2bUnQici
	Ej+KJaRZLBB3WZnbhyt5GBMwERcnEA+clbn35meuePOFZYB1JHCVhr0/cJUKU75aidGKMpT+mLWnH
	xOGTfO7SwjNDLiljsBO38jF4g901oJ99nXHYQpFe9hcKvsQ23ARciCZ9iFnQ8/+Tz9fqeJN1zrAFe
	TkToykSVlA+rfyDfQJqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFhww-0004f0-EA; Mon, 16 Aug 2021 19:07:06 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFhwr-0004eW-Id; Mon, 16 Aug 2021 19:07:05 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17GJ6YDq102656;
 Mon, 16 Aug 2021 14:06:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629140794;
 bh=4vxSEz+AmmCXEN2LkI87YYCgJtAmczodNl2+hfi9ERA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=n5I15Mqfhso01ZiJ7ZTG7GP7GznRCd6yPQVN5SuOkpMfa3/ewlLlEJnqGKls3dZSM
 dvJhAvuEroI+n11l9a8WPzgdlD5F09IDuvAcgNo3QaM2dw4O1ReYy6Sn6mH+cr0CGE
 DdRAz6J8b8ANjjF3ukwKmzTMIxtRuxLUIHQxTyog=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17GJ6YiV128983
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Aug 2021 14:06:34 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 16
 Aug 2021 14:06:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 16 Aug 2021 14:06:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17GJ6WDJ112307;
 Mon, 16 Aug 2021 14:06:33 -0500
Date: Tue, 17 Aug 2021 00:36:31 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 09/35] mtd: spi-nor: atmel: Use flash late_init() for
 locking
Message-ID: <20210816190629.3kg4cbf5d7h7gyk5@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-10-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-10-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_120701_744764_96B20B3C 
X-CRM114-Status: GOOD (  20.16  )
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

On 27/07/21 07:51AM, Tudor Ambarus wrote:
> Locking is not described in JESD216 SFDP standard, place the locking
> init in late_init().

You are chaning the order of setting the locking ops here. Earlier, they 
were set before we parsed SFDP. Now they are set after we parse SFDP. 
Though I don't see it making much of a difference.

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/atmel.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 1fea5cab492c..b937ef734e55 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -48,15 +48,11 @@ static const struct spi_nor_locking_ops atmel_at25fs_locking_ops = {
>  	.is_locked = atmel_at25fs_is_locked,
>  };
>  
> -static void atmel_at25fs_default_init(struct spi_nor *nor)
> +static void atmel_at25fs_late_init(struct spi_nor *nor)
>  {
>  	nor->params->locking_ops = &atmel_at25fs_locking_ops;
>  }
>  
> -static const struct spi_nor_fixups atmel_at25fs_fixups = {
> -	.default_init = atmel_at25fs_default_init,
> -};
> -
>  /**
>   * atmel_set_global_protection - Do a Global Protect or Unprotect command
>   * @nor:	pointer to 'struct spi_nor'
> @@ -146,34 +142,30 @@ static const struct spi_nor_locking_ops atmel_global_protection_ops = {
>  	.is_locked = atmel_is_global_protected,
>  };
>  
> -static void atmel_global_protection_default_init(struct spi_nor *nor)
> +static void atmel_global_protection_late_init(struct spi_nor *nor)
>  {
>  	nor->params->locking_ops = &atmel_global_protection_ops;
>  }
>  
> -static const struct spi_nor_fixups atmel_global_protection_fixups = {
> -	.default_init = atmel_global_protection_default_init,
> -};
> -
>  static const struct flash_info atmel_parts[] = {
>  	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
>  	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | SPI_NOR_HAS_LOCK)
> -		.fixups = &atmel_at25fs_fixups },
> +		.late_init = atmel_at25fs_late_init },
>  	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK)
> -		.fixups = &atmel_at25fs_fixups },
> +		.late_init = atmel_at25fs_late_init },
>  
>  	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8,
>  			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -			.fixups = &atmel_global_protection_fixups },
> +		.late_init = atmel_global_protection_late_init },

Won't you be better off setting this in the manufacturer late_init()? It 
seems common for most atmel flashes.

Of course, this would cause a problem for atmel flashes that don't have 
this at all, since we would set locking for those as well. But I think 
we can avoid that by checking for SNOR_F_HAS_LOCK in 
spi_nor_register_locking_ops().

>  	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64,
>  			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -			.fixups = &atmel_global_protection_fixups },
> +		.late_init = atmel_global_protection_late_init },
>  	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64,
>  			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -			.fixups = &atmel_global_protection_fixups },
> +		.late_init = atmel_global_protection_late_init },
>  	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128,
>  			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -			.fixups = &atmel_global_protection_fixups },
> +		.late_init = atmel_global_protection_late_init },
>  
>  	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> @@ -181,13 +173,13 @@ static const struct flash_info atmel_parts[] = {
>  	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
>  	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16,
>  			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -			.fixups = &atmel_global_protection_fixups },
> +		.late_init = atmel_global_protection_late_init },
>  	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32,
>  			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -			.fixups = &atmel_global_protection_fixups },
> +		.late_init = atmel_global_protection_late_init },
>  	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64,
>  			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -			.fixups = &atmel_global_protection_fixups },
> +		.late_init = atmel_global_protection_late_init },
>  
>  	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
>  };
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

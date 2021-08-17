Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185F1C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 12:17:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C967560F38
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 12:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C967560F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYLpMYLywq8Lpo3GTbJ0jwvBTFNHPwcvqn1WXw2pXVM=; b=NXEmlZpktcDo3/
	eC6gsfPWvabc/xZG7qdt0rbrQ1Fs0EOp367n9OmSpyYisJwwe4DTw1y7lryvIJGdeWVGWa4OnTDwl
	0KK/KCM6kJwIWKl1ZQPeH/d39xFHPm6JBNnJHJxjqGKihDWzBqp5dZFwLb6MyZaITg7l/YVwIIcDF
	7JhyQydlYTuIi/yO6/LhrfRc2Hh4RRzZCympoL+qVACJGoJ3nyJN1+PhBAGp3yZ5BUrH/9Vp/fgEl
	PRHhc9rBnRAXPGQsxMjjm4TIhLJU7LU8b0dWC+WDAFXAAWgG38med7rLdV3fhX//BkRoh/Ybaw4D1
	7p7VFPgcb9hhAoHbHQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFy1g-002PUp-UM; Tue, 17 Aug 2021 12:17:04 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFy1b-002PRb-EG; Tue, 17 Aug 2021 12:17:03 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17HCGUAR099463;
 Tue, 17 Aug 2021 07:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629202590;
 bh=Ym54jGve0DbuNtpRdAVtOK97Rr4qbly9kzllQQTRRuE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=oOy0/e7JHE5ypvx3npgEz89NVEu4mj2W8carJsvQZoPnQ23yswqhmZE/jwHRE7TJ/
 TiyfWrqSs+27lrc6Ali4qIkgrBFRfz4HpNJbOzHv58M9SFMOU5+eAHFpB2h+o1Yr74
 Tmq/S5cabaz0HAP/WJgEr2UGdPh34H3NTinTh914=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17HCGU3a061390
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Aug 2021 07:16:30 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 17
 Aug 2021 07:16:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 17 Aug 2021 07:16:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17HCGTon084949;
 Tue, 17 Aug 2021 07:16:29 -0500
Date: Tue, 17 Aug 2021 17:46:28 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 18/35] mtd: spi-nor: Get rid of SPI_NOR_4B_OPCODES flag
Message-ID: <20210817121626.5vcwuluheqfqrqc3@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-19-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-19-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_051659_650416_F34CFC11 
X-CRM114-Status: GOOD (  37.89  )
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
> Get rid of flash_info flags that indicate settings which can be
> discovered when parsing SFDP. It will be clearer who sets what,
> and we'll restrict the flash settings that a developer can choose to
> only settings that are not SFDP discoverable.
> 
> Whether a flash supports 4byte opcodes or not, is discoverable when
> parsing the optional 4-byte address instruction table. Flashes that
> do not support the 4bait SFDP table should set the SNOR_F_4B_OPCODES
> flag in the late_init() call. Flashes that define the 4bait SFDP table
> but gets it wrong, should set the flag in a post_sfdp fixup hook.

I like the idea, not so much the execution. More on this below.

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c       |  3 ---
>  drivers/mtd/spi-nor/core.h       | 32 ++++++++++++++++----------------
>  drivers/mtd/spi-nor/gigadevice.c |  7 ++++---
>  drivers/mtd/spi-nor/issi.c       | 12 ++++++------
>  drivers/mtd/spi-nor/macronix.c   | 18 ++++++++++--------
>  drivers/mtd/spi-nor/micron-st.c  | 22 +++++++++++++---------
>  drivers/mtd/spi-nor/spansion.c   | 12 ++++++------
>  7 files changed, 55 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 6a8617346764..240d5c31af88 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3204,9 +3204,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (ret)
>  		return ret;
>  
> -	if (info->flags & SPI_NOR_4B_OPCODES)
> -		nor->flags |= SNOR_F_4B_OPCODES;
> -
>  	if (info->flags & SPI_NOR_IO_MODE_EN_VOLATILE)
>  		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
>  
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 625f4eed75f1..dfdc51a26cad 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -348,40 +348,36 @@ struct flash_info {
>  					 * S3AN flashes have specific opcode to
>  					 * read the status register.
>  					 */
> -#define SPI_NOR_4B_OPCODES	BIT(11)	/*
> -					 * Use dedicated 4byte address op codes
> -					 * to support memory size above 128Mib.
> -					 */
> -#define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
> -#define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
> -#define USE_CLSR		BIT(14)	/* use CLSR command */
> -#define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
> -#define SPI_NOR_TB_SR_BIT6	BIT(16)	/*
> +#define NO_CHIP_ERASE		BIT(11) /* Chip does not support chip erase */
> +#define SPI_NOR_SKIP_SFDP	BIT(12)	/* Skip parsing of SFDP tables */
> +#define USE_CLSR		BIT(13)	/* use CLSR command */
> +#define SPI_NOR_OCTAL_READ	BIT(14)	/* Flash supports Octal Read */
> +#define SPI_NOR_TB_SR_BIT6	BIT(15)	/*
>  					 * Top/Bottom (TB) is bit 6 of
>  					 * status register. Must be used with
>  					 * SPI_NOR_HAS_TB.
>  					 */
> -#define SPI_NOR_4BIT_BP		BIT(17) /*
> +#define SPI_NOR_4BIT_BP		BIT(16) /*
>  					 * Flash SR has 4 bit fields (BP0-3)
>  					 * for block protection.
>  					 */
> -#define SPI_NOR_BP3_SR_BIT6	BIT(18) /*
> +#define SPI_NOR_BP3_SR_BIT6	BIT(17) /*
>  					 * BP3 is bit 6 of status register.
>  					 * Must be used with SPI_NOR_4BIT_BP.
>  					 */
> -#define SPI_NOR_OCTAL_DTR_READ	BIT(19) /* Flash supports octal DTR Read. */
> -#define SPI_NOR_OCTAL_DTR_PP	BIT(20) /* Flash supports Octal DTR Page Program */
> -#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(21) /*
> +#define SPI_NOR_OCTAL_DTR_READ	BIT(18) /* Flash supports octal DTR Read. */
> +#define SPI_NOR_OCTAL_DTR_PP	BIT(19) /* Flash supports Octal DTR Page Program */
> +#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(20) /*
>  						 * Flash enables the best
>  						 * available I/O mode via a
>  						 * volatile bit.
>  						 */
> -#define SPI_NOR_SWP_IS_VOLATILE	BIT(22)	/*
> +#define SPI_NOR_SWP_IS_VOLATILE	BIT(21)	/*
>  					 * Flash has volatile software write
>  					 * protection bits. Usually these will
>  					 * power-up in a write-protected state.
>  					 */
> -#define SPI_NOR_PARSE_SFDP	BIT(23) /*
> +#define SPI_NOR_PARSE_SFDP	BIT(22) /*
>  					 * Flash initialized based on the SFDP
>  					 * tables.
>  					 */
> @@ -569,4 +565,8 @@ static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
>  	return mtd->priv;
>  }
>  
> +static inline void snor_f_4b_opcodes(struct spi_nor *nor)

Maybe snor_set_f_4b_opcodes()?

> +{
> +	nor->flags |= SNOR_F_4B_OPCODES;
> +}
>  #endif /* __LINUX_MTD_SPI_NOR_INTERNAL_H */
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
> index 447d84bb2128..ff523fe734ef 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -47,9 +47,10 @@ static const struct flash_info gigadevice_parts[] = {
>  			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>  	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
>  			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			   SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
> -			   SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
> -		.fixups = &gd25q256_fixups },
> +			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
> +			   SPI_NOR_TB_SR_BIT6)
> +		.fixups = &gd25q256_fixups,
> +		.late_init = snor_f_4b_opcodes,	},
>  };
>  
>  const struct spi_nor_manufacturer spi_nor_gigadevice = {
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 1e5bb5408b68..aeff8f60cbae 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -45,9 +45,9 @@ static const struct flash_info issi_parts[] = {
>  	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
>  			     SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
> -			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			     SPI_NOR_4B_OPCODES)
> -		.fixups = &is25lp256_fixups },
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		.fixups = &is25lp256_fixups,
> +		.late_init = snor_f_4b_opcodes, },
>  	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128,
> @@ -55,9 +55,9 @@ static const struct flash_info issi_parts[] = {
>  	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512,
> -			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			    SPI_NOR_4B_OPCODES)
> -		.fixups = &is25lp256_fixups },
> +			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		.fixups = &is25lp256_fixups,
> +		.late_init = snor_f_4b_opcodes, },
>  
>  	/* PMC */
>  	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index fba85efafb47..9709eb68b613 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -105,29 +105,31 @@ static const struct flash_info macronix_parts[] = {
>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
>  			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		.fixups = &mx25l25635_fixups },
> -	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512,
> -			      SECT_4K | SPI_NOR_4B_OPCODES) },
> +	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K)
> +		.late_init = snor_f_4b_opcodes, },
>  	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +			      SPI_NOR_QUAD_READ)
> +		.late_init = snor_f_4b_opcodes, },
>  	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>  	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024,
> -			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			      SPI_NOR_4B_OPCODES) },
> +			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		.late_init = snor_f_4b_opcodes, },
>  	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +			      SPI_NOR_QUAD_READ)
> +		.late_init = snor_f_4b_opcodes, },
>  	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048,
>  			      SPI_NOR_QUAD_READ) },
>  	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096,
> -			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		.late_init = snor_f_4b_opcodes, },
>  };
>  
>  static void macronix_default_init(struct spi_nor *nor)
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index c224e59820a1..72cc4673bf88 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -121,13 +121,13 @@ static struct spi_nor_fixups mt35xu512aba_fixups = {
>  static const struct flash_info micron_parts[] = {
>  	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
>  			       SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
> -			       SPI_NOR_4B_OPCODES | SPI_NOR_OCTAL_DTR_READ |
> -			       SPI_NOR_OCTAL_DTR_PP |
> +			       SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
>  			       SPI_NOR_IO_MODE_EN_VOLATILE)
> -	  .fixups = &mt35xu512aba_fixups},
> +	  .fixups = &mt35xu512aba_fixups,
> +	  .late_init = snor_f_4b_opcodes, },

This flash populated the 4BAIT table, so you can simply drop the flag. 
No need for the late_init().

This makes me think that many other flashes might also have the 4BAIT 
table but the developers chose to add this flag here since at that time 
the norm was to populate all flash capabilities. I think we could be 
able to drop many more .late_init like this. But unfortunately someone 
needs to do the hard work of checking each flash, and most flash 
datasheets don't even list the SFDP contents.

So while I think in the ideal world we would go check each flash, I 
think this is an acceptable compromise. Let's not let perfection be the 
enemy of good.

While we are on this topic, I find this a bit "ugly". Having to set 
late_init() for setting these flags for each flash is not exactly very 
clean or readable. I don't know how the future will look like, but if 
each flash/family needs its own late_init() to set some flags, it won't 
be very readable. We seem to be trading one type of complexity for 
another. I dunno which is the lesser evil though...

>  	{ "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
> -			    SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
> -			    SPI_NOR_4B_OPCODES) },
> +			    SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ)
> +	  .late_init = snor_f_4b_opcodes, },
>  };
>  
>  static const struct flash_info st_parts[] = {
> @@ -149,25 +149,29 @@ static const struct flash_info st_parts[] = {
>  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512,
>  			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> -			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +			       SPI_NOR_QUAD_READ)
> +	  .late_init = snor_f_4b_opcodes, },
>  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
>  			      USE_FSR | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
>  	{ "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512,
>  			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> -			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +			       SPI_NOR_QUAD_READ)
> +	  .late_init = snor_f_4b_opcodes, },
>  	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512,
>  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
>  			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> -			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +			       SPI_NOR_QUAD_READ)
> +	  .late_init = snor_f_4b_opcodes, },
>  	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
>  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>  			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
>  	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
>  			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> -			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +			       SPI_NOR_QUAD_READ)
> +	  .late_init = snor_f_4b_opcodes, },
>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
>  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index aad7170768b4..af10833f56d8 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -259,14 +259,14 @@ static const struct flash_info spansion_parts[] = {
>  	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16,
>  			     SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128,
> -			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			     SPI_NOR_4B_OPCODES) },
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		.late_init = snor_f_4b_opcodes, },
>  	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256,
> -			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			     SPI_NOR_4B_OPCODES) },
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		.late_init = snor_f_4b_opcodes, },
>  	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
> -			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			     SPI_NOR_4B_OPCODES) },
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		.late_init = snor_f_4b_opcodes, },
>  	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
>  			      SPI_NOR_NO_ERASE) },
>  	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
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

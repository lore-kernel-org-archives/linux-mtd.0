Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF87FC07E99
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 12:59:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B94260FF2
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 12:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B94260FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/YjQvM9+qUu8l0DiZZdeyuph+I/dNjqLCPxQQEwfQY=; b=gR9SHiOBOAVai5
	D7Khhz4ibfhQ4gXKmVcyUeuLlfeq/Vn8psvwB5Fw7Qlkq1uRX5SWHmftadQnNJVGm3sr7edZVZJkh
	nS3y0qp5taLHmrxHwseUAymss4KjpAiY1VRhXS4vMnHBaQnDnMfaIHJb+yeI/QrJgGTqIFt9zF4t2
	AUtPtAEkROD+5lj2k/zhBih7nO6UFuEzdwyhQbJAYIfLSD/GGp47TTPMB6w7K23RR2gqb/xB1OBOo
	D4u7JbHNP8F7xTd00krQr9hEXJnEVdqBmKC6/K1yt40gRM4YMiFxHDgvoWVGDZYrY7MKuvAJYlZwc
	j20alhLqUJIfHuHjYXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0OBO-008xrg-DT; Mon, 05 Jul 2021 12:58:42 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0OBL-008xqR-2W
 for linux-mtd@lists.infradead.org; Mon, 05 Jul 2021 12:58:41 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 165Cw3Kk105669;
 Mon, 5 Jul 2021 07:58:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1625489883;
 bh=ns1lavazE1S2ByqQSPwVF4vZUorrHfRL+1ChCflKXCU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ZK7RuBEyWnv8fMwc2I4ck122L5wSncKyQB0hcBE5F/khqO9IVmtm0ZvUdZ+Scr0Am
 PhWPf/WPYq0Dj3FHleOfBrrtTjmE1aGCobVLNqRWMIvGyv9A/2rzgNqkxmHpjWMWXe
 tw2Kz3n8JOGZzLXd1tTn28xKoZbipJbqHDw6Mn1s=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 165Cw2RI020676
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Jul 2021 07:58:03 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 5 Jul
 2021 07:58:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 5 Jul 2021 07:58:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 165Cw20V041210;
 Mon, 5 Jul 2021 07:58:02 -0500
Date: Mon, 5 Jul 2021 18:28:01 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/7] mtd: spi-nor: core: Introduce SPI_NOR_PARSE_SFDP
Message-ID: <20210705125759.lgk4qrps6pc2exsg@ti.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702144110.250481-2-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_055839_288992_7E446995 
X-CRM114-Status: GOOD (  30.22  )
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

Hi Tudor,

I only have small commit message nitpicks/improvements for this patch.

On 02/07/21 05:41PM, Tudor Ambarus wrote:
> SPI NOR flashes that statically declare one of the
> SPI_NOR_{DUAL, QUAD, OCTAL, OCTAL_DTR}_READ flags, and do not support
> the RDSFDP command, are gratuiously receiving the RDSFDP command,

I think you should drop all the commas in this sentence. They seem 
unnecessary to me.

> in the attempt of parsing the SFDP tables. It is not desirable to issue
> comands that are not supported, so introduce a flag to help on this

s/comands/commands/

> situation.
> 
> New flash additions that support the SFDP standard should be declared
> using SPI_NOR_PARSE_SFDP. Support that can be discovered when parsing
> SFDP should not be duplicated by explicit flags at flash declaration.
> All the flash parameters will be discovered when parsing SFDP.
> Sometimes manufacturers wrongly define some fields in the SFDP tables.
> If that's the case, SFDP data can be ammended with the fixups() hooks.

s/ammended/amended/

> It is not common, but if the SFDP tables are entirely wrong, and it
> does not worth the hassle to tweak the SFDP parameters by using the
> fixups hooks, or if the flash does not define the SFDP tables at all,
> then statically init the flash with the SPI_NOR_SKIP_SFDP flag and
> specify the reset of flash capabilities with the flash info flags.

s/reset/rest/ ?

> 
> With time, we want to convert all flashes to SPI_NOR_PARSE_SFDP and
> stop triggering the SFDP parsing with the
> SPI_NOR_{DUAL, QUAD, OCTAL*}_READ flags. Getting rid of the
> SPI_NOR_{OCTAL, OCTAL_DTR}_READ trigger is easy achievable, the reset

s/easy/easily/

s/reset/rest/ ?

> are a long term goal.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 3 ++-
>  drivers/mtd/spi-nor/core.h | 4 ++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index cc08bd707378..3d9f3698fb7b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2726,7 +2726,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  
>  	spi_nor_manufacturer_init_params(nor);
>  
> -	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +	if ((nor->info->flags & (SPI_NOR_PARSE_SFDP |
> +				 SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |

Ok.

>  				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
>  	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
>  		spi_nor_sfdp_init_params(nor);
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 3348e1dd1445..55fceb0ec894 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -382,6 +382,10 @@ struct flash_info {
>  					 * protection bits. Usually these will
>  					 * power-up in a write-protected state.
>  					 */
> +#define SPI_NOR_PARSE_SFDP	BIT(23) /*
> +					 * Flash initialized based on the SFDP
> +					 * tables.
> +					 */

We will be running out of bits to use soon at this rate. But I don't 
think it is too much of a worry since it should be easy to make flags 
u64.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

>  
>  	const struct spi_nor_otp_organization otp_org;
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

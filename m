Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4D2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 07:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8nIdfjyBVy82w2Zl1uo9qvhOroO9DFq75qJB0yzV1I=; b=ovaulqN0w/LfbdMeSXRXw4fSgr
	cQf5zvKxipKcjOv8TuBSJWhf+uGOovwCfChir4Fv+HHl0teyyUMo9QH7srnBgWBLlUC8CwwiY5MU5
	KLvevIIuXMEQCvI//1UaV8qB+Zv7K4YlZg+8qH5RkQKRJP1RwgdScGeVf2jeAMk7N7I6PTc3eNT7m
	gz3ItmEOZlM/JPrdC4RHENgjnKgIWVNJujeaIBkZrbgNScesrxUDCPWFIgF0GkclhT2Uk4xkpgRK0
	D9wGeHXQeNQEGlNQsAGHHEwNi/JR7upoZw17AXlA/MVkYcG8vmVuMkJl6JLdgf7ORrbzhjvG4yyPI
	yCcAKjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM3Ki-004410-A9; Mon, 21 Feb 2022 07:42:08 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM3Kc-0043yt-GK
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 07:42:04 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DFEAD2223A;
 Mon, 21 Feb 2022 08:41:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645429320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNyPUPlg2sD5m6/vUiOjIJFOgcgNo3fxUw6jJlZsrWw=;
 b=XZr2EMNdXSgxh1QoOI58hFDyj7wwKCjs6EG6mkG+ypuMak04iI9DXeZ81g/mzy1VsnlXNP
 T1f0g1gBOeLHAlD2JQyVk/gnmADU2U6Nf7DAVPfmarZsr1eF64SvkN9a2DtWNBa6G7QtOG
 tP9M3cJN5jH/izduyqoBWnIMqs1Bkp0=
MIME-Version: 1.0
Date: Mon, 21 Feb 2022 08:41:59 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, broonie@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 nicolas.ferre@microchip.com, zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw
Subject: Re: [PATCH 4/4] mtd: spi-nor: core: Introduce SPI_NOR_DTR_BSWAP16
 no_sfdp_flag
In-Reply-To: <20220218145900.1440045-5-tudor.ambarus@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <20220218145900.1440045-5-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <95b0cc336da1d7b867f62a3e6b09436d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_234202_769084_AB552CBF 
X-CRM114-Status: GOOD (  20.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-02-18 15:59, schrieb Tudor Ambarus:
> Introduce SPI_NOR_DTR_BSWAP16 flag for flashes that don't define the
> mandatory BFPT table. When set it indicates that the byte order of 
> 16-bit
> words is swapped when read in 8D-8D-8D mode compared to 1-1-1 mode.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 5 ++++-
>  drivers/mtd/spi-nor/core.h | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 453d8c54d062..c3128a8e1544 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2572,7 +2572,7 @@ static void spi_nor_no_sfdp_init_params(struct
> spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params = nor->params;
>  	struct spi_nor_erase_map *map = &params->erase_map;
> -	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
> +	const u16 no_sfdp_flags = nor->info->no_sfdp_flags;
>  	u8 i, erase_mask;
> 
>  	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
> @@ -2613,6 +2613,9 @@ static void spi_nor_no_sfdp_init_params(struct
> spi_nor *nor)
>  					SPINOR_OP_PP, SNOR_PROTO_8_8_8_DTR);
>  	}
> 
> +	if (no_sfdp_flags & SPI_NOR_DTR_BSWAP16)
> +		nor->flags |= SNOR_F_DTR_BSWAP16;
> +
>  	/*
>  	 * Sector Erase settings. Sort Erase Types in ascending order, with 
> the
>  	 * smallest erase size starting at BIT(0).
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 7c077d41c335..1cb887437193 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -362,6 +362,8 @@ struct spi_nor_fixups {
>   *   SPI_NOR_OCTAL_READ:      flash supports Octal Read.
>   *   SPI_NOR_OCTAL_DTR_READ:  flash supports octal DTR Read.
>   *   SPI_NOR_OCTAL_DTR_PP:    flash supports Octal DTR Page Program.
> + *   SPI_NOR_DTR_BSWAP16:     the byte order of 16-bit words is 
> swapped when
> + *			      read or written in DTR mode compared to STR mode.
>   *
>   * @fixup_flags:    flags that indicate support that can be discovered 
> via SFDP
>   *                  ideally, but can not be discovered for this
> particular flash
> @@ -404,7 +406,7 @@ struct flash_info {
>  #define USE_FSR				BIT(10)
>  #define SPI_NOR_XSR_RDY			BIT(11)
> 
> -	u8 no_sfdp_flags;
> +	u16 no_sfdp_flags;
>  #define SPI_NOR_SKIP_SFDP		BIT(0)
>  #define SECT_4K				BIT(1)
>  #define SECT_4K_PMC			BIT(2)
> @@ -413,6 +415,7 @@ struct flash_info {
>  #define SPI_NOR_OCTAL_READ		BIT(5)
>  #define SPI_NOR_OCTAL_DTR_READ		BIT(6)
>  #define SPI_NOR_OCTAL_DTR_PP		BIT(7)
> +#define SPI_NOR_DTR_BSWAP16		BIT(8)
> 
>  	u8 fixup_flags;
>  #define SPI_NOR_4B_OPCODES		BIT(0)

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

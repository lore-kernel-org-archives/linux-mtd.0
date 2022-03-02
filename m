Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBB2C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 12:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3NjJ+u0XGVTeweNXRNlLemdDdhGffsV7g+URnc2VIU=; b=Q6m80Z0JdEBF/4
	BSCSQZXx2OCieptSWUvgvXyigQ3gn7TiMbRHZsww3LN3nOpxUgrMg1bk7jkSIe3zaMNj/t7lw35bO
	5XihlGXp6ql7rojymHgVLi1NFUHc194PGyncZ2q+Xs+1AH4Y6gsOScob79kX29Sr25bWi5jAhGlmz
	6soFfag/mvs2KfiXfOvWNlCUYIvMEJkuvSaBLlry4SWuhPor4p8Igs76TQcao/WBgTs66KeIDDQEy
	DG6vEpcO3pn3951wc5uAvYVQAZ6TcgUqo89PNoaqMWHqp7JNiXYlnm6D1Rlq6Dj49tXr10+S/deqZ
	2bHZefwN5IMDket7ZioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPO7z-002cVR-AN; Wed, 02 Mar 2022 12:30:47 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPO7x-002cUp-4j
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2022 12:30:46 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 222CUdSD008743;
 Wed, 2 Mar 2022 06:30:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1646224240;
 bh=rtFipknxeYo1v4cJrenh1bkttKuv3UnZgO67uv1f29A=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ogUHR4vLrj75nCD6UJHB+sbkwKzKm9l3OiDn+6sZyY7MDMJUdQJVprUsD/+7qW2CP
 5EZdRGhQKaaCgt5S9IXusnBchvVlcqn4v0l3AbENai8H+msDSwu3816e5DF8q6zgZM
 pQhomww8w9Hrlr5CugIIvyX+7SmaUH/z4hheu0W4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 222CUd12045049
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Mar 2022 06:30:39 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Mar 2022 06:30:39 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Mar 2022 06:30:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 222CUcPc062807;
 Wed, 2 Mar 2022 06:30:39 -0600
Date: Wed, 2 Mar 2022 18:00:38 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 4/4] mtd: spi-nor: core: Introduce SPI_NOR_DTR_BSWAP16
 no_sfdp_flag
Message-ID: <20220302123038.fe5bk3akyovihxem@ti.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <20220218145900.1440045-5-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218145900.1440045-5-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_043045_289620_57113FDF 
X-CRM114-Status: GOOD (  22.13  )
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

On 18/02/22 04:59PM, Tudor Ambarus wrote:
> Introduce SPI_NOR_DTR_BSWAP16 flag for flashes that don't define the
> mandatory BFPT table. When set it indicates that the byte order of 16-bit
> words is swapped when read in 8D-8D-8D mode compared to 1-1-1 mode.

Is there any flash that currently needs this flag but does not define 
BFPT? If there is no user, let's not add it. It can always be added 
later.

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
> @@ -2572,7 +2572,7 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params = nor->params;
>  	struct spi_nor_erase_map *map = &params->erase_map;
> -	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
> +	const u16 no_sfdp_flags = nor->info->no_sfdp_flags;
>  	u8 i, erase_mask;
>  
>  	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
> @@ -2613,6 +2613,9 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
>  					SPINOR_OP_PP, SNOR_PROTO_8_8_8_DTR);
>  	}
>  
> +	if (no_sfdp_flags & SPI_NOR_DTR_BSWAP16)
> +		nor->flags |= SNOR_F_DTR_BSWAP16;
> +
>  	/*
>  	 * Sector Erase settings. Sort Erase Types in ascending order, with the
>  	 * smallest erase size starting at BIT(0).
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 7c077d41c335..1cb887437193 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -362,6 +362,8 @@ struct spi_nor_fixups {
>   *   SPI_NOR_OCTAL_READ:      flash supports Octal Read.
>   *   SPI_NOR_OCTAL_DTR_READ:  flash supports octal DTR Read.
>   *   SPI_NOR_OCTAL_DTR_PP:    flash supports Octal DTR Page Program.
> + *   SPI_NOR_DTR_BSWAP16:     the byte order of 16-bit words is swapped when
> + *			      read or written in DTR mode compared to STR mode.
>   *
>   * @fixup_flags:    flags that indicate support that can be discovered via SFDP
>   *                  ideally, but can not be discovered for this particular flash
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

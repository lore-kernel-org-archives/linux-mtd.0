Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC79BC3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 05:48:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E5D2204EC
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 05:48:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Txcyg9yf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mLW/ZDdv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E5D2204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUnLUHNn3O35ivlvWx7sBEnrIrZGX2Cyy3xiIlKvtZg=; b=Txcyg9yfmO3UjH
	3J2zqzJx2TdfvUTbIBuXhpYLBZ1j07gG9zS3FTaCZK6XcRa5TFUKQjBwBmD5gHYVSBjia6ZXVMT7Z
	KfUnrHS5Jd3M+EMygmssBJz9RHmlIP3F1cd6FHE0/DmcOZfoy00WEKZGE8IxyVH5POvvcqbcM3I7A
	zwu6G7eLWvzM2iEzBphGoh+fPL23G34D8YFbw0ysqumYO3zgrH/b9f79+KdE+a0QCJDParb5aZqTI
	m9xmOTErh5YZ5MxF++7vIvKqUulaQSSue1X7l5jI2kGHNjF/IX7HrnW6sQICTwoRXtGrVljT/ktDa
	P+yiuUD2I7Iv50MskIVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2ULH-00049L-3Z; Tue, 27 Aug 2019 05:48:31 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2ULE-00048n-C0
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 05:48:29 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R5mN9X107439;
 Tue, 27 Aug 2019 00:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566884903;
 bh=NLw1dkWiMq9XrUKh2CldBAJYtOZ9XDX5mN04ZYPcLhw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=mLW/ZDdvX02S4VgGO0bsiCCS/YrKFaTx1Sr/yJ+RqX79aIcLFhg7rGFnp2zYtNYxS
 BdSgY7hUYdDYc44sZk9DIqufyGnfAVhv6ieJ2W5EO1EXDzXiB6utAt74R8+xVp2mdY
 sTIk5SZlSJ2OlKaze46E6EqSJVYYnJgADlVVhrZA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R5mNx9086346
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 00:48:23 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 00:48:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 00:48:22 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R5mJvL051681;
 Tue, 27 Aug 2019 00:48:20 -0500
Subject: Re: [RESEND PATCH v3 06/20] mtd: spi-nor: Add a default_init() fixup
 hook for gd25q256
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-7-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <74bfb73e-e1c4-ce78-f1cb-6ee0050eb275@ti.com>
Date: Tue, 27 Aug 2019 11:18:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826120821.16351-7-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_224828_490076_DBFBF17E 
X-CRM114-Status: GOOD (  23.74  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: boris.brezillon@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 26/08/19 5:38 PM, Tudor.Ambarus@microchip.com wrote:
> From: Boris Brezillon <boris.brezillon@bootlin.com>
> 
> gd25q256 needs to tweak the ->quad_enable() implementation and the
> ->default_init() fixup hook is the perfect place to do that. This way,
> if we ever need to tweak more things for this flash, we won't have to
> add new fields in flash_info.
> 
> We can get rid of the flash_info->quad_enable field as gd25q256 was
> the only user.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> [tudor.ambarus@microchip.com: use ->default_init() hook instead of
> ->post_sfdp()]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---


Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

> v3: no changes
> >  drivers/mtd/spi-nor/spi-nor.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 8fd60e1eebd2..3dbbfe34d1d2 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -222,8 +222,6 @@ struct flash_info {
>  
>  	/* Part specific fixup hooks. */
>  	const struct spi_nor_fixups *fixups;
> -
> -	int	(*quad_enable)(struct spi_nor *nor);
>  };
>  
>  #define JEDEC_MFR(info)	((info)->id[0])
> @@ -2126,6 +2124,21 @@ static struct spi_nor_fixups mx25l25635_fixups = {
>  	.post_bfpt = mx25l25635_post_bfpt_fixups,
>  };
>  
> +static void gd25q256_default_init(struct spi_nor *nor)
> +{
> +	/*
> +	 * Some manufacturer like GigaDevice may use different
> +	 * bit to set QE on different memories, so the MFR can't
> +	 * indicate the quad_enable method for this case, we need
> +	 * to set it in the default_init fixup hook.
> +	 */
> +	nor->params.quad_enable = macronix_quad_enable;
> +}
> +
> +static struct spi_nor_fixups gd25q256_fixups = {
> +	.default_init = gd25q256_default_init,
> +};
> +
>  /* NOTE: double check command sets and memory organization when you add
>   * more nor chips.  This current list focusses on newer chips, which
>   * have been converging on command sets which including JEDEC ID.
> @@ -2218,7 +2231,7 @@ static const struct flash_info spi_nor_ids[] = {
>  		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> -			.quad_enable = macronix_quad_enable,
> +			.fixups = &gd25q256_fixups,
>  	},
>  
>  	/* Intel/Numonyx -- xxxs33b */
> @@ -4237,15 +4250,6 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  			params->quad_enable = spansion_quad_enable;
>  			break;
>  		}
> -
> -		/*
> -		 * Some manufacturer like GigaDevice may use different
> -		 * bit to set QE on different memories, so the MFR can't
> -		 * indicate the quad_enable method for this case, we need
> -		 * set it in flash info list.
> -		 */
> -		if (info->quad_enable)
> -			params->quad_enable = info->quad_enable;
>  	}
>  
>  	spi_nor_manufacturer_init_params(nor);
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

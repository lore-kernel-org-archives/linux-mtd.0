Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC67C3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 05:54:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64EB82173E
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 05:54:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bhgrmh36";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uXoakiBP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64EB82173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FzLAqCI4V/D2FVEkJKL/qoQjtso9cO6sIikrzQvE/Pg=; b=bhgrmh365JbWO43L5kcHwogfDs
	Jmw2uoanskTlPyooXVv69OeY7Ef9CssIsw9C8F8JoH+DfvAGrAc1Vj02ibSafcqGEr8J7d5tptVTQ
	JjRM9H93ViVKPIYwoWdDZT4MoHt8hIqAqqNME5lqDo1oww6TUM9D823y/jUpnkzMiIJbBRupeMxCz
	e4HTSU9iFBTKPI+xZaS+rSc9+RVc1N3ia3Jcu+u3OK0SEWGRvJTCXRxvH5bbi5G8851fy6FdwqQuZ
	Ym3/lPY/n5fdhI2S0WHP0GA+yzcTi8i+321iK2Aayv+HSzRnfNApeRTB1DL7LrJzJymuu8I9m7uaF
	YgXULp5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2UQu-00064Y-AI; Tue, 27 Aug 2019 05:54:20 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2UQs-00064D-0x
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 05:54:19 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R5s7mF089216;
 Tue, 27 Aug 2019 00:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566885247;
 bh=PdGPhP6yk9Qew2y7lV7qkkA/6T4hgy/lRD/J6Aq/um4=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=uXoakiBPlar/EIUhpDG+u6sSCBv0L5sda/xUZYZh+K/IK3g+9s02+IIJK7CoNrkPz
 RCUvpqHF2FeiJXSMEm03Uk9Ld5Io25NFwSAR1K08tLoo7E8hgx3u0YZTWiVfuyb/Fs
 PqDJgRUsei6Lk+vPdpDP2w5Oig28GeU8zlNdCp3o=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R5s7Am002150
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 00:54:07 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 00:54:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 00:54:07 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R5s37Q059007;
 Tue, 27 Aug 2019 00:54:04 -0500
Subject: Re: [RESEND PATCH v3 07/20] mtd: spi_nor: Move manufacturer
 quad_enable() in ->default_init()
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-8-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <143f11c8-1227-3907-e17a-b54f2612514f@ti.com>
Date: Tue, 27 Aug 2019 11:24:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826120821.16351-8-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_225418_151536_84ED23D5 
X-CRM114-Status: GOOD (  20.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 26/08/19 5:38 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> The goal is to move the quad_enable manufacturer specific init in the
> nor->manufacturer->fixups->default_init()
> 
> The legacy quad_enable() implementation is spansion_quad_enable(),
> select this method by default.
> 
> Set specific manufacturer fixups->default_init() hooks to overwrite
> the default quad_enable() implementation when needed.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---


Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh


> v3: collect R-b
> 
>  drivers/mtd/spi-nor/spi-nor.c | 48 ++++++++++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 3dbbfe34d1d2..2a239531704a 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4150,13 +4150,38 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  	return err;
>  }
>  
> +static void macronix_set_default_init(struct spi_nor *nor)
> +{
> +	nor->params.quad_enable = macronix_quad_enable;
> +}
> +
> +static void st_micron_set_default_init(struct spi_nor *nor)
> +{
> +	nor->params.quad_enable = NULL;
> +}
> +
>  /**
>   * spi_nor_manufacturer_init_params() - Initialize the flash's parameters and
> - * settings based on ->default_init() hook.
> + * settings based on MFR register and ->default_init() hook.
>   * @nor:	pointer to a 'struct spi-nor'.
>   */
>  static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
>  {
> +	/* Init flash parameters based on MFR */
> +	switch (JEDEC_MFR(nor->info)) {
> +	case SNOR_MFR_MACRONIX:
> +		macronix_set_default_init(nor);
> +		break;
> +
> +	case SNOR_MFR_ST:
> +	case SNOR_MFR_MICRON:
> +		st_micron_set_default_init(nor);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
>  	if (nor->info->fixups && nor->info->fixups->default_init)
>  		nor->info->fixups->default_init(nor);
>  }
> @@ -4168,6 +4193,9 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  	const struct flash_info *info = nor->info;
>  	u8 i, erase_mask;
>  
> +	/* Initialize legacy flash parameters and settings. */
> +	params->quad_enable = spansion_quad_enable;
> +
>  	/* Set SPI NOR sizes. */
>  	params->size = (u64)info->sector_size * info->n_sectors;
>  	params->page_size = info->page_size;
> @@ -4233,24 +4261,6 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  			       SPINOR_OP_SE);
>  	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
>  
> -	/* Select the procedure to set the Quad Enable bit. */
> -	if (params->hwcaps.mask & (SNOR_HWCAPS_READ_QUAD |
> -				   SNOR_HWCAPS_PP_QUAD)) {
> -		switch (JEDEC_MFR(info)) {
> -		case SNOR_MFR_MACRONIX:
> -			params->quad_enable = macronix_quad_enable;
> -			break;
> -
> -		case SNOR_MFR_ST:
> -		case SNOR_MFR_MICRON:
> -			break;
> -
> -		default:
> -			/* Kept only for backward compatibility purpose. */
> -			params->quad_enable = spansion_quad_enable;
> -			break;
> -		}
> -	}
>  
>  	spi_nor_manufacturer_init_params(nor);
>  
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

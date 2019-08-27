Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73F9C3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 04:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A12C2070B
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 04:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XA2EAHAS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oXnYsrMa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A12C2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RddkQr3XRi39ZOfbjHSAhR1D8U8r0KLb5pW24EDP3ng=; b=XA2EAHASBP/juEotM/lK7anCLB
	PZiQyyJEsMcEmF4FokFwYGTBxSb/m7HDCKdXMKAHDSgcNHVvC96QWX1I7huDO3QPldalDkvRlvbmW
	J/e7Df9VYRzt3WaQWgAD8lvjWOmS4ZJSzt+Mf6R7nb4xckJ1MJkKOreK/CnljoEaM6PwKKhjKav5T
	bREjR9klNLxUKC3IBFxBWBVJsjROxgLA9TIwgOVMY/YTYpH0dOigJEiNarEs+EyG4EqLrUmU/tIKj
	P0zUbVozWx2tpcmUmHn4R9yIESKMnSy0kFuJwk8oujaMjPRKaMQdYQLdfGi4lo018VkjFxZ8qQzSy
	+plN7iqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2TNh-0000Re-Q4; Tue, 27 Aug 2019 04:46:57 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2TNf-0000RF-3v
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 04:46:56 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R4knCa070555;
 Mon, 26 Aug 2019 23:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566881209;
 bh=KrCBam3qJVNZZHb/CUmpQ8FkM8SL5qIK/W1Un1+xWE4=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=oXnYsrMaYsKbWiHQHwwpZNTub0g0CoXpNn5li48bZXg+2qKVcBFzLTPVpc2dZYwAM
 SA94ZVw6DDuWpu14fLHgI4tO0elXm7qPpIiPavy4W765PKublz8w3xVDnynPYSmkHt
 PGDJvssfHcl50sXibgVyVW/PUIL4nW7c0/oedjfo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R4knVL046133
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Aug 2019 23:46:49 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 26
 Aug 2019 23:46:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 26 Aug 2019 23:46:49 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R4kkNQ104974;
 Mon, 26 Aug 2019 23:46:46 -0500
Subject: Re: [RESEND PATCH v3 03/20] mtd: spi-nor: Drop quad_enable() from
 'struct spi-nor'
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-4-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <da4fcf3d-b742-b30b-144a-a2b5591609a3@ti.com>
Date: Tue, 27 Aug 2019 10:17:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826120821.16351-4-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_214655_251657_A7B64D84 
X-CRM114-Status: GOOD (  21.82  )
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
> All flash parameters and settings should reside inside
> 'struct spi_nor_flash_parameter'. Drop the local copy of
> quad_enable() and use the one from 'struct spi_nor_flash_parameter'.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

> v3: Collect R-b
> 
>  drivers/mtd/spi-nor/spi-nor.c | 40 +++++++++++++++++++++++-----------------
>  include/linux/mtd/spi-nor.h   |  2 --
>  2 files changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index e9b9cd70a999..effda372cb33 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4403,7 +4403,6 @@ static int spi_nor_setup(struct spi_nor *nor,
>  {
>  	struct spi_nor_flash_parameter *params = &nor->params;
>  	u32 ignored_mask, shared_mask;
> -	bool enable_quad_io;
>  	int err;
>  
>  	/*
> @@ -4457,23 +4456,33 @@ static int spi_nor_setup(struct spi_nor *nor,
>  		return err;
>  	}
>  
> -	/* Enable Quad I/O if needed. */
> -	enable_quad_io = (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
> -			  spi_nor_get_protocol_width(nor->write_proto) == 4);
> -	if (enable_quad_io && params->quad_enable)
> -		nor->quad_enable = params->quad_enable;
> -	else
> -		nor->quad_enable = NULL;
> -
>  	return 0;
>  }
>  
> +/**
> + * spi_nor_quad_enable() - enable Quad I/O if needed.
> + * @nor:                pointer to a 'struct spi_nor'
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_quad_enable(struct spi_nor *nor)
> +{
> +	if (!nor->params.quad_enable)
> +		return 0;
> +
> +	if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
> +	      spi_nor_get_protocol_width(nor->write_proto) == 4))
> +		return 0;
> +
> +	return nor->params.quad_enable(nor);
> +}
> +
>  static int spi_nor_init(struct spi_nor *nor)
>  {
>  	int err;
>  
>  	if (nor->clear_sr_bp) {
> -		if (nor->quad_enable == spansion_quad_enable)
> +		if (nor->params.quad_enable == spansion_quad_enable)
>  			nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
>  
>  		err = nor->clear_sr_bp(nor);
> @@ -4484,12 +4493,10 @@ static int spi_nor_init(struct spi_nor *nor)
>  		}
>  	}
>  
> -	if (nor->quad_enable) {
> -		err = nor->quad_enable(nor);
> -		if (err) {
> -			dev_err(nor->dev, "quad mode not supported\n");
> -			return err;
> -		}
> +	err = spi_nor_quad_enable(nor);
> +	if (err) {
> +		dev_err(nor->dev, "quad mode not supported\n");
> +		return err;
>  	}
>  
>  	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {
> @@ -4706,7 +4713,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
>  	 * - set the number of dummy cycles (mode cycles + wait states).
>  	 * - set the SPI protocols for register and memory accesses.
> -	 * - set the Quad Enable bit if needed (required by SPI x-y-4 protos).
>  	 */
>  	ret = spi_nor_setup(nor, hwcaps);
>  	if (ret)
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 77ba692d9348..17787238f0e9 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -535,7 +535,6 @@ struct flash_info;
>   * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
>   * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
>   *			completely locked
> - * @quad_enable:	[FLASH-SPECIFIC] enables SPI NOR quad mode
>   * @clear_sr_bp:	[FLASH-SPECIFIC] clears the Block Protection Bits from
>   *			the SPI NOR Status Register.
>   * @params:		[FLASH-SPECIFIC] SPI-NOR flash parameters and settings.
> @@ -579,7 +578,6 @@ struct spi_nor {
>  	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>  	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>  	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
> -	int (*quad_enable)(struct spi_nor *nor);
>  	int (*clear_sr_bp)(struct spi_nor *nor);
>  	struct spi_nor_flash_parameter params;
>  
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

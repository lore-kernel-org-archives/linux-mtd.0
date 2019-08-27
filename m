Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1E8C3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 07:36:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF5E122CF8
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 07:36:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jEL3QdYe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VXRycNKG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF5E122CF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VH5G80HICrMjDku7ybibgp1/8VF2/6TEUmvux7kV6WU=; b=jEL3QdYe6YdBK2CJWR+T6lYJ8S
	2MhjjBC81KACahpOCRYoyKUHDMLetUuvAbcEyiCaX9O66PbnWWIVj7cd3tu05/gx33Vks8+RyKfVL
	6hlM1GePRBbJdnac6DG98muuiCzHDJYyjGJdCuSBskP7VSrPuBg8BzqRDW6YGTarFd2uMr8C1o6hf
	IrSAIAJVyETzWWh8vFl0kCe+Hsxl5djZZbD6fEhS5sLpq4/uicFlw9Lw/YoejFiHb8KeSNjNAf3t/
	2TCR9Ctcai/byu3xILVCEk2fX3PjW/tglfBNURf2koOYHcse7JZi60NxWbwvD9y5MXGC71g6x7M8s
	rCaPrM/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2W1y-0003Co-Ts; Tue, 27 Aug 2019 07:36:42 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2W1w-0003C1-6m
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 07:36:41 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R7aZOB115578;
 Tue, 27 Aug 2019 02:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566891395;
 bh=rabRdcGKKXk+rI54LrxDrK1WyVh94dphJ3IbIT41bu4=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=VXRycNKGQXkAgoosfTFixNw3RyXk2jqekFV7a9mr9NA9HaB284o4u5x/DlwopOBgB
 rXMc/oOm5F8+KKQqhUeGttDSaQrfw7S+vL0hIyRPxNu1xMCUIeYug2Jf1tPUzoBHVm
 XxYrw7pqHTRy+GpHmJ0MFCOH7+jAnqRjE4xNKUik=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R7aY0v128167
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 02:36:35 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 02:36:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 02:36:34 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R7aVST072874;
 Tue, 27 Aug 2019 02:36:32 -0500
Subject: Re: [RESEND PATCH v3 18/20] mtd: spi_nor: Introduce
 spi_nor_set_addr_width()
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-19-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <61c0950b-6c1b-00da-bc8c-4d26d630d57b@ti.com>
Date: Tue, 27 Aug 2019 13:07:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826120821.16351-19-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_003640_391611_1A6B1797 
X-CRM114-Status: GOOD (  18.58  )
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



On 26/08/19 5:39 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Parsing of flash parameters were interleaved with setting of the
> nor addr width. Dedicate a function for setting nor addr width.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

> v3: no changes
> 
>  drivers/mtd/spi-nor/spi-nor.c | 50 ++++++++++++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index dcda96a20f6c..d13317d1f372 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4739,6 +4739,33 @@ static const struct flash_info *spi_nor_match_id(const char *name)
>  	return NULL;
>  }
>  
> +static int spi_nor_set_addr_width(struct spi_nor *nor)
> +{
> +	if (nor->addr_width) {
> +		/* already configured from SFDP */
> +	} else if (nor->info->addr_width) {
> +		nor->addr_width = nor->info->addr_width;
> +	} else if (nor->mtd.size > 0x1000000) {
> +		/* enable 4-byte addressing if the device exceeds 16MiB */
> +		nor->addr_width = 4;
> +	} else {
> +		nor->addr_width = 3;
> +	}
> +
> +	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
> +		dev_err(nor->dev, "address width is too large: %u\n",
> +			nor->addr_width);
> +		return -EINVAL;
> +	}
> +
> +	/* Set 4byte opcodes when possible. */
> +	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
> +	    !(nor->flags & SNOR_F_HAS_4BAIT))
> +		spi_nor_set_4byte_opcodes(nor);
> +
> +	return 0;
> +}
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps)
>  {
> @@ -4885,29 +4912,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (ret)
>  		return ret;
>  
> -	if (nor->addr_width) {
> -		/* already configured from SFDP */
> -	} else if (info->addr_width) {
> -		nor->addr_width = info->addr_width;
> -	} else if (mtd->size > 0x1000000) {
> -		/* enable 4-byte addressing if the device exceeds 16MiB */
> -		nor->addr_width = 4;
> -	} else {
> -		nor->addr_width = 3;
> -	}
> -
>  	if (info->flags & SPI_NOR_4B_OPCODES)
>  		nor->flags |= SNOR_F_4B_OPCODES;
>  
> -	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
> -	    !(nor->flags & SNOR_F_HAS_4BAIT))
> -		spi_nor_set_4byte_opcodes(nor);
> -
> -	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
> -		dev_err(dev, "address width is too large: %u\n",
> -			nor->addr_width);
> -		return -EINVAL;
> -	}
> +	ret = spi_nor_set_addr_width(nor);
> +	if (ret)
> +		return ret;
>  
>  	/* Send all the required SPI flash commands to initialize device */
>  	ret = spi_nor_init(nor);
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

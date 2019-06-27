Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3F3C48BD6
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 13:22:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F5BA2083B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 13:22:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H5vmGVtM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kBwmfjHL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F5BA2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bn4/wdA4UXeaSlqdXf0P5EZDO81Tep9xdt14tmhmwl8=; b=H5vmGVtMvRvSzG
	r21kr3sZK0Y/MMF7B4lTfVlrSX6odtu06lku0qGfpUDdeSBnapfazF5Gbo0OeLcin16BUGlONCeV7
	hf5am/5yT7K43G/jwDBhSsY1WwPqp1f4wHyri6wvTrW5E5yJlNdNNrKJsgJTGt22ka+M791Frqp6b
	jQI9HTbmXV5G1pIi02V5c2GfX3Fuzx3EtCYLCETuHJlWC5CMny4PbzC61f7uAzdi9UxGBZBVnCyrC
	pDjXLs6bXLkFBUvVnqBt5mVs2E5NRNaRAYFLmuoHT0byURuDb5bZdPG6RpMmTStJtj9bjFQk6RPel
	nfiWrpbTed6Ajgv4zcbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgUMO-0005xm-9h; Thu, 27 Jun 2019 13:22:44 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgUMK-0005sR-So
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 13:22:42 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5RDMKOC058667;
 Thu, 27 Jun 2019 08:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1561641740;
 bh=2t8iaercx/bO/UkajZenhI3ItsRcNxCLD1tRz9jSpXA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=kBwmfjHLeS8LJpKg0FVUffoXIvcIYD0EJR9gbEhKrtIf+87ib7AI+1L14gmq79RBd
 C+vBg8BmZSRaM5YaRxXMppeuV9IBb2OMjZXzYj3PZsQwvq5BkaB7HBBT9WvrwyEY8Y
 +tltr+XHX4ULfkNboXT3wy6AHQATT3xefokXwPYg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5RDMK59059849
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 Jun 2019 08:22:20 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 27
 Jun 2019 08:22:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 27 Jun 2019 08:22:19 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5RDMGoQ053172;
 Thu, 27 Jun 2019 08:22:17 -0500
Subject: Re: [PATCH v4] mtd: spi-nor: fix nor->addr_width when its value
 configured from SFDP does not match the actual width
To: Liu Xiang <liu.xiang6@zte.com.cn>, <linux-mtd@lists.infradead.org>
References: <1561392046-10487-1-git-send-email-liu.xiang6@zte.com.cn>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <792b5942-9aca-b0f2-dd92-cb8f96cd8027@ti.com>
Date: Thu, 27 Jun 2019 18:53:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1561392046-10487-1-git-send-email-liu.xiang6@zte.com.cn>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_062241_022453_621473C7 
X-CRM114-Status: GOOD (  18.60  )
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
Cc: tudor.ambarus@microchip.com, richard@nod.at, liuxiang_1999@126.com,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 24/06/19 9:30 PM, Liu Xiang wrote:
> IS25LP256 gets BFPT_DWORD1_ADDRESS_BYTES_3_ONLY from BFPT table for
> address width. But in actual fact the flash can support 4-byte address.
> Use a post bfpt fixup hook to overwrite the address width advertised by
> the BFPT.
> 
> Suggested-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
> 

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

> ---
> 
> Changes in v4:
>  update the comment suggested by Tudor.
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 73172d7..ce153c4 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1687,6 +1687,28 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>  		.flags = SPI_NOR_NO_FR | SPI_S3AN,
>  
>  static int
> +is25lp256_post_bfpt_fixups(struct spi_nor *nor,
> +			   const struct sfdp_parameter_header *bfpt_header,
> +			   const struct sfdp_bfpt *bfpt,
> +			   struct spi_nor_flash_parameter *params)
> +{
> +	/*
> +	 * IS25LP256 supports 4B opcodes, but the BFPT advertises a
> +	 * BFPT_DWORD1_ADDRESS_BYTES_3_ONLY address width.
> +	 * Overwrite the address width advertised by the BFPT.
> +	 */
> +	if ((bfpt->dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
> +		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
> +		nor->addr_width = 4;
> +
> +	return 0;
> +}
> +
> +static struct spi_nor_fixups is25lp256_fixups = {
> +	.post_bfpt = is25lp256_post_bfpt_fixups,
> +};
> +
> +static int
>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>  			    const struct sfdp_parameter_header *bfpt_header,
>  			    const struct sfdp_bfpt *bfpt,
> @@ -1827,7 +1849,8 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>  			SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			SPI_NOR_4B_OPCODES) },
> +			SPI_NOR_4B_OPCODES)
> +			.fixups = &is25lp256_fixups },
>  	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128,
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

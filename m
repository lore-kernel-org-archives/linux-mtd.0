Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8878EC3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 07:48:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5861820828
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 07:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cNFKHHcF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lxivtr3C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5861820828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyZzo0oHZ1HCRCRnX5oI3CTQIVrw/jx+F4R7/PnQd6Y=; b=cNFKHHcFZDSld3
	aj4ER7+IiudB5oSiNoe5LIBG+zULg9Sk7JcP2kQIdpO/WDrzb/HwNWNBc153+Mx2J/8eQ5/mwqmAQ
	Lc7vsi0ZsRmKK1w+sfZkSDx/S3SLmaspDxsXrZymt1p2gj+u1kWGsjWwHNv09+zD+lvMnHTprYDlU
	qtqbkfu6OM43PHh3OJuNj2RVPO7jdjN8RPxOnMGegTJj2xCt96gUUxvsVQXBUP+O2wS2eyp/d6UOn
	mCEyjW/9SpBy5Nm5yh5sXF0Cj5F9aFtB13Ho/w/+BjvW78C1cqPPLuAfK4MY/dvPW0M1w9ICx7w4b
	CrgFxoqJ3oBIrj/sIyIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2WD8-0007ix-0u; Tue, 27 Aug 2019 07:48:14 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2WD4-0007ho-LB
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 07:48:12 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R7m55l011401;
 Tue, 27 Aug 2019 02:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566892085;
 bh=DAEmQY6ZcVPLUHgDx6bVO328R5BPWYgZs0CQXt41clQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=lxivtr3CCfY0WlrlGLRWdOIV9dw5+vpZGkk3YRQzrzS2UlmwSFwA+XOXykYongFPl
 gdXC7uNpZpQbaJxS3KpGkUQxljzhjCk34FUubsAv4YqhTAqjdbsfDvcNzJeSgOaI23
 8fqld3gxFatQZaCBUMOOW4xZocdC2nnp9TxcYXSU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R7m58Y116885
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 02:48:05 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 02:48:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 02:48:05 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R7m0h6129701;
 Tue, 27 Aug 2019 02:48:02 -0500
Subject: Re: [RESEND PATCH v3 16/20] mtd: spi-nor: Add the SPI_NOR_XSR_RDY flag
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-17-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <6c4c1b43-426d-75c9-126d-f60c0af0e956@ti.com>
Date: Tue, 27 Aug 2019 13:18:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826120821.16351-17-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_004810_781249_C33D558C 
X-CRM114-Status: GOOD (  19.30  )
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



On 26/08/19 5:39 PM, Tudor.Ambarus@microchip.com wrote:
> From: Boris Brezillon <boris.brezillon@bootlin.com>
> 
> S3AN flashes use a specific opcode to read the status register.
> We currently use the SPI_S3AN flag to decide whether this specific
> SR read opcode should be used, but SPI_S3AN is about to disappear, so
> let's add a new flag.
> 
> Note that we use the same bit as SPI_S3AN implies SPI_NOR_XSR_RDY and
> vice versa.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

> v3: no changes
> 
>  drivers/mtd/spi-nor/spi-nor.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index edf1c8badac9..2699e999d21a 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -211,6 +211,14 @@ struct flash_info {
>  					 * bit. Must be used with
>  					 * SPI_NOR_HAS_LOCK.
>  					 */
> +#define SPI_NOR_XSR_RDY		BIT(10)	/*
> +					 * S3AN flashes have specific opcode to
> +					 * read the status register.
> +					 * Flags SPI_NOR_XSR_RDY and SPI_S3AN
> +					 * use the same bit as one implies the
> +					 * other, but we will get rid of
> +					 * SPI_S3AN soon.
> +					 */
>  #define	SPI_S3AN		BIT(10)	/*
>  					 * Xilinx Spartan 3AN In-System Flash
>  					 * (MFR cannot be used for probing
> @@ -4798,7 +4806,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
>  	 * with Atmel spi-nor
>  	 */
> -	if (info->flags & SPI_S3AN)
> +	if (info->flags & SPI_NOR_XSR_RDY)
>  		nor->flags |=  SNOR_F_READY_XSR_RDY;
>  
>  	if (info->flags & SPI_NOR_HAS_LOCK)
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

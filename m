Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C0DC07E96
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:31:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60CCB61879
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60CCB61879
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mbzFWFrnYg3edfo8kfzKxwQ2Nhg7JnruY3BdPlLLc8k=; b=SBocJpXeWC7ipP
	YwOsvEBrgrxmxy5NvtNWCotq46ufqRDCwJKe4p1MHfLZ/EA3wflZODzkhZkIfXjniFjOvNtI2atzc
	QvS+MmQTpVGviZFOwi1OO+pRf51dNgH9DRZCaJfBTifDjTzUtWPPX0LbKRJTg7lsoWrKMnVHhCEhC
	3+Xy8S6qej5T5741/xIQurc2tbw/82Tjs4jUZVgweaUy2dBhSFhQCw4F1DcsTqkMDm1CodyhoOxND
	DhReGHZYi71aFLqfTEBgu0w+oB6yPSxkCFG1jrwxsYoAgzQ6uAdv9S0WVA8GlyDVnicvqSbSC7PTq
	YeaDWI8EvYDRGcaK5DyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ebn-00AT8T-Gl; Tue, 06 Jul 2021 06:31:03 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0eZP-00ARlh-NB
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 06:28:37 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1666SAqv011016;
 Tue, 6 Jul 2021 01:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1625552890;
 bh=johTuHZPODnbt1NS5okvRc7ZQzfAgNVoUqXlXQYMnAo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=RYZVeZZWGz0du1c/KaHjBEHMnDveA0N794TDGxoDh1K1za6CnVh36svWJ/g4F351K
 Hm1g4CVSxtEIimwn4cr7vad7dOD2flI/fAlzsxz+yOjYPqJVN/hKBFWtQnEXBDGZdc
 lRG3WVdC7n0vRfnmTUGgdSVgGq6Lt9ZMAsSm5H1s=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1666SAcn035992
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Jul 2021 01:28:10 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 6 Jul
 2021 01:28:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 6 Jul 2021 01:28:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1666S9YA031744;
 Tue, 6 Jul 2021 01:28:10 -0500
Date: Tue, 6 Jul 2021 11:58:08 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 6/7] mtd: spi-nor: manuf-id-collisions: Add support for
 xt25f128b
Message-ID: <20210706062806.m63v2kaqkckmwgwx@ti.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-7-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702144110.250481-7-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_232835_888987_11B1BD2F 
X-CRM114-Status: GOOD (  22.40  )
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

On 02/07/21 05:41PM, Tudor Ambarus wrote:
> Flash does not support continuation codes and may collide with a flash
> of other manufacturer, Intersil being an example .
> 
> This flash addition is just for demonstration purposes. As I don't
> have the flash, I assumed that it supports SFDP.

I found a datasheet for this flash via Google [0]. It does indeed 
support SFDP (section 6.36). The data in the SFDP table is not listed so 
we can't say if it is completely correct though.

I am not sure if we should add support for an untested flash. We ask 
people to only add tested flashes and I think it is a good principle to 
stick to.

> If the flash does not define the SFDP tables, it should be statically
> initialized with:
>         /* XTX (XTX Technology Limited) */
>         { "XT25F128B", INFO(0x0b4018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
>                             SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>                             SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> };
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/manuf-id-collisions.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
> index 9efcba9d18a0..c473c7d40d09 100644
> --- a/drivers/mtd/spi-nor/manuf-id-collisions.c
> +++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
> @@ -8,6 +8,10 @@ static const struct flash_info id_collision_parts[] = {
>  	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> +
> +	/* XTX (XTX Technology Limited) */
> +	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
> +			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>  };
>  
>  const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
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

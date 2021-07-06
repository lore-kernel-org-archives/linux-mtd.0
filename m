Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282A3C07E9B
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:18:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E772161988
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E772161988
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLpKPTIJQj49qHHSdvyW/H+dNeK9lGo8jSbf09LY2LQ=; b=YqBl4o9qUJQTXQ
	e9tj24qHBn/Y8nXn5E0uo+p3P68Od6qdidsvS0fDXhXX5RDZ475Jg6Oi84mNTEg9nDuDKsZkbHh+w
	cqXWbE74C2e1w2KyGHm5UljulNx/T42oWxHZcOBcEDSnR6QKCRLHHPUmoaQN4dVf1JEfPGd/yiDOC
	QLo88TXRYkcQBAsZcddu5p5zIWwRsye63W8Ql+mQVD7bYzAG1ycnNCAt937eKgFsWVMaoWu/tLxpS
	glE4lT5CJzlKf+QB3NyMbIllZaJTevhPNrpam4kPG8KI5ptxKB8WuQEDn4E+JPMJ77lVc3MrEN4Ga
	zA3+Njs0cT4z3uqUdeIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0eP9-00AOc5-8m; Tue, 06 Jul 2021 06:17:59 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0eP5-00AObK-Ng
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 06:17:57 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1666HUpJ079289;
 Tue, 6 Jul 2021 01:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1625552250;
 bh=m5CdFnjEBx2bofTS+s/668tTYXAqda2lO/jSDhdIRgA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=W4XmOXPArx7yphtATj7ANzUBlcvzy5/RYTR5EBysrZD+H1J4NYw+KzBiaSG+Keg2G
 Yrrv0kr6/vs/gR3tLJ/IYpC/9ASWJ6SYq26wcjHGF6jrFe48Y3Scgu+qR6E1Fzz6rK
 nK+R/bxvO8e1GexBMPI1w8SLYfq+rjr3YJ65VdXE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1666HU7o023035
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Jul 2021 01:17:30 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 6 Jul
 2021 01:17:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 6 Jul 2021 01:17:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1666HS6C050901;
 Tue, 6 Jul 2021 01:17:29 -0500
Date: Tue, 6 Jul 2021 11:47:28 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 4/7] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
Message-ID: <20210706061726.fw6jvgxlaj3k7dqy@ti.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-5-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702144110.250481-5-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_231755_903265_3D8B5915 
X-CRM114-Status: GOOD (  20.50  )
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
> MX25L12835F define SFDP, while MX25L12805D does not.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 83a097708949..38701347bf04 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,26 @@
>  
>  #include "core.h"
>  
> +static const char *mx25l12835f = "mx25l12835f";
> +
> +static int mx25l12835f_post_bfpt_fixups(struct spi_nor *nor,
> +				const struct sfdp_parameter_header *bfpt_header,
> +				const struct sfdp_bfpt *bfpt)
> +{
> +	/*
> +	 * Macronix has a bad habit of reusing flash IDs: MX25L12835F collides
> +	 * with MX25L12805D. MX25L12835F defines SFDP tables, while the older
> +	 * variant does not.
> +	 */
> +	nor->name = mx25l12835f;

Same question as patch 3/7. Do we need to declare a separate pointer?

> +
> +	return 0;
> +}
> +
> +static struct spi_nor_fixups mx25l12835f_fixups = {
> +	.post_bfpt = mx25l12835f_post_bfpt_fixups,
> +};
> +
>  static const char *mx25l3233f = "mx25l3233f";
>  
>  static int mx25l3233f_post_bfpt_fixups(struct spi_nor *nor,
> @@ -71,8 +91,9 @@ static const struct flash_info macronix_parts[] = {
>  	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
>  	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
> -	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K |
> -			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
> +	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |

Same comment as patch 3/7. Consider adding a comment here listing all 
flashes with collision on this ID.

Other than these two nitpicks,

Acked-by: Pratyush Yadav <p.yadav@ti.com>

> +			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
> +		.fixups = &mx25l12835f_fixups },
>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>  	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
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

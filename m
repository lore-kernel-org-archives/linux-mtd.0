Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2D3C07E96
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:16:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 088996128E
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 088996128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTb+iMXo1y6Z4Pd8s3bHQ69NpRvCXuOHh9rn+4AhmcQ=; b=rfOg4k7zEZUO3D
	XIk8x/0OY8GAENmafa4ewYPjrM1tuWEwySXRLJh2YNEiP5heyi3TB1+zoBa/GFVaPrzjYEPCIyx58
	A8JSIEcTsPKDWcJQ535vO15+dA0sA1RtPQOFNFS1/dRwXPhQyM0Y+HgOo6Do80PLOUvvAAPs+nhOU
	QRFyZGHxPEDB6h/Gsb0Q0TkTF2o9f8P4G4k9aKR3hsP+1T4k93Q02I2ZlbFiLGJjXBOJDm2+DiA/9
	RLi0KmneiLI2Wl3BMMTci+jJJUAZBjSmv8YeOtH92AsK8QwD8tBq+KiqbTzNlLmPM7ESzCj7qEFO1
	znJZS9bOPy3+THmXsizw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0eMl-00AOME-Qz; Tue, 06 Jul 2021 06:15:31 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0eMi-00AOLh-0A
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 06:15:30 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1666F0TZ005994;
 Tue, 6 Jul 2021 01:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1625552100;
 bh=K9Ga3Lf6tmFnpD+xX01YI7ab/Dza/vlbsHuon02Wdl4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=TOYFv+X3Wcs/fZ3ieGXGYprshTIeDmol/eapBkgWImKbhIMmcatSe/bm9lYmc4tTq
 Ix+9kWn1oeI98CigpFRnwftBeDAeN9pKuHUQESL5IHVYvGxjb0NMaZxN4SH2qgotjs
 nnlyQMKfThB/uNCgQ6YhspX4ouOOVRSwjAY0ospo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1666F0Ob018785
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Jul 2021 01:15:00 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 6 Jul
 2021 01:15:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 6 Jul 2021 01:15:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1666ExLP067228;
 Tue, 6 Jul 2021 01:15:00 -0500
Date: Tue, 6 Jul 2021 11:44:58 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 3/7] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
Message-ID: <20210706061456.74i4qvusa64s6bc3@ti.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-4-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702144110.250481-4-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_231528_213537_2F9F2D32 
X-CRM114-Status: GOOD (  25.13  )
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
> Macronix has a bad habbit of reusing flash IDs. While MX25L3233F supports
> RDSFDP opcode, MX25L3205D does not support it and does not recommend
> issuing opcodes that are not supported ("It is not recommended to adopt
> any other code not in the command definition table, which will potentially
> enter the hidden mode.").
> 
> We tested the RDSFDP on the MX25L3205D and the conclusion is that the
> flash didn't reply anything. Given that it is unlikely that RDSFDP will
> cause any problems for the old MX25L3205D, differentiate between the two
> flashes by parsing SFDP.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 27498ed0cc0d..83a097708949 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,26 @@
>  
>  #include "core.h"
>  
> +static const char *mx25l3233f = "mx25l3233f";
> +
> +static int mx25l3233f_post_bfpt_fixups(struct spi_nor *nor,
> +				const struct sfdp_parameter_header *bfpt_header,
> +				const struct sfdp_bfpt *bfpt)
> +{
> +	/*
> +	 * Macronix has a bad habit of reusing flash IDs: MX25L3233F collides
> +	 * with MX25L3205D. MX25L3233F defines SFDP tables, while the older
> +	 * variant does not.
> +	 */
> +	nor->name = mx25l3233f;

Do we need to use the const char pointer here? Won't just doing 
nor->name = "mx2513233f"; do the trick?

> +
> +	return 0;
> +}
> +
> +static struct spi_nor_fixups mx25l3233f_fixups = {
> +	.post_bfpt = mx25l3233f_post_bfpt_fixups,
> +};
> +
>  static int
>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>  			    const struct sfdp_parameter_header *bfpt_header,
> @@ -39,7 +59,9 @@ static const struct flash_info macronix_parts[] = {
>  	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
>  	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
>  	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
> -	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
> +	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SPI_NOR_PARSE_SFDP |

Maybe add a comment here listing all the flashes that could collide with 
this ID?

Other than this,

Acked-by: Pratyush Yadav <p.yadav@ti.com>

> +			      SECT_4K)
> +		.fixups = &mx25l3233f_fixups },
>  	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
>  	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
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

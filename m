Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9FBC07E9C
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:43:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92DC661945
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92DC661945
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ItOCmB5zqWVZLZLVcvvjJpi9LApmx3mGT3qpLtHLdxg=; b=EzhgtUn/pemlJP
	XBmMrrKb02cb72gEDg1Qa01CaoNbuiSA8jsAVosFIB7dn9iWQ0P9Cm7Xu4mdjypmJT2A0PQJt3vK/
	cvBhX452/2dQmShXkjKSu8CBr5So/fmJFizxCIWsQrShLfOpPY+RnlO6gjwPh3u93/VSPAklmqe/D
	lFcYZ7qdRLFNpUh96+xPHNJ+/OP/DtEnqtDSWY20JBZqLiTE0P2e2j3VK7sD326MC0ddH2q3j+9UD
	67Rv0C+d+9sQW2nl7JSIZvoNS1RSssw2pi3w9CShve4NKLkTsQvstyVtE9MN0TZMZAdaOmrGstWGm
	KhASi9dR9ASqoFml5IYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0enH-00AZ1e-4A; Tue, 06 Jul 2021 06:42:55 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0efx-00AVQs-8d
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 06:35:23 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1666YtOJ014330;
 Tue, 6 Jul 2021 01:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1625553295;
 bh=gY2YbL4RlaE1yv/xBSSv3pK/COu5sc7hBHpq0EaTGwU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=okrR3MCdDCvGzmB7/h28UAB5qGRmjxLrdxG76Pi6qnuLegXrLjp6BJ2Sx+B5Gz79J
 2L3f/bnr6RvvGzHN7yeMA4vTG8jnO+PdlL3QzbrW3gsVHf7A4rBcijL6lvTtsW3TQK
 +bJehBNFABSY1uQLvgV8rTaKe8s5YD8pq0fZLBRQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1666YtQ0044812
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Jul 2021 01:34:55 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 6 Jul
 2021 01:34:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 6 Jul 2021 01:34:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1666YsIB098198;
 Tue, 6 Jul 2021 01:34:54 -0500
Date: Tue, 6 Jul 2021 12:04:53 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 5/7] mtd: spi-nor: Introduce Manufacturer ID collisions
 driver
Message-ID: <20210706063451.z5z5mb5z7jshifme@ti.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-6-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702144110.250481-6-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_233521_469163_896733F4 
X-CRM114-Status: GOOD (  28.42  )
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
> Some manufacturers completely ignore the manufacturer's identification code
> standard (JEP106) and do not define the manufacturer ID continuation
> scheme. This will result in manufacturer ID collisions.
> 
> An an example, JEP106BA requires Boya that it's manufacturer ID to be
> preceded by 8 continuation codes. Boya's identification code must be:
> 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x68. But Boya ignores the
> continuation scheme and its ID collides with the manufacturer defined in
> bank one: Convex Computer.
> 
> Introduce the manuf-id-collisions driver in order to address ID collisions
> between manufacturers. flash_info entries will be added in a first come,

So all manufacturers with an ID collision will be placed in this file, 
and won't get a separate file of their own. Ok.

> first served manner. Differentiation between flashes will be done at
> runtime if possible. Where runtime differentiation is not possible, new
> compatibles will be introduced, but this will be done as a last resort.
> Every new flash addition that define the SFDP tables, should dump its SFDP
> tables in the patch's comment section below the --- line, so that we can
> reference it in case of collisions.

Can we have this rule documented somewhere? Anyone who doesn't closely 
follow the list won't know about this rule, and having to ask for it on 
every new patch would be tedious. I am not sure if we have a place to 
document this that has high visibility though.

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/Makefile              |  1 +
>  drivers/mtd/spi-nor/core.c                |  1 +
>  drivers/mtd/spi-nor/core.h                |  1 +
>  drivers/mtd/spi-nor/manuf-id-collisions.c | 17 +++++++++++++++++
>  4 files changed, 20 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/manuf-id-collisions.c
> 
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 6b904e439372..48763d10daad 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  spi-nor-objs			:= core.o sfdp.o swp.o otp.o sysfs.o
> +spi-nor-objs			+= manuf-id-collisions.o
>  spi-nor-objs			+= atmel.o
>  spi-nor-objs			+= catalyst.o
>  spi-nor-objs			+= eon.o
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d528e28995c6..206a54c20fef 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1829,6 +1829,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
>  }
>  
>  static const struct spi_nor_manufacturer *manufacturers[] = {
> +	&spi_nor_manuf_id_collisions,
>  	&spi_nor_atmel,
>  	&spi_nor_catalyst,
>  	&spi_nor_eon,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 55fceb0ec894..e9896cd60695 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -476,6 +476,7 @@ struct sfdp {
>  };
>  
>  /* Manufacturer drivers. */
> +extern const struct spi_nor_manufacturer spi_nor_manuf_id_collisions;
>  extern const struct spi_nor_manufacturer spi_nor_atmel;
>  extern const struct spi_nor_manufacturer spi_nor_catalyst;
>  extern const struct spi_nor_manufacturer spi_nor_eon;
> diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
> new file mode 100644
> index 000000000000..9efcba9d18a0
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0

Please add a description for this file. Why it is needed, what should go 
in here, etc.

Other than this,

Acked-by: Pratyush Yadav <p.yadav@ti.com>

> +
> +#include <linux/mtd/spi-nor.h>
> +#include "core.h"
> +
> +static const struct flash_info id_collision_parts[] = {
> +	/* Boya */
> +	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
> +	.name = "manufacturer ID collisions",
> +	.parts = id_collision_parts,
> +	.nparts = ARRAY_SIZE(id_collision_parts),
> +};
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

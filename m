Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8211C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 21:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCIneK62ao5p/L940yGNe2lPUtvXcGn3Hla5SD+XugQ=; b=G78abQy0lUEZkYJGxxZXsaJyrt
	GIlJQXoIZAaWHLZaWW4uoylURR1yKWExe5xk+8d75rAp+to1DsRn4KK2gNwUAK0zWRK0tBDJxUImQ
	nPEV/YSLVFY/f1Wa20S6YvxuICgPvDksQbZU9Q2DXe89w/GUILXFvsUTwt60R5RMm+Y5sy9SKaFlX
	3edPCywhd8ofoPXkwLa+giD/Zr3lIQvfWeFn/mJySfXQ2FwbNyyFxLrFoljZ2x7RQzzKIxRSEvBe6
	mQLwyA5WN5dWsyUUwi8zTiw6bIMzwlr1QCSrYHkE0Iy0q5M9Lx/c2eXAd0yChDtDQS0MW7tEGsPpo
	m3uU6hfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moBIj-00BbOs-Vv; Fri, 19 Nov 2021 21:20:06 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moBIg-00BbNv-0O
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 21:20:04 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7110F22205;
 Fri, 19 Nov 2021 22:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1637356796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cUkcSEJdODljw5mRoN1I+VbKsGyg8RbPSdW+5boz/Lk=;
 b=jXFH2YgXvQk0ZSq///qkQNrbyr1zUk2dvbckiq0uJOhENiUap00OA4TTkgpP3hXOwFLXna
 Wuxez7EJLb7al1CFnqF6rujeEakipr/t8Kc9JDEiiXt4qVojm/eacacxNL+K1a92YMVnZM
 rJvmmJXfrHVKW0He8+d/RuDHoVWLVIk=
MIME-Version: 1.0
Date: Fri, 19 Nov 2021 22:19:56 +0100
From: Michael Walle <michael@walle.cc>
To: Alexander A Sverdlin <alexander.sverdlin@nokia.com>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: mt25qu: Ignore 6th ID byte
In-Reply-To: <20211119080402.20262-1-alexander.sverdlin@nokia.com>
References: <20211119080402.20262-1-alexander.sverdlin@nokia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <9a158e2ef6635212c1e353590e3b773b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_132002_684782_50FA5A39 
X-CRM114-Status: GOOD (  14.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2021-11-19 09:04, schrieb Alexander A Sverdlin:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Ignore 6th ID byte, secure version of mt25qu256a has 0x73 as 6th byte.

What is the secure version? What is the difference? Do you have some
links to datasheets for both?

Also please provide the SFDP data for this flash, see [1].

-michael

[1] 
https://lore.kernel.org/linux-mtd/7038f037de3e224016d269324517400d@walle.cc/

> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index f3d19b7..509a732 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -155,9 +155,9 @@ static const struct flash_info st_parts[] = {
>  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
>  			      USE_FSR | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> -	{ "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512,
> -			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> -			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +	{ "mt25qu256a",  INFO(0x20bb19, 0x1044, 64 * 1024,  512,
> +			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512,
>  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
> @@ -167,9 +167,9 @@ static const struct flash_info st_parts[] = {
>  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>  			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
> -	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
> -			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> -			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +	{ "mt25qu512a",  INFO(0x20bb20, 0x1044, 64 * 1024, 1024,
> +			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
>  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

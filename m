Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BAAC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 21:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSCKpySL3LVdxZQOU3lyMz3RvJBssEeuopaPl1XOjTo=; b=lfh1IMjfQOiFJDAwgKPU/6rxK2
	UP0wBHQFnBFxhcwQ6gHpPCK6riD76l9oQB1uUxxz+zHXxdaSujiJ69uiS6czWXWGAWaf3HhUkDTFF
	GhQTd78CHg/oJuWp2ep8vo7FgYy6zVNQa7j3Wb0mSkNYeKaI7lHMKRusQXPslUo0xVQh/o9fO8hbd
	iQyBvCo9/SbrR08b1By/RWRWOz34GnuGhdrblD4yyWnXG7Y4vOm4M5iWBNy2/UbUn3CRhGhIifdfB
	aK9rC6ueDsn75DGf6byapCCVNRc4U38lK2Ks7SMCfZsJP8vpgECRpreB//EZ9AbL9lQA4/UF2SMJ4
	UPp7ECRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPAUm-000hck-Ny; Tue, 01 Mar 2022 21:57:24 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPAUa-000haW-40; Tue, 01 Mar 2022 21:57:13 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 491D322239;
 Tue,  1 Mar 2022 22:57:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646171830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fRigi8y5w+yR/9xpIUm4pHiTi8KF2lWeh6zWkolfhU=;
 b=l46o8QDiW6mpCEEnUX03TjUoYWd+UybpYnZPN54Spt80AHR5oAGHvQVn9bvgMrIrcWreqn
 ZAXUJtWm4n32M4g7BjGoTL5ApGvoUGZmQrKuO+IhmtsOqGBa/EyIiwfLS8Q4npwA1Mdedq
 0hnxgHSfohYK8KtF/dQ/QVFg/jeoA3s=
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 22:57:10 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 3/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
In-Reply-To: <20220228134505.203270-4-tudor.ambarus@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-4-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <67810d13180a2718ad7ccc28815d2894@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_135712_351501_809CD10E 
X-CRM114-Status: GOOD (  23.87  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 nicolas.ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-02-28 14:45, schrieb Tudor Ambarus:
> Macronix has a bad habbit of reusing flash IDs. While MX25L3233F 
> supports
> RDSFDP opcode, MX25L3205D does not support it and does not recommend
> issuing opcodes that are not supported ("It is not recommended to adopt
> any other code not in the command definition table, which will 
> potentially
> enter the hidden mode.").
> 
> We tested the RDSFDP on the MX25L3205D and the conclusion is that the
> flash didn't reply anything. Given that it is unlikely that RDSFDP will
> cause any problems for the old MX25L3205D, differentiate between the 
> two
> flashes by parsing SFDP.
> 
> Tested MX25L3233F. Generated a 256 Kbyte random data and did an erase,
> write, read back and compare test. The flash uses for reads
> SPINOR_OP_READ_1_4_4 0xeb, for erases SPINOR_OP_BE_4K 0x20, and for 
> writes
> SPINOR_OP_PP 0x02.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> #  cat
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
> c22016
> # cat
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
> macronix
> # cat
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
> mx25l3233f
> # cat
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> > mx25l3233f-sfdp
> 
> 
> # xxd -p mx25l3233f-sfdp
> 53464450000101ff00000109300000ffc2000104600000ffffffffffffff
> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0144eb086b
> 083b04bbeeffffffffff00ffffff00ff0c200f5210d800ffffffffffffff
> ffffffffffff003650269cf97764fecfffffffffffff

Is quad enable working or has this the same problem as
the macronix flash in patch 4? Judging by the length of the SFDP
this also lacks the required information to select an
appropriate enable method. I haven't had closer look though.

> 
> # sha1sum mx25l3233f-sfdp
> 1b6e0f75b4a6d08d570082992455affa72b2dc81  mx25l3233f-sfdp
> 
>  drivers/mtd/spi-nor/macronix.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c 
> b/drivers/mtd/spi-nor/macronix.c
> index d81a4cb2812b..2754bbef3d2e 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,24 @@
> 
>  #include "core.h"
> 
> +static int mx25l3205d_post_bfpt_fixups(struct spi_nor *nor,
> +				const struct sfdp_parameter_header *bfpt_header,
> +				const struct sfdp_bfpt *bfpt)
> +{
> +	/*
> +	 * Macronix has a bad habit of reusing flash IDs: MX25L3233F collides
> +	 * with MX25L3205D. MX25L3233F defines SFDP tables, while the older
> +	 * variant does not.
> +	 */
> +	nor->name = "mx25l3233f";
> +
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups mx25l3205d_fixups = {
> +	.post_bfpt = mx25l3205d_post_bfpt_fixups,
> +};
> +
>  static int
>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>  			    const struct sfdp_parameter_header *bfpt_header,
> @@ -44,7 +62,10 @@ static const struct flash_info macronix_nor_parts[] 
> = {
>  	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32)
>  		NO_SFDP_FLAGS(SECT_4K) },
>  	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64)
> -		NO_SFDP_FLAGS(SECT_4K) },
> +		/* ID collision with mx25l3233f. */
> +		PARSE_SFDP
> +		NO_SFDP_FLAGS(SECT_4K)
> +		.fixups = &mx25l3205d_fixups },
>  	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64)
>  		NO_SFDP_FLAGS(SECT_4K) },
>  	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

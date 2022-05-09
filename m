Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D89C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 08:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RJPebdjKYrL0g1u6TNO8hlpqaeN6lKBCsl/51YliEg=; b=xIXD0j1E+OOjIqRt53j6W5z8lt
	E6xiLoPOeK1zQn6gZY9106OSP2yqIfrc72flKXahE5GfMjDbewIjeqPY9kZEmIEH2xW53sbvVmDB6
	xHZRMpF43xGdr+Zc6/2/wZuofJ9PuljpPSqf8VUilSTu+zLXFcSSX75KoZhhQgNPQ1Neu8RvYHSlp
	82FTTHLZRpTLA6luObZEhtS/gVSPUol2drUU61ThzatV+oo5VThpftGKj4GwQnNKXry96Xax3ts/K
	1S23Xxoy0k5lZ6h7bID4gujf10H1ESrpAmfHvPAaKmCX9tGQBshPGIExQ48r67OOG7DGdF9OJyIGU
	uZPV3jDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnyd9-00D4pf-Ad; Mon, 09 May 2022 08:20:35 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnycx-00D4nk-1A; Mon, 09 May 2022 08:20:25 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7ED4822239;
 Mon,  9 May 2022 10:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652084417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6f1TBH+COXI1PwND1GIIasif+oFluPhIWcr3mTeh3w=;
 b=drn6vOHeupGbeHAiIcV3396mhxQ9FzHDrlyWkHYJ2Ju1SBLW8iH9s3/G46VJpT/aM2EKnG
 hSn9ySPJLplHpop3Fu09civCrppHSg6Qizvo6nvTUqldO2Lf6EdDAYD5tKO6Q6Yvkd4fL9
 49Zkt7i/XqiYj/LZc6dIQt6AX61F9rk=
MIME-Version: 1.0
Date: Mon, 09 May 2022 10:20:14 +0200
From: Michael Walle <michael@walle.cc>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven
 <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
In-Reply-To: <20220502185613.83483-1-biju.das.jz@bp.renesas.com>
References: <20220502185613.83483-1-biju.das.jz@bp.renesas.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <27018c54344051e409161b7554dfa49f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_012023_452214_4096AD94 
X-CRM114-Status: GOOD (  22.78  )
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

Am 2022-05-02 20:56, schrieb Biju Das:
> Add support for Renesas AT25QL128A serial nor flash.
> Details of flash chip can be found here [1]
> 
> [1] 
> https://www.dialog-semiconductor.com/sites/default/files/2022-04/DS-AT25QL128A-129F-022022.pdf
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> $  xxd -p sfdp
> 53464450060101ff00060110300000ff1f00010280000001ffffffffffff
> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> 083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
> 01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
> ffffffffffffffff501650190000ffff

Thanks!

> :~# md5sum
> /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> 23e3ec56b5b8f986d0488ba4727239dd
> 
> ~# cat
> /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
> 1f4218
> 
> ~# cat
> /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/partname
> at25ql128a
> 
> ~# cat
> /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
> renesas
> 
> RFC->v1:
>  * Moved the flash definitions to atmel.c
>  * Remove macro related to locking as it is untested.
>  * Replaced INFO macro with SNOR_ID3
> 
> RFC:
>  *
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220501185512.51158-1-biju.das.jz@bp.renesas.com/
> ---
>  drivers/mtd/spi-nor/atmel.c | 55 +++++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.c  |  1 +
>  drivers/mtd/spi-nor/core.h  |  1 +
>  3 files changed, 57 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 656dd80a0be7..61cff6de7db2 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -10,6 +10,15 @@
> 
>  #define ATMEL_SR_GLOBAL_PROTECT_MASK GENMASK(5, 2)
> 
> +#define SNOR_ID3(_jedec_id) \
> +	.id = { \
> +		((_jedec_id) >> 16) & 0xff, \
> +		((_jedec_id) >> 8) & 0xff, \
> +		(_jedec_id) & 0xff, \
> +	}, \
> +	.id_len = 3, \
> +	.parse_sfdp = true

Put that into core.h below the INFO macros.

> +
>  /*
>   * The Atmel AT25FS010/AT25FS040 parts have some weird configuration 
> for the
>   * block protection bits. We don't support them. But legacy behavior 
> in linux
> @@ -204,6 +213,52 @@ static const struct flash_info atmel_nor_parts[] = 
> {
>  		NO_SFDP_FLAGS(SECT_4K) },
>  };
> 
> +static const struct flash_info renesas_nor_parts[] = {
> +	{ "at25ql128a", SNOR_ID3(0x1f4218) },

Put that into the atmel list, no need for an own list.

> +};
> +
> +/**
> + * renesas_nor_set_4byte_addr_mode() - Set 4-byte address mode for 
> Renesas
> + * flashes.
> + * @nor:	pointer to 'struct spi_nor'.
> + * @enable:	true to enter the 4-byte address mode, false to exit the 
> 4-byte
> + *		address mode.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int renesas_nor_set_4byte_addr_mode(struct spi_nor *nor, bool 
> enable)

Please expand the SFDP parser. This should be contained in 16th dword,
there.

> +{
> +	int ret;
> +
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
> +	ret = spi_nor_set_4byte_addr_mode(nor, enable);
> +	if (ret)
> +		return ret;
> +
> +	return spi_nor_write_disable(nor);
> +}
> +
> +static void renesas_nor_default_init(struct spi_nor *nor)
> +{
> +	nor->flags &= ~SNOR_F_HAS_16BIT_SR;

Why is that?

> +	nor->params->quad_enable = NULL;
> +	nor->params->set_4byte_addr_mode = renesas_nor_set_4byte_addr_mode;
> +}
> +
> +static const struct spi_nor_fixups renesas_nor_fixups = {
> +	.default_init = renesas_nor_default_init,
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_renesas = {
> +	.name = "renesas",
> +	.parts = renesas_nor_parts,
> +	.nparts = ARRAY_SIZE(renesas_nor_parts),
> +	.fixups = &renesas_nor_fixups,
> +};

Not needed.

-michael

> +
>  const struct spi_nor_manufacturer spi_nor_atmel = {
>  	.name = "atmel",
>  	.parts = atmel_nor_parts,
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b4f141ad9c9c..ba9f222da00b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1621,6 +1621,7 @@ static const struct spi_nor_manufacturer
> *manufacturers[] = {
>  	&spi_nor_issi,
>  	&spi_nor_macronix,
>  	&spi_nor_micron,
> +	&spi_nor_renesas,
>  	&spi_nor_st,
>  	&spi_nor_spansion,
>  	&spi_nor_sst,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index b7fd760e3b47..3d2e39329079 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -511,6 +511,7 @@ extern const struct spi_nor_manufacturer 
> spi_nor_intel;
>  extern const struct spi_nor_manufacturer spi_nor_issi;
>  extern const struct spi_nor_manufacturer spi_nor_macronix;
>  extern const struct spi_nor_manufacturer spi_nor_micron;
> +extern const struct spi_nor_manufacturer spi_nor_renesas;
>  extern const struct spi_nor_manufacturer spi_nor_st;
>  extern const struct spi_nor_manufacturer spi_nor_spansion;
>  extern const struct spi_nor_manufacturer spi_nor_sst;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

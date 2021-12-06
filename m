Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4ADC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/v3U2vrqa5L5iQXVZZ5/J4dNe/aL9mz7pt92ubIfQZc=; b=GV1yagz+4EyXZw
	zJJQ8K4NMaLIEFWQonXhPt1txdTYV+bUugC5uXNPMtYfIIAXWgdMfWEeJ1Ca8rvp88BSA97iBXF1U
	ykHFW/nrjI6eEG3PwoEoGn5HlJdaFf7xVCWHhNcfWVzydoTBbRP0LT7GpMMPeImfD2MeG2JGnvDlG
	qRfwYb+xWJZg//wtP6+rJJ2mMaDMcHwvnvWzibsih4PBy9lM+46rJPVy8WUuJmfapR5KBl+mg2F2k
	9H/vwP/fJDzzKXUPotwu5N3d7zxOCPhDEvwQPO3QZzZxrKRUpy6SwTcu1xpKDSQ5jj6bUcpPfsXF9
	khpbl9qlImwHLDNai06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFXt-004Mai-7m; Mon, 06 Dec 2021 15:04:49 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFXo-004MXU-AF; Mon, 06 Dec 2021 15:04:46 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B6F4Fce051926;
 Mon, 6 Dec 2021 09:04:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638803055;
 bh=wruBA6zsjv1Rf8NctYADKtc8E62M/IAHwiEvp8nwAUk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Kye6OPj/Zgh+KyrIPY3qg7/uOpUs8w+cvgehPQWvHVrzo+OIkZq9ZhhYpUaxsLyJz
 +14N8adEA8HIVxVsZJsWemC6roKPSY2MYGLYgG7nr+7cKH0FzeVSEBlYlI236ThfSU
 /WAT3imZLeTtZwMXswIHUfXq1n1I8Ge+/nESPfRs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B6F4Fh7116549
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 Dec 2021 09:04:15 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 6
 Dec 2021 09:04:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 6 Dec 2021 09:04:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B6F4Ex3034484;
 Mon, 6 Dec 2021 09:04:14 -0600
Date: Mon, 6 Dec 2021 20:34:13 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v5 09/14] mtd: spi-nor: core: Init all flash parameters
 based on SFDP where possible
Message-ID: <20211206150411.wj2fl36dngwwawcc@ti.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
 <20211203142256.47370-10-tudor.ambarus@microchip.com>
 <20211206122244.in6pzwjnxxo7yd32@ti.com>
 <57890ba8-c0f8-b50a-7126-d74b92537f2e@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57890ba8-c0f8-b50a-7126-d74b92537f2e@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_070444_672926_11011871 
X-CRM114-Status: GOOD (  47.46  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 06/12/21 01:52PM, Tudor.Ambarus@microchip.com wrote:
> On 12/6/21 2:22 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 03/12/21 04:22PM, Tudor Ambarus wrote:
> >> New flash additions that support SFDP should be declared with
> >> PARSE_SFDP and with all the other flags that are not SFDP
> >> discoverable.
> >>
> >> Keep the old way of initializing the flash, until all the flashes
> >> are converted to use either PARSE_SFDP or SPI_NOR_SKIP_SFDP.
> >>
> >> Flashes that declare PARSE_SFDP do not have a roll-back mechanism
> >> because if spi_nor_parse_sfdp() returns an error it means that either
> >> BFPT is not supported, thus SFDP is not supported and the user didn't
> >> correctly declared the flash_info entry, or some memalloc failed.
> >> Either way we should return an error. The rest of the SFDP tables are
> >> optional, if one of the optional SFDP tables fails, we just continue.
> >> We would like to get rid of the default_init() hook, so the
> >> spi_nor_manufacturer_init_params() is not called in the new sequnce
> >> of flash initialization that is based solely on SFDP.
> >>
> >> Split spi_nor_info_init_params() in spi_nor_init_default_params()
> >> and spi_nor_no_sfdp_init_params(). spi_nor_init_default_params() is
> >> called for all the flashes regardless if they support SFDP or not.
> >> spi_nor_no_sfdp_init_params() is called just for the flashes that
> >> do not define SFDP and initializes parameters and setting solely
> >> based on flash_info data.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> >>  drivers/mtd/spi-nor/core.c | 194 ++++++++++++++++++++++---------------
> >>  1 file changed, 116 insertions(+), 78 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index 86bbd1ca22fc..d5eaf9a705ae 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -2509,74 +2509,21 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
> >>  }
> >>
> >>  /**
> >> - * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
> >> - * based on JESD216 SFDP standard.
> >> + * spi_nor_no_sfdp_init_params() - Initialize the flash's parameters and
> >> + * settings based on nor->info->sfdp_flags. This method should be called only by
> >> + * flashes that do not define SFDP tables. If the flash supports SFDP but the
> >> + * information is wrong and the settings from this function can not be retrieved
> >> + * by parsing SFDP, one should instead use the fixup hooks and update the wrong
> > 
> > s/fixup hooks/fixup flags/ ?
> 
> fixup hooks is fine if we want to fix a wrong SFDP table.
> fixup flags for settings that are not SFDP discoverable, i.e. where the table
> is missing.

Ok.

> 
> 3/ FIXUP_FLAGS: flags that indicate support that can be discovered
>    via SFDP ideally, but can not be discovered for this particular flash
>    because the SFDP table that indicates this support is not defined by
>    the flash. In case the table for this support is defined but has wrong
>    values, one should instead use a post_sfdp() hook to set the SNOR_F
>    equivalent flag.
> > 
> >> + * bits.
> >>   * @nor:     pointer to a 'struct spi_nor'.
> >> - *
> >> - * The method has a roll-back mechanism: in case the SFDP parsing fails, the
> >> - * legacy flash parameters and settings will be restored.
> >>   */
> >> -static void spi_nor_sfdp_init_params(struct spi_nor *nor)
> >> -{
> >> -     struct spi_nor_flash_parameter sfdp_params;
> >> -
> >> -     memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
> >> -
> >> -     if (spi_nor_parse_sfdp(nor)) {
> >> -             memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
> >> -             nor->addr_width = 0;
> >> -             nor->flags &= ~SNOR_F_4B_OPCODES;
> >> -     }
> >> -}
> > [...]
> >> +
> >> +/**
> >> + * spi_nor_init_params_deprecated() - Deprecated way of initializing flash
> >> + * parameters and settings.
> >> + * @nor:     pointer to a 'struct spi_nor'.
> >> + *
> >> + * The method assumes that flash doesn't support SFDP so it initializes flash
> >> + * parameters in spi_nor_no_sfdp_init_params() which later on can be overwritten
> >> + * when parsing SFDP, if supported.
> >> + */
> >> +static void spi_nor_init_params_deprecated(struct spi_nor *nor)
> >> +{
> >> +     spi_nor_no_sfdp_init_params(nor);
> >> +
> >> +     spi_nor_manufacturer_init_params(nor);
> >> +
> >> +     if ((SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_OCTAL_READ |
> >> +          SPI_NOR_OCTAL_DTR_READ) &&
> >> +         !(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP))
> >> +             spi_nor_sfdp_init_params_deprecated(nor);
> >> +}
> >> +
> > [...]
> >> @@ -2773,24 +2807,28 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
> >>   * parameters that are not declared in the JESD216 SFDP standard, or where SFDP
> >>   * tables are not defined at all.
> >>   *           spi_nor_late_init_params()
> >> + *
> >> + * Return: 0 on success, -errno otherwise.
> >>   */
> >>  static int spi_nor_init_params(struct spi_nor *nor)
> >>  {
> >> +     int ret;
> >> +
> >>       nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params), GFP_KERNEL);
> >>       if (!nor->params)
> >>               return -ENOMEM;
> >>
> >> -     spi_nor_info_init_params(nor);
> >> -
> >> -     spi_nor_manufacturer_init_params(nor);
> >> +     spi_nor_init_default_params(nor);
> >>
> >> -     if ((nor->info->parse_sfdp ||
> >> -          (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
> >> -                                       SPI_NOR_QUAD_READ |
> >> -                                       SPI_NOR_OCTAL_READ |
> >> -                                       SPI_NOR_OCTAL_DTR_READ))) &&
> >> -         !(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP))
> >> -             spi_nor_sfdp_init_params(nor);
> >> +     if (nor->info->parse_sfdp) {
> >> +             ret = spi_nor_parse_sfdp(nor);
> >> +             if (ret) {
> >> +                     dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
> >> +                     return ret;
> >> +             }
> >> +     } else {
> >> +             spi_nor_init_params_deprecated(nor);
> > 
> > Hmm, a flash without SFDP would always go via the "deprecated" path even
> > if it is a new entry. It makes no difference in practice, but is just
> > slightly confusing logically. Can we make this a bit clearer? How about
> > this:
> > 
> >   if (nor->info->parse_sfdp) {
> >         ...
> >   } else if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) {
> >         spi_nor_no_sfdp_init_params();
> >         spi_nor_manufacturer_init_params();
> >   } else {
> >         spi_nor_init_params_deprecated();
> >   }
> > 
> >> +     }
> 
> Ok, will do. Can I add your R-b tag on a local v6 with this change that you
> proposed? It will spare me of sending v6.

Sure, go ahead.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A11C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 11:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cif6tlvw0Ct9111D8DzCCXpjSjAj9YMuDcYhgQd3Zic=; b=C0OUjXXMDNmdEA
	xOcAHbjSNqQz8nYnhxQmbE1C7loLsM9cws/M6p+rQWlHu6xh3+OTfXrSlvGUTKcEyYqKM3j2wElPJ
	3FWe8aohDPajUJqHqO5Yma6CVdk1n+5HgzUMd7CM2GLFSLKwK5qensg0r23Sy6t8lOYyKqwWxrU7K
	UIJnxnyJFOVf8nsRUXWYCxZxeCnAtZ8KQLCJSCv0Nxfl0HnrsVy8CdglI069BSixoKv6fJilSdrOg
	uOXtIWb4k4YaQMjfb0Qw4n6wNbZs5yzj2w/yRps9O7vzpYKfSwu10odSFD1ms8rw/3ggXxnNwuCH7
	ParivBU7hvIKjtwpw7ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD30f-00FT5h-Qe; Thu, 27 Jan 2022 11:32:13 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD30b-00FT3s-EU
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 11:32:11 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 742AB2000B;
 Thu, 27 Jan 2022 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643283127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJ3dQkEhnnJUHoZBOZFn0R++5XVMRHl5USu0CVEc2xU=;
 b=pAQK6AW2lZNDp7O0BkgGBq4us168lWmbQ/b4qn4ym0Uion6qWglsoLjQeEWIV+uhZ6kID1
 wL9wwghG1xoIvRRKuIXUaYcgm+VZlNsVH/qNBikp+1VvlRYSK7gmS834Kw+ZU/PHPrb7qT
 gxcvMe9aITe32RocznthtxT0I1MjGJOWZvaVeZwCcyEA3u/vCB8TKhhCSCG9zmEI5poipG
 EywlYXyfoErv/dxVZyJPUKC1+8rAJf8urg8tIsOUI1sWMTnyZHyjISPDBpGctNPHce0Zfi
 eUdy0hXeH3mqihbpio0bfyxc1PNmlENzs5MdSoN9hQgkKJfxSj9HXGvOtJ/Khg==
Date: Thu, 27 Jan 2022 12:32:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: Fix misuses of of_match_ptr()
Message-ID: <YfKCtYR7ZrPu+waQ@piout.net>
References: <20220127110631.1064705-1-miquel.raynal@bootlin.com>
 <RQ8D6R.EBO0P9DUGF812@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <RQ8D6R.EBO0P9DUGF812@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_033209_846115_EA31EF81 
X-CRM114-Status: GOOD (  37.22  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/01/2022 11:18:27+0000, Paul Cercueil wrote:
> Hi Miquel,
> =

> Le jeu., janv. 27 2022 at 12:06:31 +0100, Miquel Raynal
> <miquel.raynal@bootlin.com> a =E9crit :
> > of_match_ptr() either expands to NULL if !CONFIG_OF, or is transparent
> > otherwise. There are several drivers using this macro which keep their
> > of_device_id array enclosed within an #ifdef CONFIG_OF check, these are
> > considered fine. However, When misused, the of_device_id array pointed
> > by this macro will produce a warning because it is finally unused when
> > compiled without OF support.
> > =

> > A number of fixes are possible:
> > - Always depend on CONFIG_OF, but this will not always work and may
> >   break boards.
> > - Enclose the compatible array by #ifdef's, this may save a bit of
> >   memory but will reduce build coverage.
> > - Tell the compiler the array may be unused, if this can be avoided,
> >   let's not do this.
> > - Just drop the macro, setting the of_device_id array for a non OF
> >   enabled platform is not an issue, it will just be unused.
> > =

> > The latter solution seems the more appropriate, so let's use it.
> =

> I disagree. The proper solution would be to not have of_match_ptr()
> conditionally defined.
> =


I disagree...

> Right now it's defined basically like this:
> #ifdef CONFIG_OF
> #define of_match_ptr(_ptr) (_ptr)
> #else
> #define of_match_ptr(_ptr) NULL
> #endif
> =

> This is bad, because in the !CONFIG_OF case, the pointer is never
> referenced, and the compiler complains about it, as you can notice.
> =

> Instead, it should be defined like this:
> #define of_match_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_OF), (_ptr))
> =

> Then in the !CONFIG_OF case the compiler will see the array as effectively
> unused, and drop it as needed.
> =

> We are doing the exact same work with the PM callbacks, with the new
> pm_ptr() macro.
> =

> Note that I don't know the behaviour of MODULE_DEVICE_TABLE(of, ...), it
> might be a good idea to make it a NOP if !CONFIG_OF so that the array is
> removed by the compiler as dead code (if it's not the case already).
> =


... because ACPI platforms can use the OF table to probe drivers even
when they don't have OF support.

> Cheers,
> -Paul
> =

> > =

> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/devices/mchp23k256.c                | 2 +-
> >  drivers/mtd/devices/mchp48l640.c                | 2 +-
> >  drivers/mtd/nand/raw/atmel/nand-controller.c    | 2 +-
> >  drivers/mtd/nand/raw/atmel/pmecc.c              | 2 +-
> >  drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 2 +-
> >  drivers/mtd/nand/raw/ingenic/jz4780_bch.c       | 2 +-
> >  drivers/mtd/nand/raw/mtk_ecc.c                  | 2 +-
> >  drivers/mtd/nand/raw/omap2.c                    | 2 +-
> >  drivers/mtd/nand/raw/renesas-nand-controller.c  | 2 +-
> >  drivers/mtd/nand/raw/sh_flctl.c                 | 2 +-
> >  10 files changed, 10 insertions(+), 10 deletions(-)
> > =

> > diff --git a/drivers/mtd/devices/mchp23k256.c
> > b/drivers/mtd/devices/mchp23k256.c
> > index a8b31bddf14b..bf51eebf052c 100644
> > --- a/drivers/mtd/devices/mchp23k256.c
> > +++ b/drivers/mtd/devices/mchp23k256.c
> > @@ -234,7 +234,7 @@ MODULE_DEVICE_TABLE(of, mchp23k256_of_table);
> >  static struct spi_driver mchp23k256_driver =3D {
> >  	.driver =3D {
> >  		.name	=3D "mchp23k256",
> > -		.of_match_table =3D of_match_ptr(mchp23k256_of_table),
> > +		.of_match_table =3D mchp23k256_of_table,
> >  	},
> >  	.probe		=3D mchp23k256_probe,
> >  	.remove		=3D mchp23k256_remove,
> > diff --git a/drivers/mtd/devices/mchp48l640.c
> > b/drivers/mtd/devices/mchp48l640.c
> > index 231a10790196..4ec505b3f4a6 100644
> > --- a/drivers/mtd/devices/mchp48l640.c
> > +++ b/drivers/mtd/devices/mchp48l640.c
> > @@ -362,7 +362,7 @@ MODULE_DEVICE_TABLE(of, mchp48l640_of_table);
> >  static struct spi_driver mchp48l640_driver =3D {
> >  	.driver =3D {
> >  		.name	=3D "mchp48l640",
> > -		.of_match_table =3D of_match_ptr(mchp48l640_of_table),
> > +		.of_match_table =3D mchp48l640_of_table,
> >  	},
> >  	.probe		=3D mchp48l640_probe,
> >  	.remove		=3D mchp48l640_remove,
> > diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c
> > b/drivers/mtd/nand/raw/atmel/nand-controller.c
> > index f3276ee9e4fe..4ecbaccf5526 100644
> > --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> > +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> > @@ -2648,7 +2648,7 @@ static
> > SIMPLE_DEV_PM_OPS(atmel_nand_controller_pm_ops, NULL,
> >  static struct platform_driver atmel_nand_controller_driver =3D {
> >  	.driver =3D {
> >  		.name =3D "atmel-nand-controller",
> > -		.of_match_table =3D of_match_ptr(atmel_nand_controller_of_ids),
> > +		.of_match_table =3D atmel_nand_controller_of_ids,
> >  		.pm =3D &atmel_nand_controller_pm_ops,
> >  	},
> >  	.probe =3D atmel_nand_controller_probe,
> > diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c
> > b/drivers/mtd/nand/raw/atmel/pmecc.c
> > index 498e41ccabbd..43ebd78816c0 100644
> > --- a/drivers/mtd/nand/raw/atmel/pmecc.c
> > +++ b/drivers/mtd/nand/raw/atmel/pmecc.c
> > @@ -1003,7 +1003,7 @@ static int atmel_pmecc_probe(struct
> > platform_device *pdev)
> >  static struct platform_driver atmel_pmecc_driver =3D {
> >  	.driver =3D {
> >  		.name =3D "atmel-pmecc",
> > -		.of_match_table =3D of_match_ptr(atmel_pmecc_match),
> > +		.of_match_table =3D atmel_pmecc_match,
> >  	},
> >  	.probe =3D atmel_pmecc_probe,
> >  };
> > diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> > b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> > index b18861bdcdc8..ff26c10f295d 100644
> > --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> > +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> > @@ -567,7 +567,7 @@ static struct platform_driver ingenic_nand_driver =
=3D
> > {
> >  	.remove		=3D ingenic_nand_remove,
> >  	.driver	=3D {
> >  		.name	=3D DRV_NAME,
> > -		.of_match_table =3D of_match_ptr(ingenic_nand_dt_match),
> > +		.of_match_table =3D ingenic_nand_dt_match,
> >  	},
> >  };
> >  module_platform_driver(ingenic_nand_driver);
> > diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> > b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> > index d67dbfff76cc..12b5b0484fe9 100644
> > --- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> > +++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> > @@ -260,7 +260,7 @@ static struct platform_driver jz4780_bch_driver =3D=
 {
> >  	.probe		=3D jz4780_bch_probe,
> >  	.driver	=3D {
> >  		.name	=3D "jz4780-bch",
> > -		.of_match_table =3D of_match_ptr(jz4780_bch_dt_match),
> > +		.of_match_table =3D jz4780_bch_dt_match,
> >  	},
> >  };
> >  module_platform_driver(jz4780_bch_driver);
> > diff --git a/drivers/mtd/nand/raw/mtk_ecc.c
> > b/drivers/mtd/nand/raw/mtk_ecc.c
> > index 1b47964cb6da..e7df3dac705e 100644
> > --- a/drivers/mtd/nand/raw/mtk_ecc.c
> > +++ b/drivers/mtd/nand/raw/mtk_ecc.c
> > @@ -579,7 +579,7 @@ static struct platform_driver mtk_ecc_driver =3D {
> >  	.probe  =3D mtk_ecc_probe,
> >  	.driver =3D {
> >  		.name  =3D "mtk-ecc",
> > -		.of_match_table =3D of_match_ptr(mtk_ecc_dt_match),
> > +		.of_match_table =3D mtk_ecc_dt_match,
> >  #ifdef CONFIG_PM_SLEEP
> >  		.pm =3D &mtk_ecc_pm_ops,
> >  #endif
> > diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
> > index f0bbbe401e76..58c32a11792e 100644
> > --- a/drivers/mtd/nand/raw/omap2.c
> > +++ b/drivers/mtd/nand/raw/omap2.c
> > @@ -2298,7 +2298,7 @@ static struct platform_driver omap_nand_driver =
=3D {
> >  	.remove		=3D omap_nand_remove,
> >  	.driver		=3D {
> >  		.name	=3D DRIVER_NAME,
> > -		.of_match_table =3D of_match_ptr(omap_nand_ids),
> > +		.of_match_table =3D omap_nand_ids,
> >  	},
> >  };
> > =

> > diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c
> > b/drivers/mtd/nand/raw/renesas-nand-controller.c
> > index 428e08362956..6db063b230a9 100644
> > --- a/drivers/mtd/nand/raw/renesas-nand-controller.c
> > +++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
> > @@ -1412,7 +1412,7 @@ MODULE_DEVICE_TABLE(of, rnandc_id_table);
> >  static struct platform_driver rnandc_driver =3D {
> >  	.driver =3D {
> >  		.name =3D "renesas-nandc",
> > -		.of_match_table =3D of_match_ptr(rnandc_id_table),
> > +		.of_match_table =3D rnandc_id_table,
> >  	},
> >  	.probe =3D rnandc_probe,
> >  	.remove =3D rnandc_remove,
> > diff --git a/drivers/mtd/nand/raw/sh_flctl.c
> > b/drivers/mtd/nand/raw/sh_flctl.c
> > index 13df4bdf792a..b85b9c6fcc42 100644
> > --- a/drivers/mtd/nand/raw/sh_flctl.c
> > +++ b/drivers/mtd/nand/raw/sh_flctl.c
> > @@ -1220,7 +1220,7 @@ static struct platform_driver flctl_driver =3D {
> >  	.remove		=3D flctl_remove,
> >  	.driver =3D {
> >  		.name	=3D "sh_flctl",
> > -		.of_match_table =3D of_match_ptr(of_flctl_match),
> > +		.of_match_table =3D of_flctl_match,
> >  	},
> >  };
> > =

> > --
> > 2.27.0
> > =

> =

> =


-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

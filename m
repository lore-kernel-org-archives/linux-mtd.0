Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RUr40-0007KU-QE
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2011 02:35:27 +0000
Received: by bkat2 with SMTP id t2so8917338bka.36
 for <linux-mtd@lists.infradead.org>; Sun, 27 Nov 2011 18:35:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1322397903.2799.5.camel@phoenix>
References: <1322397903.2799.5.camel@phoenix>
From: Wan ZongShun <mcuos.com@gmail.com>
Date: Mon, 28 Nov 2011 10:34:59 +0800
Message-ID: <CAKT61h_oUPRo=Ea_t=w=+VLBeEkAiC9CSPKADebYfEJZ0QUE4A@mail.gmail.com>
Subject: Re: [PATCH] mtd: convert drivers/mtd/* to use module_platform_driver()
To: Axel Lin <axel.lin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Sukumar Ghorai <s-ghorai@ti.com>, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Manuel Lauss <manuel.lauss@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2011/11/27 Axel Lin <axel.lin@gmail.com>:
> This patch converts the drivers in drivers/mtd/* to use the
> module_platform_driver() macro which makes the code smaller and a bit
> simpler.
>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Jiandong Zheng <jdzheng@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Wan ZongShun <mcuos.com@gmail.com>
> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Cc: Jamie Iles <jamie@jamieiles.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Manuel Lauss <manuel.lauss@googlemail.com>
> Cc: Vimal Singh <vimal.newwork@gmail.com>
> Cc: Andres Salomon <dilinger@queued.net>
> Cc: Sukumar Ghorai <s-ghorai@ti.com>
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
> =C2=A0drivers/mtd/maps/bcm963xx-flash.c =C2=A0 | =C2=A0 13 +------------
> =C2=A0drivers/mtd/maps/bfin-async-flash.c | =C2=A0 12 +-----------
> =C2=A0drivers/mtd/maps/gpio-addr-flash.c =C2=A0| =C2=A0 12 +-----------
> =C2=A0drivers/mtd/maps/ixp2000.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 12 +-----------
> =C2=A0drivers/mtd/maps/ixp4xx.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 14 +-------------
> =C2=A0drivers/mtd/maps/latch-addr-flash.c | =C2=A0 12 +-----------
> =C2=A0drivers/mtd/maps/physmap_of.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 13 +---=
---------
> =C2=A0drivers/mtd/maps/pxa2xx-flash.c =C2=A0 =C2=A0 | =C2=A0 13 +--------=
----
> =C2=A0drivers/mtd/maps/rbtx4939-flash.c =C2=A0 | =C2=A0 13 +------------
> =C2=A0drivers/mtd/maps/sa1100-flash.c =C2=A0 =C2=A0 | =C2=A0 13 +--------=
----
> =C2=A0drivers/mtd/maps/sun_uflash.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 13 +---=
---------
> =C2=A0drivers/mtd/nand/ams-delta.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 12=
 +-----------
> =C2=A0drivers/mtd/nand/au1550nd.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 12=
 +-----------
> =C2=A0drivers/mtd/nand/bcm_umi_nand.c =C2=A0 =C2=A0 | =C2=A0 13 +--------=
----
> =C2=A0drivers/mtd/nand/fsl_elbc_nand.c =C2=A0 =C2=A0| =C2=A0 13 +--------=
----
> =C2=A0drivers/mtd/nand/fsl_upm.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 12 +-----------
> =C2=A0drivers/mtd/nand/jz4740_nand.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 12 +---=
--------
> =C2=A0drivers/mtd/nand/mpc5121_nfc.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 14 +---=
----------
> =C2=A0drivers/mtd/nand/ndfc.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 13 +------------
> =C2=A0drivers/mtd/nand/nomadik_nand.c =C2=A0 =C2=A0 | =C2=A0 14 +--------=
-----
> =C2=A0drivers/mtd/nand/nuc900_nand.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 13 +---=
---------
> =C2=A0drivers/mtd/nand/omap2.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 15 +--------------
> =C2=A0drivers/mtd/nand/pasemi_nand.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 12 +---=
--------
> =C2=A0drivers/mtd/nand/plat_nand.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 13=
 +------------
> =C2=A0drivers/mtd/nand/pxa3xx_nand.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 12 +---=
--------
> =C2=A0drivers/mtd/nand/sharpsl.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 12 +-----------
> =C2=A0drivers/mtd/nand/socrates_nand.c =C2=A0 =C2=A0| =C2=A0 13 +--------=
----
> =C2=A0drivers/mtd/nand/tmio_nand.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 13=
 +------------
> =C2=A0drivers/mtd/onenand/generic.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 16 ++--=
------------
> =C2=A0drivers/mtd/onenand/samsung.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 13 +---=
---------
> =C2=A030 files changed, 31 insertions(+), 356 deletions(-)
>
> diff --git a/drivers/mtd/maps/bcm963xx-flash.c b/drivers/mtd/maps/bcm963x=
x-flash.c
> index 736ca10..56927f5 100644
> --- a/drivers/mtd/maps/bcm963xx-flash.c
> +++ b/drivers/mtd/maps/bcm963xx-flash.c
> @@ -257,18 +257,7 @@ static struct platform_driver bcm63xx_mtd_dev =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init bcm963xx_mtd_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&bcm63xx_mtd_dev);
> -}
> -
> -static void __exit bcm963xx_mtd_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&bcm63xx_mtd_dev);
> -}
> -
> -module_init(bcm963xx_mtd_init);
> -module_exit(bcm963xx_mtd_exit);
> +module_platform_driver(bcm63xx_mtd_dev);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_DESCRIPTION("Broadcom BCM63xx MTD driver for CFE and RedBoot=
");
> diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-=
async-flash.c
> index 6d6b2b5..650126c 100644
> --- a/drivers/mtd/maps/bfin-async-flash.c
> +++ b/drivers/mtd/maps/bfin-async-flash.c
> @@ -190,17 +190,7 @@ static struct platform_driver bfin_flash_driver =3D =
{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init bfin_flash_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&bfin_flash_driver=
);
> -}
> -module_init(bfin_flash_init);
> -
> -static void __exit bfin_flash_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&bfin_flash_driver);
> -}
> -module_exit(bfin_flash_exit);
> +module_platform_driver(bfin_flash_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_DESCRIPTION("MTD map driver for Blackfins with flash/etherne=
t on same async bank");
> diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-a=
ddr-flash.c
> index 1ec66f0..33cce89 100644
> --- a/drivers/mtd/maps/gpio-addr-flash.c
> +++ b/drivers/mtd/maps/gpio-addr-flash.c
> @@ -279,17 +279,7 @@ static struct platform_driver gpio_flash_driver =3D =
{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init gpio_flash_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&gpio_flash_driver=
);
> -}
> -module_init(gpio_flash_init);
> -
> -static void __exit gpio_flash_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&gpio_flash_driver);
> -}
> -module_exit(gpio_flash_exit);
> +module_platform_driver(gpio_flash_driver);
>
> =C2=A0MODULE_AUTHOR("Mike Frysinger <vapier@gentoo.org>");
> =C2=A0MODULE_DESCRIPTION("MTD map driver for flashes addressed physically=
 and with gpios");
> diff --git a/drivers/mtd/maps/ixp2000.c b/drivers/mtd/maps/ixp2000.c
> index 437fcd2..fc7d4d0 100644
> --- a/drivers/mtd/maps/ixp2000.c
> +++ b/drivers/mtd/maps/ixp2000.c
> @@ -246,18 +246,8 @@ static struct platform_driver ixp2000_flash_driver =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init ixp2000_flash_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&ixp2000_flash_dri=
ver);
> -}
> -
> -static void __exit ixp2000_flash_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&ixp2000_flash_driver);
> -}
> +module_platform_driver(ixp2000_flash_driver);
>
> -module_init(ixp2000_flash_init);
> -module_exit(ixp2000_flash_exit);
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Deepak Saxena <dsaxena@plexity.net>");
> =C2=A0MODULE_ALIAS("platform:IXP2000-Flash");
> diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
> index 3040901..8b54101 100644
> --- a/drivers/mtd/maps/ixp4xx.c
> +++ b/drivers/mtd/maps/ixp4xx.c
> @@ -270,19 +270,7 @@ static struct platform_driver ixp4xx_flash_driver =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init ixp4xx_flash_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&ixp4xx_flash_driv=
er);
> -}
> -
> -static void __exit ixp4xx_flash_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&ixp4xx_flash_driver);
> -}
> -
> -
> -module_init(ixp4xx_flash_init);
> -module_exit(ixp4xx_flash_exit);
> +module_platform_driver(ixp4xx_flash_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_DESCRIPTION("MTD map driver for Intel IXP4xx systems");
> diff --git a/drivers/mtd/maps/latch-addr-flash.c b/drivers/mtd/maps/latch=
-addr-flash.c
> index 119baa7..8fed58e 100644
> --- a/drivers/mtd/maps/latch-addr-flash.c
> +++ b/drivers/mtd/maps/latch-addr-flash.c
> @@ -223,17 +223,7 @@ static struct platform_driver latch_addr_flash_drive=
r =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init latch_addr_flash_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&latch_addr_flash_=
driver);
> -}
> -module_init(latch_addr_flash_init);
> -
> -static void __exit latch_addr_flash_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&latch_addr_flash_drive=
r);
> -}
> -module_exit(latch_addr_flash_exit);
> +module_platform_driver(latch_addr_flash_driver);
>
> =C2=A0MODULE_AUTHOR("David Griego <dgriego@mvista.com>");
> =C2=A0MODULE_DESCRIPTION("MTD map driver for flashes addressed physically=
 with upper "
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.=
c
> index 7d65f9d..2e6fb68 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -338,18 +338,7 @@ static struct platform_driver of_flash_driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D of_fla=
sh_remove,
> =C2=A0};
>
> -static int __init of_flash_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&of_flash_driver);
> -}
> -
> -static void __exit of_flash_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&of_flash_driver);
> -}
> -
> -module_init(of_flash_init);
> -module_exit(of_flash_exit);
> +module_platform_driver(of_flash_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Vitaly Wool <vwool@ru.mvista.com>");
> diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-fl=
ash.c
> index 2a25b67..274e399 100644
> --- a/drivers/mtd/maps/pxa2xx-flash.c
> +++ b/drivers/mtd/maps/pxa2xx-flash.c
> @@ -142,18 +142,7 @@ static struct platform_driver pxa2xx_flash_driver =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.shutdown =C2=A0 =C2=A0 =C2=A0 =3D pxa2xx_flas=
h_shutdown,
> =C2=A0};
>
> -static int __init init_pxa2xx_flash(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&pxa2xx_flash_driv=
er);
> -}
> -
> -static void __exit cleanup_pxa2xx_flash(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&pxa2xx_flash_driver);
> -}
> -
> -module_init(init_pxa2xx_flash);
> -module_exit(cleanup_pxa2xx_flash);
> +module_platform_driver(pxa2xx_flash_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Nicolas Pitre <nico@fluxnic.net>");
> diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx493=
9-flash.c
> index 0237f19..bb7d204 100644
> --- a/drivers/mtd/maps/rbtx4939-flash.c
> +++ b/drivers/mtd/maps/rbtx4939-flash.c
> @@ -137,18 +137,7 @@ static struct platform_driver rbtx4939_flash_driver =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init rbtx4939_flash_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&rbtx4939_flash_dr=
iver);
> -}
> -
> -static void __exit rbtx4939_flash_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&rbtx4939_flash_driver)=
;
> -}
> -
> -module_init(rbtx4939_flash_init);
> -module_exit(rbtx4939_flash_exit);
> +module_platform_driver(rbtx4939_flash_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_DESCRIPTION("RBTX4939 MTD map driver");
> diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-fl=
ash.c
> index fa9c0a9..ac3a290 100644
> --- a/drivers/mtd/maps/sa1100-flash.c
> +++ b/drivers/mtd/maps/sa1100-flash.c
> @@ -394,18 +394,7 @@ static struct platform_driver sa1100_mtd_driver =3D =
{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init sa1100_mtd_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&sa1100_mtd_driver=
);
> -}
> -
> -static void __exit sa1100_mtd_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&sa1100_mtd_driver);
> -}
> -
> -module_init(sa1100_mtd_init);
> -module_exit(sa1100_mtd_exit);
> +module_platform_driver(sa1100_mtd_driver);
>
> =C2=A0MODULE_AUTHOR("Nicolas Pitre");
> =C2=A0MODULE_DESCRIPTION("SA1100 CFI map driver");
> diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.=
c
> index 2d66234..175e537 100644
> --- a/drivers/mtd/maps/sun_uflash.c
> +++ b/drivers/mtd/maps/sun_uflash.c
> @@ -158,15 +158,4 @@ static struct platform_driver uflash_driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __deve=
xit_p(uflash_remove),
> =C2=A0};
>
> -static int __init uflash_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&uflash_driver);
> -}
> -
> -static void __exit uflash_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&uflash_driver);
> -}
> -
> -module_init(uflash_init);
> -module_exit(uflash_exit);
> +module_platform_driver(uflash_driver);
> diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
> index 9e6b498..3197e97 100644
> --- a/drivers/mtd/nand/ams-delta.c
> +++ b/drivers/mtd/nand/ams-delta.c
> @@ -280,17 +280,7 @@ static struct platform_driver ams_delta_nand_driver =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init ams_delta_nand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&ams_delta_nand_dr=
iver);
> -}
> -module_init(ams_delta_nand_init);
> -
> -static void __exit ams_delta_nand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&ams_delta_nand_driver)=
;
> -}
> -module_exit(ams_delta_nand_exit);
> +module_platform_driver(ams_delta_nand_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Jonathan McDowell <noodles@earth.li>");
> diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
> index 77fb4e6..73abbc3 100644
> --- a/drivers/mtd/nand/au1550nd.c
> +++ b/drivers/mtd/nand/au1550nd.c
> @@ -560,17 +560,7 @@ static struct platform_driver au1550nd_driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __deve=
xit_p(au1550nd_remove),
> =C2=A0};
>
> -static int __init au1550nd_load(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&au1550nd_driver);
> -};
> -
> -static void __exit au1550nd_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&au1550nd_driver);
> -};
> -module_init(au1550nd_load);
> -module_exit(au1550nd_exit);
> +module_platform_driver(au1550nd_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Embedded Edge, LLC");
> diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_n=
and.c
> index 46b58d6..50387fd 100644
> --- a/drivers/mtd/nand/bcm_umi_nand.c
> +++ b/drivers/mtd/nand/bcm_umi_nand.c
> @@ -546,18 +546,7 @@ static struct platform_driver nand_driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.resume =3D bcm_umi_nand_resume,
> =C2=A0};
>
> -static int __init nand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&nand_driver);
> -}
> -
> -static void __exit nand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&nand_driver);
> -}
> -
> -module_init(nand_init);
> -module_exit(nand_exit);
> +module_platform_driver(nand_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Broadcom");
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc=
_nand.c
> index eedd8ee..f2f6e87 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -971,18 +971,7 @@ static struct platform_driver fsl_elbc_nand_driver =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D fsl_elbc_nand_remove,
> =C2=A0};
>
> -static int __init fsl_elbc_nand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&fsl_elbc_nand_dri=
ver);
> -}
> -
> -static void __exit fsl_elbc_nand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&fsl_elbc_nand_driver);
> -}
> -
> -module_init(fsl_elbc_nand_init);
> -module_exit(fsl_elbc_nand_exit);
> +module_platform_driver(fsl_elbc_nand_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Freescale");
> diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
> index b4f3cc9..45df542 100644
> --- a/drivers/mtd/nand/fsl_upm.c
> +++ b/drivers/mtd/nand/fsl_upm.c
> @@ -353,17 +353,7 @@ static struct platform_driver of_fun_driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __deve=
xit_p(fun_remove),
> =C2=A0};
>
> -static int __init fun_module_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&of_fun_driver);
> -}
> -module_init(fun_module_init);
> -
> -static void __exit fun_module_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&of_fun_driver);
> -}
> -module_exit(fun_module_exit);
> +module_platform_driver(of_fun_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Anton Vorontsov <avorontsov@ru.mvista.com>");
> diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nan=
d.c
> index e266407..ac3b9f2 100644
> --- a/drivers/mtd/nand/jz4740_nand.c
> +++ b/drivers/mtd/nand/jz4740_nand.c
> @@ -423,17 +423,7 @@ static struct platform_driver jz_nand_driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init jz_nand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&jz_nand_driver);
> -}
> -module_init(jz_nand_init);
> -
> -static void __exit jz_nand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&jz_nand_driver);
> -}
> -module_exit(jz_nand_exit);
> +module_platform_driver(jz_nand_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
> diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nf=
c.c
> index 5ede647..c240cf1 100644
> --- a/drivers/mtd/nand/mpc5121_nfc.c
> +++ b/drivers/mtd/nand/mpc5121_nfc.c
> @@ -879,19 +879,7 @@ static struct platform_driver mpc5121_nfc_driver =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init mpc5121_nfc_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&mpc5121_nfc_drive=
r);
> -}
> -
> -module_init(mpc5121_nfc_init);
> -
> -static void __exit mpc5121_nfc_cleanup(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&mpc5121_nfc_driver);
> -}
> -
> -module_exit(mpc5121_nfc_cleanup);
> +module_platform_driver(mpc5121_nfc_driver);
>
> =C2=A0MODULE_AUTHOR("Freescale Semiconductor, Inc.");
> =C2=A0MODULE_DESCRIPTION("MPC5121 NAND MTD driver");
> diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
> index f8aacf4..ec68854 100644
> --- a/drivers/mtd/nand/ndfc.c
> +++ b/drivers/mtd/nand/ndfc.c
> @@ -294,18 +294,7 @@ static struct platform_driver ndfc_driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D __devexit_p(ndfc_remove),
> =C2=A0};
>
> -static int __init ndfc_nand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&ndfc_driver);
> -}
> -
> -static void __exit ndfc_nand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&ndfc_driver);
> -}
> -
> -module_init(ndfc_nand_init);
> -module_exit(ndfc_nand_exit);
> +module_platform_driver(ndfc_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Thomas Gleixner <tglx@linutronix.de>");
> diff --git a/drivers/mtd/nand/nomadik_nand.c b/drivers/mtd/nand/nomadik_n=
and.c
> index b463ecf..673dc6c 100644
> --- a/drivers/mtd/nand/nomadik_nand.c
> +++ b/drivers/mtd/nand/nomadik_nand.c
> @@ -228,19 +228,7 @@ static struct platform_driver nomadik_nand_driver =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init nand_nomadik_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 pr_info("Nomadik NAND driver\n");
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&nomadik_nand_driv=
er);
> -}
> -
> -static void __exit nand_nomadik_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&nomadik_nand_driver);
> -}
> -
> -module_init(nand_nomadik_init);
> -module_exit(nand_nomadik_exit);
> +module_platform_driver(nomadik_nand_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("ST Microelectronics (sachin.verma@st.com)");
> diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nan=
d.c
> index fa8faed..8febe46 100644
> --- a/drivers/mtd/nand/nuc900_nand.c
> +++ b/drivers/mtd/nand/nuc900_nand.c
> @@ -364,18 +364,7 @@ static struct platform_driver nuc900_nand_driver =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init nuc900_nand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&nuc900_nand_drive=
r);
> -}
> -
> -static void __exit nuc900_nand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&nuc900_nand_driver);
> -}
> -
> -module_init(nuc900_nand_init);
> -module_exit(nuc900_nand_exit);
> +module_platform_driver(nuc900_nand_driver);
>
> =C2=A0MODULE_AUTHOR("Wan ZongShun <mcuos.com@gmail.com>");
> =C2=A0MODULE_DESCRIPTION("w90p910/NUC9xx nand driver!");
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index f745f00..b3a883e 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1145,20 +1145,7 @@ static struct platform_driver omap_nand_driver =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init omap_nand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 pr_info("%s driver initializing\n", DRIVER_NAME);
> -
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&omap_nand_driver)=
;
> -}
> -
> -static void __exit omap_nand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&omap_nand_driver);
> -}
> -
> -module_init(omap_nand_init);
> -module_exit(omap_nand_exit);
> +module_platform_driver(omap_nand_driver);
>
> =C2=A0MODULE_ALIAS("platform:" DRIVER_NAME);
> =C2=A0MODULE_LICENSE("GPL");
> diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nan=
d.c
> index a97264e..974dbf8 100644
> --- a/drivers/mtd/nand/pasemi_nand.c
> +++ b/drivers/mtd/nand/pasemi_nand.c
> @@ -230,17 +230,7 @@ static struct platform_driver pasemi_nand_driver =3D
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D pasemi=
_nand_remove,
> =C2=A0};
>
> -static int __init pasemi_nand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&pasemi_nand_drive=
r);
> -}
> -module_init(pasemi_nand_init);
> -
> -static void __exit pasemi_nand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&pasemi_nand_driver);
> -}
> -module_exit(pasemi_nand_exit);
> +module_platform_driver(pasemi_nand_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Egor Martovetsky <egor@pasemi.com>");
> diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
> index ea8e123..7f2da69 100644
> --- a/drivers/mtd/nand/plat_nand.c
> +++ b/drivers/mtd/nand/plat_nand.c
> @@ -148,18 +148,7 @@ static struct platform_driver plat_nand_driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static int __init plat_nand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&plat_nand_driver)=
;
> -}
> -
> -static void __exit plat_nand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&plat_nand_driver);
> -}
> -
> -module_init(plat_nand_init);
> -module_exit(plat_nand_exit);
> +module_platform_driver(plat_nand_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Vitaly Wool");
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 9eb7f87..90d6016 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1311,17 +1311,7 @@ static struct platform_driver pxa3xx_nand_driver =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.resume =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D pxa3xx=
_nand_resume,
> =C2=A0};
>
> -static int __init pxa3xx_nand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&pxa3xx_nand_drive=
r);
> -}
> -module_init(pxa3xx_nand_init);
> -
> -static void __exit pxa3xx_nand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&pxa3xx_nand_driver);
> -}
> -module_exit(pxa3xx_nand_exit);
> +module_platform_driver(pxa3xx_nand_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_DESCRIPTION("PXA3xx NAND controller driver");
> diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
> index 619d2a5..b175c0f 100644
> --- a/drivers/mtd/nand/sharpsl.c
> +++ b/drivers/mtd/nand/sharpsl.c
> @@ -230,17 +230,7 @@ static struct platform_driver sharpsl_nand_driver =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __deve=
xit_p(sharpsl_nand_remove),
> =C2=A0};
>
> -static int __init sharpsl_nand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&sharpsl_nand_driv=
er);
> -}
> -module_init(sharpsl_nand_init);
> -
> -static void __exit sharpsl_nand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&sharpsl_nand_driver);
> -}
> -module_exit(sharpsl_nand_exit);
> +module_platform_driver(sharpsl_nand_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Richard Purdie <rpurdie@rpsys.net>");
> diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates=
_nand.c
> index 0fb24f9..e02b08b 100644
> --- a/drivers/mtd/nand/socrates_nand.c
> +++ b/drivers/mtd/nand/socrates_nand.c
> @@ -273,18 +273,7 @@ static struct platform_driver socrates_nand_driver =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __deve=
xit_p(socrates_nand_remove),
> =C2=A0};
>
> -static int __init socrates_nand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&socrates_nand_dri=
ver);
> -}
> -
> -static void __exit socrates_nand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&socrates_nand_driver);
> -}
> -
> -module_init(socrates_nand_init);
> -module_exit(socrates_nand_exit);
> +module_platform_driver(socrates_nand_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Ilya Yanok");
> diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
> index beebd95..6caa0cd 100644
> --- a/drivers/mtd/nand/tmio_nand.c
> +++ b/drivers/mtd/nand/tmio_nand.c
> @@ -533,18 +533,7 @@ static struct platform_driver tmio_driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.resume =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D tmio_r=
esume,
> =C2=A0};
>
> -static int __init tmio_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&tmio_driver);
> -}
> -
> -static void __exit tmio_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&tmio_driver);
> -}
> -
> -module_init(tmio_init);
> -module_exit(tmio_exit);
> +module_platform_driver(tmio_driver);
>
> =C2=A0MODULE_LICENSE("GPL v2");
> =C2=A0MODULE_AUTHOR("Ian Molton, Dirk Opfer, Chris Humbert, Dmitry Barysh=
kov");
> diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.=
c
> index 7813095..0ccd5bf 100644
> --- a/drivers/mtd/onenand/generic.c
> +++ b/drivers/mtd/onenand/generic.c
> @@ -115,21 +115,9 @@ static struct platform_driver generic_onenand_driver=
 =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __deve=
xit_p(generic_onenand_remove),
> =C2=A0};
>
> -MODULE_ALIAS("platform:" DRIVER_NAME);
> -
> -static int __init generic_onenand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&generic_onenand_d=
river);
> -}
> -
> -static void __exit generic_onenand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&generic_onenand_driver=
);
> -}
> -
> -module_init(generic_onenand_init);
> -module_exit(generic_onenand_exit);
> +module_platform_driver(generic_onenand_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");
> =C2=A0MODULE_DESCRIPTION("Glue layer for OneNAND flash on generic boards"=
);
> +MODULE_ALIAS("platform:" DRIVER_NAME);
> diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.=
c
> index 5474547..fa1ee43 100644
> --- a/drivers/mtd/onenand/samsung.c
> +++ b/drivers/mtd/onenand/samsung.c
> @@ -1133,18 +1133,7 @@ static struct platform_driver s3c_onenand_driver =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __deve=
xit_p(s3c_onenand_remove),
> =C2=A0};
>
> -static int __init s3c_onenand_init(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&s3c_onenand_drive=
r);
> -}
> -
> -static void __exit s3c_onenand_exit(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&s3c_onenand_driver);
> -}
> -
> -module_init(s3c_onenand_init);
> -module_exit(s3c_onenand_exit);
> +module_platform_driver(s3c_onenand_driver);
>
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");

Acked-by: Wan ZongShun <mcuos.com@gmail.com>

Thanks!

> --
> 1.7.5.4
>
>
>
>



--=20
Wan ZongShun.
www.mcuos.com

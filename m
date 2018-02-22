Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eonLm-0007wo-9h
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 09:39:44 +0000
Date: Thu, 22 Feb 2018 10:39:26 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org, Eric Miao
 <eric.y.miao@gmail.com>, Antoine Tenart <antoine.tenart@bootlin.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Nadav Haklai <nadavh@marvell.com>,
 linux-mtd@lists.infradead.org, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v4 0/6] Use the reworked Marvell NAND controller with
 all boards
Message-ID: <20180222103926.40e98f62@bbrezillon>
In-Reply-To: <20180219223557.2458-1-miquel.raynal@bootlin.com>
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Robert,

On Mon, 19 Feb 2018 23:35:51 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hello,
>=20
> Marvell NAND controller driver pxa3xx_nand has been replaced in 4.16 by
> a new driver featuring the new ->exec_op() interface called
> marvell_nand.
>=20
> These patches were part of a greater series that has been partially
> applied. Now that support for PXA boards looks stable, migrate all of
> them to use the new driver.
>=20
> To avoid risking compilation issues/broken bisection, I guess it would
> probably be better to make all these patches go through the MTD tree?
>=20
> Best regards,
> Miqu=C3=A8l
>=20
> Changes since v3:
>   - Split the removal of pxa3xx_nand driver in two: one patch to migrate
>     the defconfigs, another to remove the driver.
>   - Acked-by/Tested-by from Robert Jarzmik.
>=20
>=20
> Miquel Raynal (6):
>   mtd: nand: use Marvell reworked NAND controller driver with all
>     platforms
>   mtd: nand: remove deprecated pxa3xx_nand driver
>   mtd: nand: remove useless fields from pxa3xx NAND platform data
>   dt-bindings: mtd: remove pxa3xx NAND controller documentation
>   arm: dts: pxa: use reworked NAND controller driver
>   MAINTAINERS: remove entry for deleted pxa3xx_nand driver

I'm about to apply this series. Do you plan to add a few more acks or
is it okay?

>=20
>  .../devicetree/bindings/mtd/pxa3xx-nand.txt        |   50 -
>  MAINTAINERS                                        |    6 -
>  arch/arm/boot/dts/pxa3xx.dtsi                      |    6 +-
>  arch/arm/configs/cm_x300_defconfig                 |    2 +-
>  arch/arm/configs/pxa3xx_defconfig                  |    3 +-
>  arch/arm/configs/pxa_defconfig                     |    2 +-
>  arch/arm/configs/raumfeld_defconfig                |    2 +-
>  arch/arm/mach-mmp/ttc_dkb.c                        |    4 +-
>  arch/arm/mach-pxa/cm-x300.c                        |    8 +-
>  arch/arm/mach-pxa/colibri-pxa3xx.c                 |    8 +-
>  arch/arm/mach-pxa/colibri.h                        |    2 +-
>  arch/arm/mach-pxa/littleton.c                      |   10 +-
>  arch/arm/mach-pxa/mxm8x10.c                        |   10 +-
>  arch/arm/mach-pxa/raumfeld.c                       |    6 +-
>  arch/arm/mach-pxa/zylonite.c                       |   10 +-
>  drivers/mtd/nand/raw/Kconfig                       |   11 -
>  drivers/mtd/nand/raw/Makefile                      |    1 -
>  drivers/mtd/nand/raw/marvell_nand.c                |    3 +-
>  drivers/mtd/nand/raw/pxa3xx_nand.c                 | 2103 --------------=
------
>  include/linux/platform_data/mtd-nand-pxa3xx.h      |   43 +-
>  20 files changed, 43 insertions(+), 2247 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
>  delete mode 100644 drivers/mtd/nand/raw/pxa3xx_nand.c
>=20



--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

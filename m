Received: from mail-wg0-f43.google.com ([74.125.82.43])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlGaA-0002SU-Ds
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2015 12:50:20 +0000
Received: by wgso17 with SMTP id o17so17202238wgs.1
 for <linux-mtd@lists.infradead.org>; Thu, 23 Apr 2015 05:49:53 -0700 (PDT)
Message-ID: <5538EA69.2080702@monstr.eu>
Date: Thu, 23 Apr 2015 14:49:45 +0200
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
MIME-Version: 1.0
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net,
 michal.simek@xilinx.com, grant.likely@linaro.org,
 gregkh@linuxfoundation.org, jason@lakedaemon.net,
 ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org,
 computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com,
 jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com,
 joern@logfs.org
Subject: Re: [PATCH 2/2] mtd: nand: Add support for Arasan Nand Flash
 Controller
References: <1429192597-23519-1-git-send-email-punnaia@xilinx.com>
 <6ba05766-d8b9-436d-a953-447edc24b179@BN1BFFO11FD051.protection.gbl>
In-Reply-To: <6ba05766-d8b9-436d-a953-447edc24b179@BN1BFFO11FD051.protection.gbl>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="L6qVeiwWAmIkH7BKcEvI4nmeQk1lumJWB"
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 kalluripunnaiahchoudary@gmail.com, kpc528@gmail.com,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--L6qVeiwWAmIkH7BKcEvI4nmeQk1lumJWB
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 04/16/2015 03:56 PM, Punnaiah Choudary Kalluri wrote:
> Added the basic driver for Arasan Nand Flash Controller used in
> Zynq UltraScale+ MPSoC. It supports only Hw Ecc and upto 24bit
> correction.
>=20
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> ---
>  drivers/mtd/nand/Kconfig      |    7 +
>  drivers/mtd/nand/Makefile     |    1 +
>  drivers/mtd/nand/arasan_nfc.c |  861 +++++++++++++++++++++++++++++++++=
++++++++
>  3 files changed, 869 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/nand/arasan_nfc.c
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 5897d8d..64e497c 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -530,4 +530,11 @@ config MTD_NAND_HISI504
>  	help
>  	  Enables support for NAND controller on Hisilicon SoC Hip04.
> =20
> +config MTD_NAND_ARASAN
> +	tristate "Support for Arasan Nand Flash controller"
> +	depends on MTD_NAND
> +	help
> +	  Enables the driver for the Arasan Nand Flash controller on
> +	  Zynq UltraScale+ MPSoC.
> +
>  endif # MTD_NAND
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 582bbd05..fd863ea 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -52,5 +52,6 @@ obj-$(CONFIG_MTD_NAND_XWAY)		+=3D xway_nand.o
>  obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+=3D bcm47xxnflash/
>  obj-$(CONFIG_MTD_NAND_SUNXI)		+=3D sunxi_nand.o
>  obj-$(CONFIG_MTD_NAND_HISI504)	        +=3D hisi504_nand.o
> +obj-$(CONFIG_MTD_NAND_ARASAN)		+=3D arasan_nfc.o
> =20
>  nand-objs :=3D nand_base.o nand_bbt.o nand_timings.o
> diff --git a/drivers/mtd/nand/arasan_nfc.c b/drivers/mtd/nand/arasan_nf=
c.c
> new file mode 100644
> index 0000000..a4b407b
> --- /dev/null
> +++ b/drivers/mtd/nand/arasan_nfc.c
> @@ -0,0 +1,861 @@
> +/*
> + * Arasan Nand Flash Controller Driver
> + *
> + * Copyright (C) 2014 - 2015 Xilinx, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modif=
y it under
> + * the terms of the GNU General Public License version 2 as published =
by the
> + * Free Software Foundation; either version 2 of the License, or (at y=
our
> + * option) any later version.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>

For !CONFIG_OF_MTD here should be also. Kbuild system just reported this
problem.

#include <linux/of.h>

For the rest
Tested-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--L6qVeiwWAmIkH7BKcEvI4nmeQk1lumJWB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAlU46m0ACgkQykllyylKDCGHwgCdFk0Drlrn9u1pc0w0vhKUWAxG
j+UAn3n945WuVJOtUYaLoJ532//SHWyR
=H4cr
-----END PGP SIGNATURE-----

--L6qVeiwWAmIkH7BKcEvI4nmeQk1lumJWB--

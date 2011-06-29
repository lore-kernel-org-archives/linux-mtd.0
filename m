Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbrfk-0003od-Rd
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 10:07:06 +0000
Date: Wed, 29 Jun 2011 12:06:58 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v7 1/3] MTD : add the common code for GPMI-NFC
	controller driver
Message-ID: <20110629100658.GE1992@pengutronix.de>
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>
	<1309335878-16678-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Content-Disposition: inline
In-Reply-To: <1309335878-16678-2-git-send-email-b32955@freescale.com>
Cc: thierry.nolf.barco@gmail.com, LW@KARO-electronics.de,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Huang,

On Wed, Jun 29, 2011 at 04:24:36PM +0800, Huang Shijie wrote:
> These files contain the common code for the GPMI-NFC driver.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Thanks for the update. Good news, the DMA problem is gone now.
I am just running the mtd-stresstest-suite...

> ---
>  drivers/mtd/nand/gpmi-nfc/gpmi-nfc.c | 2484 ++++++++++++++++++++++++++++=
++++++
>  drivers/mtd/nand/gpmi-nfc/gpmi-nfc.h |  495 +++++++
>  2 files changed, 2979 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/nand/gpmi-nfc/gpmi-nfc.c
>  create mode 100644 drivers/mtd/nand/gpmi-nfc/gpmi-nfc.h
>=20
> diff --git a/drivers/mtd/nand/gpmi-nfc/gpmi-nfc.c b/drivers/mtd/nand/gpmi=
-nfc/gpmi-nfc.c
> new file mode 100644
> index 0000000..187b4a3
> --- /dev/null
> +++ b/drivers/mtd/nand/gpmi-nfc/gpmi-nfc.c
> @@ -0,0 +1,2484 @@
> +/*
> + * Freescale GPMI NFC NAND Flash Driver
> + *
> + * Copyright (C) 2010-2011 Freescale Semiconductor, Inc.
> + * Copyright (C) 2008 Embedded Alley Solutions, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng
> + * with this program; if not, write to the Free Software Foundation, Inc=
=2E,
> + * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + */
> +#include "gpmi-nfc.h"

Usually in the kernel, every file includes the stuff it needs for
itself.

> +
> +/* add our owner bbt descriptor */
> +static uint8_t scan_ff_pattern[] =3D { 0xff };
> +static struct nand_bbt_descr gpmi_bbt_descr =3D {
> +	.options	=3D 0,
> +	.offs		=3D 0,
> +	.len		=3D 1,
> +	.pattern	=3D scan_ff_pattern
> +};
> +
> +/* debug control */
> +int gpmi_debug;
> +module_param(gpmi_debug, int, S_IRUGO | S_IWUSR);
> +MODULE_PARM_DESC(gpmi_debug, "print out the debug infomation.");
> +
> +/* enable the gpmi-nfc. */
> +static bool enable_gpmi_nand;

Hmm, disabled by default? I somehow have the impression that it was not
exactly _this_ patch you tested ;) Should go, of course; probably debug
cruft?

> +static int __devinit acquire_interrupt(struct gpmi_nfc_data *this,
> +			const char *resource_name,
> +			irq_handler_t interrupt_handler, int *lno, int *hno)
> +{
> +	struct platform_device *pdev =3D this->pdev;
> +	struct resource *r;
> +	int err;
> +
> +	r =3D platform_get_resource_byname(pdev, IORESOURCE_IRQ, resource_name);
> +	if (!r) {
> +		pr_info("Can't get resource for %s\n", resource_name);
> +		return -ENXIO;
> +	}
> +
> +	BUG_ON(r->start !=3D r->end);
> +	err =3D request_irq(r->start, interrupt_handler, 0, resource_name, this=
);
> +	if (err) {
> +		pr_info("Can't own %s\n", resource_name);
> +		return err;
> +	}
> +
> +	*lno =3D r->start;
> +	*hno =3D r->end;
> +	return 0;
> +}

This will not work if max_chip_count > 1, because the irq is already
taken. (Also, I am not convinced of the resource handling, but I need to
delve into the code more, first.)

Back to testing, thanks for the update,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk4K+UEACgkQD27XaX1/VRs3ZQCgjJXLtT0a3Askl3Uya2XsG+zq
Tz0An0oMAb+XIA0P4yRDgKu7s41G6IhH
=IRhP
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--

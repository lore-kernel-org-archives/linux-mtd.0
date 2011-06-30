Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcEfO-0007sH-7d
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 10:40:15 +0000
Date: Thu, 30 Jun 2011 12:40:09 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v7 0/3]  add the GPMI controller driver for IMX23/IMX28
Message-ID: <20110630104009.GC1997@pengutronix.de>
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline
In-Reply-To: <1309335878-16678-1-git-send-email-b32955@freescale.com>
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


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2011 at 04:24:35PM +0800, Huang Shijie wrote:
> The general-purpose media interface(GPMI) controller is a flexible interf=
ace
> to up to several NAND flashs.
>=20
> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC accelera=
tor.
>=20
> With the help of BCH, the GPMI controller can choose to do the hardware E=
CC or
> not.
>=20
> This driver is a _pure_ MTD NAND controller driver now.

It seems writing does not work for me. I use a MX28EVK, NAND is reported as:

[    1.670000] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xdc (Micron MT=
29F4G08ABADAWP)

With ubiformat or the mtd_stresstest-module, I get stuff like this:

root@device:~ ubiformat /dev/mtd0
ubiformat: mtd0 (nand), size 536870912 bytes (512.0 MiB), 4096 eraseblocks =
of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 4095 -- 100 % complete =20
ubiformat: 4094 eraseblocks are supposedly empty
ubiformat: 2 bad eraseblocks found, numbers: 1243, 3935
ubiformat: formatting eraseblock 2 --  0 % complete =20
[  172.430000] [ start_dma_without_bch_irq : 393 ] DMA timeout!!!
[  173.430000] [ start_dma_with_bch_irq : 424 ] bch timeout!!!
[  173.430000] [ mil_ecc_write_page : 1647 ] Error in ECC-based write: -110
[  173.440000] [ send_command : 305 ] step 1 error
[  173.440000] [ mil_cmd_ctrl : 1369 ] Chip: 0, Error -1
[  173.450000] [ send_command : 305 ] step 1 error
[  173.450000] [ mil_cmd_ctrl : 1369 ] Chip: 0, Error -1
[  173.460000] [ read_data : 386 ] step 1 error
=2E..

Reading works though, mtd_readtest passes. Wild guess: something wrong
with the safe timings, perhaps?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk4MUokACgkQD27XaX1/VRvMPQCePZzeWnq+lqMSJVb0/VxRdQSI
ONAAnjcgEsoiYzAylbyp2SxgAhFnKiCa
=vXfg
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--

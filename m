Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MCtw3-0006IO-Ud
	for linux-mtd@lists.infradead.org; Sat, 06 Jun 2009 11:19:42 +0000
Date: Sat, 6 Jun 2009 13:19:26 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
Message-ID: <20090606111926.GA3279@pengutronix.de>
References: <1244203514-12516-1-git-send-email-w.sang@pengutronix.de>
	<1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
	<1244276049.3751.1176.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <1244276049.3751.1176.camel@macbook.infradead.org>
Cc: devicetree-discuss@ozlabs.org, albrecht.dress@arcor.de,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 06, 2009 at 09:14:08AM +0100, David Woodhouse wrote:

> On Fri, 2009-06-05 at 14:05 +0200, Wolfram Sang wrote:
> > Create an of-aware driver using the now exported generic functions from
> > plat-ram.c. Also add the documentation for the binding. Partitions are
> > not yet supported. Tested on a phyCORE-MPC5200B-IO.
>=20
> Do we have an ack for the device-tree bindings?=20
>=20
> It _would_ be possible to hook up RAM through the existing of_physmap
> driver, I think -- although it would be slightly less efficient that
> way.
>=20
> Maybe cleaner from the device-tree POV though. And if we want to put a
> special case in the _code_ to make it more efficient, we can do that.

During development, I also checked physmap_of.c and found this binding:

        {
                .type           =3D "rom",
                .compatible     =3D "direct-mapped"
        },

which made some sense to me and I thought about .type =3D "ram". However, I=
 then
found this in the code:

/* Helper function to handle probing of the obsolete "direct-mapped"
 * compatible binding, which has an extra "probe-type" property
 * describing the type of flash probe necessary. */
static struct mtd_info * __devinit obsolete_probe(struct of_device *dev,
                                                  struct map_info *map)
{
[...]

        dev_warn(&dev->dev, "Device tree uses obsolete \"direct-mapped\" "
                 "flash binding\n");

My conclusion was then that a mtd-ram binding wouldn't belong here, but I h=
ave
maybe misinterpreted things...

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoqUL4ACgkQD27XaX1/VRujcgCfaC0oE0HFX1XXmPmsivP0MN2s
WnIAniT/ONI9qNUFXF1wBUP9BtTVclh1
=9yH8
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

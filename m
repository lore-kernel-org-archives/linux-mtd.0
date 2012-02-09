Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvTqj-0006Bo-IP
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2012 13:15:48 +0000
Message-ID: <4F33C6F5.3090907@pengutronix.de>
Date: Thu, 09 Feb 2012 14:15:33 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 2/2] mtd: ixp4xx: oops in ixp4xx_flash_probe
References: <1328729069-21308-1-git-send-email-mkl@blackshift.org>
 <1328729069-21308-3-git-send-email-mkl@blackshift.org>
 <1328789487.22240.84.camel@sauron.fi.intel.com>
In-Reply-To: <1328789487.22240.84.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig71E88E8B9E1D97FFA0502A25"
Cc: Marc Kleine-Budde <mkl@blackshift.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig71E88E8B9E1D97FFA0502A25
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/09/2012 01:11 PM, Artem Bityutskiy wrote:
> On Wed, 2012-02-08 at 20:24 +0100, Marc Kleine-Budde wrote:
>> In commit "c797533 mtd: abstract last MTD partition parser argument" t=
he
>> third argument of "mtd_device_parse_register()" changed from start add=
ress
>> of the MTD device to a pointer to a struct.
>=20
> Hi, thanks for the fix. Several comments:
>=20
> 1. I've removed the huge oops from the description - it is not very
> helpful and not worth having.
> 2. It is usually a good idea to CC the author of the commit causing the=

> regression.
> 3. For regressions like this it is a good idea put the stable tree tag.=


Noted.

> I've added
>=20
> Cc: stable@kernel.org [3.2+]
>=20
> (git tag --contains c797533 gives the version)
>=20
> and pushed to the l2-mtd.git tree, thanks!

Thanks


--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig71E88E8B9E1D97FFA0502A25
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk8zxvgACgkQjTAFq1RaXHONVwCfXhIyd8iD8TVM5A3Rv9d79QMx
tyoAn05+Tyor+IQLrc8v7fFj5Q+4FcNQ
=6yU6
-----END PGP SIGNATURE-----

--------------enig71E88E8B9E1D97FFA0502A25--

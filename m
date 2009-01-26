Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LRXmX-0003rS-UP
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2009 20:10:08 +0000
Date: Mon, 26 Jan 2009 21:10:00 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Matthias Fuchs <matthias.fuchs@esd-electronics.com>
Subject: Re: [PATCH] mtd: Add open firmware GPIO NAND driver
Message-ID: <20090126201000.GA21294@pengutronix.de>
References: <200901251801.52179.matthias.fuchs@esd-electronics.com>
	<20090125192710.GA26917@pengutronix.de>
	<200901260907.05825.matthias.fuchs@esd-electronics.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <200901260907.05825.matthias.fuchs@esd-electronics.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Matthias,

On Mon, Jan 26, 2009 at 09:07:05AM +0100, Matthias Fuchs wrote:

> first I thought about adding the device tree code to the platform driver.
> But if you look at the code you will see that there are many places where
> the drivers differ. Merging my code with the platform driver will bring a=
 lot of #ifdefs
> and I do not like that! The identical functions are only a very few lines.

Okay, that's why I asked :) When I did the of-version of mtd-ram, it was
luckily possible to make a generic init function and call them from
both, platform and of. I just wanted to know if such an approach was
considered.

Regards,

   Wolfram

--=20
  Dipl.-Ing. Wolfram Sang | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl+GJgACgkQD27XaX1/VRsXkgCggDSCOoGStSILuw3cCLKNogSt
vlQAn0wnakbgWF6v5jhIgo4gr9svG2aj
=0GQY
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--

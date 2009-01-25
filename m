Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LRAdU-0008Ey-UE
	for linux-mtd@lists.infradead.org; Sun, 25 Jan 2009 19:27:15 +0000
Date: Sun, 25 Jan 2009 20:27:10 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Matthias Fuchs <matthias.fuchs@esd-electronics.com>
Subject: Re: [PATCH] mtd: Add open firmware GPIO NAND driver
Message-ID: <20090125192710.GA26917@pengutronix.de>
References: <200901251801.52179.matthias.fuchs@esd-electronics.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <200901251801.52179.matthias.fuchs@esd-electronics.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Matthias,

On Sun, Jan 25, 2009 at 06:01:51PM +0100, Matthias Fuchs wrote:
> This patch adds a GPIO based nand driver that is configured through
> the open firmware flat device tree. It's based on the gpio platform
> nand driver.

As there are some identical functions in this driver and the original
platform based driver, I think it will be easier to maintain those
functions if they are used by both drivers. Do you think it is feasible
to share the code among those two?

Kind regards,

   Wolfram

--=20
  Dipl.-Ing. Wolfram Sang | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl8vQ4ACgkQD27XaX1/VRtlxACdFdd+sVbTjxjeZ7I1kFEwHFtK
YpkAoKPnvesr1faR/cDAC96BYwk915ML
=VanM
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--

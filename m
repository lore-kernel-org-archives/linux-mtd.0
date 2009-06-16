Received: from smtp4.netcologne.de ([194.8.194.137])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MGcJY-0007Xw-Go
	for linux-mtd@lists.infradead.org; Tue, 16 Jun 2009 17:19:23 +0000
Date: Tue, 16 Jun 2009 19:19:06 +0200
From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
To: Grant Likely <grant.likely@secretlab.ca>
In-Reply-To: <fa686aa40906160553m2f0e7cc4n644c3893573845f@mail.gmail.com>
	(from grant.likely@secretlab.ca on Tue Jun 16 14:53:17 2009)
Message-Id: <1245172753.3400.0@antares>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-3vEv1y6AYteInxT4S5bC"
Cc: devicetree-discuss@ozlabs.org, Wolfram Sang <w.sang@pengutronix.de>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Ben Dooks <ben-linux@fluff.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-3vEv1y6AYteInxT4S5bC
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 16.06.09 14:53 schrieb(en) Grant Likely:
> I'm not happy about the use case though.  It probably shouldn't =20
> appear in this binding, or if it does it should be tagged as an =20
> optional property.

I agree with you that the naming is really misleading - other devices =20
which are not mtd's may suffer from the same problem of the lpb (in my =20
case, I have an extra memory-mapped Ethernet chip which I didn't try to =20
access yet...).

As it is actually a chip select property, what about defining an =20
optional property like "cs-width =3D (8|16|32)" which defaults to 8 and =20
may be added to each 5200 lpb child?

> It is only in the 5200 localplus case that bank-width is needed to =20
> figure out how to apply the workaround.

Just out of curiosity: what about the "localbus" of other Freescale =20
chips (82xx? 83xx? Maybe others?)?

Thanks, Albrecht.

--=-3vEv1y6AYteInxT4S5bC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iD8DBQBKN9QRn/9unNAn/9ERAgcZAKCDBRHS+2sgGwIwB2vjxbbyuycbjwCfQBnb
016afTZRn4vmVMeRgCX/P/Y=
=RUF4
-----END PGP SIGNATURE-----

--=-3vEv1y6AYteInxT4S5bC--

Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RrrUR-00018M-8m
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 13:41:47 +0000
Date: Mon, 30 Jan 2012 14:41:30 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
Message-ID: <20120130134130.GG15596@pengutronix.de>
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <201201301327.41298.marek.vasut@gmail.com>
 <20120130131205.GD15596@pengutronix.de>
 <201201301430.44374.marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="+sHJum3is6Tsg7/J"
Content-Disposition: inline
In-Reply-To: <201201301430.44374.marek.vasut@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--+sHJum3is6Tsg7/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Hehe, just torturing you guys a bit :)

And the gain of that is? The only outcome I currently see is that I feel
less motivated to put you on CC next time.

> > > > Did it always do that? Or is a newer version needed?
> > >=20
> > > I can't comment on this one, I never used it. I rather got NAND worki=
ng
> > > properly.
> >=20
> > Me neither. But if so, we have another regression candidate.
>=20
> What regression candidate ? The version of NAND driver in u-boot should b=
e close=20
> to what's in mainline Linux kernel.

I am not talking about U-Boot here. I was wondering if somebody who uses
the FSL deployment method would need to update kobs-ng, so a proper BBT
gets written. If so, people missing the need to update would see a
regression. Which is another reason to not make BBT usage default. But I
maybe wrong here. Huang will tell.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--+sHJum3is6Tsg7/J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8mngoACgkQD27XaX1/VRudwwCguUOhXzkf09y/Y6N4GfpOc1Ls
O0QAn1bXuMp1+OoqkaR0dJR9JU1Dx4yY
=hK9B
-----END PGP SIGNATURE-----

--+sHJum3is6Tsg7/J--

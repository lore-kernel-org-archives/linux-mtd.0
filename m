Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rrr1u-0003p0-I2
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 13:12:19 +0000
Date: Mon, 30 Jan 2012 14:12:05 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
Message-ID: <20120130131205.GD15596@pengutronix.de>
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <4F267F21.1030204@freescale.com>
 <20120130114131.GC15596@pengutronix.de>
 <201201301327.41298.marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline
In-Reply-To: <201201301327.41298.marek.vasut@gmail.com>
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


--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > U-Boot has NAND support in mainline, for barebox it is work-in-progress.
>=20
> Why don't you rather start hacking on u-boot instead of chasing behind it=
 all=20
> the time ;-)

"chasing all the time behind it" is plain wrong, you should know that. I
also fed back the DMA fix I found. Besides, this is off-topic.

> > Did it always do that? Or is a newer version needed?
>=20
> I can't comment on this one, I never used it. I rather got NAND working=
=20
> properly.

Me neither. But if so, we have another regression candidate.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8mlyUACgkQD27XaX1/VRtAKwCfY5ukZo83zARGNdt0X9onpGfw
Bj8AoIn7UpyvNy9FAcmpRqQBNLeBC80b
=AR4R
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--

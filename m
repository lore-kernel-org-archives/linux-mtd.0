Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qk18g-0004XG-5u
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2011 21:50:42 +0000
Date: Thu, 21 Jul 2011 23:50:20 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
Message-ID: <20110721215020.GA25344@pengutronix.de>
References: <1311230846-26437-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <1311230846-26437-1-git-send-email-b32955@freescale.com>
Cc: arnd@arndb.de, dedekind1@gmail.com, linux-mtd@lists.infradead.org,
	shijie8@gmail.com, linux-arm-kernel@lists.infradead.org,
	LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The general-purpose media interface(GPMI) controller is a flexible interf=
ace
> to up to several NAND flashs.
=2E..
> To Walfram & Artem:
>     About how to disable the JFFS2 to use the OOB:
>     I read the code, and I still have no idea about how to use the ecclay=
out
>     to do the job. Could you give me some hint? thanks.

Have you checked mxc_nand.c for example? There is

static struct nand_ecclayout nandv1_hw_eccoob_smallpage =3D {
        .eccbytes =3D 5,
        .eccpos =3D {6, 7, 8, 9, 10},
        .oobfree =3D {{0, 5}, {12, 4}, }
}

defined as one layout. Now, you could define one where oobfree is empty and
eccbytes as big as the oob-area.

> The driver depends on another GPMI-NAND device patch set, you can find th=
em at :
> 	[1] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037033.html
> 	[2] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037031.html
> 	[3] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037032.html
> 	[4] http://lists.infradead.org/pipermail/linux-mtd/2011-July/037034.html
>=20
> The driver also depends on another DMA patch by Shawn:
> 	[0] http://lists.infradead.org/pipermail/linux-mtd/2011-June/036820.html

This makes it difficult for testers/reviewers. Please try to get a git-bran=
ch
=66rom Freescale or Linaro.

> 	[4] DMA timeout issue. I use the .config created by `make mxs_defconfig`
> 	    and the bug never occur. It seems some other module has impact to the
> 	    DMA.

Sadly, I can't confirm that. DMA timeout happens with my config as well as =
with
the mxs_defconfig. ubiformat breaks immediately when trying to write.

Problem is that I am away from my dev-machine for a few days. I can do limi=
ted
tests remotely but not develop actively right now. But if you need logs...

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk4onxwACgkQD27XaX1/VRs8+gCfZ3nLKUVXccM7W3aIjUI3Zo7y
30IAn04OzPQNFlhMqVhZpAmS8NrqcI2i
=Yb6r
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--

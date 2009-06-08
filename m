Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDhpJ-00032A-D7
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 16:36:04 +0000
Date: Mon, 8 Jun 2009 18:35:40 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
Message-ID: <20090608163540.GA16384@pengutronix.de>
References: <1244203514-12516-1-git-send-email-w.sang@pengutronix.de>
	<1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
	<fa686aa40906060905y1d39dce1j87d993ceb94273be@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <fa686aa40906060905y1d39dce1j87d993ceb94273be@mail.gmail.com>
Cc: devicetree-discuss@ozlabs.org, albrecht.dress@arcor.de,
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


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Question: why is bank-width even relevant for a RAM device?

The underlying map_ram-driver uses it once while erasing. The question rema=
ins
if this is really needed? And: Does this need to get solved before merging =
my
patches because changing the binding afterwards is hard? Or can they go
mainline nevertheless?

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkotPdwACgkQD27XaX1/VRtCFgCdG3OTwgCSa2f7XfeouY/s4UWO
glkAn1KU3AwcC2lVVuy9oFvNdXpPU8wD
=pEkx
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--

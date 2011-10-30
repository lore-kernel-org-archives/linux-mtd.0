Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKc8C-00062P-IV
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 20:37:25 +0000
Date: Sun, 30 Oct 2011 21:37:19 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH V2 2/2] mtd: tests: annotate as DANGEROUS in Kconfig
Message-ID: <20111030203719.GA20162@pengutronix.de>
References: <1319977792.2126.30.camel@koala>
	<1319992129-13588-1-git-send-email-w.sang@pengutronix.de>
	<1320006895.2126.61.camel@koala>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <1320006895.2126.61.camel@koala>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2011 at 10:34:53PM +0200, Artem Bityutskiy wrote:
> On Sun, 2011-10-30 at 17:28 +0100, Wolfram Sang wrote:
> > +	  WARNING: Some of the tests will ERASE THE CONTENT of mtd devices!
> > +	  Do not use these tests unless you are sure you really need to.
>=20
> Thanks, I've pushed this patch but amended the above text a bit:
> +         WARNING: some of the tests will ERASE entire MTD device which t=
hey
> +         test. Do not use these tests unless you really know what you do.

OK, thanks! Seems we now finally have it :)

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk6ttX8ACgkQD27XaX1/VRtxaQCggvlmOuwg5bC4ZfuYLAZjnynl
vmUAnRyeF23bka0BbvZHdWrJmQWISScS
=SsP4
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--

Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MtIvG-00048m-Rx
	for linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 10:30:07 +0000
Date: Thu, 1 Oct 2009 12:30:00 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Matthias Fuchs <matthias.fuchs@esd.eu>
Subject: Re: patented FTL format
Message-ID: <20091001103000.GA3166@pengutronix.de>
References: <200909301732.35277.matthias.fuchs@esd.eu>
	<20090930172832.GA4574@linode.davidb.org>
	<200910011123.07588.matthias.fuchs@esd.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <200910011123.07588.matthias.fuchs@esd.eu>
Cc: David Brown <mtd@davidb.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I expected get heard by the maintainer of the FTL code. Somebody
> must have added the notice to the source code. Perhaps that person
> knows why :-)

'git blame <file>' tells you the author/commit that changed a specific line.
Then, 'git show <commit>' shows you also the description. That usually help=
s to
find the mail-thread accompanying the patch. Dunno if it works in this case,
but it often does.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkrEhKgACgkQD27XaX1/VRtyGQCgoOpWIh7hMuFA+FFSqT0qMv4h
n/4An2PAgDO5vRBDTTGg+8zYs9sAA/HP
=mrL7
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--

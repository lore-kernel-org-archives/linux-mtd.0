Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OwVlv-0002kx-U9
	for linux-mtd@lists.infradead.org; Fri, 17 Sep 2010 07:54:16 +0000
Date: Fri, 17 Sep 2010 09:54:11 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] nanddump: Rename --nobad to --noskipbad
Message-ID: <20100917075411.GA3119@pengutronix.de>
References: <1284359070.27765.155.camel@localhost>
	<1284362113-26737-1-git-send-email-w.sang@pengutronix.de>
	<1284704420.2373.60.camel@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <1284704420.2373.60.camel@localhost>
Cc: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2010 at 09:20:20AM +0300, Artem Bityutskiy wrote:
> On Mon, 2010-09-13 at 09:15 +0200, Wolfram Sang wrote:
> > "nobad" might lead to the assumption that bad blocks are skipped, but t=
his
> > option does exactly the opposite. Use a more descriptive name.
> >=20
> > Reported-by: Jon Povey <Jon.Povey@racelogic.co.uk>
> > Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> > Cc: Mike Frysinger <vapier@gentoo.org>
>=20
> It does not apply to the latest mtd-utils tree. Would you please re-send
> an updated version?

Ehrm, it still applies on top of Mike's original patch (it just seems
that the latter is not pushed yet despite your mail saying so). Or do
you want me to fold those two?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkyTHqMACgkQD27XaX1/VRsZkgCdFEoCIV0WN8yIIdOUyC+O5dJu
xaQAnRY7bURQnyhJNRUX74evMwJacfAm
=11uH
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

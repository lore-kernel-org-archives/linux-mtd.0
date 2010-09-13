Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ov2Qh-0003bO-7i
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 06:22:16 +0000
Date: Mon, 13 Sep 2010 08:22:09 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Subject: Re: [PATCH 2/2] nanddump: add --nobad to read bad blocks
Message-ID: <20100913062209.GA7382@pengutronix.de>
References: <1284263427-31342-2-git-send-email-vapier@gentoo.org>
	<70E876B0EA86DD4BAF101844BC814DFE0903E3E3DC@Cloud.RL.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0903E3E3DC@Cloud.RL.local>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2010 at 06:50:04AM +0100, Jon Povey wrote:
> Mike Frysinger wrote:
> > Sometimes dumping bad blocks is useful, like when the data isn't actual=
ly
> > bad but the OOB layout isn't what the kernel is expecting or is otherwi=
se
> > screwed up.  The --nobad option allows just that.
>=20
> > +"-N         --nobad              Read without bad block skipping\n"
>=20
> This doesn't seem like a good name for the option to me. A useful option =
but
> an unintuitive name, "nobad" sounds like it is going to omit bad blocks,
> where actually it is going to include them.
>=20
> "noskipbad" or "includebad" would seem to be better.

I agree. Is that still fixable despite being pushed already?

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkyNwxAACgkQD27XaX1/VRutcQCgoOKRbQaZU/9yYjMhaMglkmr2
L48AoJIf7x25csYa3lglATSPt649m4mi
=DdoQ
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--

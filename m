Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaXbI-0000oV-TP
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 16:19:57 +0000
Date: Mon, 10 Aug 2009 18:19:42 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] mtd/maps: add mtd-ram support to physmap_of
Message-ID: <20090810161942.GA27833@pengutronix.de>
References: <1247834363-28198-1-git-send-email-w.sang@pengutronix.de>
	<fa686aa40908072243x56d2160fk688149f4b7b912ae@mail.gmail.com>
	<1249795043.9157.37.camel@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <1249795043.9157.37.camel@localhost>
Cc: devicetree-discuss@ozlabs.org, Vitaly Wool <vwool@ru.mvista.com>,
	Albrecht =?iso-8859-15?Q?Dre=DF?= <albrecht.dress@arcor.de>,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Ken MacLeod <ken@bitsko.slc.ut.us>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 09, 2009 at 08:17:23AM +0300, Artem Bityutskiy wrote:
> On Fri, 2009-08-07 at 23:43 -0600, Grant Likely wrote:
> > On Fri, Jul 17, 2009 at 6:39 AM, Wolfram Sang<w.sang@pengutronix.de> wr=
ote:
> > > Use physmap_of to access RAMs as mtd and add documenation for it. Thi=
s approach
> > > is a lot less intrusive as adding an of-wrapper around plat-ram.c. As=
 most
> > > extensions of plat-ram.c (e.g. custom map-functions) can't be mapped =
to the
> > > device tree anyhow, extending physmap_of seems to be the cleanest app=
roach.
> > >
> > > Tested with a phyCORE-MPC5121e.
> > >
> > > Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> >=20
> > Looks good to me.
> >=20
> > Acked-by: Grant Likely <grant.likely@secretlab.ca>
>=20
> This patch is sitting in my l2-mtd-2.6.git tree.

Great, thanks a lot (and for your l2-tree in general!). One question: Are t=
he
additional Acked-bys added later? I could think they might be useful for
David's review...

Kind regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqASJ4ACgkQD27XaX1/VRtxLwCeKVSaOJ+BJhVWeZMsFQ17Mpqt
uWEAn3VzrFmKQpaJo8EcQPP1/DAgMgLr
=k6lN
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--

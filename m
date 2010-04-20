Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O4A4O-0008Op-JC
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2010 09:48:41 +0000
Date: Tue, 20 Apr 2010 11:48:38 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Can PYSMAP_COMPAT go?
Message-ID: <20100420094838.GO19957@pengutronix.de>
References: <20100420063547.GH19957@pengutronix.de>
	<20100420073503.GL4586@mail.wantstofly.org>
	<1271750733.14748.1580.camel@macbook.infradead.org>
	<20100420090408.GM19957@pengutronix.de>
	<1271755256.14748.1583.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FilwpOHBrTVNlmJ3"
Content-Disposition: inline
In-Reply-To: <1271755256.14748.1583.camel@macbook.infradead.org>
Cc: linux-mtd@lists.infradead.org, Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--FilwpOHBrTVNlmJ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2010 at 10:20:56AM +0100, David Woodhouse wrote:
> On Tue, 2010-04-20 at 11:04 +0200, Wolfram Sang wrote:
> > Okay, so unless i386 gets device-tree support ;), how about at least
> > this?
>=20
> I'd love to see i386 get device-tree support. OLPC could benefit from it
> immediately, and we could start using it on the embedded toys which are
> coming out now.

True. It was the "unless" I was pointing for. I'd think it will take a long
while...

> I really don't think 0x4000000 is a 'sensible' default. Zero was better

Okay. I just wanted to remove the inconsistency (all these options could be=
 0
then). But it's probably now worth the fuss.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--FilwpOHBrTVNlmJ3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvNeHYACgkQD27XaX1/VRtYjgCfRMtELfksbu/lehM5R9MGD8I8
6ZUAn26uWm9i6y0XglK5NrcI9BDMGhtg
=DAJe
-----END PGP SIGNATURE-----

--FilwpOHBrTVNlmJ3--

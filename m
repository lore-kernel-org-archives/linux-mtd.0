Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NwaXo-0003aD-R1
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2010 12:27:45 +0000
Date: Tue, 30 Mar 2010 14:26:44 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 01/24] mtd/maps/pismo: remove dangling pointer and a leak
Message-ID: <20100330122644.GC29472@pengutronix.de>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de>
	<1269094385-16114-2-git-send-email-w.sang@pengutronix.de>
	<20100320145729.GA5399@flint.arm.linux.org.uk>
	<20100320153146.GB5515@pengutronix.de>
	<20100320154113.GB14470@flint.arm.linux.org.uk>
	<1269160241.4028.9777.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Content-Disposition: inline
In-Reply-To: <1269160241.4028.9777.camel@macbook.infradead.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Russell King <rmk+lkml@arm.linux.org.uk>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 21, 2010 at 08:30:41AM +0000, David Woodhouse wrote:

> > Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
> >=20
> > David, are you going to pick this up?=20
>=20
> http://git.infradead.org/mtd-2.6.git/commitdiff/395b2288

Thanks. The handling of the dangling pointer will be handled differently fr=
om
2.6.35 on, but I will prepare the necessary fixup then. The fixed leak was
good to have, I think.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkux7gQACgkQD27XaX1/VRtZqgCgw6MZ9rJru+nE6a2mkxJ98Cco
khMAoJrN2JlWKWJeHTzq/t9FwLMVUq7t
=S2Us
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--

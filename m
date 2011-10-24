Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RIS0z-0006JD-13
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2011 21:25:01 +0000
Date: Mon, 24 Oct 2011 23:24:55 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [BUG] Re: mtd_stresstest module bricked my dockstar
Message-ID: <20111024212455.GC6326@pengutronix.de>
References: <69501156.1798237.1319395066798.JavaMail.fmail@mwmweb003>
	<20111024055705.GA4020@1wt.eu>
	<B10F15EA8AB74E698DC0D94563A30BE7@samsungnetbook>
	<20111024195313.GA6326@pengutronix.de>
	<1319490276.12314.9.camel@golum>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Content-Disposition: inline
In-Reply-To: <1319490276.12314.9.camel@golum>
Cc: linux-kernel@vger.kernel.org, Roland Kletzing <devzero@web.de>,
	linux-mtd@lists.infradead.org, adrian.hunter@intel.com,
	Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Yes, we should use -1 as the default value, and print a scary warning
> message when the module is inserted without a parameter. We should
> probably also put word "destructive" or something like this to the
> module description.

I would volunteer to do this tomorrow if nobody is working on it at this
moment...

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk6l16cACgkQD27XaX1/VRt5RACgwMdTUyiafJ2KB96FbuJqx6Tg
jJ8An2I0PmTHJyPzYfxknWjBhgroCuDU
=B87k
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--

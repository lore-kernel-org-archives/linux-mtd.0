Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFL6J-00043h-LY
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2012 07:57:56 +0000
Date: Wed, 4 Apr 2012 09:57:48 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH] mtd/gpmi : do not include the mxs.h
Message-ID: <20120404075748.GA9073@pengutronix.de>
References: <1333247817-18472-1-git-send-email-shijie8@gmail.com>
 <20120403193920.GC2201@pengutronix.de>
 <CAMiH66FhFFi1Kd7t6uK4S46Yt=g1kxxCUZywCNAmy14E1AHH1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <CAMiH66FhFFi1Kd7t6uK4S46Yt=g1kxxCUZywCNAmy14E1AHH1A@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> Do you mean your patch "lib: add support for stmp-style devices" ?
> or some other patch?

Yes, it adds the SET and CLR macros. writel() then need to be modified agai=
n.
Nothing major, though.

> Your patch "lib: add support for stmp-style devices" does not give me the=
 API
> to remove this code as i ever wished to.

Then please speak up. The only comment I can find from you is the requested
move to a fsl-directory, but this is nothing about API?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk97/vwACgkQD27XaX1/VRti9wCgjYrgzFOmB5ewA77KYC1D7hXp
a4oAnA/UfKkuy8xCF2ZE8qIG5R56e3t+
=17Dj
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--

Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oyl2u-0001NS-Ek
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 12:37:05 +0000
Date: Thu, 23 Sep 2010 14:37:02 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: =?iso-8859-15?Q?Fl=E1vio?= Silveira <fggs@terra.com.br>
Subject: Re: [Help] SST39VF6401B Support
Message-ID: <20100923123701.GE2994@pengutronix.de>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR>
	<AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com>
	<74A5BE60138147F696E151AACD52EDEE@THOR>
	<20100923120534.GD2994@pengutronix.de>
	<F42FA4FD208F41E8891EB2BF9C7E62CB@THOR>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Content-Disposition: inline
In-Reply-To: <F42FA4FD208F41E8891EB2BF9C7E62CB@THOR>
Cc: linux-mtd@lists.infradead.org, Yegor Yefremov <yegorslists@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


>  Thanks for your response. What do you mean by broken CFI?

Well, ehrm, it is broken :) It simply doesn't work the way it is
expected, due to the custom unlock address.

>  Also, as you seem with way more experience than me, do you know if
> cfi_probe do 3 cycle command for SST CFI Query Entry?
>  If you could check: http://www.sst.com/dotAsset/40483.pdf
>  Give me your thoughts about it

Sorry, besides my initial pointer, I have too many other things going on
today. But it seems Guillaume had a look and will guide you.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkybSe0ACgkQD27XaX1/VRvwOgCgkNF+YvVN9PujrgzVHRUeoxNL
lFAAoJOwofXl6NBe3ZP5yTbE+RoARdKO
=N8zd
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--

Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1as662-0001Oz-Am
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2016 10:07:59 +0000
From: Markus Pargmann <mpa@pengutronix.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Han Xu <han.xu@nxp.com>, Fabio Estevam <fabio.estevam@freescale.com>,
 Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Stefan Christ <s.christ@phytec.de>,
 Huang Shijie <shijie.huang@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH RESEND] gpmi-nand: Handle ECC Errors in erased pages
Date: Mon, 18 Apr 2016 12:07:27 +0200
Message-ID: <12179071.kte6qB1Shv@adelgunde>
In-Reply-To: <20160415174031.3c088df5@bbrezillon>
References: <1456059126-25469-1-git-send-email-mpa@pengutronix.de>
 <AM4PR0401MB1841C82A9BCBFF2C55AA4DC397680@AM4PR0401MB1841.eurprd04.prod.outlook.com>
 <20160415174031.3c088df5@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2599268.1EaGA9dVCD";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nextPart2599268.1EaGA9dVCD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Friday 15 April 2016 17:40:31 Boris Brezillon wrote:
> On Fri, 15 Apr 2016 15:33:07 +0000
> Han Xu <han.xu@nxp.com> wrote:
>=20
> > >
> > > I just did [1] (it applies on top of your patch), but maybe you
> > > can test it (I don't have any imx platforms right now) ;).
> >=20
> > Great, thank you :). I just tested the patch and it works for me. T=
he
> > erased page bitflips are still detected and fixed. I will send a ne=
w
> > version then.
> >=20
> > Hi Markus,
> >=20
> > Could you please share how to verify the patch, in other words, how=
 to reproduce the
> > UBIFS corruption issue consistently. Thanks.

I used a simple bashscript with 'nandwrite --noecc' that writes a numbe=
r
of zeroes in every sub-page. For written pages the ECC will handle the
flips. For erased pages we can test the algorithm that handles the
erased page bitflips.

>=20
> I should really post a new version of the nandflipbits tool [1].
> That's clearly the easiest solution to verify that your bitflip
> correction is reliable.

Seems really useful.

Best Regards,

Markus

>=20
>=20
> [1]http://lists.infradead.org/pipermail/linux-mtd/2014-November/05663=
4.html
>=20
>=20

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart2599268.1EaGA9dVCD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFLHfAAoJEEpcgKtcEGQQnW0P/3HtodJowHNGexstH3mfXjKt
3E/Nx9Dj1agiMwUYnz/UbiipljgiNR9wIjY+9ml3QtuATCVnZ7Ikr7sRzmrTF7x0
9wviw2ZUHUUpJykkIUtDiwCz0YSb9okA3bErmaly9JUMfTykED61/Q4o9FNpA531
ZyNLUO78VYrIy4aJhSpmVncgqTj03dQ1FRE4mDhkWB2xXI4hHj2aYrywebJG5EZy
Ab9aQx6RoxQIc4vnEfxRDB3BxWkX+IY5RL/Wa9cS64vpO9M85Zc/XQ9nUX1ec7vZ
4H6dRQPygooBYGpKSLskH/QAjp51H0lIAyINn/6Ef53s9akkqzGZh999Wvdaz1P7
1Lbbo5zg4LH3/W8HE1FITegaXXgRf2UHiBMdnz2OqSw9f79hRpwPQ3GcAHbFUHmq
MpwdtsXdUAeelaQFT61u3iSKz2JO5XpoELkM8aI3wLST397nAkS/EpUETZ/H5ymr
otlNomAbV0ZP3cF0Xim/yHJcmIwv4yaupyUoyjF0Pq4EWGMVA5mM81ULFlTk7X+C
v5+ilMROrs6fs9KOdYTE+gBb+nW5R2lISetE4xHaA/ZHRHGMACbdHMgEQW6tVdIb
9vpTxZsyNdqEB15ozp1EPXHHIkTupwIYE6iAFffCUE8Mhm8ngU9gjgtpr0tj/JTm
8NnAmjsNZpz2JKPMZwND
=vShH
-----END PGP SIGNATURE-----

--nextPart2599268.1EaGA9dVCD--

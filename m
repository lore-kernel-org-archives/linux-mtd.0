Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tgely-0000Bp-FT
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2012 16:58:07 +0000
Date: Thu, 6 Dec 2012 17:58:00 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH] mtd: nand: gpmi: reset BCH earlier, too, to avoid NAND
 startup problems
Message-ID: <20121206165800.GA17129@pengutronix.de>
References: <1354740362-20412-1-git-send-email-w.sang@pengutronix.de>
 <50BFFFE8.8040002@freescale.com>
 <20121206095213.GA2589@pengutronix.de>
 <CAMiH66EPDKhd=pBJWhtm3P+qgGcdVbHD-hb93ZB7Ou7Sc=vByg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <CAMiH66EPDKhd=pBJWhtm3P+qgGcdVbHD-hb93ZB7Ou7Sc=vByg@mail.gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <david.woodhouse@intel.com>,
 linux-arm-kernel@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Did you power-cycle between each test or reboot? I still need to test if
> What's the meaning of "power-cycle"?

power off - power on

> I only tested with the soft reset, the power is never shut down.

OK.

> With your patch, we have resetted the BCH twice in the driver. Could
> we only reset BCH one time?

You tell me, please :) Is it needed when changing the layout? I don't
have any setup to test that. Unless I can test that, I prefer to not
remove it. I am a bit anxious, because the reason for the stalled BCH is
not fully understood and all I can reliably say is that resetting twice
does not hurt.

> Do you ever remove another reset-bch code, and test it?

It will probably work, but we don't cover the case of changing the
layout?

> Frankly speaking, it's strange to reset the BCH twice, and it makes no se=
nse. :(

The stalled BCH makes no sense either, currently.

> I am afraid that we have to add three-reset-bch in the future, if we
> can not find the root cause.

Well, ask the IC guys if something can go wrong when the BCH has been
active and the GPMI gets reset and issues NAND commands (without needing
ECC).

> If you can remove another reset-bch code, i will ack the patch.

Removing code that late in the cycle without proof sounds dangerous to
me.

> > The setup needs to be done properly to ensure a consistent state at the
> > beginning, especially when somebody used the NAND before (ROM code,
> At the beginning? it's really interesting.
> I want to test it myself.
>=20
> could you wait for some time?

What is some time? :)

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlDAzpgACgkQD27XaX1/VRu9vwCfZ2IE6f2/3NicotB1GS2N7I0l
OlcAni1ug6lCqxNCLPLIwNIkLpVbKwEL
=vHh8
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--

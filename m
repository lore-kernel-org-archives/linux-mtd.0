Date: Tue, 24 Feb 2015 09:17:09 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150224081709.GM25269@lukather>
References: <1424091072-7738-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
 <87oaotaa6r.fsf@free.fr> <20150216205825.GG25269@lukather>
 <87k2zha69p.fsf@free.fr> <20150217103740.GK25269@lukather>
 <877fvga2mb.fsf@free.fr> <54E3777B.20607@free-electrons.com>
 <20150224034548.GC18140@ld-irv-0074>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="BXhH8iG0/4JcYZU2"
Content-Disposition: inline
In-Reply-To: <20150224034548.GC18140@ld-irv-0074>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--BXhH8iG0/4JcYZU2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Brian,

On Mon, Feb 23, 2015 at 07:45:48PM -0800, Brian Norris wrote:
> On Tue, Feb 17, 2015 at 02:16:43PM -0300, Ezequiel Garcia wrote:
> > On 02/17/2015 02:07 PM, Robert Jarzmik wrote:
> > > It will be Brian choice eventually, but if you say that you will subm=
it that
> > > approach for next cycle, and yours for stable, and that for next you'=
ll convert
> > > mdelay() to msleep(), I'll stop arguing.
> >=20
> > How about you push a proper patchset with this alternative (and a nice
> > cover letter explaining the need for a threaded irq) so we can discuss
> > properly this new turn?
>=20
> I think both Maxime's change (polling a new HW bit) and Robert J's
> change (move to a threaded IRQ) are good. I'll take another look, but I
> expect I'll take Maxime's v4 for the 4.0 cycle, and Robert J's v2 for
> 4.1 (or will we just jump straight to 5.0? I never know).

That's what I would expect too.

> Will I see a patch to convert to msleep() and/or a jiffies timeout
> in the near future?

As soon as both patches are merged.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--BXhH8iG0/4JcYZU2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU7DOFAAoJEBx+YmzsjxAgtm0P/00a7hosgRlJ8OfAo4jxdeDS
NrAc1PGdIe55eaJQ0QNrrODLlpSNCp2eNLRTledmuGU46y2D6kIL4JC65vwUdUv7
Gma/Vc+fQHrx5QF60D4GwapNVAuluiAw07v5z+L3WuiekIf43ysKY8O/DS4VISSH
PHF6lE7SDjvn4M8nL6EGLPauT2osc78PvuAa54IZR7ToZXJPLQ8J91xjYDyWV1XQ
aDk+3F0TX2xPzFrxS32GdDhvPce3NPHhGZnFJ8viZbjE4vsB6SZU+YF5fXVZCSdD
zlfzqvRABwI98rG0QEt8QLq3flFDkTRxCCIHdmNeXC/euufcw517x3l8+Tm0W4by
lMtjBzWGVvs9vhzGuu1Ga86Eww9zQmtGgaz/BLxvkmy2MDon91V1RYKzvvGNZWXQ
Hm1lzis6DW3hKQAypjeLaNXmGHDXZY0hkyj/bT0Va7HMF2zEUzWKl2YeZDk5w4J9
aq8crCZZ+6fn+hK1omkHomjGZ88rYruE+/y5XPghvuDYcc08Q2I99rMhuVO9e5la
2u3C8yhhP3LecOu8ke8ZT+XBIVVvbxpyzqxsqcmob1ojwIe2BAHllDETc/vYaqU9
j+SbB/HE6sRl5JIAcg7TNXz2NvwtTB+647wQnkbYb0ATQlkE9x7l8c2ne7HQ2h+r
F9gphax5y8YGXblcAei5
=0fMb
-----END PGP SIGNATURE-----

--BXhH8iG0/4JcYZU2--

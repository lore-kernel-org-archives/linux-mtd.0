Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SeOUX-0000Z6-A2
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 10:38:30 +0000
Message-ID: <1339497736.2401.24.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading
 its version
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 12 Jun 2012 13:42:16 +0300
In-Reply-To: <CAN8TOE_Li5bysfUS_MPPaBOF-vC64s3j-feTqfUJQsR6c_yb+A@mail.gmail.com>
References: <20120610135812.01dce4e7@pixies.home.jungo.com>
 <CAN8TOE_Li5bysfUS_MPPaBOF-vC64s3j-feTqfUJQsR6c_yb+A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MqP3O/o+MqL7QrP5/jed"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MqP3O/o+MqL7QrP5/jed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-06-10 at 22:59 -0700, Brian Norris wrote:
> Hi,
>=20
> On Sun, Jun 10, 2012 at 3:58 AM, Shmulik Ladkani
> <shmulik.ladkani@gmail.com> wrote:
> > - Not runtime tested.
>=20
> Patch looks fine, but this makes me curious: does anyone use
> NAND_BBT_ABSPAGE? It looked broken to me when I tried it not tool long
> ago, but I didn't look too deeply. (I doubt that this typo was its
> only problem, but I may try again...)

Looks like this is used in diskonchip.c.

--=20
Best Regards,
Artem Bityutskiy

--=-MqP3O/o+MqL7QrP5/jed
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP1x0IAAoJECmIfjd9wqK0KFoP/3fFiBqdeIhUZbXeUiYbfJt6
8xy3AVKmH0OahQ/c7eEDcRsUEGzuT+PhlbceiXv6lsWtJZFCWz4rjNBpAt1waVsF
dBhqkSmfnWepQxLeuH9orlnGwM9Yo/ePG+ehYK6L/XpzAoWh8jB/TQjFFq4gtnOp
RVsST7xeW5Mnh57XfskSarV0qUjsG2dgVFOcwl9OZfWttlTLzVPQ/OJIY4oI8mSN
vyCMgqGoEL7VO2CW91KA2sdCqEAo4Bl2kAQ4yzD4qRgf60ZF3Y+kaEEOvpc9M0k6
KfJ7y5f95/c0IP6tl/hIEi55Lx+zLGfz/EByx9eW3AgfY+hSb7W2LYGmXA3imzuI
d43lsnI2g/r+KtwaiStpMiw0DJ7TqSYmn5T60G7Kp5v+J2ZzCzKhOzZt4yAO0Gbs
uToOlXvbNCuBELdjIQ8SUEotRU17EQNvoty0liqXCX9DSaIM2acbu0sqUuIKoSLv
PzF2R015bE9jCEsiZ7JbfUkbnSkyAD+csIXsjweWFYxhX5eT7GNLeSaPafEpkMQT
9OrkFFQ+2lhPe7DNeBh3M9nUMaWy+s3EYp0C5WnSApITIUtjHbSJqj1Cd6/D3u0W
At+pqx+w/9OeusAvC8pZBb/hV3LVpGWuFfCFFNgQJ1j30eL0Gqwic4xHkmUUZoC6
nneCxWSLcUHrRH7VBlVb
=5Ihi
-----END PGP SIGNATURE-----

--=-MqP3O/o+MqL7QrP5/jed--

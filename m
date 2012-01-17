Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rn4J4-0004Uf-C8
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2012 08:22:14 +0000
Received: by iaek3 with SMTP id k3so875384iae.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2012 00:22:13 -0800 (PST)
Message-ID: <1326788619.28708.0.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Woodhouse, David" <david.woodhouse@intel.com>
Date: Tue, 17 Jan 2012 10:23:39 +0200
In-Reply-To: <1326747569.11686.31.camel@shinybook.infradead.org>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de> <1326320928.2338.37.camel@koala>
 <4F0EA32E.20500@linutronix.de> <1326494218.2258.36.camel@koala>
 <1326747569.11686.31.camel@shinybook.infradead.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-0NJmzzQtBJcabvzF58Jt"
Mime-Version: 1.0
Cc: Dan Carpenter <error27@gmail.com>, Barry Song <21cnbao@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, "Hunter,
 Adrian" <adrian.hunter@intel.com>, Gabor Juhos <juhosg@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Jamie Iles <jamie@jamieiles.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Florian Fainelli <florian@openwrt.org>, Peter Wippich <pewi@gw-instruments.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>, "Dong,
 Chuanxiao" <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Guillaume LECERF <glecerf@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-0NJmzzQtBJcabvzF58Jt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-16 at 20:59 +0000, Woodhouse, David wrote:
> On Sat, 2012-01-14 at 00:36 +0200, Artem Bityutskiy wrote:
> > I think so, because it is distributed, and it is historically the way
> > blocks had been marked as bad, and I thing vendors make sure this
> > mechanism works.=20
>=20
> They make sure it works for *them* at manufacturing time, sure. But what
> makes you so sure it'll work for *us*?

Well, I am 100% not sure of course. But think that because marking blocks a=
s bad using OOB is
the standard way, and vendors know about this, and they know that flash
bad blocks become bad, they will probably make try to make this
mechanism work for the users. But even if this is not true for a
specific chip, then the users should have BBT, and it will be used. But
I do not believe that=20

--=20
Best Regards,
Artem Bityutskiy


--=-0NJmzzQtBJcabvzF58Jt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFTALAAoJECmIfjd9wqK0w/8QAKMo5B4CQW0TLwnP1TXvR7gF
73ppypJ6LAVp2EZUFEEL0NlNRqXhDQ1TchNxwKAEo+JSabqTpSFO+WWIZLQBoq+H
pT10frw0rBaskXwPhuxQ86Xibu8J8Rl5fGmyzeL/9VpS8gBV2va13Tb2vzp0UoB9
LJKrBaan/4L5/Mm63xCf4/sutTJ2R821rMxxycpGf8eXcVXPv3vdxBIRtf2ZwH4f
hEV+eZ0eEy3LU8THMZ64DxWaLvCCxW/riac5t9PgcmX1kHsrmha+mUfzAZGEzOd9
qMueMqOqKhiKItV/zMPIgLiGlRdeR4ahg/Gf35G5vAQ7W+Tp5OpWOlQfE1SBWGZ9
7hmw/FzW2vAvsnCBTjPygtVt7cLH2jTKC9tcQGplr8dykx+MsnUocFjDqbi9AaeF
NSZkbRVe/Fdj931Qj1cbGylM1U0TdMevPK7jbsJB2GF5JfCE83jrQ5BFbfcKiG3r
sJCH1wrHsZ37462huXtc4Mqs80g4c8iMm/gcBULtI5JfM0pWU578Qqbvc+fJhpEQ
eCrFfZjDzRLw0Gi0QME9aUiGrm93aLxe9iPkn+IQokupzAH4x40g0CPyi7gI/rfK
auqB6cVT31V7lLyjFmlPgHjlCULSu1mFIbVXdStP/4ZA0Y7xjZerU0xryZeltcq0
AvVKvJAqeQrbzB9dz+Q4
=/OFY
-----END PGP SIGNATURE-----

--=-0NJmzzQtBJcabvzF58Jt--

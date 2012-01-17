Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rn4Mq-0004ei-1G
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2012 08:26:08 +0000
Received: by iaek3 with SMTP id k3so880641iae.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2012 00:26:07 -0800 (PST)
Message-ID: <1326788862.28708.2.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Woodhouse, David" <david.woodhouse@intel.com>
Date: Tue, 17 Jan 2012 10:27:42 +0200
In-Reply-To: <1326788619.28708.0.camel@sauron.fi.intel.com>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de> <1326320928.2338.37.camel@koala>
 <4F0EA32E.20500@linutronix.de> <1326494218.2258.36.camel@koala>
 <1326747569.11686.31.camel@shinybook.infradead.org>
 <1326788619.28708.0.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-KWTKPgJzDSF+mUH9KBfX"
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


--=-KWTKPgJzDSF+mUH9KBfX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Sorry, did not finish the e-mail :-)]

On Tue, 2012-01-17 at 10:23 +0200, Artem Bityutskiy wrote:
> Well, I am 100% not sure of course. But think that because marking blocks=
 as bad using OOB is
> the standard way, and vendors know about this, and they know that flash
> bad blocks become bad, they will probably make try to make this
> mechanism work for the users. But even if this is not true for a
> specific chip, then the users should have BBT, and it will be used. But
> I do not believe that=20

that current MTD BBT is reliable enough for modern flashes. For such
a hypothetical chip ti would have to be carefully assessed.

--=20
Best Regards,
Artem Bityutskiy

--=-KWTKPgJzDSF+mUH9KBfX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFTD+AAoJECmIfjd9wqK0l+kQAKUh471LFAvZjBdBq50tkEh7
J43Ks1UEjoDYRlC/lbYeLxd20MQukrg8vPz0GCLa7tRnXqTuut+b6ly71jhbuU3W
+CMOOU6LyLQrkGB9udPnCWj694/mwgoLvqro58K8AzrzaRcseelC04DiyCTAE4ZD
Wx2id/4WD0aoWtIO7j5QoJAZRptmjWlmIWhjEkvQfC++UoHTCqzisxpzLd+7arDk
Xn9ATem0gmXnGlDcoOiWF55LIwvZpwEHVy2Ctk8/9ZJQ1DWHlVHivJES8v4txTCg
6O5+0k88yoH6wNpbmtwpu+DSvH8MSpQ04RzifrYF8CmjJzJBAkB9tT0vE4hHrwIF
/NQUei2fBvNSD2NNq/YurJDT6q5Nkwz2tOgJCkoHE/YSGBZdwJPu6dL/rmPsE4lP
QEln7RhWC9X/bnfbQZCPNabyF8bypPXM+AXZpCU8HaVtO7AawjmUifKg5TUHt83R
8Lk+NNCNFNUJD1AGKDbywHDFuaIJ6k1o7hgOnGyMmfFuhWksXQkbcxSMdcOVJnO0
MFLY8Vuh5Q40zW3L1dRc0SG0Y2ADRflgr2TXw2fcOsZAv3Yi22rdbhRwx8IA3gkv
wBginCbUzxH6rDpaAn+aH4qxZUl0V/LIvYY6ULg4kO25Hb70CxdYj+DncdaQAa5N
dzpc36y8ughTrRD5ddDY
=6MSB
-----END PGP SIGNATURE-----

--=-KWTKPgJzDSF+mUH9KBfX--

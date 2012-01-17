Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rn995-0004f2-FM
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2012 13:32:16 +0000
Received: by ggnl1 with SMTP id l1so3594714ggn.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2012 05:32:13 -0800 (PST)
Message-ID: <1326807227.28708.6.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Date: Tue, 17 Jan 2012 15:33:47 +0200
In-Reply-To: <4F154BF6.6020608@st.com>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de> <1326320928.2338.37.camel@koala>
 <4F154BF6.6020608@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-jJXDMPr+O0nG1YasGaOk"
Mime-Version: 1.0
Cc: Dan Carpenter <error27@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Adrian Hunter <adrian.hunter@intel.com>, Gabor Juhos <juhosg@openwrt.org>,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Jamie Iles <jamie@jamieiles.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Barry Song <21cnbao@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Florian Fainelli <florian@openwrt.org>, Peter Wippich <pewi@gw-instruments.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
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


--=-jJXDMPr+O0nG1YasGaOk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-17 at 10:22 +0000, Angus CLARK wrote:
> On 01/11/2012 10:28 PM, Artem Bityutskiy wrote:
> > In my view, OOB BB markers is the primary, reliable, and simple
> > mechanism. And BBT is just an additional optimization to speed up syste=
m
> > startup.
>=20
> This seems to be contrary to the advice given by the various NAND manufac=
turers
> (with a quite unusual show of consensus!)  Once a block has been deemed t=
o have
> gone bad, one cannot rely on *any* operations being successful, and that
> includes writing a bad block marker to the OOB area.  The recommended app=
roach
> has for some time been to use a Flash-resident bad block table, with an i=
nitial
> scan for the manufacturer-programmed bad-block markers.

OK, thanks for correction and information.

--=20
Best Regards,
Artem Bityutskiy

--=-jJXDMPr+O0nG1YasGaOk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFXi7AAoJECmIfjd9wqK0C3YP/RZv9f4XjZ95ay+vnmJYJ3VN
KkZwLz8c0vpe452AnDM01F6tv+vZNXzsNMaGhu/XhxrPUqalMptBgq36GxjhT7wS
+Qtae9w8z446v84LVYKwXra5ng/CWfv33g+pbpvA9zBzFD5HSDQtvBqcP/Q1mKzK
OJonmc0zZawiRrO75kf9O5FrUsMmUYm8sakzPwp+zHmsSYxiieOZhvAymwAWNZS2
x2ScgDUbYP/vsNYfJu6QTdA59xbkgWnRAVp+47HB40/2C3XvtA3+rJr7Rvxij9p7
p1v+lDNiY62nlze9iDC0DW9MmUIKlxvKGmerBdAoyjE9Tfxtbo1As1J26WEL9dvL
+5pzp35QVdOTb8oDNoQeLDD03Y4ro1yTMgCspRQbDPUdX/le7Pv6LjptLP3KM9fm
S7qfQafFX1czeZVI6xdERZ6SwBwzBnUlnX5snpd+ejS08+pP4w3pQIAcI9Y3jcw+
GCRDp0XhZucmIhiWdMr2gcwz5nK0T+faNkaIKY1ZP9kSJv3kMXqqVE4qQtc8odtq
KAPwEe9PwXE+tzcpoEDsQmkA1EhTGfxJtdWe/fLEGzBQ/LTIM9AI4n6DQG2Tbdp0
OVtnJUXbbLEEzaSKxi+FRkNa7limXY2Xn8GZjZnzOh8pjDBXHYWUSqJs8sRg7X3o
4+jL16w+Q8Q4tvMClSnQ
=Zey/
-----END PGP SIGNATURE-----

--=-jJXDMPr+O0nG1YasGaOk--

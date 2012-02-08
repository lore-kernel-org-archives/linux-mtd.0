Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv77Y-0006Hx-7t
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 12:59:36 +0000
Content-Type: multipart/mixed; boundary="===============0085985631=="
MIME-Version: 1.0
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5] mtd: nand: write BBM to OOB even with flash-based BBT
Date: Wed, 8 Feb 2012 12:58:54 +0000
Message-ID: <1328706066.22240.63.camel@sauron.fi.intel.com>
References: <1328564640-21417-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1328564640-21417-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Cc: Angus CLARK <angus.clark@st.com>, Dan Carpenter <error27@gmail.com>,
 Barry Song <21cnbao@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, "Hunter,
 Adrian" <adrian.hunter@intel.com>, Gabor Juhos <juhosg@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Jamie Iles <jamie@jamieiles.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 "Woodhouse, David" <david.woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Florian Fainelli <florian@openwrt.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Peter Wippich <pewi@gw-instruments.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>, "Dong,
 Chuanxiao" <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Guillaume LECERF <glecerf@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--===============0085985631==
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-I2c+KNHGNRTOm8xsgvaZ"

--=-I2c+KNHGNRTOm8xsgvaZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-06 at 13:44 -0800, Brian Norris wrote:
> Currently, the flash-based BBT implementation writes bad block data only
> to its flash-based table and not to the OOB marker area. Then, as new bad
> blocks are marked over time, the OOB markers become incomplete and the
> flash-based table becomes the only source of current bad block
> information. This becomes an obvious problem when, for example:

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-I2c+KNHGNRTOm8xsgvaZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPMnISAAoJECmIfjd9wqK0kOsP/09fZ37bZH0KkCCimrGehyC3
onx9DH9OUSz2j32SMZD9bkz0COaWiAZT6ZLmA/WRcKXQfwd3kX2Y/n/fa/4t+8s7
J7FskxaawUPNIyL6KBpKTbQEvhXMByRMGzzOeFKS0XyUAfKKUOCecE1HuUwqXq9Q
73l1jGiFoJeAdLzv9EzBpGFZ2oSxSOEU/qx+walobLfxinWweIACmtxYAvrj3fxv
Ogm+VaBejteX4fOIAl0QgRFxuVhyK08TA05sVXxY8c7Xxn7RxoyXDDDshybejJ3h
zN11I9E70q5b00DJotrNDXnyM6Srm4My+8cyz8ouJEzB/5uMwaEGCpDH5ncXpjE3
xrfLfqLXZEkYrScpOjW5kOQJpSFJ5IKbKs8HVFSdYm/ch3XzxDsLzE0s20P3+qnk
1cirnTKhnfFa++RLuC+NqvNkJED+F22J+/2ErtM1jiblcyoumXWWorEMLiFBlZI5
w1+OJrFsghtQwzWSQX7F+X4L4nfwMbMnV6g49pSCVxnuu0pwM1ukF3tUY8dpe9f5
xdblPzqvgiGTVltkQF5NgmvEKPEaaNZW2tKE+cjbyilRnXbb+g8yRPL0DORpfNbr
+EehdB491eB5w+WIaE5u3z/9S7Cz3Mtnt9jpY6nCtoTJaDN27HoSWymkskTTA1z5
stFPbe6BDUbOJXCYaVv+
=GH1c
-----END PGP SIGNATURE-----

--=-I2c+KNHGNRTOm8xsgvaZ--

--===============0085985631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--===============0085985631==--

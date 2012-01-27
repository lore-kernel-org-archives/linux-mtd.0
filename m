Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RqnG1-0003Cx-FX
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 14:58:30 +0000
Content-Type: multipart/mixed; boundary="===============1605328506=="
MIME-Version: 1.0
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 1/2] mtd: nand: move SCANLASTPAGE handling to the
 correct code block
Date: Fri, 27 Jan 2012 14:56:55 +0000
Message-ID: <1327676348.29385.7.camel@sauron.fi.intel.com>
References: <1327120684-7066-1-git-send-email-computersforpeace@gmail.com>
 <1327120684-7066-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1327120684-7066-2-git-send-email-computersforpeace@gmail.com>
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

--===============1605328506==
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-g7MlqOCbTDity2yJoQ93"

--=-g7MlqOCbTDity2yJoQ93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-20 at 20:38 -0800, Brian Norris wrote:
> As nand_default_block_markbad() is becoming more complex, it helps to
> have code appear only in its relevant codepath(s). Here, the calculation
> of `ofs' based on NAND_BBT_SCANLASTPAGE is only useful on paths where we
> write bad block markers to OOB. We move the condition/calculation closer
> to the `write' operation and update the comment to more correctly
> describe the operation.
>=20
> The variable `wr_ofs' is also used to help isolate our calculation of
> the "write" offset from the usage of `ofs' to represent the eraseblock
> offset. This will become useful when we reorder operations in the next
> patch.
>=20
> This patch should make no functional change.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed this patch to l2-mtd.git because it seem to be good regardless of
whether your second patch gets merged or not, thanks.

Not sure about the second patch yet, though.
--=20
Best Regards,
Artem Bityutskiy

--=-g7MlqOCbTDity2yJoQ93
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPIru8AAoJECmIfjd9wqK0dvQP/2EySU3hkVLHmEYDKcZd8/+u
EV6e3pqu89DpyUqH/Dj8G+qoawxuS5CVUNPlTQwtJxsHknFj2KzfYIWs6zl7IsjF
MxRzMWvT3RcuNcEePSoZ8xpiM0Q5hiP2jlFkPnLmjRcO1geglOgi7A/RrcTYKS5K
ZPD3vOoHcAmH2S3xu5Ib5gQ/sBG5zZO++HcZqQa2f0Dc3a4tOQa51rmyS1pl8Nen
rOogKbsIX7lt+slvwIT6HnNk/Mr0sUQmiipUz0KDOfrQvns5iMa+8gaSaLmbciTx
95og07haQOHy6QoAFeMRFcSHWLSDVY9PsRUw9bSa78Y1/4qpmWXLayh97uZ2elDF
b4QE0lf6fXin17JGg/kWWUbJePa90TXjP/KIV+hqNEelIN9RQq3R3QpSZG62k6q/
ThlAvsN9t/8GhNzst6ABjo0T2O+Z9g6Q5BO/XUEF7GuoneqjS694mVsRwNwDAg1R
N5tK4Hd+vq5SB7lU60p2+HSx0RR42V+ra4xCT1QeOmwnw22o/xzZr6SRtymOR6Ys
qvoX6ZWZtWUD4js9zCC1Yx+/6lLRFBLYkhzNmfUaeMpTen+qZh0ZcdeM01AqsIS+
acN19Gb1hCpnBAIJKktKn2XAH2ItZUHtBZzv6B1IuKq9FfBeUdFCx3JNNWSCUWhz
S/UsJV+IkD5PF9++BohR
=GiME
-----END PGP SIGNATURE-----

--=-g7MlqOCbTDity2yJoQ93--

--===============1605328506==
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

--===============1605328506==--

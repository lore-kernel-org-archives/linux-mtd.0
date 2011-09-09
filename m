Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R1w3U-00061h-5V
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2011 08:03:20 +0000
Date: Fri, 9 Sep 2011 10:03:02 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Yong Zhang <yong.zhang0@gmail.com>
Subject: Re: [PATCH 44/62] mtd: irq: Remove IRQF_DISABLED
Message-ID: <20110909080302.GD1912@pengutronix.de>
References: <1315383059-3673-1-git-send-email-yong.zhang0@gmail.com>
	<1315383059-3673-45-git-send-email-yong.zhang0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ieNMXl1Fr3cevapt"
Content-Disposition: inline
In-Reply-To: <1315383059-3673-45-git-send-email-yong.zhang0@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Baruch Siach <baruch@tkos.co.il>, Eric Miao <eric.y.miao@gmail.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>, Lei Wen <leiwen@marvell.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	linux-mtd@lists.infradead.org, Andres Salomon <dilinger@queued.net>,
	Jamie Iles <jamie@jamieiles.com>, tglx@linutronix.de,
	David Woodhouse <dwmw2@infradead.org>, mingo@elte.hu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2011 at 04:10:41PM +0800, Yong Zhang wrote:
> This flag is a NOOP and can be removed now.
>=20
> Signed-off-by: Yong Zhang <yong.zhang0@gmail.com>

Acked-by: Wolfram Sang <w.sang@pengutronix.de>

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--ieNMXl1Fr3cevapt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk5pyDYACgkQD27XaX1/VRsCLACfQ4uZK2/hfMJk1T+7qM8F7rzI
cOUAoI40NJqAPUsZN8xccnt0XbnDSHk1
=MllA
-----END PGP SIGNATURE-----

--ieNMXl1Fr3cevapt--

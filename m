Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkvet-00063k-JT
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2012 10:43:57 +0000
Date: Wed, 11 Jan 2012 11:43:39 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v4] MTD/GPMI bugfix : reset the BCH module when it is
 not MX23
Message-ID: <20120111104339.GB2605@pengutronix.de>
References: <1325647126-4281-1-git-send-email-b32955@freescale.com>
 <1326185340.8847.11.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline
In-Reply-To: <1326185340.8847.11.camel@sauron.fi.intel.com>
Cc: baruch@tkos.co.il, marek.vasut@gmail.com, koen.beel.barco@gmail.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 shijie8@gmail.com, linux-arm-kernel@lists.infradead.org,
 LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2012 at 10:49:00AM +0200, Artem Bityutskiy wrote:
> On Wed, 2012-01-04 at 11:18 +0800, Huang Shijie wrote:
> > In MX28, if we do not reset the BCH module. The BCH module may
> > becomes unstable when the board reboots for several thousands times.
> > This bug has been catched in customer's production.
> >=20
> > The patch adds some comments(some from Wolfram Sang), and fixes it now.
> >=20
> > Also change gpmi_reset_block() to static.
> >=20
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > Acked-by: Marek Vasut <marek.vasut@gmail.com>
>=20
> Pushed to l2-mtd-2.6.git, thanks!

I somehow missed this patch, if it's not too late, you can add my

Reviewed-by: Wolfram Sang <w.sang@pengutronix.de>

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8NZ9sACgkQD27XaX1/VRvwoQCaAxMR607dS9GoITGTL0JesGKn
XF8AoMSMyQD+flj2a3RGQO97Cg2w06Oh
=d5nb
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--

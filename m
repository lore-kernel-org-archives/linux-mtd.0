Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TiokG-0000hi-Kv
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 16:01:17 +0000
Date: Wed, 12 Dec 2012 17:01:08 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: nand: gpmi: reset BCH earlier, too, to avoid NAND
 startup problems
Message-ID: <20121212160108.GA2607@pengutronix.de>
References: <1354740362-20412-1-git-send-email-w.sang@pengutronix.de>
 <1355325103.3400.2.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <1355325103.3400.2.camel@sauron.fi.intel.com>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <david.woodhouse@intel.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 12, 2012 at 05:11:43PM +0200, Artem Bityutskiy wrote:
> On Wed, 2012-12-05 at 21:46 +0100, Wolfram Sang wrote:
> > It could happen (1 out of 100 times) that NAND did not start up
> > correctly after warm rebooting, so the kernel could not find the UBI or
> > DMA timed out due to a stalled BCH. When resetting BCH together with
> > GPMI, the issue could not be observed anymore (after 10000+ reboots). We
> > probably need the consistent state already before sending any command to
> > NAND, even when no ECC is needed. I chose to keep the extra reset for
> > BCH when changing the flash layout to be on the safe side.
> >=20
> > Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> > Cc: Huang Shijie <b32955@freescale.com>
> > Cc: Artem Bityutskiy <dedekind1@gmail.com>
> > Cc: David Woodhouse <david.woodhouse@intel.com>
> > ---
> >=20
> > Would be really great to have in 3.7. Also a stable-candidate IMO.
>=20
> Pushed to l2-mtd.git, thanks
>=20
> If you believe this is suitable for stable, please let me know.

I strongly believe that.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlDIqkQACgkQD27XaX1/VRtrBwCfbjWamaayesbwosHgPMYSpKcz
uswAoMVlHVTuFBGfWloQX30893Jia4eK
=7i81
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--

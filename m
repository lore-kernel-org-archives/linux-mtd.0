Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pcfwb-0001GU-B0
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 15:15:34 +0000
Date: Tue, 11 Jan 2011 16:15:28 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH 12/16] mtd: mpc5121_nfc: don't treat NULL clk as an error
Message-ID: <20110111151528.GB25741@pengutronix.de>
References: <1294749833-32019-1-git-send-email-jamie@jamieiles.com>
	<1294749833-32019-13-git-send-email-jamie@jamieiles.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <1294749833-32019-13-git-send-email-jamie@jamieiles.com>
Cc: Vincent Sanders <support@simtec.co.uk>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2011 at 12:43:49PM +0000, Jamie Iles wrote:
> clk_get() returns a struct clk cookie to the driver and some platforms
> may return NULL if they only support a single clock.  clk_get() has only
> failed if it returns a ERR_PTR() encoded pointer.
>=20
> Cc: Vincent Sanders <support@simtec.co.uk>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

Reviewed-by: Wolfram Sang <w.sang@pengutronix.de>

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk0sdBAACgkQD27XaX1/VRvKDACeJn3lvW2SQdz1ysVcRupikh5Q
/isAnir2WsLgJx0cTB1uXmP8YH4Sol+N
=4GrT
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--

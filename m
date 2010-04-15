Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O2FCn-00064n-Qc
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2010 02:53:26 +0000
Date: Thu, 15 Apr 2010 04:53:21 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: [PATCHv2 1/2] MTD: cfi_cmdset_0002: Add reboot notifier for
	AMD flashes
Message-ID: <20100415025321.GB14954@pengutronix.de>
References: <1271221078.2532.5.camel@localhost.localdomain>
	<a00f98bfcda7db841108605ebab8d07363f4aa8b@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <a00f98bfcda7db841108605ebab8d07363f4aa8b@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, saeed.bishara@gmail.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2010 at 05:57:33PM -0700, Kevin Cernekee wrote:
> Ensure that the flash device is in a quiescent state before rebooting.
> The implementation is closely modeled after the cfe_cmdset_0001 reboot
> notifier, commit 963a6fb0a0d336d0513083b7e4b5c3ff9d6d2061 .
>=20
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

Yes, if this is present for Intel, it should be present for AMD, IMHO.

Acked-by: Wolfram Sang <w.sang@pengutronix.de>

Still, the correct solution is to wire the correct reset-line to the flashe=
s.
Above patch will not help if a watchdog kicks in. Been there :(

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvGf6EACgkQD27XaX1/VRuxvACdGIp8CjRPZTaXtOm7sFBP+5uL
fFsAn1p7OC/twVIhzbn+tMW3MG1EDyPJ
=9H/B
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--

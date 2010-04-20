Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O473l-0005im-CB
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2010 06:35:50 +0000
Date: Tue, 20 Apr 2010 08:35:47 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Can PYSMAP_COMPAT go?
Message-ID: <20100420063547.GH19957@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbfcI4OLZ4XW0yH2"
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--VbfcI4OLZ4XW0yH2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

triggered by bug-report #15729 (thread at [1]), I wondered where default "0"
for MTD_PHYSMAP_LEN came from and found
73566edf9b91dd085ddb12033d0ea7288979dd10. Its description says:

    Once all physmap users have been converted to instantiate their own
    platform devices, the compat code can go.  (Or we decide that we can
    change all the in-tree users at the same time, and never merge the
    compat code.)

Grepping for current users:

~/Kernel/linux-2.6/arch$ grep -r 'MAP_COMPAT' * | grep -v 'is not set'
sh/configs/polaris_defconfig:CONFIG_MTD_PHYSMAP_COMPAT=3Dy

This one could be fixed and then the compat code could be removed. I'd pick=
 up
the job, if I get a sign that this has a chance to go in. Or shall compat s=
tay
for a reason?

Regards,

   Wolfram

[1] http://marc.info/?l=3Dlinux-kernel&m=3D127024096210230&w=3D2

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--VbfcI4OLZ4XW0yH2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvNS0MACgkQD27XaX1/VRvc9QCgkFDjSuUep31ofxHrUzYzdJmb
Ch0Anik8iT2JkB6XzpA4UXkJhUZOxH0Q
=po8L
-----END PGP SIGNATURE-----

--VbfcI4OLZ4XW0yH2--

Received: from ganesha.gnumonks.org ([2001:780:45:1d:2e0:81ff:fe28:898a])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4aKt-0008Ik-Qe
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 11:10:08 +0000
Date: Tue, 18 Dec 2007 12:06:16 +0100
From: Harald Welte <laforge@openmoko.org>
To: linux-arm-kernel@lists.arm.linux.org.uk
Subject: [PATCH 0/12] neo1973: FIC/OpenMoko Neo1973 GTA01 machine support
Message-ID: <20071218110616.GG29882@prithivi.gnumonks.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, i2c@lm-sensors.org, ben-linux@fluff.org,
	linux-input@vger.kernel.org, spi-devel-general@lists.sourceforge.net,
	arnaud.patard@rtp-net.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

This is a patchset to add core machine support for the FIC/OpenMoko
Neo1973 GTA01 GSM smartphone[1] to the Linux Kernel.  They all apply to
Linus' linux-2.6 git tree as of today.

The Neo1973 GTA01 is hardware that has been distributed to developers
for about one year, and is on public sale since July 2007.

There is a second reviison called GTA02 which is also already circulated
among developers since September 2007.  It is expected to be publicly
available soon.

There is some code that is shared by GTA01 and GTA02, and 'neo1973' is
used consistently whenever referring to shared code (platform devices,
file names as well as CONFIG_ #defines).  Whenever GTA01 is used, this
particular piece of code is specifically to the first hardware
generation.

I have some more patches piled up, including GTA02 support.  But I'd
much rather see this patchset merged first.

All your comments and feedback are welcome.  Please keep me in Cc
whenever responding.

[1] http://www.openmoko.org/

Happy hacking,
--=20
- Harald Welte <laforge@openmoko.org>          	        http://openmoko.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Software for the world's first truly open Free Software mobile phone

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHZ6moXaXGVTD0i/8RApiIAKCM9+gEmYg2yQs4nMQoPG1F6tLx3gCfRbXV
spHtP0kIz0vJpwtitMdmfMs=
=oD/y
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--

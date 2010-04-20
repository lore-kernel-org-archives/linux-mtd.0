Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O45SU-0005oG-3m
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2010 04:53:15 +0000
Date: Tue, 20 Apr 2010 06:53:01 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [Bug #15729] BUG: physmap modprobe & rmmod
Message-ID: <20100420045301.GF19957@pengutronix.de>
References: <deuQKFRcc0B.A.3EG.BRSzLB@tosh> <YeFfFNFyTSF.A.MFH.fRSzLB@tosh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TU+u6i6jrDPzmlWF"
Content-Disposition: inline
In-Reply-To: <YeFfFNFyTSF.A.MFH.fRSzLB@tosh>
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	hsweeten@visionengravers.com, linux-mtd@lists.infradead.org,
	Kernel Testers List <kernel-testers@vger.kernel.org>,
	dwmw2@infradead.org, Maciej Rutecki <maciej.rutecki@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--TU+u6i6jrDPzmlWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2010 at 05:19:23AM +0200, Rafael J. Wysocki wrote:
> This message has been generated automatically as a part of a summary repo=
rt
> of recent regressions.
>=20
> The following bug entry is on the current list of known regressions
> from 2.6.33.  Please verify if it still should be listed and let the trac=
king team
> know (either way).
>=20
>=20
> Bug-Entry	: http://bugzilla.kernel.org/show_bug.cgi?id=3D15729
> Subject		: BUG: physmap modprobe & rmmod
> Submitter	: Randy Dunlap <randy.dunlap@oracle.com>
> Date		: 2010-04-02 20:40 (18 days old)
> Message-ID	: <20100402134058.c4682716.randy.dunlap@oracle.com>
> References	: http://marc.info/?l=3Dlinux-kernel&m=3D127024096210230&w=3D2

Patch is here:

	https://patchwork.kernel.org/patch/90497/

I'd ack it if I still had the original mail :)

CCing linux-mtd and some more people, so it can get picked up.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--TU+u6i6jrDPzmlWF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvNMy0ACgkQD27XaX1/VRvOjwCfR5BTbMlc8HV5GK2pT0/fk2cx
m0MAoIBhg7erLShmPhpufA/BiydjkyeX
=IKW4
-----END PGP SIGNATURE-----

--TU+u6i6jrDPzmlWF--

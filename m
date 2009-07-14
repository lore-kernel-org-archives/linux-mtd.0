Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQiUd-0002Lh-9c
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 13:56:30 +0000
Date: Tue, 14 Jul 2009 15:56:21 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] [MTD] [CHIPS] cfi_cmdset_0001.c: put chip into
	read-array mode after unlocking
Message-ID: <20090714135621.GF7572@pengutronix.de>
References: <1247578544-6950-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yH1ZJFh+qWm+VodA"
Content-Disposition: inline
In-Reply-To: <1247578544-6950-1-git-send-email-vapier@gentoo.org>
Cc: Graf Yang <graf.yang@analog.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--yH1ZJFh+qWm+VodA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> We should try and keep the flash in the default read-array mode when
> possible so that we are much more likely to properly recover from
> unexpected reboot events (such as watchdog expiring).  If we only unlock

Hmm, the right thing to do would be fixing the watchdog to reset the flash
correctly, no? As your patch makes non-working watchdogs less obvious, I fe=
ar
that lockups will then happen when it's too late (=3D devices are deployed).

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--yH1ZJFh+qWm+VodA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpcjoUACgkQD27XaX1/VRuOIACfYzlFQ4wDGtHhsemzjKTh48nM
mk8AoMd7/BicprVimjJYEh558GhYsmqc
=jHDv
-----END PGP SIGNATURE-----

--yH1ZJFh+qWm+VodA--

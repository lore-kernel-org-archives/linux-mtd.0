Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQj3X-0002hn-NE
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 14:32:34 +0000
Date: Tue, 14 Jul 2009 16:32:29 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] [MTD] [CHIPS] cfi_cmdset_0001.c: put chip into
	read-array mode after unlocking
Message-ID: <20090714143229.GG7572@pengutronix.de>
References: <1247578544-6950-1-git-send-email-vapier@gentoo.org>
	<20090714135621.GF7572@pengutronix.de>
	<8bd0f97a0907140714t3326e26am99c65ea5fcc62647@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yQbNiKLmgenwUfTN"
Content-Disposition: inline
In-Reply-To: <8bd0f97a0907140714t3326e26am99c65ea5fcc62647@mail.gmail.com>
Cc: Graf Yang <graf.yang@analog.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--yQbNiKLmgenwUfTN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> the CFI layers already go through steps to keep the memory in read
> mode by default.

Ah, okay. With this assumption, the patch makes sense. Still, the patch
description should refer more to the above statement and not to watchdogs I=
MHO.

> the only way the watchdog could reconfigure the
> flash is if it were setup to execute software instead of kick the
> hardware, and that makes the system significantly less reliable.

I meant fixing the watchdog in hardware: If the watchdog pulls the right
#RESET, the flash will be in read-mode by default. If not, this is an impor=
tant
hardware issue.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--yQbNiKLmgenwUfTN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpclv0ACgkQD27XaX1/VRvgUwCgobF43v/CKr+/cgvs0x/Ru4Ht
yR8AoMUnxCPgfSHep7MpddUQ6haY8R/t
=tOBp
-----END PGP SIGNATURE-----

--yQbNiKLmgenwUfTN--

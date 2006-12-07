Received: from mail.gmx.net ([213.165.64.20])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GsMAW-0000Fv-U1
	for linux-mtd@lists.infradead.org; Thu, 07 Dec 2006 11:32:29 -0500
From: Toralf =?utf-8?q?F=C3=B6rster?= <toralf.foerster@gmx.de>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: linux-2.6.19-g620034c8 build #163 failed
Date: Thu, 7 Dec 2006 17:32:11 +0100
References: <200612071141.35086.toralf.foerster@gmx.de>
	<1165503148.24220.10.camel@zod.rchland.ibm.com>
In-Reply-To: <1165503148.24220.10.camel@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1837635.vFPJcxfG5f";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200612071732.14114.toralf.foerster@gmx.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart1837635.vFPJcxfG5f
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Donnerstag, 7. Dezember 2006 15:52 schrieb Josh Boyer:

> You have genprobe as a module (as well as core MTD), but AMDSTD compiled
> in.  That seems very odd.  Try setting CONFIG_MTD_CFI_AMDSTD=3Dm
>=20
Hi,

because I used "make oldconfig" I'd assume that teh resulting config file i=
s valid.
Problems like this are often related to Kconfig oddities, isn't it ?

=2D-=20
MfG/Sincerely

Toralf F=C3=B6rster

--nextPart1837635.vFPJcxfG5f
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBFeEIOhyrlCH22naMRAh6yAJoCe7Q5p5CCZWt+fNsj10DL0NhFxwCgyBs7
SlLScj/c3soyhKbrvamtW4s=
=4BV9
-----END PGP SIGNATURE-----

--nextPart1837635.vFPJcxfG5f--

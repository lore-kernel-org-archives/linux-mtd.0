Received: from [200.198.105.36] (helo=hermes.digitel.com.br)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ajn2C-0005jw-Ea
	for linux-mtd@lists.infradead.org; Thu, 22 Jan 2004 22:10:45 +0000
Received: from [10.10.10.160] by hermes.digitel.com.br (GMS
	9.01.3158/NU1492.00.9f247607) with ESMTP id lirkwaaa for
	linux-mtd@lists.infradead.org; Thu, 22 Jan 2004 20:15:13 -0200
Date: Thu, 22 Jan 2004 19:10:04 -0200
From: =?ISO-8859-1?Q?Lu=EDs_Vit=F3rio?= Cargnini <vitorio@digitel.com.br>
To: linux-mtd@lists.infradead.org
Message-Id: <20040122191004.249729a9.vitorio@digitel.com.br>
In-Reply-To: <20040122141656.4a86ad19.vitorio@digitel.com.br>
References: <20040122141656.4a86ad19.vitorio@digitel.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha1";
 boundary="Signature=_Thu__22_Jan_2004_19_10_04_-0200_8DhgF=84c6DerLkz"
Subject: Re: Problems with Macronix MX029LV065
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Thu__22_Jan_2004_19_10_04_-0200_8DhgF=84c6DerLkz
Content-Type: text/plain; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Please disconsider my last mail the problem is the CHIP of Macronix, i'll b=
e in contact with manufactor to solve this the chip are giving wrong values=
 during CFI probe, i'll post  the solution together the manufactor tomorrow.

On Thu, 22 Jan 2004 14:16:56 -0200
Lu=EDs Vit=F3rio Cargnini <vitorio@digitel.com.br> wrote:

> Hi i'm trying to substitute my AMD 29LV065 by Macronix MX29LV065, bu
> ti'm having problems during the Linux Kernel Load of this chip, i have
> did modifications on PPCBOOT and it worked. But during Kernel probe
> phase it's freazing the kernel it get in a loop trying to fetch the
> chip in cfi_chip_probe, what i must do to could use this chip ??
> Someone could help ? Need more information ?
>=20
> --=20
> Thanks && Regards
> Lu=EDs Vit=F3rio Cargnini
> Master Degree Student @ PUC-RS
> Computer Science Bacharelor
> PUC-RS
> Pontif=EDcia Universidade Cat=F3lica - Rio Grande do Sul
> Brasil
>=20


--=20
Thanks && Regards
Lu=EDs Vit=F3rio Cargnini
Master Degree Student @ PUC-RS
Computer Science Bacharelor
PUC-RS
Pontif=EDcia Universidade Cat=F3lica - Rio Grande do Sul
Brasil

--Signature=_Thu__22_Jan_2004_19_10_04_-0200_8DhgF=84c6DerLkz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAEDwtII4c9KZOcnoRAsIBAJsH4vN/fOXCYRPM3P+DSoOAKF3mTgCgkSIf
ZFHYuAEQYu5EJYXzxN9N7zE=
=W2wH
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Jan_2004_19_10_04_-0200_8DhgF=84c6DerLkz--

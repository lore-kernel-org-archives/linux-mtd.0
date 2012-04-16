Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SJsaf-0000m4-SS
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2012 20:32:02 +0000
Date: Mon, 16 Apr 2012 22:31:53 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: celinux-dev@lists.celinuxforum.org
Subject: [PROPOSAL] Start working on the "unstable bits" issue to make UBIFS
 more robust
Message-ID: <20120416203153.GA11951@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Start working on the "unstable bits" issue to make UBIFS more robust

; Summary: Start working on the "unstable bits" issue to make UBIFS more ro=
bust

; Proposer: Wolfram Sang

=3D=3D Description =3D=3D

UBIFS on top of UBI is today the defacto standard filesystem for flash-based
storage (NOR, NAND) and is already used in many consumer products. It is st=
able
and well tested. There is one major known issue, though, called "unstable b=
its"
(see link in related work), often in accordance with power cuts. The proble=
ms
involved are complex and even to start tackling them, a concentrated effort=
 is
needed. In the description of "unstable bits", there is already a roadmap
presented and this proposal suggests to pick up the first task:

--- Quote starts

1) Improve the existing power cut emulation infrastructure in UBIFS and sta=
rt
emulating unstable bits. Start with emulating only one type of unstable bit=
s,
e.g., type 1.

--- Quote ends

When this is in place, it will enable UBIFS developers (and file system
developers in general) to do power cut simulations much more easily and fix
related bugs or implement proper mechanisms. Automated tests will also bene=
fit
=66rom this work.

Given the importance of flash based storage these days, it seems worthwhile=
 to
get the ball rolling regarding "unstable bits".


=3D=3D Related work =3D=3D

* "unstable bits" description - http://www.linux-mtd.infradead.org/doc/ubif=
s.html#L_unstable_bits

=3D=3D Scope =3D=3D

3 weeks should be needed to make the general emulation proper. If all goes =
well,
maybe more types of power cuts could be implemented in that timeframe.

=3D=3D Contractor Candidates =3D=3D

Artem Bityutskiy (current UBI/UBIFS maintainer) already declined, sadly. Bu=
t he
will be around for reviews etc. Other recently active contributors to MTD/U=
BI
could probably be asked.

=3D=3D Comments =3D=3D

[[Category:Project proposals 2012]]

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk+MgbkACgkQD27XaX1/VRvLwwCfXFM5iZ3wst8Qh/g7aXP667BD
S64An0HJNvyglmOn+Nm2FgQAkyz2d7H7
=PySL
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--

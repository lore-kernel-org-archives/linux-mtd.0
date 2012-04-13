Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SIolE-0004IG-8Q
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 22:14:33 +0000
Date: Sat, 14 Apr 2012 00:14:17 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [RFC] CEWG Open Project Proposal for "unstable bits" work
Message-ID: <20120413221417.GA26836@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutski <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

as mentioned in another thread, here is a draft for the CEWG project propos=
al.
Please comment.

Thanks,

   Wolfram

=3D=3D=3D=3D

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
more types of power cuts could be implemented.

=3D=3D Contractor Candidates =3D=3D
Artem Bityutskiy (current UBI/UBIFS maintainer)

=3D=3D Comments =3D=3D


[[Category:Project proposals 2012]]

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk+IpTkACgkQD27XaX1/VRt3SwCffSNfoyIBGlVXmAC0uiqYOA4m
AfEAnRkatLVl2V/dI9IA9tPnC6UMva1P
=ZALX
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

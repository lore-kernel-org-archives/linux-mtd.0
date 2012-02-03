Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtBo7-0005lh-AJ
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 05:35:35 +0000
Received: by pbdx9 with SMTP id x9so3140494pbd.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 21:35:34 -0800 (PST)
Message-ID: <1328247455.6750.25.camel@sauron.fi.intel.com>
Subject: Re: linux-next: Tree for Feb 2 (fs/jffs2)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 03 Feb 2012 07:37:35 +0200
In-Reply-To: <4F2AD4DE.7040508@xenotime.net>
References: <20120202144516.11b33e667a7cbb8d85d96226@canb.auug.org.au>
 <4F2AD4DE.7040508@xenotime.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-C1G1Szhbc5YkJohSBUPA"
Mime-Version: 1.0
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-C1G1Szhbc5YkJohSBUPA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-02-02 at 10:24 -0800, Randy Dunlap wrote:
> On 02/01/2012 07:45 PM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20120201:
>=20
>=20
> fs/jffs2/*.c still contains uses of ->read etc. instead of using
> mtd_read() etc.

The fix from Brian has been pushed to l2-mtd.git, should be fixed.
Thanks for reporting and sorry for the breakage.

--=20
Best Regards,
Artem Bityutskiy

--=-C1G1Szhbc5YkJohSBUPA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPK3KfAAoJECmIfjd9wqK0n3IQAMUi9ZqetEHEPJ+nMKksAYfi
FIhyFHMkRkDDm5mxaqTNarSgA+D+986KCAaCZTwlzm6fdmfLgXNcR/HgugRxDGiY
Oy2+IXFYoE/GGGFOjOF4pqD4b5g1BqkdtRBCXLM6tIzrP0YIpb3pFZDzWzhF93pR
ep+FWXED82SRmb5scieuaqALA4DfsNcJisVxBH5Sfk3BHxQcagMxNbKu4rZvYiQ7
OjnvWQrD6P6PTJ/MIw1RqIuSXMSPHtvkqAA5y2jiaqFo96xeWtLpAI325rSzPCyO
B4TOWNN3ugFvsVNieUQjKbVDoOhsRQiXdaAg3MCPLeE/qX5IkGrxB8Rz6e/f10Uw
Kq3BN/lwAzwVxHlNOEw8YJrz1cMJ6sjanWIfafPkeerhnDEQjZVowJjMbaSwMlvk
W/A07Pr/GoxtOcHabfu6aWlwpIgTL6JM/Pc0MK1DHPgHsR00houXarslLO19S9Qb
fxSDuodaJKFcqZemy3M1/H01JwOZ/IQZrqPfBDP8sKTR9JLs+aca4g4+JGS6ymtL
kE9k295cJ7pVHs7ACBRmyuPxaF1D7yTncZJKoHbuZ4pOxvnsTSA9BnIlUL3vDJ0t
vHYPEjm2K7X4BtEIUA+K8Ixeq0FEaNoKI0/1BcHd4pbwBJEL8FdqF14nxY+aAm+z
wmQyGJp4GIpKwmPK5liI
=mTux
-----END PGP SIGNATURE-----

--=-C1G1Szhbc5YkJohSBUPA--

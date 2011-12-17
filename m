Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rbvtb-0007i5-51
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 15:09:55 +0000
Received: by iadk27 with SMTP id k27so5541783iad.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 07:09:54 -0800 (PST)
Message-ID: <1324134682.4240.43.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] libmtd: allow write operations when MEMWRITE is not
 supported
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Dec 2011 17:11:22 +0200
In-Reply-To: <8762hf44v4.fsf@macbook.be.48ers.dk>
References: <1323459914-25294-1-git-send-email-computersforpeace@gmail.com>
 <1323725206.2297.24.camel@koala>
 <CAN8TOE9-4j0pC5Vocu4v9toczvKAyKnRtZ6AE3fjt7Fk8PaZ=g@mail.gmail.com>
 <1324133082.4240.29.camel@sauron.fi.intel.com>
 <8762hf44v4.fsf@macbook.be.48ers.dk>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Kd/LZONCYVE8jpXFCHhJ"
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Kd/LZONCYVE8jpXFCHhJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2011-12-17 at 16:03 +0100, Peter Korsgaard wrote:
> >>>>> "Artem" =3D=3D Artem Bityutskiy <dedekind1@gmail.com> writes:
>=20
> Hi,
>=20
>  >> > I guess this require an urgent mtd-utils release.
>=20
>  Artem> OK, I've cut mtd-utils-1.4.9 bug-fix release, this time with my
>  Artem> new script, so I hope nothing is forgotten.
>=20
>  Artem> Peter, please, update - this release fixes a bad bug which breaks=
 NOR
>  Artem> erase operation in not-yet-released 3.2 kernel.
>=20
> Thanks for the heads up, I was just about to rebase a NOR-using platform
> to 3.2.
>=20
> Updated buildroot. It builds fine here, so it seems like the script is
> working.

Notice also than now we also provide the mtd-utils-1.4.9.tar.bz2.asc
tarball signature and we also sign the mtd-utils tags.

--=20
Best Regards,
Artem Bityutskiy

--=-Kd/LZONCYVE8jpXFCHhJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO7LEaAAoJECmIfjd9wqK0PNoQAMz7+ZTRFsubIUgjaEu6lsnO
lARGK9kCklrN8bHEkiM1uHNkTZZC3lUrXgyqh4CDKeKJ4ws0PZ75sdXk/ZPT7Fw6
T3ZtWqe/3JjU/CZoK/2TwJmBQaWC2fg23XapvPcd3munVqHpmjeFIGzSdktQciOf
Yq0MmASoTdXE09Wu2Zb1MroXVoZtPZTrc/4KoVaidcqUjezrVZ45Vzf2yEDRDpyt
SFEqx82J3xeHjZSTUAcWPz7BSTsCkWQ4ylgW9Xs8V6db5Xve/CVaOlDuVciv5DH9
slQbcdLgK9DeSycR1550Hte3FrCabaxhOEkeRXaTMu0BRIUTk2FkRhGYXfsrsEqN
Y5uYuWJebfiI6qZtn4h0m3vLoaKHwe865sCb6HB9xAAvZ8uggpH9HHNrdum7Zofo
Uj4u0Js5tjHw3L71oNyn37EzAYAzMB6adyT7hupm4o7ZXDp+S15GaDADtw5c8Ks0
/ytXMKT8hon6lYgp+6PoRvMlb2hg79Khkd9A2QAZ5rGt/w60xcyomxgbjXfaR98N
1dlwqSBmDn599RCn+PMP4cLe3Ka2tIl2mac+gFddUbi5NH2mAxQjPybu90g4ze8U
ZTgZmRhfbCujd2p8mFZcb8tMWZVVs9oPuZQxsr+3AO2M7iwjT5Bx2f2ZXqQudNCh
VjpUe2ZAfhG/Rtss7Pp/
=MaP2
-----END PGP SIGNATURE-----

--=-Kd/LZONCYVE8jpXFCHhJ--

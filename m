Received: from mail-yw0-x22c.google.com ([2607:f8b0:4002:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aukRU-0004GE-DW
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 17:37:05 +0000
Received: by mail-yw0-x22c.google.com with SMTP id g133so199359171ywb.2
 for <linux-mtd@lists.infradead.org>; Mon, 25 Apr 2016 10:36:43 -0700 (PDT)
Date: Mon, 25 Apr 2016 13:36:46 -0400
From: Tom Rini <trini@konsulko.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Scott Wood <oss@buserror.net>, Scott Wood <scottwood@freescale.com>,
 Marek Vasut <marex@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, u-boot@lists.denx.de,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alexander Kaplan <alex@nextthing.co>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [U-Boot] Porting Linux's MTD/NAND changes into U-Boot
Message-ID: <20160425173646.GM3732@bill-the-cat>
References: <20160425164314.15c3fc94@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="DCAeCzy6naWeAZyR"
Content-Disposition: inline
In-Reply-To: <20160425164314.15c3fc94@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--DCAeCzy6naWeAZyR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2016 at 04:43:14PM +0200, Boris Brezillon wrote:

> Hi Scott,
>=20
> I've recently contributed a lot of MTD/NAND related patches (and intend
> to continue doing so). Some of them are transversal changes touching the
> MTD and NAND framework internals, which implies patching all NAND
> drivers along with the core changes.
>=20
> All those changes are required to properly handle modern NANDs (MLC/TLC
> NANDs), and I need them to add proper NAND support to the sunxi
> platform (and more particularly to the C.H.I.P from NextThing Co.).
>=20
> So my question is, how should I port those changes to U-Boot? I see
> that your doing "synchronization commits", but in my case this mean
> including a bunch of driver specific changes into this "sync commit".
>=20
> I think it's also worth mentioning that I plan to heavily rework the
> Linux NAND framework to improve NAND performances on modern NAND
> controllers and clarify the NAND chip / NAND controller concepts, and
> other people are also working on merging the BBT code of the NAND and
> OneNAND framework. Which unfortunately means that we're not done porting
> invasive changes to U-Boot :-/.
>=20
> Any advice is welcome.

I suppose my first suggestion would be to sync the kernel back into
U-Boot more frequently.  With our bi-monthly release cycle it shouldn't
be too hard to pick a window to grab the current kernel release and
bring it over.  I think the more stuff we let build up prior to syncing
the harder it will be.

--=20
Tom

--DCAeCzy6naWeAZyR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXHlWuAAoJEIf59jXTHXZSTOYP/2I0yd7ZxInVyJuD0JS4UoF7
D8ulWVOsarfbeYWnpeVTJbMNQZ2W2UBv5+jOfNl5RVrCFJLICLiqbacdi+sCezB3
qChU2xJNp+cNgXOzhrRL1TBLAtsNOrk8i/7oODDNHFmNzU7PHeLelFJv6Alrvyba
sKk4Nmh3oLHDKpUpMXboGMUz8UxnHcIZdMDdp8qiXNiSOXMDaoFpJ1znRPAkoHlR
zfti8FOTz2BZJn/wAOZ6145nrjtr0d4KmY7Rx5fPctIQGRRaPti9JI3ChpH2Dj5Z
WTdcGOUoNxrUD7PRMr1xSpviYZ1yVlb1qSGJ5Bx4Yx24UjNHSxBX0jm630fxz2ot
N/6EFOIxwCTKyOgpJjkcFAhR8z87rRRYGQ49auoBtIZDhgbYNbX3pS6JOGLdvFp9
os6wXhvNN9N/Tc7YSqAttOq12PlFlIZpPRhP+brIzGXsIEHCgJY0m+sP2sQHN2TP
hvk7CO4VFy7oKr30qqxnV+vYt0eFhc24jXltK2R7l0dcWHWdZLaK4CUl4ZZ8VwK5
SqvX7TsqzNNYm9xA+O/q0ULXEvrm0hyAYOPUUxSAxHEWtSaGP6GjE6ei9NAYiz33
Q2B8ofACt6iPhzE/k1mMpKqg2ib6+KVH6gIP8VjBL+pQdqO7XBWTZzN+F5njO0QL
KB2aNDFLa0mjWQY8vpQz
=i/Zy
-----END PGP SIGNATURE-----

--DCAeCzy6naWeAZyR--

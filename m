Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RbvTo-0005iX-Bq
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 14:43:16 +0000
Received: by iadk27 with SMTP id k27so5509187iad.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 06:43:15 -0800 (PST)
Message-ID: <1324133082.4240.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] libmtd: allow write operations when MEMWRITE is not
 supported
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, Peter Korsgaard
 <jacmet@sunsite.dk>
Date: Sat, 17 Dec 2011 16:44:42 +0200
In-Reply-To: <CAN8TOE9-4j0pC5Vocu4v9toczvKAyKnRtZ6AE3fjt7Fk8PaZ=g@mail.gmail.com>
References: <1323459914-25294-1-git-send-email-computersforpeace@gmail.com>
 <1323725206.2297.24.camel@koala>
 <CAN8TOE9-4j0pC5Vocu4v9toczvKAyKnRtZ6AE3fjt7Fk8PaZ=g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-0Q9AGfTet4PO5WDEVqF4"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-0Q9AGfTet4PO5WDEVqF4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-12-12 at 13:40 -0800, Brian Norris wrote:
> On Mon, Dec 12, 2011 at 1:26 PM, Artem Bityutskiy <dedekind1@gmail.com> w=
rote:
> > On Fri, 2011-12-09 at 11:45 -0800, Brian Norris wrote:
> >> MEMWRITE is a recently introduced write interface for MTD; however, it
> >> is, for now, only supported on NAND flash. mtd-utils should fall back =
to
> >> old write methods when either ENOTTY or EOPNOTSUPP are returned.
> >>
> >> This is a showstopper when, for instance, using ubiformat on NOR, whic=
h
> >> don't have a mtd->write_oob interface (and thus don't support MEMWRITE=
):
> >>
> >>   ubiformat: formatting eraseblock 2 --  1 % complete  libmtd: error!:=
 MEMWRITE ioctl failed for eraseblock 2 (mtd3)
> >>           error 122 (Operation not supported)
> >>
> >> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> >
> > I guess this require an urgent mtd-utils release.

OK, I've cut mtd-utils-1.4.9 bug-fix release, this time with my
new script, so I hope nothing is forgotten.

Peter, please, update - this release fixes a bad bug which breaks NOR
erase operation in not-yet-released 3.2 kernel.


--=20
Best Regards,
Artem Bityutskiy

--=-0Q9AGfTet4PO5WDEVqF4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO7KraAAoJECmIfjd9wqK0bdsQAK+qx2elMxTOqLbr8dAF8F7X
vCATEbkyQc8pHwG7jDhKys2x0bp5gt73Anc2wwuuWDoNOGcdnCLYbAKhQDiidFjN
STzsWKRnYvFg5/9zSFpDDNYzYIl2msAV269OZDur0EWw0ZDoxIIK5BD8yw8ESTuX
vYAsd1PfmycdkNs2c/ifelPo6Auyzateu1HJ0DGneT46AJz2HjXiAqeUO+hj32LO
rqDpd91tGCQwjr7FCCBRo0i6y8+zqYoOCNg4tlB4gqSVW6uxxWna6Y2seaXtwUhy
Rb1LtFb3G7/Tk9O3OSloJdKIEELrkoiuAT6bOu5jkTV1FHuS4Djs2sCwmHb5c+hw
VsxPlETLOmhJWET41XTZtwnuAmd982HRy3/a343k2fYSmSqyBE7wVs5BXhF8Qt1n
Q2XaAz1BHuRUjxL1gBUm0EYla5+84reoeVuerci9Nn7VAmznDpkNmVPxqZmN73T9
5YIuPl8+4Lby3LSTlGoQdICOKu0hxNiHXg03tf9Hcv5aedeIHYuFOUvwdRtiZbU8
Gqy4gKvEXkBuqRSCsdyuW/3/k9dtSJz8W0ib+NfgMw2K0PLk0i5PoZghE1Y1PkM5
KjDfbOTudvWtoD1LZQji+Mw4oPhSDbKIi2qIU2dx/L7/+cjXGsp54TnYePwLhk+k
zlcPGxCiV21s3Wlf6zml
=FG+s
-----END PGP SIGNATURE-----

--=-0Q9AGfTet4PO5WDEVqF4--

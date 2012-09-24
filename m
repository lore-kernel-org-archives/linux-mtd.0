Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGADU-0007Hb-G2
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2012 15:05:01 +0000
Message-ID: <1348499094.4880.65.camel@sauron.fi.intel.com>
Subject: Re: Problem with verify-ing patch (error: arch/m68k/Kconfig.cpu:
 patch does not apply)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Mon, 24 Sep 2012 18:04:54 +0300
In-Reply-To: <CACna6rwju0g+sq+vBAfCqFJm=EBLg79G2XoGEKs5n1Y=PcmKBg@mail.gmail.com>
References: <CACna6rwju0g+sq+vBAfCqFJm=EBLg79G2XoGEKs5n1Y=PcmKBg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-HN4QOWKe82E1Y1p4BuJU"
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


--=-HN4QOWKe82E1Y1p4BuJU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-24 at 13:14 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> I wanted to verify my patch before sending it.
>=20
> TRY[0]:
> > ./verify ../wireless-testing/ mips-bcm47xx_defconfig < ../nand4/0001-mt=
d-prepare-place-for-BCMA-NAND-flash-driver-s.patch
> error: patch failed: arch/m68k/Kconfig.cpu:28
> error: arch/m68k/Kconfig.cpu: patch does not apply
>=20
> Weird. My patch doesn't touch m68k and applies cleanly to the
> ../wireless-testing tree:
>=20
> > cd ../wireless-testing/
> > git am ../nand4/0001-mtd-prepare-place-for-BCMA-NAND-flash-driver-s.pat=
ch
> Applying: mtd: prepare place for BCMA NAND flash driver(s)
>=20
> Help? :|

It tries to apply quick fixes - I carry them because the kernel gets
broken in various places all the time. So you need to fix the quick
fixes patch - probably a fix was applied in upstream already.

Obviously, quick fixes are in maintaining.git, not in the generic aiaiai
tools. They are in 'quick_fixes.mbox'.

In this case it easy - the m68k patch get merged upstream and just can
be dropped from quick_fixes.mbox. Just done that and pushed out.

--=20
Best Regards,
Artem Bityutskiy

--=-HN4QOWKe82E1Y1p4BuJU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYHaWAAoJECmIfjd9wqK072IP/jZ6+4fc+NCoWiWCoUNc/Wkb
+jYFT1u11J2133pPWoGDG2QPb2Ad+BrHOJOR34H2lbbU8l/Dv18ucg6PDVViPflw
plq6XbABuvmw5bHP2q5vrHdahHSEbMCQdQ+OwZUfwgl9rJOMmsAaMtKJ+HT3KCih
j3zP2C2rzI+InfOf0IFkupt00OysS/VRyTnWNN7wJSYjJyud841i7mtfgwTS73iI
1Zz1IPodywMvWeJES/w1MgmuRxYx3+h5s9I7274inka+EDfZUvY2JIoLStbPYTqw
pJ+1XvgNp/5V+GwJ/5vGO64nWuVi5g8v//HvixRfvGhTszWIndDMdA07/gsprHSd
qFskp8LbDot+CrxwzyzpJuqrQucpWy0HtmO7+8NSPTEbNiF2V70YXEkMP5LJRgMd
UwCZZ0NCyzJH5h3GP8Xh4QFSpFkllwTEK6zXUGrJCI98lnJWHXm6FRRvis1VMshD
025bmKfwY2BqOt1qUcJn/PptOQOFNdIP17w0L1uFC6MXo7NmA/8IkXZF3lBbmyKj
FNEAK8Yw0aGMUFPACST9ytq2lu6M0de2wzrW1uIcmjjBf5tkcuIzSScU7yqmsYSR
PdCbbsgp8gfaPkS0s24X/E6jgaFPl3aLD6UTfirXVnbIHuL1D61lvmZfuJy5DYoi
3HIW+DACq+/xih8h+NSy
=xXB8
-----END PGP SIGNATURE-----

--=-HN4QOWKe82E1Y1p4BuJU--

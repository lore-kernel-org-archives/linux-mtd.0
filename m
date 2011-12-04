Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXD3P-0003u4-TN
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 14:28:32 +0000
Received: by iaby26 with SMTP id y26so24504iab.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 06:28:30 -0800 (PST)
Subject: Re: pxa2xx-flash.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anders =?ISO-8859-1?Q?M=F8rk-Pedersen?= <amp@frogne.dk>
Date: Sun, 04 Dec 2011 16:29:33 +0200
In-Reply-To: <4ED8F1600200008E00014323@mail.frogne.dk>
References: <4ED8F1600200008E00014323@mail.frogne.dk>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-rTty9A1K2iZS9M57Vxoo"
Message-ID: <1323008978.9400.63.camel@sauron.fi.intel.com>
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


--=-rTty9A1K2iZS9M57Vxoo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-12-02 at 15:40 +0100, Anders M=C3=B8rk-Pedersen wrote:
> Hi,
>=20
> I've noticed a problem with a patch for the pxa2xx-flash.c map, which has=
 been committed to the nextline kernel (currently 3.2-rc3)
>=20
> The problem is that hardcoded mtd partitions are no longer probed - and t=
hat breaks a lot of board support modules.
>=20
> The patch is described as=20
> "mtd: pxa2xx-flash.c: use mtd_device_parse_register"
>=20
> and can be seen here: http://git.kernel.org/?p=3Dlinux/kernel/git/torvald=
s/linux.git;a=3Dcommit;h=3D6fcdc92fce81eadcee262a7a66bf3207314fab87
>=20
> I have created a small patch to address this.

Looks OK, but could you please send a patch suitable for 'git am'? So
that I save your mail and give it to git-am and end up with a commit
which has you as the author, and a nice commit message. Also, please, CC
Dmitry Eremin-Solenikov <dbaryshkov@gmail.com

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-rTty9A1K2iZS9M57Vxoo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO24PNAAoJECmIfjd9wqK0P+8QAJkaUkQEXaU1wcC5SHDtv/wb
HCfg4d4NW8hxnTSypV/Qae47EVDQTsX9kCPXlvtFBSuwULhB92IrWGlMVfdNYKfN
8HqAgvdoSGgfGIipmw5VDDNyL3Y0I/znxu0t+xubMTt4lx60+4oamVxE/yzEdTdz
WN6YL/983wGo8HubCdsH+ICbYe2DOFPOjoKotS20wEzD/iCWHf85I0kjSy+vFTYw
hVIyEevNgwV3+nq+ZC2AhK8K4oQjMWMin4nlmugBb0r4EbOYWfUyHALiU/+YuvCQ
nMsbzeKDQ/8TT7MLDhgB+2STIu9kPLA2yWxf7nRZZdGAjCNoc7omjSUNab0bW+Oo
PGHpyQhyrvuO1wkc9Cpm0QKQR0r3tdR7flSRTbdSXsPUNT2iqiUDRLHnP/mxF3XF
kPbuP8rK0Io3aiudSiJHrpbQ058CMWkVvq9N2aRI7qnEv1YcG4hmjEsMsN6p9z6o
T9hN1cr8jPvAXsvIpdBI3CgM9fk0JcQvDzKeUjsPxcyb8heUJ1Wdaq6h0bH9KCel
psqt89VqsVHTGAonaQn1G5wiQ4Hh08XFiabrch75kuRzGSqfWQe2zLHqREdSvDmr
dNOFhRNvk3pFpUaqBQmde0JhO+0Plf05oEbZ3HSX9dePu25UTDJXOoIy8opDii7e
9l1EZ4g/KjZ15PCuFh5U
=maec
-----END PGP SIGNATURE-----

--=-rTty9A1K2iZS9M57Vxoo--

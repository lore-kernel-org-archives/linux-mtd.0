Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3lg1-0000TX-Ab
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 10:27:13 +0000
Message-ID: <1345545090.2848.89.camel@sauron.fi.intel.com>
Subject: Re: another issue with ubifs on v3.6-rc2: attaching an formatted
 device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Tue, 21 Aug 2012 13:31:30 +0300
In-Reply-To: <503361C3.30308@freescale.com>
References: <20120820160750.GS2232@pengutronix.de>
 <1345489867.1789.3.camel@kyv> <20120821093518.GD12220@pengutronix.de>
 <503361C3.30308@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-01ODuP8+61O/14SyRy5e"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-01ODuP8+61O/14SyRy5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-21 at 18:24 +0800, Huang Shijie wrote:
> =E4=BA=8E 2012=E5=B9=B408=E6=9C=8821=E6=97=A5 17:35, Uwe Kleine-K=C3=B6ni=
g =E5=86=99=E9=81=93:
> > On Mon, Aug 20, 2012 at 10:11:07PM +0300, Artem Bityutskiy wrote:
> >> On Mon, 2012-08-20 at 18:07 +0200, Uwe Kleine-K=C3=B6nig wrote:
> >>> [  163.714143] uncorrectable error :
> >>> [  163.727597] UBI warning: ubi_io_read: error -74 (ECC error) while
> >>> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> >>> [  163.740737] uncorrectable error :
> >>> [  163.744032] UBI warning: ubi_io_read: error -74 (ECC error) while
> >>> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> >>> [  163.757119] uncorrectable error :
> >>> [  163.760487] UBI warning: ubi_io_read: error -74 (ECC error) while
> >>> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> >>> [  163.774427] uncorrectable error :
> >>> [  163.777808] UBI error: ubi_io_read: error -74 (ECC error) while
> >>> reading 64 bytes from PEB 0:0, read 64 bytes
> >> This looks like your flash does not really support sub-pages while
> >> declares that it does. Check it with MTD subpage test.
> > the subpages test fails with:
> >
> > [   82.435792] mtd_subpagetest: written up to eraseblock 7424
> > [   82.905775] mtd_subpagetest: written up to eraseblock 7680
> > [   83.375201] mtd_subpagetest: written up to eraseblock 7936
> > [   83.840447] mtd_subpagetest: written 8192 eraseblocks
> > [   83.845522] mtd_subpagetest: verifying all eraseblocks
> > [   83.852740] uncorrectable error :
> > [   83.856086] mtd_subpagetest: error: read failed at 0x0
> > [   83.861469] mtd_subpagetest: error -74 occurred
> > [   83.866093] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > Error: could not insert module ./drivers/mtd/tests/mtd_subpagetest.ko: =
Bad message
> The mx35 does not use the gpmi nand driver, but the mxc-nand driver.
>=20
> So I have no idea about this issue too. I do not know whether the=20
> mxc-nand support the subpage writes or not.

OK, sorry, I was confused, thought that Uwe uses the gpmi driver.

--=20
Best Regards,
Artem Bityutskiy

--=-01ODuP8+61O/14SyRy5e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQM2ODAAoJECmIfjd9wqK0EsYP/RVsIBaoye7uCpemet5mompV
VqgvIGcITd0ugnrSougoQg99RE+p//AMebmclOaUk7Zyz/dGsxom62BL0pD6uTiz
j5JTZFCjUlUGhoD2n8J8xhoyPND6vQLpvkIwUZPOFmdRgbovtIRHE13loBoLdQZY
n2fX60HTpknB9Pnc8/BuJsc7AFo/z2t8DRA9s5d0xG0tzakaPqmdlTl1UW4MCZuX
YO1LRZ94zO1V6nEVXJsLv8c7+oArpy5OUra9NUlnJCmtznN9lQUcdDn35+IxOjxT
MwNFv6HfSOpk9WMDaZBk3JapTl0i2pDX7PI4/hEQ+9dH4lSKNsMHbUURRcBrFo8+
1i9mKBetYG/ElgV5gBhQnqnJv+zGugD4XoDmHxl5UE/gPVqAJoi9N037j09y9L3j
VstRNJ712p8K7CS1SovU4Wq8Z9BxGQSrGqWPBAwufH7zlQI7CH+84xOL9M+NS8yA
32r6s/8ONt7F07LvrBlGjcoUa3a9f/EhV3C5gi98dSSlq8IB9HLwbgmxeI6FuevP
qm98OxfozqPQgMhl28yjSMgvlmHsq+WxNwREWovh4fAiuI/D9XKk3nVDiNOBpLzZ
ix8XQYHDH1lr7R09ibTXOzW7Ljku/cIl9c2tWuVNeLrN/6kA55icDu71x2oJLHE5
D99rr5os+Msh+fpDaKOs
=Ac7B
-----END PGP SIGNATURE-----

--=-01ODuP8+61O/14SyRy5e--

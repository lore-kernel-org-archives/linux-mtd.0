Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3lPq-0006jI-P2
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 10:10:31 +0000
Message-ID: <1345544113.2848.87.camel@sauron.fi.intel.com>
Subject: Re: another issue with ubifs on v3.6-rc2: attaching an formatted
 device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Huang Shijie <shijie8@gmail.com>
Date: Tue, 21 Aug 2012 13:15:13 +0300
In-Reply-To: <20120821093518.GD12220@pengutronix.de>
References: <20120820160750.GS2232@pengutronix.de>
 <1345489867.1789.3.camel@kyv> <20120821093518.GD12220@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-7ArOEBa7/jxL5PwfzX1X"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-7ArOEBa7/jxL5PwfzX1X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-21 at 11:35 +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Mon, Aug 20, 2012 at 10:11:07PM +0300, Artem Bityutskiy wrote:
> > On Mon, 2012-08-20 at 18:07 +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > [  163.714143] uncorrectable error :=20
> > > [  163.727597] UBI warning: ubi_io_read: error -74 (ECC error) while
> > > reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> > > [  163.740737] uncorrectable error :=20
> > > [  163.744032] UBI warning: ubi_io_read: error -74 (ECC error) while
> > > reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> > > [  163.757119] uncorrectable error :=20
> > > [  163.760487] UBI warning: ubi_io_read: error -74 (ECC error) while
> > > reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> > > [  163.774427] uncorrectable error :=20
> > > [  163.777808] UBI error: ubi_io_read: error -74 (ECC error) while
> > > reading 64 bytes from PEB 0:0, read 64 bytes=20
> >=20
> > This looks like your flash does not really support sub-pages while
> > declares that it does. Check it with MTD subpage test.
> the subpages test fails with:
>=20
> [   82.435792] mtd_subpagetest: written up to eraseblock 7424
> [   82.905775] mtd_subpagetest: written up to eraseblock 7680
> [   83.375201] mtd_subpagetest: written up to eraseblock 7936
> [   83.840447] mtd_subpagetest: written 8192 eraseblocks
> [   83.845522] mtd_subpagetest: verifying all eraseblocks
> [   83.852740] uncorrectable error :=20
> [   83.856086] mtd_subpagetest: error: read failed at 0x0
> [   83.861469] mtd_subpagetest: error -74 occurred
> [   83.866093] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> Error: could not insert module ./drivers/mtd/tests/mtd_subpagetest.ko: Ba=
d message
>=20
> I don't have a clue yet how to debug that further. Will start with
> checking older kernel releases. Any hints welcome.

AFAIR, the driver did not support subpages and just needed to report
about this. And there is a bug in MTD which makes it impossible for
drivers to tell that sub-pages are not supported. So AFAIU, we need the
patch I pointed you, and we also need the driver to use "no subpage
writes" option.

I think the maintainer is the best person to comment on this. I assume
this is the gpmi driver, so that would be Huang Shijie
<shijie8@gmail.com>.

--=20
Best Regards,
Artem Bityutskiy

--=-7ArOEBa7/jxL5PwfzX1X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQM1+xAAoJECmIfjd9wqK0DEcQAMUXPyeiVDamXVR6EYcPKxvC
0vSfEfQS9QggZ1TRO51WWbGo4XdyuQviuDBZN04UiDMu1HnXqp5AvMstTXxFaLx1
/Is67MTBe5FigNs6RoC4oNr9i06V2twvG9XvGG1Ic+yTUX11hYFiToRMxPqGm2TF
hrzuHV8Yz1VGc8Fr68L3FyBvf+f9XP/AzqBTiFqqas/LGNDraOZKDEZAuK/EmKtu
w/lwaMJ/a8Z6BwRcKPHqYGJx/ivj6jikV6priJvEa6T+EwfTcGq9NCouhIcAdlb7
fTbvJGxsYyLiyoS/j96nAl8VjilT0rWfuFYT/sBA+iQgGH+E9LswlCEq4iuvKlwV
SGjahV9fdNfdnfXZAGs41VA8xRIVnSMP+fUQkTWSKo6JvQm1+BrJ/PPm9xlpMmEd
nYWjgxwEVhpfKhkRLbU5hLMnRWM9+1eiCPj7zLt3wMc8NiuVgW7+rNHyLe/1P+2M
ze8nEY3tDuKoEUNB1fEU/96QfRhlr/DTbzBJ/ZCcOKSryBv8AMC8YK7AHfCD96Gz
dOZc+ndQ9SojxvmiU2Ba2zUlFAEYtJYwsdWtTN3Z5HyXwDvBWxPH2cwWnqg31vaK
ntO2oMMKDtbnhn5zusFV818Xl2x0mXMHkP+U1cEqib2sBS9elka67XNVAMzuR5Oj
7AoqhtaMdHLoOwogVUhK
=9Wdr
-----END PGP SIGNATURE-----

--=-7ArOEBa7/jxL5PwfzX1X--

Received: from metis.ext.pengutronix.de ([92.198.50.35])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3lXt-0005qJ-2J
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 10:18:50 +0000
Message-ID: <50335FFB.3080703@pengutronix.de>
Date: Tue, 21 Aug 2012 12:16:27 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: another issue with ubifs on v3.6-rc2: attaching an formatted
 device
References: <20120820160750.GS2232@pengutronix.de>
 <1345489867.1789.3.camel@kyv> <20120821093518.GD12220@pengutronix.de>
 <1345544113.2848.87.camel@sauron.fi.intel.com>
In-Reply-To: <1345544113.2848.87.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig968BDB3C40E2A5B8E6F22A88"
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 kernel@pengutronix.de,
 =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig968BDB3C40E2A5B8E6F22A88
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/21/2012 12:15 PM, Artem Bityutskiy wrote:
> On Tue, 2012-08-21 at 11:35 +0200, Uwe Kleine-K=C3=B6nig wrote:
>> On Mon, Aug 20, 2012 at 10:11:07PM +0300, Artem Bityutskiy wrote:
>>> On Mon, 2012-08-20 at 18:07 +0200, Uwe Kleine-K=C3=B6nig wrote:
>>>> [  163.714143] uncorrectable error :=20
>>>> [  163.727597] UBI warning: ubi_io_read: error -74 (ECC error) while=

>>>> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
>>>> [  163.740737] uncorrectable error :=20
>>>> [  163.744032] UBI warning: ubi_io_read: error -74 (ECC error) while=

>>>> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
>>>> [  163.757119] uncorrectable error :=20
>>>> [  163.760487] UBI warning: ubi_io_read: error -74 (ECC error) while=

>>>> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
>>>> [  163.774427] uncorrectable error :=20
>>>> [  163.777808] UBI error: ubi_io_read: error -74 (ECC error) while
>>>> reading 64 bytes from PEB 0:0, read 64 bytes=20
>>>
>>> This looks like your flash does not really support sub-pages while
>>> declares that it does. Check it with MTD subpage test.
>> the subpages test fails with:
>>
>> [   82.435792] mtd_subpagetest: written up to eraseblock 7424
>> [   82.905775] mtd_subpagetest: written up to eraseblock 7680
>> [   83.375201] mtd_subpagetest: written up to eraseblock 7936
>> [   83.840447] mtd_subpagetest: written 8192 eraseblocks
>> [   83.845522] mtd_subpagetest: verifying all eraseblocks
>> [   83.852740] uncorrectable error :=20
>> [   83.856086] mtd_subpagetest: error: read failed at 0x0
>> [   83.861469] mtd_subpagetest: error -74 occurred
>> [   83.866093] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> Error: could not insert module ./drivers/mtd/tests/mtd_subpagetest.ko:=
 Bad message
>>
>> I don't have a clue yet how to debug that further. Will start with
>> checking older kernel releases. Any hints welcome.
>=20
> AFAIR, the driver did not support subpages and just needed to report
> about this. And there is a bug in MTD which makes it impossible for
> drivers to tell that sub-pages are not supported. So AFAIU, we need the=

> patch I pointed you, and we also need the driver to use "no subpage
> writes" option.
>=20
> I think the maintainer is the best person to comment on this. I assume
> this is the gpmi driver, so that would be Huang Shijie
> <shijie8@gmail.com>.

It's an mx35, so mxc_nand.c and it's Sascha Hauer, who's on vacation
this week.

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig968BDB3C40E2A5B8E6F22A88
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlAzX/sACgkQjTAFq1RaXHNZjACgmVcm17bNaQEAtlFqlPtzp9bu
vO8AoIfAMtVqfDE4I8Bzk1ymC5qqCAAH
=hzaY
-----END PGP SIGNATURE-----

--------------enig968BDB3C40E2A5B8E6F22A88--

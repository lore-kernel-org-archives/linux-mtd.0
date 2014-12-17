Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1Fj2-0005hf-8h
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 14:37:17 +0000
Message-ID: <54919501.3020100@rempel-privat.de>
Date: Wed, 17 Dec 2014 15:36:49 +0100
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH RFC] Alphascale ASM9260 NAND controller driver
References: <1418816718-29764-1-git-send-email-linux@rempel-privat.de>
 <20141217142455.5970987e@bbrezillon>
In-Reply-To: <20141217142455.5970987e@bbrezillon>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="t9d6S3m8ThTq0DglmNWNEKUQfg9al2l9X"
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--t9d6S3m8ThTq0DglmNWNEKUQfg9al2l9X
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 17.12.2014 um 14:24 schrieb Boris Brezillon:
> Hi Oleksij,
>=20
> On Wed, 17 Dec 2014 12:45:17 +0100
> Oleksij Rempel <linux@rempel-privat.de> wrote:
>=20
>> I collected some questions with this driver. It will be great if you
>> can help me:
>> * Do HW_ECC driver should provideo option for SW_ECC?
>=20
> This is not mandatory. I did it in the sunxi driver for testing
> purpose, but it should work fine without it.
>=20
>> * My HW do ECC correction for n-bits per 512B, it mean it will
>> split block in 512B parts. If one of part has uncorrectable error, com=
plete block will be
>> reported as failed. Are there any way for partial recovery?
>=20
> I think what you're calling block here is actually a page.
> Regarding your question, there is no way to recover part of a page, but=

> each ECC block should be tested and max_bitflip should be returned
> (even if some ECC blocks contains too many errors to be corrected).
> Take a look at [1] for an example.

=46rom Flash point of view block or part which i mean !=3D page. In my ca=
se
it is TOSHIBA TC58NVG0S3ETA00, organized as (2048 + 64) bytes =C3=97 64 p=
ages
=C3=97 1024blocks. The NFC will split each each 2048B page to 512B
blocks/???/parts/sub_page/ecc_step/better_name.

HW_ECC provide bit_flip counter for each sub_page. If all sub_pages are
recovered, there is no problem. Beside the question, how many bit should
be counted. Right now max_bitflips =3D sum(all_sub_pages).

Second problem which i have is that, there is only one ecc_error flag
for all sub_pages. If one sub_page filed, i don't know which one. Ecc
erroc counter register can't help here. Only way is to reread complete
page with SW_ECC.

>> * This HW reports count of ECC bitflips for each part. Do i need to re=
turn count of errors on
>> all parts for one block?
>=20
> Again: block =3D=3D page, and no, you should only return the maximum
> corrected bitflips (same example [1]).
>=20
>=20
>> * If HW_ECC different stranges, how it should be configured? With DT o=
r automatically
>> calculated?
>=20
> I don't get that one...
> Are you talking about ECC requirements (ECC strength and steps) ?

Yes. Well, i can't choice ECC step(it is 512B on this HW), only strange.

> Best Regards,
>=20
> Boris
>=20
> [1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L1=
157
>=20


--=20
Regards,
Oleksij


--t9d6S3m8ThTq0DglmNWNEKUQfg9al2l9X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iF4EAREIAAYFAlSRlQEACgkQHwImuRkmbWlizwD+JQ7pXGVCSr/pT5iF1kgtp/l8
YNC2aMyC0H4ZItxwmoYBAJqEX49P5W9ZABn/nUzRqhlbi7vy2YrqQyzhpI9J8IlR
=hl8O
-----END PGP SIGNATURE-----

--t9d6S3m8ThTq0DglmNWNEKUQfg9al2l9X--

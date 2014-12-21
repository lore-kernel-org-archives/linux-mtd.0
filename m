Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2lVP-0001Ce-E6
 for linux-mtd@lists.infradead.org; Sun, 21 Dec 2014 18:45:28 +0000
Message-ID: <5497150A.9090304@rempel-privat.de>
Date: Sun, 21 Dec 2014 19:44:26 +0100
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: should nand driver create ECC for a page after ERASE cmd?
References: <54953675.1020102@rempel-privat.de>
 <20141221172806.4fb64605@bbrezillon>
In-Reply-To: <20141221172806.4fb64605@bbrezillon>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="N9xDQQAkq85rCNoWc6QkOWw468sNspi3q"
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
--N9xDQQAkq85rCNoWc6QkOWw468sNspi3q
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 21.12.2014 um 17:28 schrieb Boris Brezillon:
> Hi Oleksij,
>=20
> On Sat, 20 Dec 2014 09:42:29 +0100
> Oleksij Rempel <linux@rempel-privat.de> wrote:
>=20
>> Hello all,
>>
>> i'm trying to pass mtd/tests for my driver.. on pagetest i fail on thi=
s
>> place:
>> http://lxr.free-electrons.com/source/drivers/mtd/tests/pagetest.c#L311=

>>
>> after ERASE cmd this test trying to read same page. Driver will report=

>> ECC error on read, because erased page has no ECC data in OOB.
>>
>> What is correct way to handle it?
>=20
> Well, actually it depends on your NAND/ECC controller capabilities (but=

> given your discussion with Richard on IRC, I guess you already
> understood that ;-))
>=20
> 1) Wiser controllers are generating 0xff ECC bytes for a data chunk
> (chunk =3D=3D ECC step size) filled with 0xff. With BCH algorithms this=
 is
> easily done by XORing the ECC bytes with the appropriate pattern (see
> soft BCH implementation)
> 2) Some controller just verify if the data chunk + ECC bytes are all
> 0xff before passing it to the ECC engine. If they are filled with 0xff
> the ECC correction is bypassed.
> This method has one drawback: it does not properly handle bitflips
> occurring in erased pages (if one bitflip occurs the NAND controller
> consider the chunk as not empty, and pass it to the BCH engine).
> 3) The controller does not handle erased pages at all, and in this case=

> you'll have to manually test it (as Ezequiel suggested) when you
> encounter an ECC error.

Thanks a lot to all responses,
i recognised my mistake and learned from it.

Boris,
i think your explanation can be placed to mtd web page, some where here :=
)
http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests
--=20
Regards,
Oleksij


--N9xDQQAkq85rCNoWc6QkOWw468sNspi3q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iF4EAREIAAYFAlSXFQoACgkQHwImuRkmbWlDlQEAhuWsCgy0oiXYUe9ffrDxaswF
WrGLOl3mAHM4Rr+3uY4A/3c32fac0elgpqup1ZjfDZq0qmp8qWoQBjwYzo/94UDS
=uRnV
-----END PGP SIGNATURE-----

--N9xDQQAkq85rCNoWc6QkOWw468sNspi3q--

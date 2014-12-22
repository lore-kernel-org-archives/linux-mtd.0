Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y390b-0003zr-So
 for linux-mtd@lists.infradead.org; Mon, 22 Dec 2014 19:51:14 +0000
Message-ID: <54987612.9070500@rempel-privat.de>
Date: Mon, 22 Dec 2014 20:50:42 +0100
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: should nand driver create ECC for a page after ERASE cmd?
References: <54953675.1020102@rempel-privat.de>
 <20141221172806.4fb64605@bbrezillon> <5497150A.9090304@rempel-privat.de>
 <20141222184111.GD9759@ld-irv-0074>
In-Reply-To: <20141222184111.GD9759@ld-irv-0074>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Il2P6f8jKQjh1Fpg0AumtF6fpURNbxOKR"
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Il2P6f8jKQjh1Fpg0AumtF6fpURNbxOKR
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 22.12.2014 um 19:41 schrieb Brian Norris:
> On Sun, Dec 21, 2014 at 07:44:26PM +0100, Oleksij Rempel wrote:
>> Am 21.12.2014 um 17:28 schrieb Boris Brezillon:
>>> Well, actually it depends on your NAND/ECC controller capabilities (b=
ut
>>> given your discussion with Richard on IRC, I guess you already
>>> understood that ;-))
>>>
>>> 1) Wiser controllers are generating 0xff ECC bytes for a data chunk
>>> (chunk =3D=3D ECC step size) filled with 0xff. With BCH algorithms th=
is is
>>> easily done by XORing the ECC bytes with the appropriate pattern (see=

>>> soft BCH implementation)
>>> 2) Some controller just verify if the data chunk + ECC bytes are all
>>> 0xff before passing it to the ECC engine. If they are filled with 0xf=
f
>>> the ECC correction is bypassed.
>>> This method has one drawback: it does not properly handle bitflips
>>> occurring in erased pages (if one bitflip occurs the NAND controller
>>> consider the chunk as not empty, and pass it to the BCH engine).
>>> 3) The controller does not handle erased pages at all, and in this ca=
se
>>> you'll have to manually test it (as Ezequiel suggested) when you
>>> encounter an ECC error.
>>
>> Boris,
>> i think your explanation can be placed to mtd web page, some where her=
e :)
>> http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests
>=20
> Patches are welcome:
>=20
> http://www.linux-mtd.infradead.org/faq/general.html#L_mtdwww

No problem,

should it go to "general.html#L_mtd_tests" or some other section? Boris
are you ok if i use your description for this patch?

--=20
Regards,
Oleksij


--Il2P6f8jKQjh1Fpg0AumtF6fpURNbxOKR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iF4EAREIAAYFAlSYdhYACgkQHwImuRkmbWk8sAD/bK9CWXPc2ozqAg3uBd6N1eL8
AAsxALkUqX8vs/HFpFMA/ii+b+t6M7GAPuD+AOhEN9632qKbtXo9JIss6VNa6yo2
=Mker
-----END PGP SIGNATURE-----

--Il2P6f8jKQjh1Fpg0AumtF6fpURNbxOKR--

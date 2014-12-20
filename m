Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2Gv8-0004r4-Vh
 for linux-mtd@lists.infradead.org; Sat, 20 Dec 2014 10:05:59 +0000
Message-ID: <549549E3.7000903@rempel-privat.de>
Date: Sat, 20 Dec 2014 11:05:23 +0100
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, t kevin <kevint324@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: Get error -74 (ECC error) during ubiattach
References: <CAOx4H9CgOoxu82M9cpmFcRdfn=n7mQOwOVzVqvhdUiyzddEPSw@mail.gmail.com>	<CAFLxGvx=a89_B-rAjwLT6esMzYgJ5E=t24wP3Yo_8w=9x52HVQ@mail.gmail.com>
 <CAOx4H9Ds5_ZSwwKRGcEzJc_k+CTeGyeeWRWAyo5mHV5rVEnSCA@mail.gmail.com>
 <549540F1.4040107@nod.at> <549548D5.8070109@rempel-privat.de>
 <54954950.2030800@nod.at>
In-Reply-To: <54954950.2030800@nod.at>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MaafjdidKbaS7XNGfNdqqdukAlFQc0BvH"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MaafjdidKbaS7XNGfNdqqdukAlFQc0BvH
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 20.12.2014 um 11:02 schrieb Richard Weinberger:
> Am 20.12.2014 um 11:00 schrieb Oleksij Rempel:
>> Am 20.12.2014 um 10:27 schrieb Richard Weinberger:
>>> Hi!
>>>
>>> Am 20.12.2014 um 04:43 schrieb t kevin:
>>>> So for uncorrectable ECC error ( e.g., bad block) the only way out i=
s
>>>> to do a fresh ubiformat?
>>>> For device like harddisk you get bad blocks all the time, if it is n=
ot
>>>> in the critical sector things can be fixed as much as possible by fs=
ck
>>>> so I was looking for something like fsck.ubifs.
>>>
>>> An uncorrectable ECC error means that more bits flipped than your ECC=

>>> algorithm can fix.
>>
>> At same time uncorrectable ECC error mean, the page was erase and ther=
e
>> is no ECC sum. Something should be written to create ECC.
>=20
> Which would be a driver bug and needs fixing.

No at all. If driver get request to erase page, it should do it and
nothing more.
There are use cases where erase means erase, and not erase + write ecc.
It is not a driver bug!

--=20
Regards,
Oleksij


--MaafjdidKbaS7XNGfNdqqdukAlFQc0BvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iF4EAREIAAYFAlSVSeMACgkQHwImuRkmbWmsmwEAivbh0BWe1IUgbU+zl1aDaEbf
9yqwBkCsQFV1vJHXooQA/iPsZgj8udyPjj33L5WEu7lvP+8l1jvYAIy7dtyiF+FO
=hzxE
-----END PGP SIGNATURE-----

--MaafjdidKbaS7XNGfNdqqdukAlFQc0BvH--

Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2Gql-0003AY-Ug
 for linux-mtd@lists.infradead.org; Sat, 20 Dec 2014 10:01:28 +0000
Message-ID: <549548D5.8070109@rempel-privat.de>
Date: Sat, 20 Dec 2014 11:00:53 +0100
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, t kevin <kevint324@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: Get error -74 (ECC error) during ubiattach
References: <CAOx4H9CgOoxu82M9cpmFcRdfn=n7mQOwOVzVqvhdUiyzddEPSw@mail.gmail.com>	<CAFLxGvx=a89_B-rAjwLT6esMzYgJ5E=t24wP3Yo_8w=9x52HVQ@mail.gmail.com>
 <CAOx4H9Ds5_ZSwwKRGcEzJc_k+CTeGyeeWRWAyo5mHV5rVEnSCA@mail.gmail.com>
 <549540F1.4040107@nod.at>
In-Reply-To: <549540F1.4040107@nod.at>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Wgvt0JPCbX5sMptWwJRH7cjWJvWFNsaDQ"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Wgvt0JPCbX5sMptWwJRH7cjWJvWFNsaDQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 20.12.2014 um 10:27 schrieb Richard Weinberger:
> Hi!
>=20
> Am 20.12.2014 um 04:43 schrieb t kevin:
>> So for uncorrectable ECC error ( e.g., bad block) the only way out is
>> to do a fresh ubiformat?
>> For device like harddisk you get bad blocks all the time, if it is not=

>> in the critical sector things can be fixed as much as possible by fsck=

>> so I was looking for something like fsck.ubifs.
>=20
> An uncorrectable ECC error means that more bits flipped than your ECC
> algorithm can fix.

At same time uncorrectable ECC error mean, the page was erase and there
is no ECC sum. Something should be written to create ECC.

> All you can do is trying to erase the block and hoping that it will
> work again.
>=20
>>>> Is it because the background thread "ubi_bgt2d" has not started yet =
so
>>>> no one could do the data scrubbing during ubiattach stage?
>>>
>>> UBI does scrubbing if it faces bit-flips (correctable ECC errors).
>>>
>>>> Is it possible to do something like a fsck.ubifs to fix this issue?
>>>
>>> No. PEB 404 is bad.
>>> Is it always the same block?
>>
>> Yes, it is always the same block. What got me confused is below
>> message telling bad PEBs is still 0.
>> UBI: number of good PEBs:        1920
>> UBI: number of bad PEBs:         0
>> UBI: number of corrupted PEBs:   0
>=20
> I agree that this is a bit strange.
> UBI treats a block as bad if it has a bad block marker or it detects
> so while scrubbing.
>=20
> But it can also happen that you get a block with bad ECC if a powercut =
happened
> while erasing it.
> This is why UBI does not automatically mark it as bad while scanning.
> Such a block will be erased.
>=20
> Thanks,
> //richard
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20


--=20
Regards,
Oleksij


--Wgvt0JPCbX5sMptWwJRH7cjWJvWFNsaDQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iF4EAREIAAYFAlSVSNUACgkQHwImuRkmbWldIwD/fHKb5bZSXewKiHbTaq34WNTu
29jT77bC4UGaQ/NcTk4A/3Lq9+MdU12dHw1ULbelYx2MCls4WuqEMvCHWtZgJnlI
=54hs
-----END PGP SIGNATURE-----

--Wgvt0JPCbX5sMptWwJRH7cjWJvWFNsaDQ--

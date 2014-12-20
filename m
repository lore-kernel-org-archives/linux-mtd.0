Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2Kfs-00078k-UV
 for linux-mtd@lists.infradead.org; Sat, 20 Dec 2014 14:06:30 +0000
Message-ID: <54958236.5030502@rempel-privat.de>
Date: Sat, 20 Dec 2014 15:05:42 +0100
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, t kevin <kevint324@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: Get error -74 (ECC error) during ubiattach
References: <CAOx4H9CgOoxu82M9cpmFcRdfn=n7mQOwOVzVqvhdUiyzddEPSw@mail.gmail.com>	<CAFLxGvx=a89_B-rAjwLT6esMzYgJ5E=t24wP3Yo_8w=9x52HVQ@mail.gmail.com>
 <CAOx4H9Ds5_ZSwwKRGcEzJc_k+CTeGyeeWRWAyo5mHV5rVEnSCA@mail.gmail.com>
 <549540F1.4040107@nod.at> <549548D5.8070109@rempel-privat.de>
 <54954950.2030800@nod.at> <549549E3.7000903@rempel-privat.de>
 <54954BA6.7050304@nod.at> <54954C88.7020705@rempel-privat.de>
In-Reply-To: <54954C88.7020705@rempel-privat.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XXMUoUdfhFbCrn4wjavs782legsV0ODMp"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XXMUoUdfhFbCrn4wjavs782legsV0ODMp
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 20.12.2014 um 11:16 schrieb Oleksij Rempel:
> Am 20.12.2014 um 11:12 schrieb Richard Weinberger:
>> Am 20.12.2014 um 11:05 schrieb Oleksij Rempel:
>>> Am 20.12.2014 um 11:02 schrieb Richard Weinberger:
>>>> Am 20.12.2014 um 11:00 schrieb Oleksij Rempel:
>>>>> Am 20.12.2014 um 10:27 schrieb Richard Weinberger:
>>>>>> Hi!
>>>>>>
>>>>>> Am 20.12.2014 um 04:43 schrieb t kevin:
>>>>>>> So for uncorrectable ECC error ( e.g., bad block) the only way ou=
t is
>>>>>>> to do a fresh ubiformat?
>>>>>>> For device like harddisk you get bad blocks all the time, if it i=
s not
>>>>>>> in the critical sector things can be fixed as much as possible by=
 fsck
>>>>>>> so I was looking for something like fsck.ubifs.
>>>>>>
>>>>>> An uncorrectable ECC error means that more bits flipped than your =
ECC
>>>>>> algorithm can fix.
>>>>>
>>>>> At same time uncorrectable ECC error mean, the page was erase and t=
here
>>>>> is no ECC sum. Something should be written to create ECC.
>>>>
>>>> Which would be a driver bug and needs fixing.
>>>
>>> No at all. If driver get request to erase page, it should do it and
>>> nothing more.
>>> There are use cases where erase means erase, and not erase + write ec=
c.
>>
>> Raw mode is a different thing.
>=20
> There is no raw erase mode in this api.
>=20
>>> It is not a driver bug!
>>
>> If users on top of MTD read from an erased block it has to return 0xFF=
 bytes and
>> not an ECC error.
>> IOW if mtd_erase() -> mtd_read() causes an ECC error with your driver =
it needs
>> fixing.
>=20
>=20
> check out this code:
> https://github.com/olerem/linux-2.6/blob/uparm_9260-2014.12.17.1/driver=
s/mtd/nand/nand_base.c#L2686
>=20
> This commands passed to flash chip. There is nothing about erase and
> write ecc.

After long IRC discussion, i will agree that it is hw issue:
not all nand controllers use ECC algorithm with ECC=3D0xFF on empty page.=

In this case ECC of page written full of 0xff !=3D ECC of erased page. Fo=
r
this case, on ECC error, OOB should be read and tested if (OOB=3Dall(0xff=
).

May be it is more then one controller with this issue, and this case
should be handled by nand_base. If it is only single controller, it can
be solved in driver.
Other way to solve it is to use SW_ECC mode.


--=20
Regards,
Oleksij


--XXMUoUdfhFbCrn4wjavs782legsV0ODMp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iF4EAREIAAYFAlSVgjYACgkQHwImuRkmbWnjxAD/WZ3jzRqadbjK6C06D2sMY06y
UkiwIA79ed2TQ6inSfEA/3QGDIq//OGrwJzzgD6Se/rsHm75tut/yeui9yOi8xlJ
=C2jg
-----END PGP SIGNATURE-----

--XXMUoUdfhFbCrn4wjavs782legsV0ODMp--

Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1G75-0004Oc-3S
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 15:02:08 +0000
Message-ID: <54919AC9.9060903@rempel-privat.de>
Date: Wed, 17 Dec 2014 16:01:29 +0100
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH RFC] Alphascale ASM9260 NAND controller driver
References: <1418816718-29764-1-git-send-email-linux@rempel-privat.de>
 <20141217142455.5970987e@bbrezillon> <54919501.3020100@rempel-privat.de>
In-Reply-To: <54919501.3020100@rempel-privat.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Eb2tsHNFeF46lHoc0SIiDnE6LG5PjjuhI"
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
--Eb2tsHNFeF46lHoc0SIiDnE6LG5PjjuhI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 17.12.2014 um 15:36 schrieb Oleksij Rempel:
> Am 17.12.2014 um 14:24 schrieb Boris Brezillon:
>> Hi Oleksij,
>>
>> On Wed, 17 Dec 2014 12:45:17 +0100
>> Oleksij Rempel <linux@rempel-privat.de> wrote:
>>
>>> I collected some questions with this driver. It will be great if you
>>> can help me:
>>> * Do HW_ECC driver should provideo option for SW_ECC?
>>
>> This is not mandatory. I did it in the sunxi driver for testing
>> purpose, but it should work fine without it.
>>
>>> * My HW do ECC correction for n-bits per 512B, it mean it will
>>> split block in 512B parts. If one of part has uncorrectable error, co=
mplete block will be
>>> reported as failed. Are there any way for partial recovery?
>>
>> I think what you're calling block here is actually a page.
>> Regarding your question, there is no way to recover part of a page, bu=
t
>> each ECC block should be tested and max_bitflip should be returned
>> (even if some ECC blocks contains too many errors to be corrected).
>> Take a look at [1] for an example.
>=20
> From Flash point of view block or part which i mean !=3D page. In my ca=
se
> it is TOSHIBA TC58NVG0S3ETA00, organized as (2048 + 64) bytes =C3=97 64=
 pages
> =C3=97 1024blocks. The NFC will split each each 2048B page to 512B
> blocks/???/parts/sub_page/ecc_step/better_name.
>=20
> HW_ECC provide bit_flip counter for each sub_page. If all sub_pages are=

> recovered, there is no problem. Beside the question, how many bit shoul=
d
> be counted. Right now max_bitflips =3D sum(all_sub_pages).

Ok, i understood. max_bitflips =3D sum(all_sub_pages) makes no sense,
since it is not indicating actual pre fail state of one eccstep/subpage.

> Second problem which i have is that, there is only one ecc_error flag
> for all sub_pages. If one sub_page filed, i don't know which one. Ecc
> erroc counter register can't help here. Only way is to reread complete
> page with SW_ECC.
>=20
>>> * This HW reports count of ECC bitflips for each part. Do i need to r=
eturn count of errors on
>>> all parts for one block?
>>
>> Again: block =3D=3D page, and no, you should only return the maximum
>> corrected bitflips (same example [1]).
>>
>>
>>> * If HW_ECC different stranges, how it should be configured? With DT =
or automatically
>>> calculated?
>>
>> I don't get that one...
>> Are you talking about ECC requirements (ECC strength and steps) ?
>=20
> Yes. Well, i can't choice ECC step(it is 512B on this HW), only strange=
=2E
>=20
>> Best Regards,
>>
>> Boris
>>
>> [1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L=
1157
>>
>=20
>=20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20


--=20
Regards,
Oleksij


--Eb2tsHNFeF46lHoc0SIiDnE6LG5PjjuhI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iF4EAREIAAYFAlSRms0ACgkQHwImuRkmbWlN+wD+JYRbJSM7G7/ZKoUahjbpWMh6
QSnzw695nMICoZ2JQ10A/RsUHO8qfuvvfU5lDhjTu9D9WY/yKUW/TfZAIXN2rsZu
=/dDg
-----END PGP SIGNATURE-----

--Eb2tsHNFeF46lHoc0SIiDnE6LG5PjjuhI--

Received: from chaos.universe-factory.net ([37.72.148.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akz6R-0002Ym-Tw
 for linux-mtd@lists.infradead.org; Tue, 29 Mar 2016 19:15:01 +0000
Subject: Re: [PATCH for-4.4 1/2] mtd: spi-nor: fix Spansion regressions
 (aliased with Winbond)
To: Brian Norris <computersforpeace@gmail.com>
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
 <56F6DB9C.5010305@universe-factory.net>
 <56F86443.4050901@universe-factory.net> <20160328205654.GJ2545@google.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniel Kurtz <djkurtz@chromium.org>, Marek Vasut <marex@denx.de>,
 Bayi Cheng <bayi.cheng@mediatek.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Felix Fietkau <nbd@openwrt.org>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?TWlsdG9uIENoaWFuZyAo5rGf5piO5pmPKQ==?=
 <Milton.Chiang@mediatek.com>, Gernot Hoyler <Gernot.Hoyler@spansion.com>
From: Matthias Schiffer <mschiffer@universe-factory.net>
Message-ID: <56FAD419.4030506@universe-factory.net>
Date: Tue, 29 Mar 2016 21:14:33 +0200
MIME-Version: 1.0
In-Reply-To: <20160328205654.GJ2545@google.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="RoPP4FjeLtKcmlL67CAqOULCxst8mILOI"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RoPP4FjeLtKcmlL67CAqOULCxst8mILOI
Content-Type: multipart/mixed; boundary="N3kJRb1gLtQlt9TOKPjgREbEFr4GIJ8bA"
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniel Kurtz <djkurtz@chromium.org>, Marek Vasut <marex@denx.de>,
 Bayi Cheng <bayi.cheng@mediatek.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Felix Fietkau <nbd@openwrt.org>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?TWlsdG9uIENoaWFuZyAo5rGf5piO5pmPKQ==?=
 <Milton.Chiang@mediatek.com>, Gernot Hoyler <Gernot.Hoyler@spansion.com>
Message-ID: <56FAD419.4030506@universe-factory.net>
Subject: Re: [PATCH for-4.4 1/2] mtd: spi-nor: fix Spansion regressions
 (aliased with Winbond)
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
 <56F6DB9C.5010305@universe-factory.net>
 <56F86443.4050901@universe-factory.net> <20160328205654.GJ2545@google.com>
In-Reply-To: <20160328205654.GJ2545@google.com>

--N3kJRb1gLtQlt9TOKPjgREbEFr4GIJ8bA
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 03/28/2016 10:56 PM, Brian Norris wrote:
> On Mon, Mar 28, 2016 at 12:52:51AM +0200, Matthias Schiffer wrote:
>> On 03/26/2016 07:57 PM, Matthias Schiffer wrote:
>>> On 12/15/2015 07:48 PM, Brian Norris wrote:
>>>> Spansion and Winbond have occasionally used the same manufacturer ID=
,
>>>> and they don't support the same features. Particularly, writing SR=3D=
0
>>>> seems to break read access for Spansion's s25fl064k. Unfortunately, =
we
>>>> don't currently have a way to differentiate these Spansion and Winbo=
nd
>>>> parts, so rather than regressing support for these Spansion flash, l=
et's
>>>> drop the new Winbond lock/unlock support for now. We can try to addr=
ess
>>>> Winbond support during the next release cycle.
>>>>
>>>> Original discussion:
>>>>
>>>> http://patchwork.ozlabs.org/patch/549173/
>>>> http://patchwork.ozlabs.org/patch/553683/
>>>>
>>>
>>> I have a few devices with a s25fl064k lying around, and I was not abl=
e to
>>> reproduce this issue. I've re-applied "mtd: spi-nor: disable protecti=
on for
>>> Winbond flash at startup" and the flash is readable just fine.
>>>
>>> On the contrary, I've come across a board with a s25fl064k that comes=
 up
>>> locked, so removing the protection bits would be necessary. (I was no=
t yet
>>> able to check if the patch actually fixes writing to the flash on thi=
s
>>> board, as I don't have access to the device myself, but I hope to get=
 a
>>> response on that soon.)
>>>
>>> Regards,
>>> Matthias
>>>
>>
>> I made the mistake of trusting the kernel log and OpenWrt Wiki when ma=
king
>> my previous tests.
>>
>> All of the boards I was talking about in my last mail actually have a
>> Winbond w25q64, not a s25fl064k (two board I tested the patch on, and =
the
>> board that was reported to come up locked). The kernel detects the w25=
q64
>> as s25fl064k, as these two flash chips have the same JEDEC ID 0xef4017=
=2E
>=20
> That's interesting; I didn't notice we had duplicate entries for the
> same ID. But apparently, the committers did:
>=20
>   commit f2df1ae3fe8d ("mtd: m25p80: Add support for two new Spansion
>   SPI devices (S25FL-K)")
>   ...
>   "Note that both parts exhibit a Winbond manufacturer ID so they might=

>   also be added to that section."
>=20
> But this is interesting: I see the latest datasheet for Spansion
> s25fl064k says it supports the Block Protect bits in the Status
> Register, so presumably *some* version of s25fl064k should support
> write_sr(nor, 0) to unlock it at boot...
>=20
> If Felix's initial report is indeed correct, then I think we have:
> (1) Spansion s25fl064k without Block Protect support (that breaks if yo=
u
>     try to write SR=3D0)
> (2) Spansion s25fl064k with Block Protect support (that requires you to=

>     unlock at boot by writing SR=3D0 (?))
> (3) Winbond w25q64 with Block Protect support (that requires you to
>     unlock at boot by writing SR=3D0)
>=20
> And (1)-(3) all report the same ID, and (1) is incompatible with (2) an=
d
> (3). Am I right? Are flash vendors really this insane? Should we all
> just give up and go home?
>=20
> Brian
>=20

After some more tests, I believe the situation isn't actually that bad. I=

don't think there are two fundamentally different revisions of the
s25fl064k, and the s25fl064k and w25q64 are actually compatible - with on=
e
caveat: I think Spansion chips really don't like it when you don't wait
until WIP is reset after writing the status register.

As "mtd: spi-nor: wait for SR_WIP to clear on initial unlock" has fixed
that, I think we can just unconditionally unlock all flash with
SNOR_MFR_WINBOND again without breaking Spansion flash.

As I don't have a s25fl064k board at hand, this assessment is based on a
test with a different Spansion flash (the s25fl064p). The s25fl064p
exhibits the same behaviour: when I change the code to perform the initia=
l
unlock on the chip as well, reading the flash fails. But when I also appl=
y
"mtd: spi-nor: wait for SR_WIP to clear on initial unlock", everything is=

fine again.


One more, completely unrelated note: Two Spansion flashs have a typo in
their identification string, the s25sl032p and s25sl064p are actually
called s25fl032p and s25fl064p (pretty much everything found on Google fo=
r
the wrong string refers to Linux kernel code or logs). Can these just be
fixed, or is something relying on these strings not to change (devicetree=
s
or something)? If we can't change them, we should at least add a comment.=


Regards,
Matthias


--N3kJRb1gLtQlt9TOKPjgREbEFr4GIJ8bA--

--RoPP4FjeLtKcmlL67CAqOULCxst8mILOI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJW+tQZAAoJEBbvP2TLIB2ceqoQAOfz+cCWVZdOw4L2xZWDkiQv
oeuCKlHoGRVr9nBJCuID7KlwkAZeOH3ii0hqPB1lCMTgQeetFyZqSoQODO/KFIrR
as/tWu4svel+Xl7JzTFY43LNlz7ZiWQysQp4gEU3SC7APpYCkKxpGqbLE7rSgT6e
ljmfb5PI1v4sKNJI1toi3XYT16ASRUdd3+bq8Gj8ImPiqedeVlJxWTdO2pTf63F4
vgeszzeLQ/Vw0BWzdzrwcdtAFgXRE/bFtjIlVUQkOHKLUhQODu/D99Deo13BArj3
qVogiZGN8eBlUQZnflIMJuTgL+PafYLdbrkksMCcnVikO++hSBgXjBNd0ORjrwCF
3Tkzoe3KqcGhKsBru0e79UnCnLdtoPbkCG3QNgJZpK5970tjCR/AXQgERMmasrYl
oXF9yOO/CJS+6yCDOdB74vioOrGQYzUE3C9zqu0GB3sD7eJCx7mbP5usth2IFCaV
d8jiDTDuJf47IhlPlIP42+KKXfcpcpfgnVTCtI229jBWyDMSgSUv+HORseM6XzE6
/UUEUgHSDYoeygaBRUB9CR/u2pqBNLONr2uaOctRVu6iFDL6MFZTdZwv82hulZTK
wfVJ1PFO62CU8bRkF2kN1/xzowqWvBmRleCArQowAZe9WWSWK+G6212AFmj2IQ6z
1J9W9UnAOdbiU39livN4
=ZGfG
-----END PGP SIGNATURE-----

--RoPP4FjeLtKcmlL67CAqOULCxst8mILOI--

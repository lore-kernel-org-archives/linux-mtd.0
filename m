Received: from chaos.universe-factory.net ([37.72.148.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akJYd-00009q-1B
 for linux-mtd@lists.infradead.org; Sun, 27 Mar 2016 22:53:20 +0000
Subject: Re: [PATCH for-4.4 1/2] mtd: spi-nor: fix Spansion regressions
 (aliased with Winbond)
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
 <56F6DB9C.5010305@universe-factory.net>
Cc: linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
 Marek Vasut <marex@denx.de>, Bayi Cheng <bayi.cheng@mediatek.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Felix Fietkau <nbd@openwrt.org>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?=
 <eddie.huang@mediatek.com>, =?UTF-8?B?TWlsdG9uIENoaWFuZyAo5rGf5piO5pmPKQ==?=
 <Milton.Chiang@mediatek.com>
From: Matthias Schiffer <mschiffer@universe-factory.net>
Message-ID: <56F86443.4050901@universe-factory.net>
Date: Mon, 28 Mar 2016 00:52:51 +0200
MIME-Version: 1.0
In-Reply-To: <56F6DB9C.5010305@universe-factory.net>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="AfmfFmVP1xuSq0dK1BMLFL3mOiqoogS9u"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AfmfFmVP1xuSq0dK1BMLFL3mOiqoogS9u
Content-Type: multipart/mixed; boundary="jWADVBihkXosVi4adblVfatSStDRQhlk4"
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
 Marek Vasut <marex@denx.de>, Bayi Cheng <bayi.cheng@mediatek.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Felix Fietkau <nbd@openwrt.org>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?=
 <eddie.huang@mediatek.com>, =?UTF-8?B?TWlsdG9uIENoaWFuZyAo5rGf5piO5pmPKQ==?=
 <Milton.Chiang@mediatek.com>
Message-ID: <56F86443.4050901@universe-factory.net>
Subject: Re: [PATCH for-4.4 1/2] mtd: spi-nor: fix Spansion regressions
 (aliased with Winbond)
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
 <56F6DB9C.5010305@universe-factory.net>
In-Reply-To: <56F6DB9C.5010305@universe-factory.net>

--jWADVBihkXosVi4adblVfatSStDRQhlk4
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 03/26/2016 07:57 PM, Matthias Schiffer wrote:
> On 12/15/2015 07:48 PM, Brian Norris wrote:
>> Spansion and Winbond have occasionally used the same manufacturer ID,
>> and they don't support the same features. Particularly, writing SR=3D0=

>> seems to break read access for Spansion's s25fl064k. Unfortunately, we=

>> don't currently have a way to differentiate these Spansion and Winbond=

>> parts, so rather than regressing support for these Spansion flash, let=
's
>> drop the new Winbond lock/unlock support for now. We can try to addres=
s
>> Winbond support during the next release cycle.
>>
>> Original discussion:
>>
>> http://patchwork.ozlabs.org/patch/549173/
>> http://patchwork.ozlabs.org/patch/553683/
>>
>=20
> I have a few devices with a s25fl064k lying around, and I was not able =
to
> reproduce this issue. I've re-applied "mtd: spi-nor: disable protection=
 for
> Winbond flash at startup" and the flash is readable just fine.
>=20
> On the contrary, I've come across a board with a s25fl064k that comes u=
p
> locked, so removing the protection bits would be necessary. (I was not =
yet
> able to check if the patch actually fixes writing to the flash on this
> board, as I don't have access to the device myself, but I hope to get a=

> response on that soon.)
>=20
> Regards,
> Matthias
>=20

I made the mistake of trusting the kernel log and OpenWrt Wiki when makin=
g
my previous tests.

All of the boards I was talking about in my last mail actually have a
Winbond w25q64, not a s25fl064k (two board I tested the patch on, and the=

board that was reported to come up locked). The kernel detects the w25q64=

as s25fl064k, as these two flash chips have the same JEDEC ID 0xef4017.

Matthias


--jWADVBihkXosVi4adblVfatSStDRQhlk4--

--AfmfFmVP1xuSq0dK1BMLFL3mOiqoogS9u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJW+GRDAAoJEBbvP2TLIB2cJC8QAKePKyjyzJ9g2UahE3q/PizU
uU6KRN5ahdLd7NqUWS28hz0lJwpLa9Z0eHWRDnDa79iwHlLluNX2Vd2SpMqXiLxP
wxIyx/+BCxfECQ0XSQ3Rft3h2fnxildaclk3bBbxRAEbuWwXRdNkNslBksuKbiCh
MmXHGrpnw/J3zVM+/t6cbmvnviSkOX+oeftNAdFevM0SQno3nThNHFVpFU/iAEoM
BMNmsPA589SJZJ49+B0C5rWdZhfczjQ00ntl/Tb6mrT+wcr+h1PV3+zqVmpKs1El
40/I9A11pIE8WBiDIra4uCLzPFusdWiw1ESrdgfgYz29oVqA2yJ0EJDfAgq3F3D9
8JKeC2jpvWHyvYKR/Ww+vTizNY7OLCCWc1SPBhmkD4HzrkZAqNqqs6WLoTy8ulfs
MysiP2DySAqtQ2C87z/FEAaCcdLp1/NaUjEZ51rBW3W9pkvBT1ehGwMwrm9OuHCf
E2yqCh2nKMTZ4b4OjGyq1hTGSmv+nuyNgTD0ZmIJv62y180F4wcdkxw/tCArdTs/
TytsRd96ySn1qBp9CTHPDYQS5NWb+++hCPmBUDx3NgV1QPzFYaoQm0VTPxTspiJ+
mE/6ydJF1DcpPNMv0VdUbgmbbBeGYXOeBKJYYHEonhjaNai/lktkhnPSwtc1GgPJ
Gvosx8zZ9rStIM4UKEU8
=6da5
-----END PGP SIGNATURE-----

--AfmfFmVP1xuSq0dK1BMLFL3mOiqoogS9u--

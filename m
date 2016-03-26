Received: from chaos.universe-factory.net ([37.72.148.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajtXD-0004Dw-V3
 for linux-mtd@lists.infradead.org; Sat, 26 Mar 2016 19:06:09 +0000
Subject: Re: [PATCH for-4.4 1/2] mtd: spi-nor: fix Spansion regressions
 (aliased with Winbond)
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
 Marek Vasut <marex@denx.de>, Bayi Cheng <bayi.cheng@mediatek.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Felix Fietkau <nbd@openwrt.org>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?=
 <eddie.huang@mediatek.com>, =?UTF-8?B?TWlsdG9uIENoaWFuZyAo5rGf5piO5pmPKQ==?=
 <Milton.Chiang@mediatek.com>
From: Matthias Schiffer <mschiffer@universe-factory.net>
Message-ID: <56F6DB9C.5010305@universe-factory.net>
Date: Sat, 26 Mar 2016 19:57:32 +0100
MIME-Version: 1.0
In-Reply-To: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="uIVfSIpVAoJRlhMnfQreNqC8GdL69SVwo"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uIVfSIpVAoJRlhMnfQreNqC8GdL69SVwo
Content-Type: multipart/mixed; boundary="NFciFn5awennb9gs3vlhnlpnbCex7muig"
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
 Marek Vasut <marex@denx.de>, Bayi Cheng <bayi.cheng@mediatek.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Felix Fietkau <nbd@openwrt.org>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?=
 <eddie.huang@mediatek.com>, =?UTF-8?B?TWlsdG9uIENoaWFuZyAo5rGf5piO5pmPKQ==?=
 <Milton.Chiang@mediatek.com>
Message-ID: <56F6DB9C.5010305@universe-factory.net>
Subject: Re: [PATCH for-4.4 1/2] mtd: spi-nor: fix Spansion regressions
 (aliased with Winbond)
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>

--NFciFn5awennb9gs3vlhnlpnbCex7muig
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/15/2015 07:48 PM, Brian Norris wrote:
> Spansion and Winbond have occasionally used the same manufacturer ID,
> and they don't support the same features. Particularly, writing SR=3D0
> seems to break read access for Spansion's s25fl064k. Unfortunately, we
> don't currently have a way to differentiate these Spansion and Winbond
> parts, so rather than regressing support for these Spansion flash, let'=
s
> drop the new Winbond lock/unlock support for now. We can try to address=

> Winbond support during the next release cycle.
>=20
> Original discussion:
>=20
> http://patchwork.ozlabs.org/patch/549173/
> http://patchwork.ozlabs.org/patch/553683/
>=20

I have a few devices with a s25fl064k lying around, and I was not able to=

reproduce this issue. I've re-applied "mtd: spi-nor: disable protection f=
or
Winbond flash at startup" and the flash is readable just fine.

On the contrary, I've come across a board with a s25fl064k that comes up
locked, so removing the protection bits would be necessary. (I was not ye=
t
able to check if the patch actually fixes writing to the flash on this
board, as I don't have access to the device myself, but I hope to get a
response on that soon.)

Regards,
Matthias


--NFciFn5awennb9gs3vlhnlpnbCex7muig--

--uIVfSIpVAoJRlhMnfQreNqC8GdL69SVwo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJW9tucAAoJEBbvP2TLIB2cw04QAOQh6au6xrya44wPYm9UJJ2j
xIhP2aO7NH+Vu2buXw1cqotwpDqPeMtv+/xOGxKEPIRvIBNE9d1SinkO+P1mvtfR
NRgOpMiUl3a6q89YUDQDyYD35gE5UOyn7oA4xvQcEbLZc7aSzhD9xQRFkWdmQqTp
5O5G3aipwUiWaAh6IEU+jEJ3gFU/98kOedq1pKFQgqbObf1cvpbucigpeHJgbqcn
eYGLTIQdFN1GRog90RaTiPkbcECS01cPU+TOb0enYk8tXj2pDVsT2li3wW/i9kf4
MkMJrbSCIVo6VYKwQ5uFxYNL3pE6qCcNjQPa+j0kBm1wEsndUMFKwcUeL4I19Run
0oDb/AmKqK4X3117TJ67s1A7Ch7qd93A0REctsdPBGdnzuI5rg78WGeho3kh6Nev
R26KJKhJhXP0UY4OZ/ql4vf5lV0f/ym0UKj1V/DCjo4n4vydLulZlLGQF9AQm01h
Z9m9MGc1xz5iUxL7fVCqPqT3L2PrEW0c++U/7rrgmHZI4RAEl5bkbXZMB4CDDyph
tcIuLRxbdaSGC47qWiKbjmwXLM/hWQjAa7tdk3p0sgoN/aNGLqQoDhFoFUMxPl9t
7738CR2vbPxdGgTbMkYoG+Vh+si2N9QWrg589Td8q/cLUjHzRIqnUpmiuvWgc5RZ
is1kXCs5v+sSzFa2S7Sr
=2F2I
-----END PGP SIGNATURE-----

--uIVfSIpVAoJRlhMnfQreNqC8GdL69SVwo--

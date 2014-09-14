Message-ID: <1410714795.3040.45.camel@decadent.org.uk>
Subject: Re: [PATCH 0/5] m25p80,spi-nor: Fix module aliases for m25p80;
 clean up chip identification
From: Ben Hutchings <ben@decadent.org.uk>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 14 Sep 2014 18:13:15 +0100
In-Reply-To: <1410714624.3040.38.camel@decadent.org.uk>
References: <1410714624.3040.38.camel@decadent.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-5kCrhGXAEMm/4F1Yw+LT"
Mime-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 linux-spi <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ian Campbell <ijc@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-5kCrhGXAEMm/4F1Yw+LT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2014-09-14 at 18:10 +0100, Ben Hutchings wrote:
> The first patch in the series restores the module aliases to m25p80, but
> it does so by duplicating the list of names.  This should be suitable
> for stable, but it isn't viable in the longer term.
>=20
> The following patches change the spi-nor interface so that this
> duplication is no longer necessary.  This includes removing
> spi_nor::read_id, but it could be re-added after this with a different
> interface, e.g. returning a flash_info structure (which would need to be
> defined in spi_nor.h).

Note that these patch are:
- Based on your 'testing' branch
- Untested by me, aside from compiling and checking that m25p80 has the
  expected module aliases

Ben.

--=20
Ben Hutchings
The world is coming to an end.	Please log off.

--=-5kCrhGXAEMm/4F1Yw+LT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVBXMq+e/yOyVhhEJAQo4Kg//R04zhoKIjzlMv4U1iDk9QOk5oJJ0G9/r
PvZp1U8WaiT5sgKS2iXgZZl6MQaOpAeRGY2hsSE8nVlu0flZuERH/Ixt1TQemT68
46Yvj9C0m83CIdHZr91dYcsIl974OxrZrde6y6Ndk2C2TsPgnr1FnTe6KMcyOHCI
rAqMZjdQRwYmh8ciTrNQfR6lw+NjInyKSXnjCaGjddHayL/k1O5/e+2Ca2iN13qW
T5gofcI51gUpjrQOfP1dkjF2Y1+zKSBNcbf/mnxm7FAfO3hzRLTDeXfPJxSyUhFp
wH79QTnnte005zttpFaFsF8hZfP1GXAZRY3C9pXFNdDhFvk1LXrb+z31LYFH9n78
XFpxlKIMTqrtkIoZ3FPAZGZtu75HIt1LMxSkaMr4FWP+IwBVWByhrl65W8WUoeyp
okBN+nauKvpg2MxDCsLGaGamEKgR1KZw6s1pbnT22kDv6MSQf9S5MAxzlDds6Q4m
lYn+IobvgfewObWTm1/S45cNNZ9/CH+NK/P8eUbQO2oaMSQjezx78V7PcMaZvIuC
4v+0jgetM2W60h+nDuo7b7gLEeKyRiWRHnvc0f6bcoRuMg+1jYruqZArYLcSeaYL
84iRtAmgooE/verMcSzTzd+DTnhZtGnWHDr/pQgJkFx5X+xy8pmXcNVAXxYms7T/
cXO77uTMklo=
=ZMpq
-----END PGP SIGNATURE-----

--=-5kCrhGXAEMm/4F1Yw+LT--

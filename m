Date: Wed, 1 Oct 2014 19:20:03 +0100
From: Mark Brown <broonie@debian.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <20141001182003.GB17974@sirena.org.uk>
References: <1411984074-3850-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
In-Reply-To: <1411984074-3850-1-git-send-email-zajec5@gmail.com>
Subject: Re: [PATCH 1/2] mtd: m25p80: get rid of spi_get_device_id
Cc: Andrew Lunn <andrew@lunn.ch>, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 linux-spi <linux-spi@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Huang Shijie <shijie8@gmail.com>, Ian Campbell <ijc@hellion.org.uk>,
 debian-kernel <debian-kernel@lists.debian.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>, linux-arm-kernel@lists.infradead.org,
 Jason Cooper <jason@lakedaemon.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2014 at 11:47:53AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> This simplifies the way we use spi_nor framework and will allow us to
> drop spi_nor_match_id.

Please don't CC linux-spi on spi-nor patches that don't have SPI level
changes, it just clogs up patchwork.

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJULEXSAAoJECTWi3JdVIfQ2roH/0OaqzUv/QRZUlaWQtUih6CX
vHdg2Uy2SHZR9xCIOUXypgHKhGbHIH+BLD4bdwXd5Vwtus4V2Ah+46OjXGNzCi12
s6y+ycNDDWrAeAB5EqoxIFLtffV4WxyQiR0kCGismyoWOlRPLx8yTo6mVU+viTw9
qIJxmAkqwUOqkHAj8Wr0Vhbjpj/uQ6Vf405nnW/Zbo+jdVHTWf88tOoR6DAkNVvu
DcsXICE2T9JzNxRJn4Vz7dDYpy1UT4l1pAo53/+g6tMIa4FxviFBvZN0PifwfrzZ
eJx7NubePA5rCckz33Xj8pN/DBo3SsDjtEzz3X4PYWhhCQkMlT2e3XZh6kw7oDw=
=ef0F
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--

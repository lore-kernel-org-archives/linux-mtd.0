Date: Wed, 7 Aug 2013 17:41:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <zonque@gmail.com>
Message-ID: <20130807164157.GN6427@sirena.org.uk>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-8-git-send-email-zonque@gmail.com>
 <20130807155549.GE6427@sirena.org.uk> <52026EE1.6000606@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="m8RPluiNA7RIyL8J"
Content-Disposition: inline
In-Reply-To: <52026EE1.6000606@gmail.com>
Subject: Re: [PATCH 07/20] spi: spi-pxa2xx: remove legacy PXA DMA bits
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 mika.westerberg@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 gregkh@linuxfoundation.org, g.liakhovetski@gmx.de, sachin.kamat@linaro.org,
 kernel@pengutronix.de, djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--m8RPluiNA7RIyL8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 07, 2013 at 05:59:29PM +0200, Daniel Mack wrote:
> On 07.08.2013 17:55, Mark Brown wrote:

> > though this will have some trivial merge issues until the merge window
> > they shouldn't be a problem.

> Given the number of patches that need testing, I doubt this will hit the
> 3.12 window. But let's see :)

Pessimist!

--m8RPluiNA7RIyL8J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSAnjRAAoJELSic+t+oim93qYP/RYv0TbIwCs0Qjf98EozMoKz
ASQu/v5R6e6GgNjKw4FdjzKcYgzVsVDwn3Xo3STaMrjFfRCVbeqXr4APTCO1xciA
lFbuv0WSFA0SRbvSfuKEDAQLvXTdr41UiC/lLvppHyUKGEAgmaQlMiYzLTW/vmzw
55ZRQN/+fonlli0xStTSgHfD84+qFTiqh0UNQtcM1qYsHYfBJjoGICC7ZwNtXErf
m2a7UTtHFxi9chKmebGYHkMzTiaueoqkLY7NPuadMzE2ymb8UrVNUT8b76lJy8qy
nLo00Rcfpfz5DJOEYMMpyi6IgrjmQ7LGriJPaHU/yK1xy6xPWsUxJDHcEX6NO/Il
bzh4sAb/30SJ+asA5m+nfQtzLtGACkI0Ld2sN85Dk3oWilmDgkpeF4RtsS/LS+kM
7KufWcV0LnTgaEalUu+/g21c+VvjuDAwJuEUqMD0o3Sb65Iso6UnNN2iSLqs4q+b
3CppKR7UC9PSPW/wC5miYKZNquaWVW1kuq8BgUvHC2i7bjL1eh5eYcVYvHVWvoaW
w6Wz+A3jqbQETaMqyyoZ/3FRzpEOo9Rvs7dv815hKP26lrSqbUN/8HF49XzI2uOt
A38R8RfvjOIt57jPjBJmwQQn9+IkvTq3Y7apkp3JWVZJNQ+Ji89ULN4/8/aIpT4D
pu3IPN+RRKcL7aRa20aQ
=3RGH
-----END PGP SIGNATURE-----

--m8RPluiNA7RIyL8J--

Date: Wed, 7 Aug 2013 17:32:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <zonque@gmail.com>
Message-ID: <20130807163258.GL6427@sirena.org.uk>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-18-git-send-email-zonque@gmail.com>
 <20130807160743.GI6427@sirena.org.uk> <5202718F.2050507@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="SUaMdvPJwViBZG9r"
Content-Disposition: inline
In-Reply-To: <5202718F.2050507@gmail.com>
Subject: Re: [PATCH 17/20] ASoC: pxa: pxa-pcm-lib: switch over to
 snd-soc-dmaengine-pcm
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


--SUaMdvPJwViBZG9r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 07, 2013 at 06:10:55PM +0200, Daniel Mack wrote:
> On 07.08.2013 18:07, Mark Brown wrote:

> > Has this been tested with the standalone non-ASoC PXA AC'97 driver?

> Nope. I have no such device.

I guess the main test there will be making sure that it builds with ASoC
disabled.  I'm not sure anything later than PXA3xx ever actually used
AC'97.

--SUaMdvPJwViBZG9r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSAna2AAoJELSic+t+oim9btEP+wU2Sp2D2zJ1xk5lnzfx5X+p
M8HupPL7/qXM5KHxn4NTaW29gdGiD7pY0RgmaZM2uY2UrJ3qnJiW2ZlcuURh5G50
7ucusaZnBqy+aWzSpCEeOJ0MqarD5HMd98GOzkPEi+RC9wiGRxsveE1Tl2zdrvmv
VMBVsU/AxBJ0NoiTU7EtBx/low4IeUJtqFfqbHnVLcb9in1zSWqMU8Gsf19wGyrq
RpQfOLqZTkSoZYvKlh6MagGl7IQWqYbYwuR1Rxb95j4MZSfAsceKS07P3FyuqSVm
Fj6WAwIZDISVJ4w/25ysUPsVADowSJ4GILNR4xGOjImyjlGh1YC8vpkj1abliyz2
jJB3SkC2ckLix5hoshuzwA+0l/FgBmHOM/b8YUx+MSQwIiAUYWgnYFH3HffwzRUU
D0JqJUxsAuds1E4ain+EELb4RuTwaT9hKCSPrp7UQmVnu2a8efLr7ug1AQwLo96S
iHhyX6cEsKp9Bd+q81zN8mKx3b02V0mzXQyX16kHXj4Zo0IFuEtL5n6ISS/Xc1Hx
e+rnw77CRZYOpfNfKrNQrjDwYOMLPJQtYXJtAWSHh6jfCtgHlqOg/LE10ks5OPFv
DUKEu/EMKJLI6MnWixKVTTNi4AP+WCD72GrgRYelu7OtrIPSwXR7fgAbQlokBme/
Nn/uaTmMQ2HPWJDSmFL+
=vlQ4
-----END PGP SIGNATURE-----

--SUaMdvPJwViBZG9r--

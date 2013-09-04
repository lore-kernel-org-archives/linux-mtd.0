Date: Wed, 4 Sep 2013 10:55:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Huang Shijie <b32955@freescale.com>
Message-ID: <20130904095523.GT3084@sirena.org.uk>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
 <522697E9.1050208@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="MljkYTiQARTYtn+v"
Content-Disposition: inline
In-Reply-To: <522697E9.1050208@freescale.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com,
 b44548@freescale.com, dedekind1@gmail.com, linux-doc@vger.kernel.org,
 b18965@freescale.com, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, lznuaa@gmail.com, shawn.guo@linaro.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--MljkYTiQARTYtn+v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 04, 2013 at 10:16:09AM +0800, Huang Shijie wrote:

> Since this quadspi driver depends on the mtd code, could this driver
> goes to the kernel by
> the l2-mtd tree?

Why would a SPI driver depend on MTD?

--MljkYTiQARTYtn+v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSJwOIAAoJELSic+t+oim9OKIQAJwp7urCGFK3LcfwVDngUptc
0cIyY+lYKMT3OjZeuT2c1I/J1TKfbDJWdwQXgyFPAqidXl+v1XBVGpXEWJpPJJvj
R8j24xQO34/2ddY2PpYTJmC1Jur04MTy65vQSxBFTSG9oPk0oOW5nGSY1Yi1PWvb
5Kq0vkePoNakP4Q54/aexkiX/CiE7b0UujZjYRwrTZRaSu71bRtBEmuhpUaFBYll
H8swnP3twySFL/0CfGdmiQxT311AHND5kge65Mhhyiow8EyqF6pjxKfFLcvq5E7C
9XpC/iQdWIyv7ORo//QN0OqsCA2saZ6LMqa9mu+swQXuVEZh18/CbSf2mQWGgRST
UgKNuctdBWhDwRYEmAORPWro5PCaKjbF+WTqzEsTK5rRCRQYRtdpieli3epszsFU
wisnd5EeC61AceiGn7y9U+BvKhIGnqsezGP3gIa1UaLBnDCh+T0P7IEeH0SNM4J+
df25WEisHCw3Ay8LyDdnTPmZn48R+EcaTNfY236azNSrJiItv7CvywRksYYgvpi5
PKolJTqvBwb0eda1O43182fpYhn9m6DbHRvVCGyYtyEMr1oswpLsQ2IzNVoxer84
J8h9GDF9Tl7tJ2DhoLM6nFO4gYN7CgIGDyJcAxcUlf9SqgsvCxiYJVm9ZNnKMSV4
e533eyGkY8bXpQWSbygH
=Yn9k
-----END PGP SIGNATURE-----

--MljkYTiQARTYtn+v--

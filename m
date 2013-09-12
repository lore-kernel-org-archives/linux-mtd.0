Date: Thu, 12 Sep 2013 11:20:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Huang Shijie <b32955@freescale.com>
Message-ID: <20130912102027.GF29403@sirena.org.uk>
References: <522817D7.1010206@freescale.com> <522D3B79.3060707@freescale.com>
 <20130909151450.GI29403@sirena.org.uk>
 <522EC33B.9000009@freescale.com>
 <20130910180704.GB29403@sirena.org.uk>
 <522FD78A.6080900@freescale.com>
 <20130911104126.GN29403@sirena.org.uk>
 <52304BFF.4060007@freescale.com>
 <20130911113002.GP29403@sirena.org.uk>
 <523186DF.4070203@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="8KvlSQhf+aO3INfB"
Content-Disposition: inline
In-Reply-To: <523186DF.4070203@freescale.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--8KvlSQhf+aO3INfB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2013 at 05:18:23PM +0800, Huang Shijie wrote:

> yes. The driver uses the commands to find the _right_ LUT index, and
> uses the LUT index to
> trigger the controller.

What is a LUT index?

--8KvlSQhf+aO3INfB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMZVoAAoJELSic+t+oim9otIP/0o2VOZ4w8FJTfK24HyWutQb
hDBYytb9X/zzA+g4lRh14ptGE2cmd2VbtmOPvU4BqwbLUAlHdTZ2ku1xfAJ84as+
pCWGEMLusSdRj9F6Xv8OeyY+zvol8H+sXEX0Qfs+yH1vzIgdS70qGP+kGlxewr9b
CF1g1xDp6WDu9gIDl44RwFjdc99JkFbY7Sm6pyoDjpX2W6Mn19Ratih7bXbHO7+O
0CaIAlkmT7WpJuVjkBJ89g4Tq04qCf1kvjbiouUR/7KPtp4qdoldgXVsyWP0Rp2Q
0LENdAt1p6/lanfOS9MWixKObg5l4l8qCvU8SRQCDMbEV6haA5yIruiSJejOvf86
G57CKZTPxzydwlB4iScNCtpIVGngfK6iETH7L6oDeDFHn5iWheVSezROF4qrUzYZ
9fs96yfdM16/BaDV1aI8Br8bnMjHKV07YL95wFAtT8wsuamw5AvAhx+kCsxfJL4t
mMIm7JvUJsi4QsGq7P/eahEXvEBbIjI595UV9BjP+PO9Tsq17Rxg9grTaJJ7m7iK
dNTK+p9yCODCLjXWdMCDTPisk3UZ56a6IdOvcqPhtOnEs5CUTkMdCDUFylRb7Ir8
9O67fGyFvUGy0sBK9pcAt+zara8AV4+tDzP0+5CHBZ/a42rCTiK45RYUba8KrIdN
SKmE2WNiThyUsLyDj2ug
=yks0
-----END PGP SIGNATURE-----

--8KvlSQhf+aO3INfB--

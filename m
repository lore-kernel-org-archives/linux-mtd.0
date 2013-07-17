Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UzOiE-0006DA-66
 for linux-mtd@lists.infradead.org; Wed, 17 Jul 2013 10:11:58 +0000
Date: Wed, 17 Jul 2013 11:11:33 +0100
From: Mark Brown <broonie@kernel.org>
To: H Hartley Sweeten <hartleys@visionengravers.com>
Message-ID: <20130717101133.GM22506@sirena.org.uk>
References: <201307080912.37827.hartleys@visionengravers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="j1TzbQBGf+ftliiX"
Content-Disposition: inline
In-Reply-To: <201307080912.37827.hartleys@visionengravers.com>
Subject: Re: [PATCH v2 10/11] spi: spi-ep93xx: convert to the queued driver
 infrastructure
Cc: Ryan Mallon <rmallon@gmail.com>, mika.westerberg@iki.fi,
 hsweeten@visionengravers.com, linux-mtd <linux-mtd@lists.infradead.org>,
 grant.likely@linaro.org, spi-devel-general@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--j1TzbQBGf+ftliiX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 08, 2013 at 09:12:37AM -0700, H Hartley Sweeten wrote:
> The SPI core provides infrastructure for standard message queueing. Use
> that instead of handling it in the driver.

Applied, thanks.

--j1TzbQBGf+ftliiX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5m3SAAoJELSic+t+oim9rnMP/24Ro6tH3tw/bPmLtvD4D3Wk
nkg1EzatWi9fm43k/TA/GfAbsKgPDGVP7SghshiXfbyAsBvjjiJhfhJ7W+8WJv0w
iSYosrTUl6C0/ZAunw8x6MTk0hDHxmNa+cj9eKLOI3sqHF49ODu3SmKj6Eh5MKV3
jy6v5vKotE37UELbsEEpo4tThT+UHWuIMYa/gitfb9JNlvSjl04d9I80HBpIeEj7
WOe1q3oBk0JxNO/yczs4oUlRQYWF8n/rv6yZKd3Z1PyBB5iCBVa7RCnYupPg3HwY
o9KVA6b1Kx4I5S+y7Uk08IHDMp717X8tPZe5ANryrrFkiOJ4+YPmH0jD1UALQspv
2AGl2Anox9Aingnw7E5uVX6MGg3KsAqI8PQt5lKQX2V0FbPcWCGLlA6AB9KJbT7E
iitQ1kLTdg6u8JN4pakTw+vmKiog7Lut+zPUtV3RLIqkTYWPZzzxzjlw1r+LYBC5
0ekd4zeDMgJ9I/wlFiO3i13uDz1W5FW8pQHdQ2/9OaVd0a4DKUfypI6Se+2rQLj4
GpT9CT14MgzAJycPyFg+Ii2L3dt0TKbFkMYkTGTY+6z4aNMkVbbfMoXetvfbejR3
jcr7R/mi7F7MSjSlpUUW+MBVVEvtk5Hzk4GkKT9GLuihdxY/M6Q4G19F4dFQXkAE
pxNak2Q/ljj2at1kdnoU
=9bhF
-----END PGP SIGNATURE-----

--j1TzbQBGf+ftliiX--

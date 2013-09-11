Date: Wed, 11 Sep 2013 12:30:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Huang Shijie <b32955@freescale.com>
Message-ID: <20130911113002.GP29403@sirena.org.uk>
References: <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com> <522D3B79.3060707@freescale.com>
 <20130909151450.GI29403@sirena.org.uk>
 <522EC33B.9000009@freescale.com>
 <20130910180704.GB29403@sirena.org.uk>
 <522FD78A.6080900@freescale.com>
 <20130911104126.GN29403@sirena.org.uk>
 <52304BFF.4060007@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="uUnxkf+iQvOgVlY3"
Content-Disposition: inline
In-Reply-To: <52304BFF.4060007@freescale.com>
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


--uUnxkf+iQvOgVlY3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2013 at 06:54:55PM +0800, Huang Shijie wrote:

> The LUT registers needs to be filled with the SPI NOR command, such
> Fast-read/Quad-read.
> So the Quadspi driver needs to know the spi commands, and that's why the
> SPI driver has
> references to the spi command opcodes.

Indeed - what I was wondering was if those opcodes could be requested
=66rom the flash driver rather than coded in there.  The driver needs to
write the commands to the device but it's not clear to me if it really
needs to know the specific commands.

--uUnxkf+iQvOgVlY3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMFQ3AAoJELSic+t+oim99JQP/jxDl9TG6UWgNRWyDbmBdjOP
wmMAPIyJ0CXKGZioRHXlW3BCfDZRVZOT6+OXPH41uyHDzV/KucLe+hrSBbaXUdIW
k5+sZAdfPQeWxx64vYaCbzGM8addTWvoHPj9cjiIU1SgPhQrRCtwTKAU9JW8DnIV
YTaNfw6fnOFKJfLL/lCmVb0EeTvtApp6BpBBJY5Z+cXNrIpo+dsJ1i+zOb97+xfJ
q8RkC1wuZ+zJs457/ucgNrRhKG+ys3UQdfUQ/NG/Nn7iohyHxtpG+EIf67R0UBui
hjcC6hrZEWGDI/GZ+K3Sc6YdtWKU1LVqP0SHA102ewgY9mMYwtsra4YahX6XFdKQ
1oh/g3fWe6jqR0UdynHf+MYprj1vRURIDbj+bMhEplv/+29IC/40eHlOHFy2be5/
FOYKquJyBwjFLuKWkRWHd3DP8ajmSXJdUicABu68tz0Xk6o/HqkgAacDDGcIfaYr
0hE9ahGcDD2/e5isFdxEL6mi6X3UX6qooZub7/m8shWJkLh9n9NP8qQDTG865I8r
qSXTYIk45R/BshzXJRldA8cEYVQdA2gyDRFfsYmq4I7aNYH7Z3xcPLX9ujwHZN37
yamH38lt3sC3218G54dvb4zvGUVNwCNhmu4C5oMXnq4jGcyWu99AwUK62WVW11mr
t4H13sgtJbXEpd7uN2W8
=izYP
-----END PGP SIGNATURE-----

--uUnxkf+iQvOgVlY3--

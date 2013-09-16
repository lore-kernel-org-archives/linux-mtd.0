Date: Mon, 16 Sep 2013 12:06:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Huang Shijie <b32955@freescale.com>
Message-ID: <20130916110634.GC29403@sirena.org.uk>
References: <1378979431.2627.402.camel@shinybook.infradead.org>
 <20130913025827.GA3051@gmail.com>
 <1378999322.4210.95.camel@i7.infradead.org>
 <20130913041208.GD3051@gmail.com>
 <20130912205644.GW29403@sirena.org.uk>
 <52329AD3.2050608@freescale.com>
 <20130913102127.GD29403@sirena.org.uk>
 <52366F97.5030402@freescale.com>
 <20130916101912.GY29403@sirena.org.uk>
 <5236DD17.5090203@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="+gh9XxZVhzxWiq1F"
Content-Disposition: inline
In-Reply-To: <5236DD17.5090203@freescale.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--+gh9XxZVhzxWiq1F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2013 at 06:27:35PM +0800, Huang Shijie wrote:
> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8816=E6=97=A5 18:19, Mark Brown =E5=86=99=
=E9=81=93:
> > I would expect that most controllers would look just the same as they do
> > now except for the additional ability to do quad transfers - it'd just
> > get told that some transfers should use more data lines.

> The SPI is about the byte streams, but the dummy may be not a byte, the
> dummy maybe just 4bit.

> It is interesting to handle the dummy issue for the future's SPI controll=
er.

I don't know what you mean by "the dummy".

--+gh9XxZVhzxWiq1F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSNuY3AAoJELSic+t+oim9l3UQAI6lgFWYjMuZ9rzOIQYh2yY7
9zqCDqMAkqqvhaknub2+d8jUNMk69w9rOCzfnEm/V+VxD+rIwkzctpr6m9B0ok4B
LxNrwgZyqrRYu7C7eIHUHSftgOO9JoXAwxp7MO3AYbqfMV3deHcUGoMGnOycTgGE
Wb1DgGLW7GCGzBrGg2x6YhrkyxEk8+u3Vqyv/0KUGE0+v7aHWxbEq57iWl9WSsMl
GmaRx2K0/HRV1nNuZP4+TJJB3nCJhBwK11gaSuWrasCJbOMNwCuPRDBu8k0UC1MB
cyFCj8z+HiIseSnhNungSlisQvKCSstSwVr/hGte8n8zVaVBBQFPEZHSkXD34dt+
m29BQTgjgFRjJEaVCviV8k0krVu1Q/J8bkvgAIAhGCodMHYS9g62ZZltWxNT5McH
kZKTzEf161aZUamu4tRJAFSLKf5Gx2q6XhkjdyGUn5m43iPnkjCsxgV3AKyb0EQo
5gSsFvfHrkbJTgKWr2VVK9irIhzAKEfNMJbulAunqeHb5gJ12P9nJj9AfZKaTnB9
cF5TKSmTAQ4m9OaQwIrnV5NJETn4InnjD/PwSmayE/34KVmL7Amz4NTb7b00OEom
02+0JtLaZJL6fWvwIvTl7jBbFCDtKl2OaFz5QARflWGIdiOdEXj9PSE93VEExkXC
vXy+rxF2Q8vqpVhGSkF7
=EkcX
-----END PGP SIGNATURE-----

--+gh9XxZVhzxWiq1F--

Date: Sun, 28 Sep 2014 12:35:11 +0100
From: Mark Brown <broonie@debian.org>
To: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20140928113511.GX27755@sirena.org.uk>
References: <1410714624.3040.38.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="PpfQBwiAIZcuDX26"
Content-Disposition: inline
In-Reply-To: <1410714624.3040.38.camel@decadent.org.uk>
Subject: Re: [PATCH 0/5] m25p80,spi-nor: Fix module aliases for m25p80; clean
 up chip identification
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 linux-spi <linux-spi@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ian Campbell <ijc@hellion.org.uk>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--PpfQBwiAIZcuDX26
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 14, 2014 at 06:10:24PM +0100, Ben Hutchings wrote:
> The first patch in the series restores the module aliases to m25p80, but
> it does so by duplicating the list of names.  This should be suitable
> for stable, but it isn't viable in the longer term.

Please don't CC patches not for the SPI subsystem to linux-spi, they
just clog up patchwork for no benefit.

--PpfQBwiAIZcuDX26
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUJ/JuAAoJECTWi3JdVIfQ40oH/ivrIeotI6hkkh/1jCCF4kWk
VTJS8gB9pdoWBkuHwOSPBbS+VW83CzzGABp5I9noxMGTtzLQZWH0gcNrrwXhFj4a
OY9sDiqWS4lhX7oh1g6myD/7ll5AoXoJ69+B1Y8v+JqIWqoTGzU/qC4/raoSU1EW
pt8VV02kMrrXIAqs53pZ4WcfCj7e6y2aQC/xt2tj/2W0r4dukre4Xv0cgmwNUiU1
qoobzVTZtCHbuYHdhMvKjufrSHYHiQiuWLhU61inxLV6oOd4GYWGmqWKBjTLrF2E
c+ofNShOnb6AoOrWfLEtY5Z+nXeNZ0Xg5AJMaEyiYZhPmTS2NprPJNpEmBVoCk8=
=kpAW
-----END PGP SIGNATURE-----

--PpfQBwiAIZcuDX26--

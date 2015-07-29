Date: Wed, 29 Jul 2015 19:40:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Padmavathi Venna <padma.kvr@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Message-ID: <20150729184043.GL11162@sirena.org.uk>
References: <cover.1438170519.git.hramrach@gmail.com>
 <557c1962448393b2a8736f26bfa2a3a5ba4aeb7a.1438170519.git.hramrach@gmail.com>
 <20150729140046.GB11082@sirena.org.uk>
 <CAOMqctTZVET=U=2o65HpWSm4W660XZtYYbBND2k4u9CnfjfMhQ@mail.gmail.com>
 <20150729171613.GI11162@sirena.org.uk>
 <CAOMqctQzh69RCQu8pK1EuuYkrZsh6mg34+YWJFzSvimcK3B0rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="akWijmsqBEgP5JG6"
Content-Disposition: inline
In-Reply-To: <CAOMqctQzh69RCQu8pK1EuuYkrZsh6mg34+YWJFzSvimcK3B0rA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] dt: spi: s3c64xx: add compatible to
 controller-data
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--akWijmsqBEgP5JG6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 29, 2015 at 08:21:34PM +0200, Michal Suchanek wrote:
> On 29 July 2015 at 19:16, Mark Brown <broonie@kernel.org> wrote:

> >> It will not break anything. It will just spam dmesg.

> > I'm confused - if all this change does is to spam dmesg then what's the
> > point?

> Presumably when your SPI NOR flash fails to probe this message will be
> just above and you will look into the binding doc and add the
> compatible.

If you're looking to add a warning message when the flash device fails
to probe then add that in the flash driver when it detects an error,
this will cause needless noise for everyone else using this controller
purely to work around the broken binding.

And like I say compatible really seems like it isn't an appropriate
property here.

--akWijmsqBEgP5JG6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVuR4qAAoJECTWi3JdVIfQw84H+gIG06W1d5C+xW+3hdwVcySH
U+hKQACjqxbhWce28likOpb+KV3qC8Vqp4vRNYrfTgQbpJfnI4Sz/0q6UW28FL2y
ybxkDt3/XMC9D4fWRodIDZYUxEm/76Z0/y1h0VAwXSHMS8bziwltgiTVMfpxRhPv
yXOFjuhdMDHQcoTzj34vBpep1c6RT6ymMw0C0szqmElwDUvcMvh1GTidkDTTk/nQ
o/IrC2dXrjQF12YpuwRPpth98ZR2b38WkVa/Fd/nyCTbvRWiwdAY7Yn3tBTD/Hns
w1GsUiOys9kPykg/qeBOI5sLr/Y2GmYeYzz4hUdfENXDo3CCm2T62riqAjUfNng=
=+uJe
-----END PGP SIGNATURE-----

--akWijmsqBEgP5JG6--

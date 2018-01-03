Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWha5-0003pE-A8
 for linux-mtd@lists.infradead.org; Wed, 03 Jan 2018 11:51:41 +0000
Date: Wed, 3 Jan 2018 11:51:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Rob Herring <robh@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 computersforpeace@gmail.com, dwmw2@infradead.org, richard@nod.at,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 nicolas.ferre@microchip.com, radu.pirea@microchip.com
Subject: Re: [PATCH 2/3] dt-bindings: mtd: atmel-quadspi: add an optional
 property 'dmacap,memcpy'
Message-ID: <20180103115116.GG5603@sirena.org.uk>
References: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <143542c61ca674d53da4985bbabc142e8e6ebefc.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <20171226232330.trljk2ofyvu4ly3n@rob-hp-laptop>
 <0149ba05-64b1-2739-e61f-78d5170775fb@wedev4u.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xs+9IvWevLaxKUtW"
Content-Disposition: inline
In-Reply-To: <0149ba05-64b1-2739-e61f-78d5170775fb@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--xs+9IvWevLaxKUtW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2017 at 10:40:00PM +0100, Cyrille Pitchen wrote:
> Le 27/12/2017 =E0 00:23, Rob Herring a =E9crit :
> > On Sun, Dec 24, 2017 at 05:36:05AM +0100, Cyrille Pitchen wrote:

> >> +Optional properties:
> >> +- dmacap,memcpy:  Reserve a DMA channel to perform DMA memcpy() betwe=
en the
> >> +                  system memory and the QSPI mapped memory.

> > How is this a h/w property? Why would I not want to always enable DMA i=
f=20
> > possible?

> The number of DMA channels is limited for a given SoC. This number may be
> lower than the number of enabled controllers (spi, i2c, qspi, aes, sha,
> des, sdmmc, usart, ...).

> So we use a DT property to explicitly tell the matching drivers to request
> and reserved the DMA channels they need. This policy is not driver or even
> SoC specific but board specific. It's very common to reserved DMA channels
> for the most used or most performance dependent controllers, setting the
> relevant properties in the device-tree then restricting remaining
> controllers to their PIO mode.

Why can't we just time share the DMA channels at runtime, why do we need
this static allocation? =20

--xs+9IvWevLaxKUtW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlpMw7MACgkQJNaLcl1U
h9AWGQf9F0RsEiNtRpRHLeDZldvGY8OSYaP3t3RRrpTrlrKfx3BxDGqCeuTj5gfB
7wCpMzuTn8ckXz3nSuP3i2rdWUDSIZxX7zMHUElNLDEQBtUofXi4Ub35NznNShTN
0EAuW9xc86ek/iPZUnGHjQe6BcCzZajeLMpPOdxg6YPqGKHYNwtPH7RvZ9sTYI+Y
w8vj6lx5Y9o1UB0Lw/TIevyjWIOdndfy3IN0g2a2H8isDuATg0edR+CUtDKG0LBM
3EHxrxilgFks/Y3TmnirTcDMcFT+IzelUmIxtYG01DLALQQoHpMrHEfOI22/x7Hr
15vQ8RoA0kndI977/52eKt4b1QvQeg==
=1Kgv
-----END PGP SIGNATURE-----

--xs+9IvWevLaxKUtW--

Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWhYO-0002GH-Bw
 for linux-mtd@lists.infradead.org; Wed, 03 Jan 2018 11:49:54 +0000
Date: Wed, 3 Jan 2018 11:49:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Trent Piepho <tpiepho@impinj.com>
Cc: "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "radu.pirea@microchip.com" <radu.pirea@microchip.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Subject: Re: [PATCH 0/3] mtd: spi-nor: fix DMA-unsafe buffer issue between
 MTD and SPI
Message-ID: <20180103114931.GF5603@sirena.org.uk>
References: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <1514313927.26695.19.camel@impinj.com>
 <20171227103609.GQ1827@finisterre>
 <1514405711.26695.67.camel@impinj.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RE3pQJLXZi4fr8Xo"
Content-Disposition: inline
In-Reply-To: <1514405711.26695.67.camel@impinj.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--RE3pQJLXZi4fr8Xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 27, 2017 at 08:15:11PM +0000, Trent Piepho wrote:

> A random collection of spi master drivers will accept DMA-unsafe
> buffers in some way.  In some cases a framework like spi-nor provides
> the fixup to spi-nor master drivers (none so far) and in other cases
> (atmel-quadspi), the spi-nor master driver has its own fixes.

Everything really should be DMA safe.  The thing with skimping on the
DMA safety is that things generally won't explode every single time but
they might explode.

> What exactly is caught as DMA unsafe and what is not will of course
> vary greatly from driver to driver.  Some drivers will catch highmem
> memory while other drivers will only detect vmalloc memory.  Some will
> only catch an unsafe buffer if a specific SoC known to the driver to
> have an aliasing cache is enabled.  Some will check buffers that arrive
> via the spi_flash_read interface but not via generic spi transfers,
> while others will check all spi transfer buffers.

As I keep saying here the real fix would be to have a simple API that we
could use to tell if we're dealing with something DMA safe.  Right now
it's a mess because you need to pass that information around through
every layer that references memory which is a pain.

--RE3pQJLXZi4fr8Xo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlpMw0oACgkQJNaLcl1U
h9AQSAf+KdLHQShKUCckRDN+9aVdQFD3qT+Bx28dXtpMxXM+XGUk0RMl4Hvbkb2Q
Q31Oehypjtk9sY1KS5xh6AgvPQrAEfo60gSI36FG3gV8G+3jFxm3qM1mxDweHCey
VNegIt2Fx6EOOqRjSo2s9y8BJNNXKEaJqBamBhkSqNTHEnD82IpVfrmEoE5AVsa8
PyL1v4i5T6hPxoyg81aXIeD3DGEemOQbWEJenDTGGc8X5ieaKfq9bXydTwbMbtYU
qSaGjbGCqqOjUItEVUPo6WnCOVQhow+JPgPJ3vMCdH0UDNCr29cEupRbRMYAUPo4
Op15qcLdpKjnPgo3yj3iFZcG1YiMDg==
=ajYs
-----END PGP SIGNATURE-----

--RE3pQJLXZi4fr8Xo--

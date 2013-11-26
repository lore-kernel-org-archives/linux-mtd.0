Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlHeq-0001ka-4K
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 12:22:24 +0000
Date: Tue, 26 Nov 2013 12:21:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20131126122159.GB14725@sirena.org.uk>
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-3-git-send-email-sourav.poddar@ti.com>
 <20131126102951.GX14725@sirena.org.uk> <52948451.3060706@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ATpkSYPIqF1Y+gtT"
Content-Disposition: inline
In-Reply-To: <52948451.3060706@ti.com>
Subject: Re: [PATCH 02/17] spi/spi.h: Add configure from slave support.
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com, balbi@ti.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ATpkSYPIqF1Y+gtT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2013 at 04:51:53PM +0530, Sourav Poddar wrote:
> On Tuesday 26 November 2013 03:59 PM, Mark Brown wrote:

> >>+	void	(*configure_from_slave)(struct spi_device *spi, u8 *val);

> >Clearly this is far too unstructured to be useful, this is only ever
> >going to work with one specific combination of slave and master since
> >there's absolutely no semantics defined.

> I thought "val" might be good enuf, and this can be filled with whatever
> data that need to be used from slave into master(irrespective of
> slave and master?).

The name isn't the issue, it's the fact that you're passing a completely
unspecified blob of data.

--ATpkSYPIqF1Y+gtT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlJJkAAoJELSic+t+oim9VXcQAIhBXc/XHSYdXg2Y3nKvxfgQ
HxzIioI22qfif8bxGUYVykYSUFL0RT2NSDYaCHq9U1xRarInqNm7q4DsOspcHF92
oax813MDaUBdShbRrk4WP8Yv2clWHZdXoHzyw+9hvH6OH64Xw02UnUALC662QXsX
jTq1ssAujINDtRQZQ8bbGFwwQRq/08nEyVDzb0uEgYwg8ogRUxhy+dvf3+7jZAEq
wc7NfAjfzADZAI5oh8aLjK66RyKTN1+7tho1E6VV0D5QIorRsSpYAE2jdtaM397s
d6HQV8h4Ele/cokKuUkrwmjx1goef6077z9tBFPChCZInn7f2/ZCRr/HCmlm/sqV
xuwD1yQtxbEc9wuvx2Eu4Jl+G5ZlNRAqyaP62vZb5CRasQuHTXQi0Bj2ybA6n374
LkzHToU/eee6fQkUM3+/W1xOfLwL3U0jJirM4yT62U+FkVy30dhZlmLLdKxG+Ag/
pqnbfsdi98RaN7MPFF32+n5QfX+bxtqTiZttL1mDWCmqGkMVnawg+MQV9qaftcpv
pqAP0pZTOSscmjfUWjKL7ieEClvwPB6ujF2CTTD7td6z8S/OnxcUUNFXEpqSzzEO
ja44xcvTLLgOK6fOr9JwkqT+QKgwuQHlMuNTYvlLmhM7z2hj06E93RJJN2vZByaa
b9NH1V/e7xt9XaXd5AY3
=XzZy
-----END PGP SIGNATURE-----

--ATpkSYPIqF1Y+gtT--

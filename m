Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbXDa-0001ni-Dx
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 16:34:46 +0000
Date: Fri, 27 Mar 2015 09:34:50 -0700
From: Mark Brown <broonie@kernel.org>
To: Shengzhou Liu <Shengzhou.Liu@freescale.com>
Message-ID: <20150327163450.GE1743@sirena.org.uk>
References: <1427449110-24556-1-git-send-email-Shengzhou.Liu@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Content-Disposition: inline
In-Reply-To: <1427449110-24556-1-git-send-email-Shengzhou.Liu@freescale.com>
Subject: Re: [PATCH] mtd/spi: support en25s64 device
Cc: scottwood@freescale.com, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2015 at 05:38:30PM +0800, Shengzhou Liu wrote:
> Add support for EON en25s64 spi device.
>=20
> Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)

This is a MTD driver, not a SPI driver - you need to send your patch to
the MTD maintainers not me.

--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVFYapAAoJECTWi3JdVIfQ3mEH/1RBQB20poihdTUEsrx5Tior
uyAbqNNkaZJQRqUq2uxDV4vBwdO7FVcZaBcTWMVqVIGuHU6kmnrHxWycC7ln0KBm
LzFilVehfEzh0dRfm76tIf/ySskE48UX8cVnScIfBuyMW0vu6nRiUovXOslBA7sK
yjJt6NVcDE8ikuGg/GO4HFaHUz37sOwajqU2pPtEod0+rp8Ac2Xl97r73Vm9JGfe
E9IX8mZNA+MXzLiRiy3T7hNwsp5ddNsQ6KO8SXQiqHSyrZLcHGLFw81fmN1O9nU6
1n+fthR/IwfuJ5+iM4EottZM8WxQUcOTbpghHV3dr0vOsRLQSfcQV6aCECZAibE=
=+ySD
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--

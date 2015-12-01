Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3sXW-0003vy-Q9
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 21:32:47 +0000
Date: Tue, 1 Dec 2015 21:31:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Michal Suchanek <hramrach@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Stephen Warren <swarren@nvidia.com>, "Andrew F. Davis" <afd@ti.com>,
 Marek Vasut <marex@denx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>,
 Bean Huo =?utf-8?B?6ZyN5paM5paM?= <beanhuo@micron.com>,
 Furquan Shaikh <furquan@google.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Message-ID: <20151201213152.GW1929@sirena.org.uk>
References: <cover.1448988089.git.hramrach@gmail.com>
 <8c34c7790244489c2ce0072c72bd9bc7c4cdb965.1448988089.git.hramrach@gmail.com>
 <20151201195816.GS1929@sirena.org.uk> <565E0C2B.4070504@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wGE1Wqqn9IXiFm4H"
Content-Disposition: inline
In-Reply-To: <565E0C2B.4070504@gmail.com>
Subject: Re: [PATCH v5 08/10] spi: expose master transfer size limitation.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--wGE1Wqqn9IXiFm4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 01, 2015 at 10:07:55PM +0100, Heiner Kallweit wrote:

> Sure .. Just one inquiry:
> When you say "the naming here" you refer to Michal's or my version?

Michael's (transfer).

> Actually I like in Michal's hook that it directly takes a struct spi_device.
> This saves the caller one level of indirection as the caller usually will
> deal with a spi_device and not a spi_master.

> If you're fine with Michal's version then this is also fine with me,
> especially as the functionality is the same.

OK.

--wGE1Wqqn9IXiFm4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXhHHAAoJECTWi3JdVIfQGt0H/RrrYHiYZL2tii1DcolmEmVm
0Zzz54ngc0PUiDuUJO25EKlwYmDPNUNxLZBldTWnvRWifhl7pfBePTdPbELdiqi3
qSWmwsJDMVhH655vuU5a3HrU+Mm4Cu0HH3qGfyrTwhOZfNE8k0JvStuzpKnYELsU
Yt1xl/y/Fgn4gwUl6PnA5mCA8bs68gE0ouT8mK4fw60fJCK1/AkdG54Ky9bzHZed
6sjof/3B9Ld0t2X33jczI8WMn0mXlPDotXNelfOtWTADqlSxywSZhwOupHMiNWED
ULFA/mkzi0H4hsrZqeW0dbZhRQD1ZxSPDKJViZC4SPfDek05Gw5D89i2QH2WCKo=
=kDAi
-----END PGP SIGNATURE-----

--wGE1Wqqn9IXiFm4H--

Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfPQ7-0003E2-C1
 for linux-mtd@lists.infradead.org; Wed, 09 Aug 2017 11:45:05 +0000
Date: Wed, 9 Aug 2017 12:44:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com,
 john@phrozen.org, linux-spi@vger.kernel.org,
 hauke.mehrtens@intel.com, robh@kernel.org,
 andy.shevchenko@gmail.com, p.zabel@pengutronix.de, kishon@ti.com,
 mark.rutland@arm.com
Message-ID: <20170809114421.oo2bunardgw3p4tk@sirena.org.uk>
References: <20170808225247.32266-1-hauke@hauke-m.de>
 <20170808225247.32266-4-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="76oohoz2fusi4hjt"
Content-Disposition: inline
In-Reply-To: <20170808225247.32266-4-hauke@hauke-m.de>
Subject: Re: [PATCH v9 03/16] mtd: spi-falcon: drop check of boot select
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--76oohoz2fusi4hjt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 09, 2017 at 12:52:34AM +0200, Hauke Mehrtens wrote:

> Do not check which flash type the SoC was booted from before
> using this driver. Assume that the device tree is correct and use this
> driver when it was added to device tree. This also removes a build
> dependency to the SoC code.

Why?  Is this assumption reliably true?

--76oohoz2fusi4hjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlmK9ZQACgkQJNaLcl1U
h9AHSwf9Fq1OGMyZ9pNQve/uU1k7zR3YCjYuG4FAiLJ7uyu52Gbu6Jhy2kZNIn4Z
CthKUBdR/SdY6Qfhm0kk82z5Q2Jg6gc0FNzVPjXHe0nRL6oFvGyO8Zs8UL0hfJsn
8TMv7S+ApJMSjM7Aayj/Gx1bCq1GBG2s9LLhllMVfOgY0JVh5ofTzy4Egt1cfY26
SK/DTBgpOJc66xrLAOV7Z6GluBSvyOpFvoobbH8YvKEM+iV+QALKZ4u4UjKI8UJG
BNUTEqnljsgLIL8wvoEHFSwh9DSenQbKdzI1sUNkFF0cA7MnrrSez3vfuigi0nZo
Cwhde95F1WGQNdz3R2Cf83JlTMrOBw==
=fsAd
-----END PGP SIGNATURE-----

--76oohoz2fusi4hjt--

Date: Wed, 7 Aug 2013 16:55:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <zonque@gmail.com>
Message-ID: <20130807155549.GE6427@sirena.org.uk>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-8-git-send-email-zonque@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="p//XFgTqeVWI1epd"
Content-Disposition: inline
In-Reply-To: <1375889649-14638-8-git-send-email-zonque@gmail.com>
Subject: Re: [PATCH 07/20] spi: spi-pxa2xx: remove legacy PXA DMA bits
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 mika.westerberg@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 gregkh@linuxfoundation.org, g.liakhovetski@gmx.de, sachin.kamat@linaro.org,
 kernel@pengutronix.de, djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--p//XFgTqeVWI1epd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 07, 2013 at 05:33:56PM +0200, Daniel Mack wrote:
> Generic DMA support was already implemented by commit cd7bed00
> ("spi/pxa2xx: break out the private DMA API usage into a separate
> file") which moved all the legacy PXA DMA implementation code into
> its own file.

Acked-by: Mark Brown <broonie@linaro.org>

though this will have some trivial merge issues until the merge window
they shouldn't be a problem.

--p//XFgTqeVWI1epd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSAm4CAAoJELSic+t+oim96jwQAJ5qidUTivpoobMbt0y+wyku
CTHza3wsj9KtXNrVTLoQ6LBTPCXGyCKmE5IzBduH3F5QukPK4zZHVtsGpcO0aKR4
KajobpsHNdPuD07fqMlo1keR4axlVL8vcCwAu/U3xQ2PSA/ev032fT53K8ikSVHh
znMS8lzfRyvldIIrgvUyFRXe9vqez6ns3LT/Epz36Z43KBDi9z08frzzrSzTtb3t
5npgbJO31ynaGtdjWbIvdGdyLaR7K5aGRkYNzUp9cyRjj+JYYsWPLGr4rls3k/OY
VwFQcy+Fb3v/GkTfqQ3EL+bjsRVpOiTtyN0M78PE0m3e4WCzJW5NDxXLWDzozs1N
snrtKDjtF1W4k7gwppawZgBVI4yd/nf8hgLHU0aDFax+uC1PZ4SyYWT35EXd7mAA
HLLrqVeIrnCe5d1KiJ9OtlpNOh7IAg1weimS/Nf364cMQoljtpNbGNGVt/pPQ01g
KFjC+1A0DQVFCJqJF8h2VMnANP9WZLYc6u04yedHGi624xdfkTU0FG/pxCCCcnAV
SfoEgFIoFvHFsxMGomNqaLcBDE5Kg5dCcrwkiqGisEL93zsXUIFpWKFAtdiY3ike
5ditvu61/SQShxzdueTxaLoSWDorI/tLKz/CM4v6Ruc1rqCtpDI2stpwqqckpBpR
EANI+fEMZg7RO8T5dbbe
=2ef7
-----END PGP SIGNATURE-----

--p//XFgTqeVWI1epd--

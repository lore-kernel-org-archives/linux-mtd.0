Date: Tue, 14 Jul 2015 17:26:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjit Waghmode <ranjit.waghmode@xilinx.com>
Cc: michal.simek@xilinx.com, soren.brinkmann@xilinx.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, zajec5@gmail.com,
 marex@denx.de, shijie.huang@intel.com, juhosg@openwrt.org,
 ben@decadent.org.uk, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, harinik@xilinx.com,
 punnaia@xilinx.com, ran27jit@gmail.com
Message-ID: <20150714162627.GC11162@sirena.org.uk>
References: <1436445895-25504-1-git-send-email-ranjit.waghmode@xilinx.com>
 <1436445895-25504-2-git-send-email-ranjit.waghmode@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OmEpep6L+R/25PJj"
Content-Disposition: inline
In-Reply-To: <1436445895-25504-2-git-send-email-ranjit.waghmode@xilinx.com>
Subject: Re: [RFC PATCH 1/2] spi: zynqmp: gqspi: add support for dual
 parallel mode configuration
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--OmEpep6L+R/25PJj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2015 at 06:14:54PM +0530, Ranjit Waghmode wrote:

> +	if (qspi->master->flags & SPI_BOTH_FLASH) {

There's currently no SPI_BOTH_FLASH...

--OmEpep6L+R/25PJj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVpTgyAAoJECTWi3JdVIfQ2doH/AmmtPppWJw/uHkEkc0/kP4P
YtxX4R+MLlxHgsRnLnc3NLzq2EGqz8n20BgY68sLnu6YRrpf9Onx+6UuYnVShJXy
+bvwsqvnvFQrO/cOTgnPcVUQHihp/e5xS69X/i/aE+F1eOStYWYmiAFRANoc9sxN
kcE84q7gd0mHPbP0abk0wkHigZBkoT7rt/nO/4ZjGVdWbccA3t921c4ftkU0gecI
Bp1xhTgHVP0NuCzkDVDniVXzh5mxqcHlCp0+cLYoD/hb9tgRgaNTA2Vau2vIqR6+
GUGLpmAncEQlRc5exnAFvI0L/PBu0N11B24a6PYXapwY5ft8Uhy7vwlDb/PIwMA=
=iJMq
-----END PGP SIGNATURE-----

--OmEpep6L+R/25PJj--

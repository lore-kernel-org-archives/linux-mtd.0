Date: Tue, 14 Jul 2015 17:28:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjit Waghmode <ranjit.waghmode@xilinx.com>
Cc: michal.simek@xilinx.com, soren.brinkmann@xilinx.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, zajec5@gmail.com,
 marex@denx.de, shijie.huang@intel.com, juhosg@openwrt.org,
 ben@decadent.org.uk, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, harinik@xilinx.com,
 punnaia@xilinx.com, ran27jit@gmail.com
Message-ID: <20150714162806.GD11162@sirena.org.uk>
References: <1436445895-25504-1-git-send-email-ranjit.waghmode@xilinx.com>
 <1436445895-25504-3-git-send-email-ranjit.waghmode@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iYlQhtYNd1Y0HGg2"
Content-Disposition: inline
In-Reply-To: <1436445895-25504-3-git-send-email-ranjit.waghmode@xilinx.com>
Subject: Re: [RFC PATCH 2/2] spi: zynqmp: gqspi: add support for stacked mode
 configuration
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--iYlQhtYNd1Y0HGg2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2015 at 06:14:55PM +0530, Ranjit Waghmode wrote:
> This patch adds support of stacked mode configuration for
> Zynq Ultrascale+ MPSoC GQSPI controller driver.

> +	} else if (qspi->master->flags & SPI_MASTER_U_PAGE) {

Same here, there's no definition of SPI_MASTER_U_PAGE.  It doesn't sound
very generic but I'm not entirely sure what "stacked mode" is.

--iYlQhtYNd1Y0HGg2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVpTiVAAoJECTWi3JdVIfQLi8H/jkXLzsBxKK52xQsByI3VT04
lbZ/MP0v2l6XGuM/c7zlhS0H2xffdn2UO91XjPqBR5q1Bj6CTjthspzIa0NcbLMy
PTa4hZ++sslZgJAG4hjO8HZkFpcJ42HiRFdBJJTm0Fa0WD6R6lSlYxhEUcsSsmgq
icLUBY8/Z1eYh7DUSd0VeO2XdgtLBJGi+PQMLqlcFMyarPkaiwFQXpUOaVGdzaEJ
BxxEuyOZcE7y6xXiuLRnm3JAOlhsF767WTdgHrKgocMpYlaCrXmg8AFDmul9NYZ+
zqPota6joYcxUdsVO8Bc6gxN2yebdceaar9TmqtksMs1yBLTZE37/7QKbXkuWFA=
=ghHT
-----END PGP SIGNATURE-----

--iYlQhtYNd1Y0HGg2--

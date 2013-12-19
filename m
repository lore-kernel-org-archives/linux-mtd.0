Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vtdhh-0000hh-2b
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2013 13:31:53 +0000
Date: Thu, 19 Dec 2013 13:31:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20131219133105.GC31886@sirena.org.uk>
References: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
 <1386339891-32717-2-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="aHyShe78FfJzbeER"
Content-Disposition: inline
In-Reply-To: <1386339891-32717-2-git-send-email-sourav.poddar@ti.com>
Subject: Re: [PATCHv2 01/10] spi/spi.h: Add get_buf/put_buf support in spi
 master.
Cc: marex@denx.de, devicetree@vger.kernel.org, computersforpeace@gmail.com,
 balbi@ti.com, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--aHyShe78FfJzbeER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 06, 2013 at 07:54:42PM +0530, Sourav Poddar wrote:
> Add get_buf, put_buf api support in spi master.

Please add this stuff along with the code implementing it.

> +	void	(*configure_from_slave)(struct spi_device *spi);
> +

I don't understand this API at all - it takes no parameters and doesn't
have a possibility of returning any error codes?

--aHyShe78FfJzbeER
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsvUVAAoJELSic+t+oim9CuwP/1XVVgzLmTUrm8IIC25COg2Y
/9TZrDHMotVIOK33eL0Xx7hp2C5Ks1qmJKIoUj6qPzjfzKryS0niM/SGAmTf/zNO
FhgCvwMY/GVUxKwI8sxBgpDTkQSn+gxtHPIvoKcjJMJTpJiodE1QXO5rJtSPX0QF
BHZS24nQaJmxTzcgh8d3dZnvVAAYi5dEqRR8BgilOd0sjHALyRFdngVePY4cWKqG
XxeNMNlr5U8s9WyACa1Dd4SvMpX4Ytb70lSaO6g2+0FqML7zvmEbyoE6ZyVLm8f0
6TiQFCqGDxfRNxoSkJUFmTmh9rd04w5jXZii2aR9aAbUC0sZiaw8UuBolnxg3769
FWD9wb0vxnExrBvGjGqwOR8F21aODIjYCjW3RFi5wmJAFuYD77TTQkx5NgkZseG+
GO0DcO78Jh3nxuMiz2Qqzw8e2hOwCFgtXz3uQLAnyDPDEeJPO0ylvrQWTD47BMrW
7XquP0R2JBlgwXhsSQsP6MUy00KPtaNp66UW9SiI8iNl4fE4No1ZmP9PStmRqUTU
7XPFn7rTWsbfs21AwacGjb/e0k3MDcGKCja/lsnMNLnUSTNmaObMPCrEXThbQyL3
T40sRJqyAjohgJNmpncVLT3nAx8Rt7w0Tff2GK56636J0CVnT/8fHIbwPwZx9gbl
xS+mGxAk4H0y5zkcztEy
=3NTq
-----END PGP SIGNATURE-----

--aHyShe78FfJzbeER--

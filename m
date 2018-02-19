Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1enlzU-00061k-8e
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 14:00:27 +0000
Date: Mon, 19 Feb 2018 14:00:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [RFC PATCH 1/6] spi: Extend the core to ease integration of SPI
 memory controllers
Message-ID: <20180219140003.GF32761@sirena.org.uk>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-2-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WlEyl6ow+jlIgNUh"
Content-Disposition: inline
In-Reply-To: <20180205232120.5851-2-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--WlEyl6ow+jlIgNUh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 06, 2018 at 12:21:15AM +0100, Boris Brezillon wrote:

> +	/*
> +	 * The controller can implement only the high-level SPI-memory like
> +	 * operations if it does not support regular SPI transfers.
> +	 */
> +	if (ctlr->mem_ops) {
> +		if (!ctlr->mem_ops->supports_op ||
> +		    !ctlr->mem_ops->exec_op)
> +			return -EINVAL;
> +	} else if (!ctlr->transfer && !ctlr->transfer_one &&
> +		   !ctlr->transfer_one_message) {
> +		return -EINVAL;
> +	}

BTW your comment isn't describing what the code does - the comment says
that having the memory operations means the driver can't be a regular
SPI controller while the code does not do that and only checks that if a
driver has memory ops it implements two required ones.  Indeed the
existing drivers that are updated to the new API continue to implement
normal SPI operations.

--WlEyl6ow+jlIgNUh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlqK2GMACgkQJNaLcl1U
h9CVkAf+KHlVU/P/aBIqDuytJNtFH1W7piqbaeTeJuXKIBjRFUXFJhAe2Fd3y9et
RiDdKHd+FXGuHc3+gSDuo8ow0TvjNPycoC/MeyhAIsDXNIxjoSbL8KJH5Q+5b3K9
VvbOd6xe6ktpxtrCmtN+LaeqcBMcbzmZ/w66mJbiOy/1FloNtnL04rGpNsigKKY2
d5DrZ+NOOj4qxjvEITh27vKfy2yYPZwfj0gJfl3odaUAmB+ERXKW+sk+HbxWBkcN
B1kVHT+zkSzGJ3e/hXUteADrIkshF53AT6pEUklvvgowl26JUR14k7Wc+PgSspng
J/qWcKwDkCRh6KnSHIZeF0kBbKM9UA==
=aZW9
-----END PGP SIGNATURE-----

--WlEyl6ow+jlIgNUh--

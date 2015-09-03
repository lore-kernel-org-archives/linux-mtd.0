Date: Thu, 3 Sep 2015 13:12:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjit Waghmode <ranjit.waghmode@xilinx.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 michal.simek@xilinx.com, soren.brinkmann@xilinx.com,
 zajec5@gmail.com, ben@decadent.org.uk, marex@denx.de,
 b32955@freescale.com, knut.wohlrab@de.bosch.com, juhosg@openwrt.org,
 beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, harinik@xilinx.com,
 punnaia@xilinx.com
Message-ID: <20150903121232.GW12027@sirena.org.uk>
References: <1440570367-22569-1-git-send-email-ranjit.waghmode@xilinx.com>
 <1440570367-22569-2-git-send-email-ranjit.waghmode@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0DzvS/R5x22MwsQI"
Content-Disposition: inline
In-Reply-To: <1440570367-22569-2-git-send-email-ranjit.waghmode@xilinx.com>
Subject: Re: [LINUX RFC v2 1/4] spi: add support of two chip selects & data
 stripe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--0DzvS/R5x22MwsQI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 26, 2015 at 11:56:04AM +0530, Ranjit Waghmode wrote:

> To support dual parallel mode operation of ZynqMP GQSPI controller
> following API's are added inside the core:

As covered in SubmittingPatches please try to make each patch a single
change rather than having multiple separate changes in one commit.

> +	/* Controller may support more than one chip.
> +	 * This flag will enable that feature.
> +	 */
> +#define SPI_MASTER_BOTH_CS		BIT(8)		/* enable both chips */

This isn't saying that the controller supports more than one chip, it's
saying that the controller supports asserting more than one chip select
at once which isn't the same thing.  I'm also not entirely sure that
this makes sense as a separate feature to the data striping one - I'm
struggling to think of a way to use this sensibly separately to that.

--0DzvS/R5x22MwsQI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV6DkwAAoJECTWi3JdVIfQXYgH/10ooGEfIRwg3+RXxCX4cCXQ
9tZHzQ8/VXSmmnYOZk5t7sGeX4V9+KxegIv7qYfF5xo6axxM7nR5YVsytqbFmxg6
U+RGTxUM3kTvgD6xSELunChkj4/TQo2WpNxUekG06ei7KW/fTHvp/LjpfhMvm9oO
Kyz9u7CU7Jw4IqxhjFOiy+zP6lWCE2Qqh5mThX9YvxFt8q4CDZRzI/ITlOVCnT4R
Cck5fqSeRIZtaNUjZJz4f7+ZSrNt/TqoFxRmfyoEgf7XUAiw1ZmBX7NqfMbgzOEX
msplicMkoGRWtgvS2MTX4eAL22pvbnuFZOq1YKyOLc5uxboB+lgIaz8jVeVDbkU=
=fCrY
-----END PGP SIGNATURE-----

--0DzvS/R5x22MwsQI--

Date: Mon, 3 Aug 2015 17:08:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjit Waghmode <ranjit.waghmode@xilinx.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 michal.simek@xilinx.com, soren.brinkmann@xilinx.com,
 zajec5@gmail.com, ben@decadent.org.uk, marex@denx.de,
 b32955@freescale.com, knut.wohlrab@de.bosch.com, juhosg@openwrt.org,
 beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, harinik@xilinx.com,
 punnaia@xilinx.com, ranjitw@xilinx.com, ran27jit@gmail.com
Message-ID: <20150803160829.GX20873@sirena.org.uk>
References: <1438592707-30713-1-git-send-email-ranjit.waghmode@xilinx.com>
 <1438592707-30713-2-git-send-email-ranjit.waghmode@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0k4Rxg87Lb8yV0u3"
Content-Disposition: inline
In-Reply-To: <1438592707-30713-2-git-send-email-ranjit.waghmode@xilinx.com>
Subject: Re: [LINUX RFC 1/2] mtd: spi-nor: add dual parallel mode support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--0k4Rxg87Lb8yV0u3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2015 at 02:35:06PM +0530, Ranjit Waghmode wrote:

>  drivers/mtd/devices/m25p80.c  |  1 +
>  drivers/mtd/spi-nor/spi-nor.c | 92 ++++++++++++++++++++++++++++++++++---------
>  include/linux/mtd/spi-nor.h   |  3 ++
>  include/linux/spi/spi.h       |  2 +
>  4 files changed, 79 insertions(+), 19 deletions(-)

You need to at least split this into two patches, one adding a new SPI
interface and another using it in MTD.  Probably the MTD core and driver
changes need splitting too.  Please see SubmittingPatches for discussion
of splitting things.

> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index d673072..8dec349 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -355,6 +355,8 @@ struct spi_master {
>  #define SPI_MASTER_NO_TX	BIT(2)		/* can't do buffer write */
>  #define SPI_MASTER_MUST_RX      BIT(3)		/* requires rx */
>  #define SPI_MASTER_MUST_TX      BIT(4)		/* requires tx */
> +#define SPI_MASTER_DATA_STRIPE		BIT(7)		/* support data stripe */
> +#define SPI_MASTER_BOTH_CS		BIT(8)		/* enable both chips */

This is really not adequate description for a new API, I can't tell what
"data stripe" is supposed to mean at all and I've got at best a vague
idea what "both chips" really means.  This means other developers won't
be able to tell how to use or implement these flags either, and it means
I can't really review this.  You need to provide more information here,
both in the code and in the commit message.

I'd also expect some handling in the core for these, for example error
handling if they can't be supported.

--0k4Rxg87Lb8yV0u3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVv5H8AAoJECTWi3JdVIfQTmgH/ieu6GnPLRFpaqnj5Qoz3+fq
HkuL/5L1vCeMw8cSWTr81ZAMDTsrHIxx/ZlmZ4CtdNYg7b2cigZ0uGUxzMAucRH/
wZhapvEspmuxL1uy2r37bxUH6BCo7e8Z2aX/0ssusVH8GWw44v81VfNg3k2/8Oaw
nnpQ4iOiyQ3ggIR0M5vh3mnRLErGcV5G3mKm6//jeJCpE0ugFIUdTtE60Ye/8fxO
F6TSxfpeZwWESgDAIdRTEFJodjNrwAHbwZA7Ih+BvZ7HJ1RZPH297mpDMd/SErFW
ZxP2CDLk+X8Qhy168x9kS3t0RGy6YA5Gp3ikKwmjl6MyVTeC5T5L8TDe+X5w++A=
=Xowj
-----END PGP SIGNATURE-----

--0k4Rxg87Lb8yV0u3--

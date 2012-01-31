Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsCXQ-0003Zp-SV
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 12:10:18 +0000
Date: Tue, 31 Jan 2012 13:10:07 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3] mtd/gpmi : add BBT support to gpmi nand driver
Message-ID: <20120131121007.GO2471@pengutronix.de>
References: <1328008316-27258-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ABYnUdqoGSokwVM+"
Content-Disposition: inline
In-Reply-To: <1328008316-27258-1-git-send-email-b32955@freescale.com>
Cc: marek.vasut@gmail.com, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ABYnUdqoGSokwVM+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 07:11:56PM +0800, Huang Shijie wrote:
> Add a new field to gpmi_nand_platform_data{}.
> Make the BBT support to board specific.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Reviewed-by: Wolfram Sang <w.sang@pengutronix.de>

I'd think you won't be able to mark blocks bad, though. Will send a
patch in a minute. Please test.

> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 ++
>  include/linux/mtd/gpmi-nand.h          |    2 ++
>  2 files changed, 4 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index 493ec2f..4d369df 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1493,6 +1493,8 @@ static int __devinit gpmi_nfc_init(struct gpmi_nand=
_data *this)
>  	chip->ecc.mode		=3D NAND_ECC_HW;
>  	chip->ecc.size		=3D 1;
>  	chip->ecc.layout	=3D &gpmi_hw_ecclayout;
> +	if (pdata->enable_bbt)
> +		chip->bbt_options =3D NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
> =20
>  	/* Allocate a temporary DMA buffer for reading ID in the nand_scan() */
>  	this->bch_geometry.payload_size =3D 1024;
> diff --git a/include/linux/mtd/gpmi-nand.h b/include/linux/mtd/gpmi-nand.h
> index 69b6dbf..04ab366 100644
> --- a/include/linux/mtd/gpmi-nand.h
> +++ b/include/linux/mtd/gpmi-nand.h
> @@ -51,6 +51,7 @@
>   * @partitions:              An optional pointer to an array of partition
>   *                           descriptions.
>   * @partition_count:         The number of elements in the partitions ar=
ray.
> + * @enable_bbt:              Enable the BBT or not.
>   */
>  struct gpmi_nand_platform_data {
>  	/* SoC hardware information. */
> @@ -64,5 +65,6 @@ struct gpmi_nand_platform_data {
>  	/* Medium information. */
>  	struct		mtd_partition *partitions;
>  	unsigned	partition_count;
> +	unsigned int	enable_bbt:1;
>  };
>  #endif
> --=20
> 1.7.0.4
>=20
>=20

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--ABYnUdqoGSokwVM+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8n2h8ACgkQD27XaX1/VRt63wCgiAt6iSRaMYGhnQB0jpjfo1oo
XYQAoLmgZ73Op8wdOLo48mzEBzKw4xeb
=lhji
-----END PGP SIGNATURE-----

--ABYnUdqoGSokwVM+--

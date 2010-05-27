Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OHb04-0001Wc-Ij
	for linux-mtd@lists.infradead.org; Thu, 27 May 2010 11:11:45 +0000
Message-ID: <4BFE5366.3000705@pengutronix.de>
Date: Thu, 27 May 2010 13:11:34 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] mxc_nand: add support for platform defined partitions
References: <7d46e3bafd160eaa9c5d9a09b88ea1cb4a2d5b89.1274950000.git.baruch@tkos.co.il>
In-Reply-To: <7d46e3bafd160eaa9c5d9a09b88ea1cb4a2d5b89.1274950000.git.baruch@tkos.co.il>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigF4D813438CE327EBBE304A8B"
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigF4D813438CE327EBBE304A8B
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Baruch Siach wrote:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Just coding style comments from me, see inline

> ---
>  arch/arm/plat-mxc/include/mach/mxc_nand.h |    4 ++++
>  drivers/mtd/nand/mxc_nand.c               |    2 ++
>  2 files changed, 6 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/arm/plat-mxc/include/mach/mxc_nand.h b/arch/arm/plat-=
mxc/include/mach/mxc_nand.h
> index 5d2d21d..a07bae9 100644
> --- a/arch/arm/plat-mxc/include/mach/mxc_nand.h
> +++ b/arch/arm/plat-mxc/include/mach/mxc_nand.h
> @@ -20,9 +20,13 @@
>  #ifndef __ASM_ARCH_NAND_H
>  #define __ASM_ARCH_NAND_H
> =20
> +#include <linux/mtd/partitions.h>
> +
>  struct mxc_nand_platform_data {
>  	int width;	/* data bus width in bytes */
>  	int hw_ecc:1;	/* 0 if supress hardware ECC */
>  	int flash_bbt:1; /* set to 1 to use a flash based bbt */
> +	struct mtd_partition	*parts;	/* partition table */
> +	int			nr_parts; /* size of parts */

Please don't use tab(s) between type and variable name. Use tabs to
align the comment though. (Just like the other members of the struct do.)=


>  };
>  #endif /* __ASM_ARCH_NAND_H */
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index b2900d8..4f615d2 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -838,6 +838,8 @@ static int __init mxcnd_probe(struct platform_devic=
e *pdev)
>  	    parse_mtd_partitions(mtd, part_probes, &host->parts, 0);
>  	if (nr_parts > 0)
>  		add_mtd_partitions(mtd, host->parts, nr_parts);
> +	else if (pdata->parts)
> +		add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
>  	else
>  #endif
>  	{

Cheers, Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enigF4D813438CE327EBBE304A8B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkv+U2YACgkQjTAFq1RaXHNUJQCfbzPauuXUjnx3CmDalOpaoLEd
dGkAnjDsSL5Y7MuyNEboBNweFoFaPhqD
=2iDk
-----END PGP SIGNATURE-----

--------------enigF4D813438CE327EBBE304A8B--

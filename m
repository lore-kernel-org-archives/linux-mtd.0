Received: from mail-db5eur03on060b.outbound.protection.outlook.com
 ([2a01:111:f400:fe0a::60b]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMSDA-0001dL-0v
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2018 06:30:09 +0000
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "richard@nod.at" <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>
Subject: RE: [PATCH v2 1/5] mtd: spi-nor: don't drop sfdp data if optional
 parsers fail
Date: Tue, 13 Nov 2018 06:29:31 +0000
Message-ID: <VI1PR04MB5726CD772469F352B316CF6799C20@VI1PR04MB5726.eurprd04.prod.outlook.com>
References: <20181109165644.30534-1-tudor.ambarus@microchip.com>
 <20181109165644.30534-2-tudor.ambarus@microchip.com>
In-Reply-To: <20181109165644.30534-2-tudor.ambarus@microchip.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Tudor.Ambarus@microchip.com [mailto:Tudor.Ambarus@microchip.com]
> Sent: Friday, November 9, 2018 10:27 PM
> To: boris.brezillon@bootlin.com; marek.vasut@gmail.com;
> dwmw2@infradead.org; computersforpeace@gmail.com; richard@nod.at
> Cc: linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Yogesh
> Narayan Gaur <yogeshnarayan.gaur@nxp.com>; cyrille.pitchen@wedev4u.fr;
> Tudor.Ambarus@microchip.com
> Subject: [PATCH v2 1/5] mtd: spi-nor: don't drop sfdp data if optional pa=
rsers fail
>=20
> JESD216C states that just the Basic Flash Parameter Table is mandatory.
> Already defined (or future) additional parameter headers and tables are o=
ptional.
>=20
> Don't drop already collected sfdp data in case an optional table parser f=
ails. In
> case of failing, each optional parser is responsible to roll back to the =
previously
> known spi_nor data.
>=20
> Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table=
")
> Reported-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Tested-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>

> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> v2: update Fixes tag to point to correct commit
>=20
>  drivers/mtd/spi-nor/spi-nor.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c index
> 4a96ee719e5a..2cdf96013689 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -3130,7 +3130,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  	if (err)
>  		goto exit;
>=20
> -	/* Parse other parameter headers. */
> +	/* Parse optional parameter tables. */
>  	for (i =3D 0; i < header.nph; i++) {
>  		param_header =3D &param_headers[i];
>=20
> @@ -3143,8 +3143,17 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  			break;
>  		}
>=20
> -		if (err)
> -			goto exit;
> +		if (err) {
> +			dev_warn(dev, "Failed to parse optional parameter
> table: %04x\n",
> +				 SFDP_PARAM_HEADER_ID(param_header));
> +			/*
> +			 * Let's not drop all information we extracted so far
> +			 * if optional table parsers fail. In case of failing,
> +			 * each optional parser is responsible to roll back to
> +			 * the previously known spi_nor data.
> +			 */
> +			err =3D 0;
> +		}
>  	}
>=20
>  exit:
> --
> 2.9.4

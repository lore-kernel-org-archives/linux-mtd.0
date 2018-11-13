Received: from mail-ve1eur01on0622.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::622]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMSMJ-0004wj-OE
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2018 06:39:37 +0000
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: Huijin Park <huijin.park@samsung.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>
CC: Marek Vasut <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "bbanghj.park@gmail.com"
 <bbanghj.park@gmail.com>
Subject: RE: [PATCH] mtd: spi-nor: cast to u64 to avoid uint overflows
Date: Tue, 13 Nov 2018 06:39:07 +0000
Message-ID: <VI1PR04MB5726AC01619141A6135280A499C20@VI1PR04MB5726.eurprd04.prod.outlook.com>
References: <CGME20181113051847eucas1p1fb080ea1727b8be444bf3bf6aeb746f0@eucas1p1.samsung.com>
 <1542086318-18416-1-git-send-email-huijin.park@samsung.com>
In-Reply-To: <1542086318-18416-1-git-send-email-huijin.park@samsung.com>
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

Hi Huijin,

I guess this is the v2 of previously send patch [1], please follow version =
information in patch submission.

--
Regards
Yogesh Gaur
[1] https://patchwork.ozlabs.org/patch/961197/


> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf =
Of
> Huijin Park
> Sent: Tuesday, November 13, 2018 10:49 AM
> To: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>; linux-mtd@lists.infradead.org;
> linux-kernel@vger.kernel.org; bbanghj.park@gmail.com; Huijin Park
> <huijin.park@samsung.com>
> Subject: [PATCH] mtd: spi-nor: cast to u64 to avoid uint overflows
>=20
> From: "huijin.park" <huijin.park@samsung.com>
>=20
> The "params->size" is defined as "u64".
> And "info->sector_size" and "info->n_sectors" are defined as unsigned int=
 and
> u16.
> Thus, u64 data might have strange data(loss data) if the result overflows=
 an
> unsigned int.
> This patch casts "info->sector_size" and "info->n_sectors" to an u64.
>=20
> Signed-off-by: huijin.park <huijin.park@samsung.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c index
> d9c368c..527f281 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2459,7 +2459,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
>  	memset(params, 0, sizeof(*params));
>=20
>  	/* Set SPI NOR sizes. */
> -	params->size =3D info->sector_size * info->n_sectors;
> +	params->size =3D (u64)info->sector_size * (u64)info->n_sectors;
>  	params->page_size =3D info->page_size;
>=20
>  	/* (Fast) Read settings. */
> --
> 1.7.9.5
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists=
.infr
> adead.org%2Fmailman%2Flistinfo%2Flinux-
> mtd%2F&amp;data=3D02%7C01%7Cyogeshnarayan.gaur%40nxp.com%7C5efd964
> 86c7244f430b408d649278b65%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> 7C1%7C636776831529836639&amp;sdata=3DA7hiJMpfxXKTyT6yacIougPRGdHg2o
> pL492y3sVtQek%3D&amp;reserved=3D0

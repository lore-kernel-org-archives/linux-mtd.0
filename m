Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uk7jQ-0007ax-42
 for linux-mtd@lists.infradead.org; Wed, 05 Jun 2013 07:02:04 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Jingoo Han <jg1.han@samsung.com>, "'Artem Bityutskiy'"
 <artem.bityutskiy@linux.intel.com>
Subject: RE: [PATCH 20/26] mtd: nand: omap2: remove unnecessary
 platform_set_drvdata()
Date: Wed, 5 Jun 2013 07:01:32 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9D978A@DBDE04.ent.ti.com>
References: <005801ce4aed$ed90d6c0$c8b28440$@samsung.com>
In-Reply-To: <005801ce4aed$ed90d6c0$c8b28440$@samsung.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: 'David Woodhouse' <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Daniel Mack <zonque@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The driver core clears the driver data to NULL after device_release
> or on probe failure, since commit
> 0998d0631001288a5974afc0b2a5f568bcdecb4d
> (device-core: Ensure drvdata =3D NULL when no driver is bound).
> Thus, it is not needed to manually clear the device driver data to NULL.
>=20
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
Acked-by: Pekon Gupta <pekon@ti.com>

Thanks for this ..=20
With regards, pekon

> ---
>  drivers/mtd/nand/omap2.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 81b80af..daa3dfc 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -2087,7 +2087,6 @@ static int omap_nand_remove(struct
> platform_device *pdev)
>  							mtd);
>  	omap3_free_bch(&info->mtd);
>=20
> -	platform_set_drvdata(pdev, NULL);
>  	if (info->dma)
>  		dma_release_channel(info->dma);
>=20
> --
> 1.7.2.5
>=20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

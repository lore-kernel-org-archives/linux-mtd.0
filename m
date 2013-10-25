Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZeaB-0008SU-FQ
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 10:25:32 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH v2 4/5] mtd: nand: omap2: Use devm_kzalloc
Date: Fri, 25 Oct 2013 10:25:02 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA2AD60@DBDE04.ent.ti.com>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382696277-9063-5-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1382696277-9063-5-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>=20
> This simplifies the error path and makes the code less error-prone.
>=20
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/nand/omap2.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index e01a936..d3155b2 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1837,7 +1837,7 @@ static int omap_nand_probe(struct
> platform_device *pdev)
>  		return -ENODEV;
>  	}
>=20
> -	info =3D kzalloc(sizeof(struct omap_nand_info), GFP_KERNEL);
> +	info =3D devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;
>=20
> @@ -2067,8 +2067,6 @@ out_release_mem_region:
>  		free_irq(info->gpmc_irq_fifo, info);
>  	release_mem_region(info->phys_base, info->mem_size);
>  out_free_info:
> -	kfree(info);
> -
>  	return err;
>  }
>=20
> @@ -2091,7 +2089,6 @@ static int omap_nand_remove(struct
> platform_device *pdev)
>  	nand_release(&info->mtd);
>  	iounmap(info->nand.IO_ADDR_R);
>  	release_mem_region(info->phys_base, info->mem_size);
> -	kfree(info);
>  	return 0;
>  }
>=20
> --
> 1.8.1.5

I think these changes are already done as part of following patch..
http://lists.infradead.org/pipermail/linux-mtd/2013-October/049418.html

Did your rebase on my patch-set ?


with regards, pekon

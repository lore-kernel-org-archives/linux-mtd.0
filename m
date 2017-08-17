Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1diKrc-0007RA-4T
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 13:29:39 +0000
Date: Thu, 17 Aug 2017 15:29:10 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Anton Vasilyev <vasilyev@ispras.ru>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ldv-project@linuxtesting.org
Subject: Re: [PATCH v2] mtd: plat-ram: use release_mem_region instead of
 release_resource
Message-ID: <20170817152910.4f133e52@bbrezillon>
In-Reply-To: <1502900537-14402-1-git-send-email-vasilyev@ispras.ru>
References: <1502900537-14402-1-git-send-email-vasilyev@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

And now the commit title is no longer matching the patch content.

Le Wed, 16 Aug 2017 19:22:17 +0300,
Anton Vasilyev <vasilyev@ispras.ru> a =C3=A9crit :

> Replace ioremap() and request_mem_region() by devm_ioremap_resource().
>=20
> Found by Linux Driver Verification project (linuxtesting.org).

Maybe you should describe in more details what linuxtesting complained
about and why you decided to fix it using devm_ioremap_resource().

>=20
> Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> v1: Fix commit based on Boris Brezillon review
> ---
> v2: Change commit by Boris Brezillon solution
> ---
>  drivers/mtd/maps/plat-ram.c | 38 ++++----------------------------------
>  1 file changed, 4 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
> index 5157289..6d9a4d6 100644
> --- a/drivers/mtd/maps/plat-ram.c
> +++ b/drivers/mtd/maps/plat-ram.c
> @@ -43,7 +43,6 @@ struct platram_info {
>  	struct device		*dev;
>  	struct mtd_info		*mtd;
>  	struct map_info		 map;
> -	struct resource		*area;
>  	struct platdata_mtd_ram	*pdata;
>  };
> =20
> @@ -97,16 +96,6 @@ static int platram_remove(struct platform_device *pdev)
> =20
>  	platram_setrw(info, PLATRAM_RO);
> =20
> -	/* release resources */
> -
> -	if (info->area) {
> -		release_resource(info->area);
> -		kfree(info->area);
> -	}
> -
> -	if (info->map.virt !=3D NULL)
> -		iounmap(info->map.virt);
> -
>  	kfree(info);
> =20
>  	return 0;
> @@ -147,12 +136,11 @@ static int platram_probe(struct platform_device *pd=
ev)
>  	info->pdata =3D pdata;
> =20
>  	/* get the resource for the memory mapping */
> -
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	if (res =3D=3D NULL) {
> -		dev_err(&pdev->dev, "no memory resource specified\n");
> -		err =3D -ENOENT;
> +	info->map.virt =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(info->map.virt)) {
> +		err =3D PTR_ERR(info->map.virt);
> +		dev_err(&pdev->dev, "failed to ioremap() region\n");
>  		goto exit_free;
>  	}
> =20
> @@ -167,26 +155,8 @@ static int platram_probe(struct platform_device *pde=
v)
>  			(char *)pdata->mapname : (char *)pdev->name;
>  	info->map.bankwidth =3D pdata->bankwidth;
> =20
> -	/* register our usage of the memory area */
> -
> -	info->area =3D request_mem_region(res->start, info->map.size, pdev->nam=
e);
> -	if (info->area =3D=3D NULL) {
> -		dev_err(&pdev->dev, "failed to request memory region\n");
> -		err =3D -EIO;
> -		goto exit_free;
> -	}
> -
> -	/* remap the memory area */
> -
> -	info->map.virt =3D ioremap(res->start, info->map.size);
>  	dev_dbg(&pdev->dev, "virt %p, %lu bytes\n", info->map.virt, info->map.s=
ize);
> =20
> -	if (info->map.virt =3D=3D NULL) {
> -		dev_err(&pdev->dev, "failed to ioremap() region\n");
> -		err =3D -EIO;
> -		goto exit_free;
> -	}
> -
>  	simple_map_init(&info->map);
> =20
>  	dev_dbg(&pdev->dev, "initialised map, probing for mtd\n");

Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dhfPA-0001jF-Ox
 for linux-mtd@lists.infradead.org; Tue, 15 Aug 2017 17:13:26 +0000
Date: Tue, 15 Aug 2017 19:13:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Anton Vasilyev <vasilyev@ispras.ru>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ldv-project@linuxtesting.org
Subject: Re: [PATCH v1] mtd: plat-ram: use release_mem_region instead of
 release_resource
Message-ID: <20170815191301.56c3ab9d@bbrezillon>
In-Reply-To: <1502799694-669-1-git-send-email-vasilyev@ispras.ru>
References: <1502799694-669-1-git-send-email-vasilyev@ispras.ru>
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

Le Tue, 15 Aug 2017 15:21:34 +0300,
Anton Vasilyev <vasilyev@ispras.ru> a =C3=A9crit :

> Use api pair of request_mem_region and release_mem_region
> instead of release_resource.
>=20
> Found by Linux Driver Verification project (linuxtesting.

Missing ')'.

>=20
> Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
> ---
> v1: Fix commit based on Boris Brezillon review
> ---
>  drivers/mtd/maps/plat-ram.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
> index 5157289..90bc87f 100644
> --- a/drivers/mtd/maps/plat-ram.c
> +++ b/drivers/mtd/maps/plat-ram.c
> @@ -100,8 +100,8 @@ static int platram_remove(struct platform_device *pde=
v)
>  	/* release resources */
> =20
>  	if (info->area) {
> -		release_resource(info->area);
> -		kfree(info->area);
> +		release_mem_region(info->area->start,
> +				resource_size(info->area));
>  	}
> =20
>  	if (info->map.virt !=3D NULL)

Sorry to realize that only know but it seems a lot of boilerplate code
can be removed if we use devm_ioremap_resource(). I'd prefer the
following solution to the change you're proposing here.

--->8---
diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 51572895c02c..6d9a4d6f9839 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -43,7 +43,6 @@ struct platram_info {
 	struct device		*dev;
 	struct mtd_info		*mtd;
 	struct map_info		 map;
-	struct resource		*area;
 	struct platdata_mtd_ram	*pdata;
 };
=20
@@ -97,16 +96,6 @@ static int platram_remove(struct platform_device *pdev)
=20
 	platram_setrw(info, PLATRAM_RO);
=20
-	/* release resources */
-
-	if (info->area) {
-		release_resource(info->area);
-		kfree(info->area);
-	}
-
-	if (info->map.virt !=3D NULL)
-		iounmap(info->map.virt);
-
 	kfree(info);
=20
 	return 0;
@@ -147,12 +136,11 @@ static int platram_probe(struct platform_device *pdev)
 	info->pdata =3D pdata;
=20
 	/* get the resource for the memory mapping */
-
 	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	if (res =3D=3D NULL) {
-		dev_err(&pdev->dev, "no memory resource specified\n");
-		err =3D -ENOENT;
+	info->map.virt =3D devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(info->map.virt)) {
+		err =3D PTR_ERR(info->map.virt);
+		dev_err(&pdev->dev, "failed to ioremap() region\n");
 		goto exit_free;
 	}
=20
@@ -167,26 +155,8 @@ static int platram_probe(struct platform_device *pdev)
 			(char *)pdata->mapname : (char *)pdev->name;
 	info->map.bankwidth =3D pdata->bankwidth;
=20
-	/* register our usage of the memory area */
-
-	info->area =3D request_mem_region(res->start, info->map.size, pdev->name);
-	if (info->area =3D=3D NULL) {
-		dev_err(&pdev->dev, "failed to request memory region\n");
-		err =3D -EIO;
-		goto exit_free;
-	}
-
-	/* remap the memory area */
-
-	info->map.virt =3D ioremap(res->start, info->map.size);
 	dev_dbg(&pdev->dev, "virt %p, %lu bytes\n", info->map.virt, info->map.siz=
e);
=20
-	if (info->map.virt =3D=3D NULL) {
-		dev_err(&pdev->dev, "failed to ioremap() region\n");
-		err =3D -EIO;
-		goto exit_free;
-	}
-
 	simple_map_init(&info->map);
=20
 	dev_dbg(&pdev->dev, "initialised map, probing for mtd\n");

Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c029Z-0000Bk-Fx
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 08:04:42 +0000
Date: Fri, 28 Oct 2016 10:04:19 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Robert Jarzmik <robert.jarzmik@free.fr>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] mtd: nand: pxa3xx_nand: write exactly one message on
 probe failure
Message-ID: <20161028100419.1ba04968@bbrezillon>
In-Reply-To: <1474276878-1021-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1474276878-1021-1-git-send-email-u.kleine-koenig@pengutronix.de>
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

On Mon, 19 Sep 2016 11:21:18 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> For some error paths alloc_nand_resource() emitted an error message, for
> others it didn't. Make it consistently print a message including the
> error code where it's not constant and drop the hardly helpful
> additional message printed by the caller of alloc_nand_resource.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

It looks good to me. Ezequiel, Robert, any objection to this patch? If
not, can I have your Acked/Reviewed-by ?

> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 436dd6dc11f4..052e9725cf12 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1774,8 +1774,11 @@ static int alloc_nand_resource(struct platform_dev=
ice *pdev)
>  	int ret, irq, cs;
> =20
>  	pdata =3D dev_get_platdata(&pdev->dev);
> -	if (pdata->num_cs <=3D 0)
> +	if (pdata->num_cs <=3D 0) {
> +		dev_err(&pdev->dev, "broken number of chip selects\n");
>  		return -ENODEV;
> +	}
> +
>  	info =3D devm_kzalloc(&pdev->dev,
>  			    sizeof(*info) + sizeof(*host) * pdata->num_cs,
>  			    GFP_KERNEL);
> @@ -1814,8 +1817,9 @@ static int alloc_nand_resource(struct platform_devi=
ce *pdev)
>  	init_waitqueue_head(&chip->controller->wq);
>  	info->clk =3D devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(info->clk)) {
> -		dev_err(&pdev->dev, "failed to get nand clock\n");
> -		return PTR_ERR(info->clk);
> +		ret =3D PTR_ERR(info->clk);
> +		dev_err(&pdev->dev, "failed to get nand clock (%d)\n", ret);
> +		return ret;
>  	}
>  	ret =3D clk_prepare_enable(info->clk);
>  	if (ret < 0)
> @@ -1843,6 +1847,7 @@ static int alloc_nand_resource(struct platform_devi=
ce *pdev)
>  	info->mmio_base =3D devm_ioremap_resource(&pdev->dev, r);
>  	if (IS_ERR(info->mmio_base)) {
>  		ret =3D PTR_ERR(info->mmio_base);
> +		dev_err(&pdev->dev, "failed to map register space (%d)\n", ret);
>  		goto fail_disable_clk;
>  	}
>  	info->mmio_phys =3D r->start;
> @@ -1862,7 +1867,7 @@ static int alloc_nand_resource(struct platform_devi=
ce *pdev)
>  				   pxa3xx_nand_irq_thread, IRQF_ONESHOT,
>  				   pdev->name, info);
>  	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to request IRQ\n");
> +		dev_err(&pdev->dev, "failed to request IRQ (%d)\n", ret);
>  		goto fail_free_buf;
>  	}
> =20
> @@ -1961,10 +1966,8 @@ static int pxa3xx_nand_probe(struct platform_devic=
e *pdev)
>  	}
> =20
>  	ret =3D alloc_nand_resource(pdev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "alloc nand resource failed\n");
> +	if (ret)
>  		return ret;
> -	}
> =20
>  	info =3D platform_get_drvdata(pdev);
>  	probe_success =3D 0;

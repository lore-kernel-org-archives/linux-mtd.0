Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0Yyx-0004C3-Jv
 for linux-mtd@lists.infradead.org; Sat, 29 Oct 2016 19:07:57 +0000
Date: Sat, 29 Oct 2016 21:07:30 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, kernel@pengutronix.de, Robert Jarzmik
 <robert.jarzmik@free.fr>
Subject: Re: [PATCH] mtd: nand: pxa3xx_nand: write exactly one message on
 probe failure
Message-ID: <20161029210730.7bb0b4fb@bbrezillon>
In-Reply-To: <ac811aeb-1f9d-e985-134b-8faba0a1a4cf@gmail.com>
References: <1474276878-1021-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20161028100419.1ba04968@bbrezillon>
 <ac811aeb-1f9d-e985-134b-8faba0a1a4cf@gmail.com>
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

On Sat, 29 Oct 2016 19:56:39 +0200
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 10/28/2016 10:04 AM, Boris Brezillon wrote:
> > On Mon, 19 Sep 2016 11:21:18 +0200
> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:
> >  =20
> >> For some error paths alloc_nand_resource() emitted an error message, f=
or
> >> others it didn't. Make it consistently print a message including the
> >> error code where it's not constant and drop the hardly helpful
> >> additional message printed by the caller of alloc_nand_resource.
> >>
> >> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> =
=20
> >=20
> > It looks good to me. Ezequiel, Robert, any objection to this patch? If
> > not, can I have your Acked/Reviewed-by ?
> >  =20
> >> ---
> >>  drivers/mtd/nand/pxa3xx_nand.c | 17 ++++++++++-------
> >>  1 file changed, 10 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_=
nand.c
> >> index 436dd6dc11f4..052e9725cf12 100644
> >> --- a/drivers/mtd/nand/pxa3xx_nand.c
> >> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> >> @@ -1774,8 +1774,11 @@ static int alloc_nand_resource(struct platform_=
device *pdev)
> >>  	int ret, irq, cs;
> >> =20
> >>  	pdata =3D dev_get_platdata(&pdev->dev);
> >> -	if (pdata->num_cs <=3D 0)
> >> +	if (pdata->num_cs <=3D 0) {
> >> +		dev_err(&pdev->dev, "broken number of chip selects\n"); =20
>=20
> Not: Should be "invalid number of chip selects" .

Correct. I can fix that when applying.

> Also, if you turn the
> num_cs to unsigned type in the platdata, the test can be if (foo =3D=3D 0)
> instead.

If we really want to turn num_cs into an unsigned int, then it should
be done in different patch, but honestly, that's not the first thing I
would rework in this driver ;-).

>=20
> >>  		return -ENODEV;
> >> +	}
> >> +
> >>  	info =3D devm_kzalloc(&pdev->dev,
> >>  			    sizeof(*info) + sizeof(*host) * pdata->num_cs,
> >>  			    GFP_KERNEL);
> >> @@ -1814,8 +1817,9 @@ static int alloc_nand_resource(struct platform_d=
evice *pdev)
> >>  	init_waitqueue_head(&chip->controller->wq);
> >>  	info->clk =3D devm_clk_get(&pdev->dev, NULL);
> >>  	if (IS_ERR(info->clk)) {
> >> -		dev_err(&pdev->dev, "failed to get nand clock\n");
> >> -		return PTR_ERR(info->clk);
> >> +		ret =3D PTR_ERR(info->clk);
> >> +		dev_err(&pdev->dev, "failed to get nand clock (%d)\n", ret);
> >> +		return ret;
> >>  	}
> >>  	ret =3D clk_prepare_enable(info->clk);
> >>  	if (ret < 0)
> >> @@ -1843,6 +1847,7 @@ static int alloc_nand_resource(struct platform_d=
evice *pdev)
> >>  	info->mmio_base =3D devm_ioremap_resource(&pdev->dev, r);
> >>  	if (IS_ERR(info->mmio_base)) {
> >>  		ret =3D PTR_ERR(info->mmio_base);
> >> +		dev_err(&pdev->dev, "failed to map register space (%d)\n", ret);
> >>  		goto fail_disable_clk;
> >>  	}
> >>  	info->mmio_phys =3D r->start;
> >> @@ -1862,7 +1867,7 @@ static int alloc_nand_resource(struct platform_d=
evice *pdev)
> >>  				   pxa3xx_nand_irq_thread, IRQF_ONESHOT,
> >>  				   pdev->name, info);
> >>  	if (ret < 0) {
> >> -		dev_err(&pdev->dev, "failed to request IRQ\n");
> >> +		dev_err(&pdev->dev, "failed to request IRQ (%d)\n", ret);
> >>  		goto fail_free_buf;
> >>  	}
> >> =20
> >> @@ -1961,10 +1966,8 @@ static int pxa3xx_nand_probe(struct platform_de=
vice *pdev)
> >>  	}
> >> =20
> >>  	ret =3D alloc_nand_resource(pdev);
> >> -	if (ret) {
> >> -		dev_err(&pdev->dev, "alloc nand resource failed\n");
> >> +	if (ret)
> >>  		return ret;
> >> -	}
> >> =20
> >>  	info =3D platform_get_drvdata(pdev);
> >>  	probe_success =3D 0; =20
> >=20
> >=20
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >  =20
>=20
>=20

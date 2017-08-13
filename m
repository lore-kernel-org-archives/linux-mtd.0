Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dgnqR-0008EB-0t
 for linux-mtd@lists.infradead.org; Sun, 13 Aug 2017 08:02:00 +0000
Date: Sun, 13 Aug 2017 10:01:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: fix error return code in flctl_probe()
Message-ID: <20170813100135.4a5c9d23@bbrezillon>
In-Reply-To: <20170809162921.GA2006@embeddedgus>
References: <20170809162921.GA2006@embeddedgus>
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

Le Wed, 9 Aug 2017 11:29:21 -0500,
"Gustavo A. R. Silva" <gustavo@embeddedor.com> a =C3=A9crit :

> platform_get_irq() returns an error code, but the sh_flctl
> driver ignores it and always returns -ENXIO. This is not correct
> and, prevents -EPROBE_DEFER from being propagated properly.
>=20
> Print and propagate the return value of platform_get_irq on failure.
>=20
> This issue was detected with the help of Coccinelle.

Applied.

Thanks,

Boris

>=20
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/mtd/nand/sh_flctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index 891ac7b..7461b80 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -1141,8 +1141,8 @@ static int flctl_probe(struct platform_device *pdev)
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -		dev_err(&pdev->dev, "failed to get flste irq data\n");
> -		return -ENXIO;
> +		dev_err(&pdev->dev, "failed to get flste irq data: %d\n", irq);
> +		return irq;
>  	}
> =20
>  	ret =3D devm_request_irq(&pdev->dev, irq, flctl_handle_flste, IRQF_SHAR=
ED,

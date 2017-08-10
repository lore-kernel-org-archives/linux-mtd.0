Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dfkFs-0008RQ-AE
 for linux-mtd@lists.infradead.org; Thu, 10 Aug 2017 09:59:53 +0000
Date: Thu, 10 Aug 2017 11:59:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: atmel: fix of_irq_get() error check
Message-ID: <20170810115920.7cbb16f2@bbrezillon>
In-Reply-To: <20170805211436.181653483@cogentembedded.com>
References: <20170805211436.181653483@cogentembedded.com>
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

Le Sun, 06 Aug 2017 00:14:28 +0300,
Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> a =C3=A9crit :

> of_irq_get() may return 0 as well as negative error number on failure,
> while the driver only checks for the negative values.  The driver would
> then call devm_request_irq() for IRQ0  in its probe method and never get
> a valid interrupt.
>=20
> Check for 'nc->irq <=3D 0' instead and return -ENXIO from the driver's pr=
obe
> iff of_irq_get() returned 0.
>=20
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>=20
> ---
> The patch is against the 'master' branch of the 'linux-mtd.git' repo --
> the 'nand/fixes'  branch seems too old...
>=20
>  drivers/mtd/nand/atmel/nand-controller.c |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> Index: linux-mtd/drivers/mtd/nand/atmel/nand-controller.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-mtd.orig/drivers/mtd/nand/atmel/nand-controller.c
> +++ linux-mtd/drivers/mtd/nand/atmel/nand-controller.c
> @@ -2078,11 +2078,11 @@ atmel_hsmc_nand_controller_legacy_init(s
>  	}
> =20
>  	nc->irq =3D of_irq_get(nand_np, 0);
> -	if (nc->irq < 0) {
> -		ret =3D nc->irq;
> -		if (ret !=3D -EPROBE_DEFER)
> +	if (nc->irq <=3D 0) {
> +		if (nc->irq !=3D -EPROBE_DEFER)
>  			dev_err(dev, "Failed to get IRQ number (err =3D %d)\n",
> -				ret);
> +				nc->irq);

nc->irq can be 0 here which doesn't make any sense for an error return
code, so I'd suggest to still use ret and move the 'ret =3D nc->irq ?:
-ENXIO' line before doing the !=3D -EPROBE_DEFER test.

> +		ret =3D nc->irq ?: -ENXIO;

Why ENXIO and not EINVAL?

>  		goto out;
>  	}
> =20
> @@ -2168,11 +2168,11 @@ atmel_hsmc_nand_controller_init(struct a
> =20
>  	nc->irq =3D of_irq_get(np, 0);
>  	of_node_put(np);
> -	if (nc->irq < 0) {
> +	if (nc->irq <=3D 0) {
>  		if (nc->irq !=3D -EPROBE_DEFER)
>  			dev_err(dev, "Failed to get IRQ number (err =3D %d)\n",
>  				nc->irq);
> -		return nc->irq;
> +		return nc->irq ?: -ENXIO;
>  	}
> =20
>  	np =3D of_parse_phandle(dev->of_node, "atmel,nfc-io", 0);
>=20

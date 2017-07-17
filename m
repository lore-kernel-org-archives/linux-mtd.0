Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dXCxz-0007FU-Ac
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 20:50:12 +0000
Date: Mon, 17 Jul 2017 22:49:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spear_smi: add NULL check on devm_kzalloc() return
 value
Message-ID: <20170717224935.4dd40ba0@bbrezillon>
In-Reply-To: <20170706222550.GA30998@embeddedgus>
References: <20170706222550.GA30998@embeddedgus>
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

Le Thu, 6 Jul 2017 17:25:50 -0500,
"Gustavo A. R. Silva" <garsilva@embeddedor.com> a =C3=A9crit :

> Check return value from call to devm_kzalloc()
> in order to prevent a NULL pointer dereference.
>=20
> This issue was detected using Coccinelle and the following semantic patch:
>=20
> @@
> expression x;
> identifier fld;
> @@
>=20
> * x =3D devm_kzalloc(...);
>   ... when !=3D x =3D=3D NULL
>   x->fld
>=20
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/devices/spear_smi.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_=
smi.c
> index dd50698..ddf4789 100644
> --- a/drivers/mtd/devices/spear_smi.c
> +++ b/drivers/mtd/devices/spear_smi.c
> @@ -775,6 +775,8 @@ static int spear_smi_probe_config_dt(struct platform_=
device *pdev,
>  	pdata->board_flash_info =3D devm_kzalloc(&pdev->dev,
>  					       sizeof(*pdata->board_flash_info),
>  					       GFP_KERNEL);
> +	if (!pdata->board_flash_info)
> +		return -ENOMEM;
> =20
>  	/* Fill structs for each subnode (flash device) */
>  	while ((pp =3D of_get_next_child(np, pp))) {

Received: from mail.free-electrons.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1diKTg-0006Yl-Vn
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 13:04:51 +0000
Date: Thu, 17 Aug 2017 15:03:54 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: physmap_of: Fix resources leak in 'of_flash_probe()'
Message-ID: <20170817150354.56cdd114@bbrezillon>
In-Reply-To: <20170806125501.10368-1-christophe.jaillet@wanadoo.fr>
References: <20170806125501.10368-1-christophe.jaillet@wanadoo.fr>
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

Le Sun,  6 Aug 2017 14:55:01 +0200,
Christophe JAILLET <christophe.jaillet@wanadoo.fr> a =C3=A9crit :

> If 'of_flash_probe_gemini()' or 'of_flash_probe_versatile()' fail, we must
> reslease some resources, as already done in all error handling paths in
> this function.

Applied to l2-mtd/master.

Thanks,

Boris

>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mtd/maps/physmap_of_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/physmap_of_core.c b/drivers/mtd/maps/physma=
p_of_core.c
> index 62fa6836f218..2c8cc97ce019 100644
> --- a/drivers/mtd/maps/physmap_of_core.c
> +++ b/drivers/mtd/maps/physmap_of_core.c
> @@ -235,10 +235,10 @@ static int of_flash_probe(struct platform_device *d=
ev)
> =20
>  		err =3D of_flash_probe_gemini(dev, dp, &info->list[i].map);
>  		if (err)
> -			return err;
> +			goto err_out;
>  		err =3D of_flash_probe_versatile(dev, dp, &info->list[i].map);
>  		if (err)
> -			return err;
> +			goto err_out;
> =20
>  		err =3D -ENOMEM;
>  		info->list[i].map.virt =3D ioremap(info->list[i].map.phys,

Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dXCAL-00013l-CR
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 19:58:51 +0000
Date: Mon, 17 Jul 2017 21:58:22 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, keescook@chromium.org,
 kernel-janitors@vger.kernel.org, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] mtd: physmap_of: Drop unnecessary static
Message-ID: <20170717215822.3c7a0d86@bbrezillon>
In-Reply-To: <1500149266-32357-4-git-send-email-Julia.Lawall@lip6.fr>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
 <1500149266-32357-4-git-send-email-Julia.Lawall@lip6.fr>
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

Le Sat, 15 Jul 2017 22:07:38 +0200,
Julia Lawall <Julia.Lawall@lip6.fr> a =C3=A9crit :

> Drop static on a local variable, when the variable is initialized before
> any possible use.  Thus, the static has no benefit.
>=20
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @bad exists@
> position p;
> identifier x;
> type T;
> @@
> static T x@p;
> ...
> x =3D <+...x...+>
>=20
> @@
> identifier x;
> expression e;
> type T;
> position p !=3D bad.p;
> @@
> -static
>  T x@p;
>  ... when !=3D x
>      when strict
> ?x =3D e;
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

>=20
> ---
> These patches are all independent of each other.
>=20
>  drivers/mtd/maps/physmap_of_versatile.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff -u -p a/drivers/mtd/maps/physmap_of_versatile.c b/drivers/mtd/maps/p=
hysmap_of_versatile.c
> --- a/drivers/mtd/maps/physmap_of_versatile.c
> +++ b/drivers/mtd/maps/physmap_of_versatile.c
> @@ -97,7 +97,7 @@ static const struct of_device_id ebi_mat
>  static int ap_flash_init(struct platform_device *pdev)
>  {
>  	struct device_node *ebi;
> -	static void __iomem *ebi_base;
> +	void __iomem *ebi_base;
>  	u32 val;
>  	int ret;
> =20
>=20

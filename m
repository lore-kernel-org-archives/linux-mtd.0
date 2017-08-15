Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dhXjy-0001ja-UF
 for linux-mtd@lists.infradead.org; Tue, 15 Aug 2017 09:02:26 +0000
Date: Tue, 15 Aug 2017 11:01:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Anton Vasilyev <vasilyev@ispras.ru>
Cc: David Woodhouse <dwmw2@infradead.org>, ldv-project@linuxtesting.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: plat-ram: use release_mem_region instead of
 release_resource
Message-ID: <20170815110159.39ebdeb6@bbrezillon>
In-Reply-To: <1502456103-1576-1-git-send-email-vasilyev@ispras.ru>
References: <1502456103-1576-1-git-send-email-vasilyev@ispras.ru>
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

Le Fri, 11 Aug 2017 15:55:03 +0300,
Anton Vasilyev <vasilyev@ispras.ru> a =C3=A9crit :

> Use api pair of request_mem_region and release_mem_region
> instead of release_resource.
>=20
> Found by Linux Driver Verification project (linuxtesting.
>=20
> Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
> ---
>  drivers/mtd/maps/plat-ram.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
> index 5157289..baaf146 100644
> --- a/drivers/mtd/maps/plat-ram.c
> +++ b/drivers/mtd/maps/plat-ram.c
> @@ -82,6 +82,7 @@ static inline void platram_setrw(struct platram_info *i=
nfo, int to)
>  static int platram_remove(struct platform_device *pdev)
>  {
>  	struct platram_info *info =3D to_platram_info(pdev);
> +	resource_size_t res_size;
> =20
>  	dev_dbg(&pdev->dev, "removing device\n");
> =20
> @@ -100,8 +101,8 @@ static int platram_remove(struct platform_device *pde=
v)
>  	/* release resources */
> =20
>  	if (info->area) {
> -		release_resource(info->area);
> -		kfree(info->area);
> +		res_size =3D resource_size(info->area)

Missing semi-colon here, which means you did not even compile-test your
changes :P.

> +		release_mem_region(info->area->start, res_size);

Why adding a res_size variable instead of doing

		release_mem_region(info->area->start,
				   resource_size(info->area);

?

>  	}
> =20
>  	if (info->map.virt !=3D NULL)

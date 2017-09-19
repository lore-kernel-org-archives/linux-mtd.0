Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1duOtT-0008IE-Dv
 for linux-mtd@lists.infradead.org; Tue, 19 Sep 2017 20:13:38 +0000
Date: Tue, 19 Sep 2017 22:12:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: remove unused blockmask variable
Message-ID: <20170919221246.4e46cb9e@bbrezillon>
In-Reply-To: <20170902084938.15942-1-clabbe.montjoie@gmail.com>
References: <20170902084938.15942-1-clabbe.montjoie@gmail.com>
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

On Sat,  2 Sep 2017 10:49:38 +0200
Corentin Labbe <clabbe.montjoie@gmail.com> wrote:

> This patch fix the following build warning:
> drivers/mtd/nand/nand_base.c:2671:30: attention : variable =E2=80=98block=
mask=E2=80=99 set but not used [-Wunused-but-set-variable]

Applied.

Thanks,

Boris

>=20
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 9900476a0afe..b875fd365084 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2668,7 +2668,7 @@ static uint8_t *nand_fill_oob(struct mtd_info *mtd,=
 uint8_t *oob, size_t len,
>  static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
>  			     struct mtd_oob_ops *ops)
>  {
> -	int chipnr, realpage, page, blockmask, column;
> +	int chipnr, realpage, page, column;
>  	struct nand_chip *chip =3D mtd_to_nand(mtd);
>  	uint32_t writelen =3D ops->len;
> =20
> @@ -2704,7 +2704,6 @@ static int nand_do_write_ops(struct mtd_info *mtd, =
loff_t to,
> =20
>  	realpage =3D (int)(to >> chip->page_shift);
>  	page =3D realpage & chip->pagemask;
> -	blockmask =3D (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
> =20
>  	/* Invalidate the page cache, when we write to the cached page */
>  	if (to <=3D ((loff_t)chip->pagebuf << chip->page_shift) &&

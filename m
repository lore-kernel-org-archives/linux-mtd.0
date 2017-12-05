Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMFBB-0000RM-Ev
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 15:30:43 +0000
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
 [209.85.217.170]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id vB5FTmXN003846
 for <linux-mtd@lists.infradead.org>; Wed, 6 Dec 2017 00:29:48 +0900
Received: by mail-ua0-f170.google.com with SMTP id h2so462921uae.12
 for <linux-mtd@lists.infradead.org>; Tue, 05 Dec 2017 07:29:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171205110929.6820-2-boris.brezillon@free-electrons.com>
References: <20171205110929.6820-1-boris.brezillon@free-electrons.com>
 <20171205110929.6820-2-boris.brezillon@free-electrons.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 6 Dec 2017 00:29:07 +0900
Message-ID: <CAK7LNARs1wGzE9zHHsxH81uwZREqVj-csfdt=tb8VT3ZSu5jAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: Only allocate ecc->{calc, code}_buf when
 actually needed
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-12-05 20:09 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> The only users of the ecc->{calc,code}_buf buffers are NAND controller
> drivers implementing ecc->calculate() and/or ecc->correct(). Since the
> ->oobsize can be non-negligle, especially on modern NAND devices, we'd
> better allocate it only when it is actually required.
>
> Make ecc->{calc,code}_buf allocation dependent on the presence of
> ecc->calculate() or ecc->correct().
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 71e70c4964f3..e6873d10c574 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -5318,21 +5318,9 @@ int nand_scan_tail(struct mtd_info *mtd)
>                 return -EINVAL;
>         }
>
> -       ecc->calc_buf = kmalloc(mtd->oobsize, GFP_KERNEL);
> -       if (!ecc->calc_buf)
> -               return -ENOMEM;
> -
> -       ecc->code_buf = kmalloc(mtd->oobsize, GFP_KERNEL);
> -       if (!ecc->code_buf) {
> -               ret = -ENOMEM;
> -               goto err_free_buf;
> -       }
> -
>         chip->data_buf = kmalloc(mtd->writesize + mtd->oobsize, GFP_KERNEL);
> -       if (!chip->data_buf) {
> -               ret = -ENOMEM;
> -               goto err_free_buf;
> -       }
> +       if (!chip->data_buf)
> +               return -ENOMEM;
>
>         /*
>          * FIXME: some NAND manufacturer drivers expect the first die to be
> @@ -5495,6 +5483,15 @@ int nand_scan_tail(struct mtd_info *mtd)
>                 goto err_nand_manuf_cleanup;
>         }
>
> +       if (ecc->correct || ecc->calculate) {
> +               ecc->calc_buf = kmalloc(mtd->oobsize, GFP_KERNEL);
> +               ecc->code_buf = kmalloc(mtd->oobsize, GFP_KERNEL);
> +               if (!ecc->calc_buf || !ecc->code_buf) {
> +                       ret = -ENOMEM;
> +                       goto err_nand_manuf_cleanup;
> +               }
> +       }
> +
>         /* For many systems, the standard OOB write also works for raw */
>         if (!ecc->read_oob_raw)
>                 ecc->read_oob_raw = ecc->read_oob;
> --
> 2.11.0


I wondered if chip->data_buf allocation could be moved as well,
but otherwise, looks good to me.


Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>


-- 
Best Regards
Masahiro Yamada

Received: from mail-qt0-x233.google.com ([2607:f8b0:400d:c0d::233])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2COQ-0005lK-9I
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 08:29:31 +0000
Received: by mail-qt0-x233.google.com with SMTP id 8so2945330qtv.1
 for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2017 01:29:04 -0700 (PDT)
MIME-Version: 1.0
Sender: romain.izard@mobile-devices.fr
In-Reply-To: <20171005165724.30516-1-boris.brezillon@free-electrons.com>
References: <20171005165724.30516-1-boris.brezillon@free-electrons.com>
From: Romain Izard <romain.izard.pro@gmail.com>
Date: Wed, 11 Oct 2017 10:28:42 +0200
Message-ID: <CAGkQfmPZ369d7=VL+a1+=_Woe2bTn21P-4PrabbyWu=ANq56OA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: atmel: Actually use the PM ops
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "# 4 . 9+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-10-05 18:57 GMT+02:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> commit 6e532afaca8e ("mtd: nand: atmel: Add PM ops") was defining PM
> ops but nothing was using/referencing those PM ops.
>
> Fixes: 6e532afaca8e ("mtd: nand: atmel: Add PM ops")
> Cc: <stable@vger.kernel.org>
> Cc: Romain Izard <romain.izard.pro@gmail.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Tested-by: Romain Izard <romain.izard.pro@gmail.com>

> ---
>  drivers/mtd/nand/atmel/nand-controller.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
> index 29182160bb5f..90a71a56bc23 100644
> --- a/drivers/mtd/nand/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/atmel/nand-controller.c
> @@ -2549,6 +2549,7 @@ static struct platform_driver atmel_nand_controller_driver = {
>         .driver = {
>                 .name = "atmel-nand-controller",
>                 .of_match_table = of_match_ptr(atmel_nand_controller_of_ids),
> +               .pm = &atmel_nand_controller_pm_ops,
>         },
>         .probe = atmel_nand_controller_probe,
>         .remove = atmel_nand_controller_remove,
> --
> 2.11.0
>

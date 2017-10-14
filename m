Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e3O7M-0002Bw-2Q
 for linux-mtd@lists.infradead.org; Sat, 14 Oct 2017 15:13:08 +0000
Date: Sat, 14 Oct 2017 17:12:26 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, stable@vger.kernel.org, Marek
 Vasut <marek.vasut@gmail.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Romain Izard <romain.izard.pro@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: atmel: Actually use the PM ops
Message-ID: <20171014171226.384ae6a5@bbrezillon>
In-Reply-To: <20171005165724.30516-1-boris.brezillon@free-electrons.com>
References: <20171005165724.30516-1-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu,  5 Oct 2017 18:57:24 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> commit 6e532afaca8e ("mtd: nand: atmel: Add PM ops") was defining PM
> ops but nothing was using/referencing those PM ops.
> 

Applied.

> Fixes: 6e532afaca8e ("mtd: nand: atmel: Add PM ops")
> Cc: <stable@vger.kernel.org>
> Cc: Romain Izard <romain.izard.pro@gmail.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/atmel/nand-controller.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
> index 29182160bb5f..90a71a56bc23 100644
> --- a/drivers/mtd/nand/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/atmel/nand-controller.c
> @@ -2549,6 +2549,7 @@ static struct platform_driver atmel_nand_controller_driver = {
>  	.driver = {
>  		.name = "atmel-nand-controller",
>  		.of_match_table = of_match_ptr(atmel_nand_controller_of_ids),
> +		.pm = &atmel_nand_controller_pm_ops,
>  	},
>  	.probe = atmel_nand_controller_probe,
>  	.remove = atmel_nand_controller_remove,

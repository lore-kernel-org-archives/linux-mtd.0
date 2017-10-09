Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1OS0-0006IB-S6
 for linux-mtd@lists.infradead.org; Mon, 09 Oct 2017 03:09:55 +0000
Subject: Re: [PATCH] mtd: nand: atmel: Actually use the PM ops
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: Nicolas Ferre <nicolas.ferre@atmel.com>, <stable@vger.kernel.org>, Marek
 Vasut <marek.vasut@gmail.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Romain Izard <romain.izard.pro@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
References: <20171005165724.30516-1-boris.brezillon@free-electrons.com>
From: "Yang, Wenyou" <Wenyou.Yang@Microchip.com>
Message-ID: <7f1dc747-b32f-9bd5-c01a-e3d5bb29b11b@Microchip.com>
Date: Mon, 9 Oct 2017 11:09:23 +0800
MIME-Version: 1.0
In-Reply-To: <20171005165724.30516-1-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2017/10/6 0:57, Boris Brezillon wrote:
> commit 6e532afaca8e ("mtd: nand: atmel: Add PM ops") was defining PM
> ops but nothing was using/referencing those PM ops.
>
> Fixes: 6e532afaca8e ("mtd: nand: atmel: Add PM ops")
> Cc: <stable@vger.kernel.org>
> Cc: Romain Izard <romain.izard.pro@gmail.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>   drivers/mtd/nand/atmel/nand-controller.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
> index 29182160bb5f..90a71a56bc23 100644
> --- a/drivers/mtd/nand/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/atmel/nand-controller.c
> @@ -2549,6 +2549,7 @@ static struct platform_driver atmel_nand_controller_driver = {
>   	.driver = {
>   		.name = "atmel-nand-controller",
>   		.of_match_table = of_match_ptr(atmel_nand_controller_of_ids),
> +		.pm = &atmel_nand_controller_pm_ops,
>   	},
>   	.probe = atmel_nand_controller_probe,
>   	.remove = atmel_nand_controller_remove,

Acked-by: Wenyou Yang <wenyou.yang@microchip.com>

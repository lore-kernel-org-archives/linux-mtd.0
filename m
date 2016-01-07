Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHGJ6-0002rF-86
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 19:33:13 +0000
Date: Thu, 7 Jan 2016 20:32:47 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Harvey Hunt <harvey.hunt@imgtec.com>,
 Alex Smith <alex@alex-smith.me.uk>
Subject: Re: [PATCH] mtd: jz4780_nand: remove useless mtd->priv = chip
 assignment
Message-ID: <20160107203247.0a6fb5ed@bbrezillon>
In-Reply-To: <1452189779-20001-1-git-send-email-computersforpeace@gmail.com>
References: <1452189779-20001-1-git-send-email-computersforpeace@gmail.com>
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

On Thu,  7 Jan 2016 10:02:59 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> As of commit 2d3b77bac34b ("mtd: nand: update mtd_to_nand()"), this
> assignment isn't necessary, since struct mtd_info is embedded in struct
> nand_chip.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Harvey Hunt <harvey.hunt@imgtec.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Alex Smith <alex@alex-smith.me.uk>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/nand/jz4780_nand.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
> index 17eb9f264187..6156c554e1c2 100644
> --- a/drivers/mtd/nand/jz4780_nand.c
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -270,7 +270,6 @@ static int jz4780_nand_init_chip(struct platform_device *pdev,
>  
>  	chip = &nand->chip;
>  	mtd = nand_to_mtd(chip);
> -	mtd->priv = chip;
>  	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
>  				   cs->bank);
>  	if (!mtd->name)



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

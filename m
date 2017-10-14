Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e3O6L-0001wI-EL
 for linux-mtd@lists.infradead.org; Sat, 14 Oct 2017 15:11:47 +0000
Date: Sat, 14 Oct 2017 17:11:23 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: nand: omap2: Do not assign omap_nand_info to
 platform drvdata
Message-ID: <20171014171123.4095025b@bbrezillon>
In-Reply-To: <20171010133245.jlwto3gpmin5bmtw@lenoch>
References: <20171010133245.jlwto3gpmin5bmtw@lenoch>
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

On Tue, 10 Oct 2017 15:32:45 +0200
Ladislav Michl <ladis@linux-mips.org> wrote:

> commit 67ce04bf2746 ("mtd: nand: add OMAP2/OMAP3 NAND driver") assigned
> pointer to omap_nand_info to the platform drvdata in probe function
> just to be reasigned later to the pointer to mtd_info, which is
> what remove function expects it to be. Remove useless assignment.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>  drivers/mtd/nand/omap2.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 01368a8f9e3f..a97c1aeed55e 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1823,7 +1823,6 @@ static int omap_nand_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> -	platform_set_drvdata(pdev, info);
>  	info->ops = gpmc_omap_get_nand_ops(&info->reg, info->gpmc_cs);
>  	if (!info->ops) {
>  		dev_err(&pdev->dev, "Failed to get GPMC->NAND interface\n");

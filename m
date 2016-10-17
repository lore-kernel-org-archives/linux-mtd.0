Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwEOZ-0005Dh-6z
 for linux-mtd@lists.infradead.org; Mon, 17 Oct 2016 20:20:29 +0000
Date: Mon, 17 Oct 2016 22:20:00 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: omap2: Fix module autoload
Message-ID: <20161017222000.79b8fe04@bbrezillon>
In-Reply-To: <1476721177-3425-1-git-send-email-javier@osg.samsung.com>
References: <1476721177-3425-1-git-send-email-javier@osg.samsung.com>
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

On Mon, 17 Oct 2016 13:19:37 -0300
Javier Martinez Canillas <javier@osg.samsung.com> wrote:

> If the driver is built as a module, autoload won't work because the module
> alias information is not filled. So user-space can't match the registered
> device with the corresponding module.
> 
> Export the module alias information using the MODULE_DEVICE_TABLE() macro.
> 
> Before this patch:
> 
> $ modinfo drivers/mtd/nand/omap2_nand.ko | grep alias
> alias:          platform:omap2-nand
> 
> After this patch:
> 
> $ modinfo drivers/mtd/nand/omap2_nand.ko | grep alias
> alias:          platform:omap2-nand
> alias:          of:N*T*Cti,omap2-nandC*
> alias:          of:N*T*Cti,omap2-nand
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Applied.

Thanks,

Boris

> 
> ---
> 
>  drivers/mtd/nand/omap2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 5513bfd9cdc9..0934c3b3f70e 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -2197,6 +2197,7 @@ static const struct of_device_id omap_nand_ids[] = {
>  	{ .compatible = "ti,omap2-nand", },
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, omap_nand_ids);
>  
>  static struct platform_driver omap_nand_driver = {
>  	.probe		= omap_nand_probe,

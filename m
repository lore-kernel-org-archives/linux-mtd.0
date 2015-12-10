Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a78Pj-0007rj-EW
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 21:06:12 +0000
Subject: Re: [PATCH] mtd: brcmnand: defer to devm_ioremap_resource() for error
 checking
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <1449714797-27492-1-git-send-email-computersforpeace@gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, bcm-kernel-feedback-list@broadcom.com
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <5669E920.9010706@simon.arlott.org.uk>
Date: Thu, 10 Dec 2015 21:05:36 +0000
MIME-Version: 1.0
In-Reply-To: <1449714797-27492-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/12/15 02:33, Brian Norris wrote:
> devm_ioremap_resource() does error checking on the 'res' argument, so
> drop the error check in bcm6368_nand.c.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Simon Arlott <simon@fire.lp0.eu>

Tested-by: Simon Arlott <simon@fire.lp0.eu>

> ---
> Compile tested only
> 
>  drivers/mtd/nand/brcmnand/bcm6368_nand.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/bcm6368_nand.c b/drivers/mtd/nand/brcmnand/bcm6368_nand.c
> index 7f5359be24f2..34c91b0e1e69 100644
> --- a/drivers/mtd/nand/brcmnand/bcm6368_nand.c
> +++ b/drivers/mtd/nand/brcmnand/bcm6368_nand.c
> @@ -105,9 +105,6 @@ static int bcm6368_nand_probe(struct platform_device *pdev)
>  
>  	res = platform_get_resource_byname(pdev,
>  		IORESOURCE_MEM, "nand-int-base");
> -	if (!res)
> -		return -EINVAL;
> -
>  	priv->base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
> 


-- 
Simon Arlott

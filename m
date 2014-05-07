Received: from vps0.lunn.ch ([178.209.37.122])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wi29L-0005Ug-Q2
 for linux-mtd@lists.infradead.org; Wed, 07 May 2014 13:44:44 +0000
Date: Wed, 7 May 2014 15:41:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 3/3] mtd: orion_nand: Make of_device_id array const
Message-ID: <20140507134128.GA24565@lunn.ch>
References: <021e01cf69d0$e89e8290$b9db87b0$%han@samsung.com>
 <022001cf69d1$624bcd50$26e367f0$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <022001cf69d1$624bcd50$26e367f0$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'Brian Norris' <computersforpeace@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Andrew Lunn' <andrew@lunn.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 07, 2014 at 05:50:23PM +0900, Jingoo Han wrote:
> Make of_device_id array const, because all OF functions
> handle it as const.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/mtd/nand/orion_nand.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index dd7fe81..471b4df 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -214,7 +214,7 @@ static int orion_nand_remove(struct platform_device *pdev)
>  }
>  
>  #ifdef CONFIG_OF
> -static struct of_device_id orion_nand_of_match_table[] = {
> +static const struct of_device_id orion_nand_of_match_table[] = {
>  	{ .compatible = "marvell,orion-nand", },
>  	{},
>  };

Acked-by: Andrew Lunn <andrew@lunn.ch>

	  Andrew

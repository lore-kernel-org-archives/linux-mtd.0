Received: from perceval.ideasonboard.com ([95.142.166.194])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN2yk-0004wi-4T
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 14:13:59 +0000
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bastian Hecht <hechtb@googlemail.com>
Subject: Re: [PATCH v2 01/10] mtd: sh_flctl: Add missing iounmap()
Date: Wed, 25 Apr 2012 16:14:15 +0200
Message-ID: <7143447.AG1jzNJhqs@avalon>
In-Reply-To: <1335362618-4559-2-git-send-email-hechtb@gmail.com>
References: <1335362618-4559-1-git-send-email-hechtb@gmail.com>
 <1335362618-4559-2-git-send-email-hechtb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bastian,

Thanks for the patch.

On Wednesday 25 April 2012 16:03:29 Bastian Hecht wrote:
> Add the unmapping for the error case and for the driver removal.
> 
> Signed-off-by: Bastian Hecht <hechtb@gmail.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/mtd/nand/sh_flctl.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index 2ee9a1b..ed86a64 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -919,6 +919,7 @@ static int __devinit flctl_probe(struct platform_device
> *pdev)
> 
>  err_chip:
>  	pm_runtime_disable(&pdev->dev);
> +	iounmap(flctl->reg);
>  err_iomap:
>  	kfree(flctl);
>  	return ret;
> @@ -930,6 +931,7 @@ static int __devexit flctl_remove(struct platform_device
> *pdev)
> 
>  	nand_release(&flctl->mtd);
>  	pm_runtime_disable(&pdev->dev);
> +	iounmap(flctl->reg);
>  	kfree(flctl);
> 
>  	return 0;

-- 
Regards,

Laurent Pinchart

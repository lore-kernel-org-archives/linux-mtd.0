Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5Sfy-00062N-Ny
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 07:56:52 +0000
Date: Tue, 2 May 2017 09:56:18 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Simon Baatz <gmbnomis@gmail.com>
Subject: Re: [PATCH] mtd: nand: orion: don't complain for probe deferral
Message-ID: <20170502095618.2be1e0d8@bbrezillon>
In-Reply-To: <20170502000455.13240-5-computersforpeace@gmail.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
 <20170502000455.13240-5-computersforpeace@gmail.com>
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

On Mon,  1 May 2017 17:04:54 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Recent patches to this driver changed the error handling for missing
> clocks. Now we'll print an error if the clock causes us to defer
> probing. Let's not do that.
> 
> Cc: Simon Baatz <gmbnomis@gmail.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> Compile tested only
> 
>  drivers/mtd/nand/orion_nand.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index f8e463a97b9e..e2bfb37f11df 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -161,7 +161,8 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  		if (ret == -ENOENT) {
>  			info->clk = NULL;
>  		} else {
> -			dev_err(&pdev->dev, "failed to get clock!\n");
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(&pdev->dev, "failed to get clock!\n");
>  			return ret;
>  		}
>  	}

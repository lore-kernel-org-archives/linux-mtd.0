Received: from mgw2.diku.dk ([130.225.96.92])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qr1fz-0006Mg-H5
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2011 05:50:00 +0000
Date: Wed, 10 Aug 2011 07:49:52 +0200 (CEST)
From: Julia Lawall <julia@diku.dk>
To: Jiandong Zheng <jdzheng@broadcom.com>
Subject: Re: [PATCH] drivers/mtd/nand/bcm_umi_nand.c: add missing kfree/ioremap
In-Reply-To: <1312954935-14592-1-git-send-email-julia@diku.dk>
Message-ID: <Pine.LNX.4.64.1108100749250.22900@ask.diku.dk>
References: <1312954935-14592-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Scott Branden <sbranden@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Oops, please ignore this patch.  I missed another similar problem in the 
same function.

julia


On Wed, 10 Aug 2011, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> The error handling code under the #if should be the same as elsewhere in
> the function.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/mtd/nand/bcm_umi_nand.c |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
> index a8ae898..72e8ec2 100644
> --- a/drivers/mtd/nand/bcm_umi_nand.c
> +++ b/drivers/mtd/nand/bcm_umi_nand.c
> @@ -433,8 +433,11 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
>  
>  #if USE_DMA
>  	err = nand_dma_init();
> -	if (err != 0)
> +	if (err != 0) {
> +		iounmap(bcm_umi_io_base);
> +		kfree(board_mtd);
>  		return err;
> +	}
>  #endif
>  
>  	/* Figure out the size of the device that we have.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Received: from galahad.ideasonboard.com ([185.26.127.97])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoKEV-0006gG-08
 for linux-mtd@lists.infradead.org; Fri, 01 May 2015 23:20:36 +0000
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Subject: Re: [PATCH 1/3] mtd: sh_flctl: fixup wait_for_completion_timeout
 return handling
Date: Sat, 02 May 2015 02:20:36 +0300
Message-ID: <1840948.DRGdB3Gx66@avalon>
In-Reply-To: <1430489763-18417-1-git-send-email-hofrat@osadl.org>
References: <1430489763-18417-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Wolfram Sang <wsa@the-dreams.de>, Vinod Koul <vinod.koul@intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nicholas,

Thank you for the patch.

On Friday 01 May 2015 16:16:01 Nicholas Mc Guire wrote:
> wait_for_completion_timeout() returns unsigned long not int so the check
> for <= should be == and the type unsigned long. This fixes up the return
> value handling and returns -ETIMEDOUT on timeout rather than 0 and 1 on
> on success rather than a more or less random remaining number of jiffies.
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
> 
> call sites:
> read_fiforeg,write_ec_fiforeg assume > 0 == success
> and the comment in flctl_dma_fifo0_transfe states
>         /* ret > 0 is success */
>         return ret;
> since it is only checking for > 0 in the call-sites
> returning -ETIMEDOUT should be fine.
> 
> Patch was compile tested with ap325rxa_defconfig (implies
> CONFIG_MTD_NAND_SH_FLCTL=y)
> 
> Patch is against 4.1-rc1 (localversion-next is -next-20150501)
> 
>  drivers/mtd/nand/sh_flctl.c |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index c3ce81c..4450864 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -354,6 +354,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl
> *flctl, unsigned long *buf, dma_cookie_t cookie = -EINVAL;
>  	uint32_t reg;
>  	int ret;
> +	unsigned long time_left;
> 
>  	if (dir == DMA_FROM_DEVICE) {
>  		chan = flctl->chan_fifo0_rx;
> @@ -388,14 +389,16 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl
> *flctl, unsigned long *buf, goto out;
>  	}
> 
> -	ret =
> +	time_left =
>  	wait_for_completion_timeout(&flctl->dma_complete,
>  				msecs_to_jiffies(3000));
> 
> -	if (ret <= 0) {
> +	if (time_left == 0) {
>  		dmaengine_terminate_all(chan);
>  		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
> -	}
> +		ret = -ETIMEDOUT;
> +	} else
> +		ret = 1;	/* completion succeeded */

I'd go one step further and make this function return < 0 on error and 0 on 
success, like usually done through the kernel API. You could then simplify the 
code using something like

        if (!wait_for_completion_timeout(&flctl->dma_complete,
                                         msecs_to_jiffies(3000))) {
                dmaengine_terminate_all(chan);
                dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
                ret = -ETIMEDOUT;
        }

(pre-initializing ret to 0)

> 
>  out:
>  	reg = readl(FLINTDMACR(flctl));

-- 
Regards,

Laurent Pinchart

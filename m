Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bYxgY-0005tE-Vx
 for linux-mtd@lists.infradead.org; Sun, 14 Aug 2016 15:50:51 +0000
Date: Sun, 14 Aug 2016 17:50:29 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: nand: sh_flctl: handle dma_submit() errors
Message-ID: <20160814175029.29b03b4a@bbrezillon>
In-Reply-To: <1462477364-19529-1-git-send-email-computersforpeace@gmail.com>
References: <1462477364-19529-1-git-send-email-computersforpeace@gmail.com>
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

On Thu,  5 May 2016 12:42:44 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Some build tools noticed that 'cookie' is being set but not used. Might
> as well catch the errors here and handle them the same way we handle
> other DMA prep steps.
> 

Applied. I know it's only been compile tested, and even if nobody
acked/reviewed/tested it, it seems to be correct.
Let's see if someone complains about a regression (the commit will be in
-next for the whole 4.8-rc cycle).

Thanks,

Boris

> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Compile tested only
> 
>  drivers/mtd/nand/sh_flctl.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index 6fa3bcd59769..442ce619b3b6 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -397,7 +397,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
>  	struct dma_chan *chan;
>  	enum dma_transfer_direction tr_dir;
>  	dma_addr_t dma_addr;
> -	dma_cookie_t cookie = -EINVAL;
> +	dma_cookie_t cookie;
>  	uint32_t reg;
>  	int ret;
>  
> @@ -423,6 +423,12 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
>  		desc->callback = flctl_dma_complete;
>  		desc->callback_param = flctl;
>  		cookie = dmaengine_submit(desc);
> +		if (dma_submit_error(cookie)) {
> +			ret = dma_submit_error(cookie);
> +			dev_warn(&flctl->pdev->dev,
> +				 "DMA submit failed, falling back to PIO\n");
> +			goto out;
> +		}
>  
>  		dma_async_issue_pending(chan);
>  	} else {

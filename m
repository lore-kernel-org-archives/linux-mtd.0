Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlUbl-0006TT-1h
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 02:12:05 +0000
Received: by mail-ie0-f171.google.com with SMTP id ar20so11081434iec.30
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2013 18:11:44 -0800 (PST)
Date: Tue, 26 Nov 2013 18:11:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] mtd: sh_flctl: Fix warnings due to improper casts
Message-ID: <20131127021140.GV9468@ld-irv-0074.broadcom.com>
References: <1385512511-10477-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385512511-10477-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 27, 2013 at 01:35:11AM +0100, Laurent Pinchart wrote:
> Cast pointers to unsigned long instead of unsigned int. This fixes
> warnings on platforms where pointers have a different size than int.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/mtd/nand/sh_flctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index a3c84eb..b1e2b13 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -151,7 +151,7 @@ static void flctl_setup_dma(struct sh_flctl *flctl)
>  	dma_cap_set(DMA_SLAVE, mask);
>  
>  	flctl->chan_fifo0_tx = dma_request_channel(mask, shdma_chan_filter,
> -					    (void *)pdata->slave_id_fifo0_tx);
> +			(void *)(unsigned long)pdata->slave_id_fifo0_tx);

Perhaps the intermediate cast should be for uintptr_t instead of
unsigned long, just to be more exact? (I see that uintptr_t is just
typedef'd for unsigned long, but it still seems more precise.)

>  	dev_dbg(&pdev->dev, "%s: TX: got channel %p\n", __func__,
>  		flctl->chan_fifo0_tx);
>  
> @@ -168,7 +168,7 @@ static void flctl_setup_dma(struct sh_flctl *flctl)
>  		goto err;
>  
>  	flctl->chan_fifo0_rx = dma_request_channel(mask, shdma_chan_filter,
> -					    (void *)pdata->slave_id_fifo0_rx);
> +			(void *)(unsigned long)pdata->slave_id_fifo0_rx);

Ditto.

>  	dev_dbg(&pdev->dev, "%s: RX: got channel %p\n", __func__,
>  		flctl->chan_fifo0_rx);
>  

Brian

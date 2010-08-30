Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq3oK-00009I-ER
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 12:50:08 +0000
Received: by vws11 with SMTP id 11so5526076vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 05:50:03 -0700 (PDT)
Subject: Re: [PATCH 2/3] MTD: OneNAND: Fix loop hang when DMA error at
	Samsung	SoCs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20100827025537.GA10698@july>
References: <20100827025537.GA10698@july>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 15:49:57 +0300
Message-ID: <1283172597.12995.68.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-27 at 11:55 +0900, Kyungmin Park wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> When DMA error occurs. it's loop hang since it can't exit the loop.
> and it's the right DMA handling code as Spec.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/mtd/onenand/samsung.c |   11 +++++------
>  1 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
> index 05329ba..69e48d0 100644
> --- a/drivers/mtd/onenand/samsung.c
> +++ b/drivers/mtd/onenand/samsung.c
> @@ -554,14 +554,13 @@ static int s5pc110_dma_ops(void *dst, void *src, size_t count, int direction)
>  
>  	do {
>  		status = readl(base + S5PC110_DMA_TRANS_STATUS);
> +		if (status & S5PC110_DMA_TRANS_STATUS_TE) {
> +			writel(S5PC110_DMA_TRANS_CMD_TEC,
> +					base + S5PC110_DMA_TRANS_CMD);
> +			return -EIO;
> +		}
>  	} while (!(status & S5PC110_DMA_TRANS_STATUS_TD));
>  
> -	if (status & S5PC110_DMA_TRANS_STATUS_TE) {
> -		writel(S5PC110_DMA_TRANS_CMD_TEC, base + S5PC110_DMA_TRANS_CMD);
> -		writel(S5PC110_DMA_TRANS_CMD_TDC, base + S5PC110_DMA_TRANS_CMD);
> -		return -EIO;
> -	}
> -
>  	writel(S5PC110_DMA_TRANS_CMD_TDC, base + S5PC110_DMA_TRANS_CMD);

You shoule also add timeout to the loop. Forever loops are bad. Please,
while you are on it, fix the forever loop by doing something like this:
http://patchwork.ozlabs.org/patch/59180/
I mean, add timeout please.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)

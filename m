Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEbd9-0003oK-Ek
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 12:15:12 +0000
Date: Sun, 19 Jun 2016 14:14:49 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v2 4/8] MTD: xway: remove endless loop
Message-ID: <20160619141449.5fd34945@bbrezillon>
In-Reply-To: <1466277252-13867-5-git-send-email-hauke@hauke-m.de>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
 <1466277252-13867-5-git-send-email-hauke@hauke-m.de>
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

On Sat, 18 Jun 2016 21:14:08 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> From: John Crispin <john@phrozen.org>
> 
> The reset loop logic could run into a endless loop. Lets fix it as
> requested.
> http://lists.infradead.org/pipermail/linux-mtd/2012-September/044240.html
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 346781a..61176c4 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -73,16 +73,22 @@ struct xway_nand_data {
>  static void xway_reset_chip(struct nand_chip *chip)
>  {
>  	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
> +	unsigned long timeout;
>  	unsigned long flags;
>  
>  	nandaddr &= ~NAND_WRITE_ADDR;
>  	nandaddr |= NAND_WRITE_CMD;
>  
>  	/* finish with a reset */
> +	timeout = jiffies + msecs_to_jiffies(20);
> +
>  	spin_lock_irqsave(&ebu_lock, flags);
>  	writeb(NAND_WRITE_CMD_RESET, (void __iomem *) nandaddr);
> -	while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
> -		;
> +	do {
> +		if ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
> +			break;
> +		cond_resched();
> +	} while (!time_after_eq(jiffies, timeout));
>  	spin_unlock_irqrestore(&ebu_lock, flags);
>  }
>  

AFAICS, this function is doing exactly what
->cmdfunc(NAND_CMD_RESET, -1 , -1) does, except for the NAND_WAIT_WR_C
test? What is this bit representing?

I'd really prefer if you kill this function and just call ->cmdfunc()
instead.

Received: from mail-qk0-f178.google.com ([209.85.220.178])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZQzx8-00087p-Dv
 for linux-mtd@lists.infradead.org; Sun, 16 Aug 2015 15:34:31 +0000
Received: by qkbm65 with SMTP id m65so39683430qkb.2
 for <linux-mtd@lists.infradead.org>; Sun, 16 Aug 2015 08:33:08 -0700 (PDT)
Date: Sun, 16 Aug 2015 12:29:27 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: fix random command timeouts
Message-ID: <20150816152924.GA799@laptop.cereza>
References: <1439396538-13298-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439396538-13298-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 Aug 06:22 PM, Robert Jarzmik wrote:
> When 2 commands are submitted in a row, and the second is very quick,
> the completion of the second command might never come. This happens
> especially if the second command is quick, such as a status read after
> an erase.
> 
> The issue is that in the interrupt handler, the status bits are cleared
> after the new command is issued. There is a small temporal window where
> this happens :
>  - the previous command has set the command done bit
>  - the ready for a command bit is set
>  - the handler submits the next command
>    - just then, the command completes, and the command done bit is still
>      set
>  - the handler clears the "previous" command done bit
>  - the handler exits
> 
> In this flow, the "command done" of the next command will never trigger
> a new interrupt to finish the status command, as it was cleared for both
> commands.
> 
> Fix this by clearing the status bit before submitting a new command.
> 

This fix looks correct. Thanks!

Couple questions:

1. In which platform are you seeing this bug?
2. Is this a regression? (i.e. should we queue it for -stable?)

Also, one might question why we can't just write NDSR right after it's read,
before we wake the IRQ thread or start DMA. It appears this is
a requirement of BCH, as per the comment in drain_fifo.

It would be nice to put a comment explaining why we clear NDSR only
before the check to WRCMDREQ. Maybe even copy-pasting something
from the commit log?

I'd like to say "Yay, let's pick it" but I'd like to make sure this is
tested on all platforms first (unless you've tested it already).

> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index b0737aec7caf..718097414b9c 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -687,8 +687,10 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
>  		is_ready = 1;
>  	}
>  
> +	/* clear NDSR to let the controller exit the IRQ */
> +	nand_writel(info, NDSR, status);
> +
>  	if (status & NDSR_WRCMDREQ) {
> -		nand_writel(info, NDSR, NDSR_WRCMDREQ);
>  		status &= ~NDSR_WRCMDREQ;
>  		info->state = STATE_CMD_HANDLE;
>  
> @@ -709,8 +711,6 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
>  			nand_writel(info, NDCB0, info->ndcb3);
>  	}
>  
> -	/* clear NDSR to let the controller exit the IRQ */
> -	nand_writel(info, NDSR, status);
>  	if (is_completed)
>  		complete(&info->cmd_complete);
>  	if (is_ready)
> -- 
> 2.1.4
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar

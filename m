Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEfUt-0002II-A2
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 16:22:55 +0000
Date: Sun, 19 Jun 2016 18:22:32 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v3 3/8] MTD: xway: the latched command should be persistent
Message-ID: <20160619182232.500f75fc@bbrezillon>
In-Reply-To: <1466352497-6806-4-git-send-email-hauke@hauke-m.de>
References: <1466352497-6806-1-git-send-email-hauke@hauke-m.de>
 <1466352497-6806-4-git-send-email-hauke@hauke-m.de>
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

On Sun, 19 Jun 2016 18:08:12 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> From: John Crispin <john@phrozen.org>
> 
> With each write the pins on the NAND flash chip have to be activated.
> Instead of setting them only when NAND_CTRL_CHANGE is given, always set
> them.

This commit message is a bit fuzzy. How about:

"
mtd: nand: xway: Avoid messing up with IO_ADDR_W in ->cmd_ctrl()

The ->cmd_ctrl() function is adjusting the ->IO_ADDR_W value depending
on the command type each time NAND_CTRL_CHANGE is passed. This is not
only useless but can lead to an ->IO_ADDR_W corruption.

Get rid of this logic and rely on the NAND_CLE and NAND_ALE flags to
deduce the iomem address to write the cmd argument to.
"

BTW, please use the "mtd: nand: <nand-controller-driver>: " prefix in
your subject line (this applies to all the patches you sent so far).

> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index ec189e5..6028edb 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -107,22 +107,18 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>  	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
>  	unsigned long flags;
>  
> -	if (ctrl & NAND_CTRL_CHANGE) {
> -		nandaddr &= ~(NAND_WRITE_CMD | NAND_WRITE_ADDR);
> -		if (ctrl & NAND_CLE)
> -			nandaddr |= NAND_WRITE_CMD;
> -		else
> -			nandaddr |= NAND_WRITE_ADDR;
> -		this->IO_ADDR_W = (void __iomem *) nandaddr;
> -	}
> +	if (cmd == NAND_CMD_NONE)
> +		return;
>  
> -	if (cmd != NAND_CMD_NONE) {
> -		spin_lock_irqsave(&ebu_lock, flags);
> -		writeb(cmd, this->IO_ADDR_W);
> -		while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
> -			;
> -		spin_unlock_irqrestore(&ebu_lock, flags);
> -	}
> +	spin_lock_irqsave(&ebu_lock, flags);
> +	if (ctrl & NAND_CLE)
> +		writeb(cmd, (void __iomem *) (nandaddr | NAND_WRITE_CMD));
> +	else if (ctrl & NAND_ALE)
> +		writeb(cmd, (void __iomem *) (nandaddr | NAND_WRITE_ADDR));
> +
> +	while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
> +		;
> +	spin_unlock_irqrestore(&ebu_lock, flags);
>  }
>  
>  static int xway_dev_ready(struct mtd_info *mtd)

Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEbH6-0004Ku-Kv
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 11:52:25 +0000
Date: Sun, 19 Jun 2016 13:52:02 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v2 3/8] MTD: xway: the latched command should be persistent
Message-ID: <20160619135202.1ebac60f@bbrezillon>
In-Reply-To: <1466277252-13867-4-git-send-email-hauke@hauke-m.de>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
 <1466277252-13867-4-git-send-email-hauke@hauke-m.de>
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

On Sat, 18 Jun 2016 21:14:07 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> From: John Crispin <john@phrozen.org>
> 
> If they are not persistent a different address will be used and the
> controller will deactivate some pins.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 2889e48..346781a 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -67,6 +67,7 @@
>  
>  struct xway_nand_data {
>  	struct nand_chip	chip;
> +	u32			xway_latchcmd;
>  };
>  
>  static void xway_reset_chip(struct nand_chip *chip)
> @@ -104,22 +105,21 @@ static void xway_select_chip(struct mtd_info *mtd, int chip)
>  
>  static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>  {
> -	struct nand_chip *this = mtd_to_nand(mtd);
> -	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct xway_nand_data *data = nand_get_controller_data(chip);
> +	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
>  	unsigned long flags;
>  
>  	if (ctrl & NAND_CTRL_CHANGE) {
> -		nandaddr &= ~(NAND_WRITE_CMD | NAND_WRITE_ADDR);
>  		if (ctrl & NAND_CLE)
> -			nandaddr |= NAND_WRITE_CMD;
> -		else
> -			nandaddr |= NAND_WRITE_ADDR;
> -		this->IO_ADDR_W = (void __iomem *) nandaddr;
> +			data->xway_latchcmd = NAND_WRITE_CMD;
> +		else if (ctrl & NAND_ALE)
> +			data->xway_latchcmd = NAND_WRITE_ADDR;
>  	}
>  
>  	if (cmd != NAND_CMD_NONE) {
>  		spin_lock_irqsave(&ebu_lock, flags);
> -		writeb(cmd, this->IO_ADDR_W);
> +		writeb(cmd, (void __iomem *) (nandaddr | data->xway_latchcmd));
>  		while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
>  			;
>  		spin_unlock_irqrestore(&ebu_lock, flags);

Not sure what you're trying to do exactly. AFAICS, your controller seems
to handle each addr and cmd cycles independently, so all you have to do
is something like that:

	/*
	 * I'm assuming baseaddr has been initialized to the NAND
	 * controller base address.
	 */

	if (cmd == NAND_CMD_NONE)
		return;

	spin_lock_irqsave(&ebu_lock, flags);
	if (ctrl & NAND_CLE)
		writeb(cmd, baseaddr + NAND_WRITE_CMD);
	else
		writeb(cmd, baseaddr + NAND_WRITE_ADDR);

	while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
		;
	spin_unlock_irqrestore(&ebu_lock, flags);

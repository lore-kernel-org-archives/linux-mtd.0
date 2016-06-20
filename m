Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEuuu-0008FM-8G
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 08:50:48 +0000
Date: Mon, 20 Jun 2016 10:50:24 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v4 4/8] mtd: nand: xway: use generic reset function
Message-ID: <20160620105024.0f711aed@bbrezillon>
In-Reply-To: <1466355785-13689-5-git-send-email-hauke@hauke-m.de>
References: <1466355785-13689-1-git-send-email-hauke@hauke-m.de>
 <1466355785-13689-5-git-send-email-hauke@hauke-m.de>
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

On Sun, 19 Jun 2016 19:03:01 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> Instead of writing an own reset function use the generic NAND reset
> function. This way we can remove our own reset function.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 23 +++--------------------
>  1 file changed, 3 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 6028edb..8a0019a 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -35,7 +35,6 @@
>  #define NAND_CMD_CS		BIT(4) /* chip select */
>  #define NAND_CMD_SE		BIT(5) /* spare area access latch */
>  #define NAND_CMD_WP		BIT(6) /* write protect */
> -#define NAND_WRITE_CMD_RESET	0xff
>  #define NAND_WRITE_CMD		(NAND_CMD_CS | NAND_CMD_CLE)
>  #define NAND_WRITE_ADDR		(NAND_CMD_CS | NAND_CMD_ALE)
>  #define NAND_WRITE_DATA		(NAND_CMD_CS)
> @@ -68,22 +67,6 @@ struct xway_nand_data {
>  	struct nand_chip	chip;
>  };
>  
> -static void xway_reset_chip(struct nand_chip *chip)
> -{
> -	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
> -	unsigned long flags;
> -
> -	nandaddr &= ~NAND_WRITE_ADDR;
> -	nandaddr |= NAND_WRITE_CMD;
> -
> -	/* finish with a reset */
> -	spin_lock_irqsave(&ebu_lock, flags);
> -	writeb(NAND_WRITE_CMD_RESET, (void __iomem *) nandaddr);
> -	while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
> -		;
> -	spin_unlock_irqrestore(&ebu_lock, flags);
> -}
> -
>  static void xway_select_chip(struct mtd_info *mtd, int chip)
>  {
>  
> @@ -199,14 +182,14 @@ static int xway_nand_probe(struct platform_device *pdev)
>  		| NAND_CON_SE_P | NAND_CON_WP_P | NAND_CON_PRE_P
>  		| cs_flag, EBU_NAND_CON);
>  
> -	/* finish with a reset */
> -	xway_reset_chip(&data->chip);
> -
>  	/* Scan to find existence of the device */
>  	err = nand_scan(mtd, 1);
>  	if (err)
>  		return err;
>  
> +	/* finish with a reset */
> +	data->chip.cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
> +

Hm, I wonder if this is really useful. The NAND chip is already reset
as part of the nand_scan() process. Are you sure you need to reset it
again here?

Can you test after dropping this reset operation?

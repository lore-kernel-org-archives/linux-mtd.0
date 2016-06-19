Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEcRX-0000lN-K3
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 13:07:16 +0000
Date: Sun, 19 Jun 2016 15:06:53 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v2 8/8] MTD: xway: use global NAND_CMD_RESET define
Message-ID: <20160619150653.519586eb@bbrezillon>
In-Reply-To: <1466277252-13867-9-git-send-email-hauke@hauke-m.de>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
 <1466277252-13867-9-git-send-email-hauke@hauke-m.de>
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

On Sat, 18 Jun 2016 21:14:12 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index b3badf9..7244bb8 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -34,7 +34,6 @@
>  #define NAND_CMD_SE		(1 << 5)
>  #define NAND_CMD_WP		(1 << 6)
>  #define NAND_CMD_PRE		(1 << 7)
> -#define NAND_WRITE_CMD_RESET	0xff
>  #define NAND_WRITE_CMD		(NAND_CMD_CS | NAND_CMD_CLE)
>  #define NAND_WRITE_ADDR		(NAND_CMD_CS | NAND_CMD_ALE)
>  #define NAND_WRITE_DATA		(NAND_CMD_CS)
> @@ -99,7 +98,7 @@ static void xway_reset_chip(struct nand_chip *chip)
>  	timeout = jiffies + msecs_to_jiffies(20);
>  
>  	spin_lock_irqsave(&ebu_lock, flags);
> -	writeb(NAND_WRITE_CMD_RESET, (void __iomem *) nandaddr);
> +	writeb(NAND_CMD_RESET, (void __iomem *) nandaddr);

That's a good intention, but as I said, I think we can get rid of the
whole function and use ->cmdfunc(RESET) instead.

>  	do {
>  		if ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
>  			break;

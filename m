Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bADLY-000381-Pr
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 09:30:56 +0000
Date: Tue, 7 Jun 2016 11:30:21 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com, john@phrozen.org
Subject: Re: [PATCH 3/6] MTD: xway: the latched command should be persistent
Message-ID: <20160607113021.00998d8b@bbrezillon>
In-Reply-To: <1465161609-19303-4-git-send-email-hauke@hauke-m.de>
References: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
 <1465161609-19303-4-git-send-email-hauke@hauke-m.de>
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

On Sun,  5 Jun 2016 23:20:06 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> From: John Crispin <john@phrozen.org>
> 
> If they are not persistent a different address will be used and the
> controller will deactivate some pins.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 0ab6e83..79fecc8 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -64,6 +64,8 @@
>  #define NAND_CON_CSMUX		(1 << 1)
>  #define NAND_CON_NANDM		1
>  
> +static u32 xway_latchcmd;

Please avoid using global variables. This field should be part of your
private nand_chip struct.

> +
>  static void xway_reset_chip(struct nand_chip *chip)
>  {
>  	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
> @@ -104,17 +106,15 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>  	unsigned long flags;
>  
>  	if (ctrl & NAND_CTRL_CHANGE) {
> -		nandaddr &= ~(NAND_WRITE_CMD | NAND_WRITE_ADDR);
>  		if (ctrl & NAND_CLE)
> -			nandaddr |= NAND_WRITE_CMD;
> -		else
> -			nandaddr |= NAND_WRITE_ADDR;
> -		this->IO_ADDR_W = (void __iomem *) nandaddr;
> +			xway_latchcmd = NAND_WRITE_CMD;
> +		else if (ctrl & NAND_ALE)
> +			xway_latchcmd = NAND_WRITE_ADDR;
>  	}
>  
>  	if (cmd != NAND_CMD_NONE) {
>  		spin_lock_irqsave(&ebu_lock, flags);
> -		writeb(cmd, this->IO_ADDR_W);
> +		writeb(cmd, (void __iomem *) (nandaddr | xway_latchcmd));
>  		while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
>  			;
>  		spin_unlock_irqrestore(&ebu_lock, flags);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

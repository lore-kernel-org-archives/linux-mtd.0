Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEc3K-0005su-6T
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 12:42:15 +0000
Date: Sun, 19 Jun 2016 14:41:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v2 6/8] MTD: xway: fix nand locking
Message-ID: <20160619144152.4ba4de77@bbrezillon>
In-Reply-To: <1466277252-13867-7-git-send-email-hauke@hauke-m.de>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
 <1466277252-13867-7-git-send-email-hauke@hauke-m.de>
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

On Sat, 18 Jun 2016 21:14:10 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> From: John Crispin <john@phrozen.org>
> 
> The external Bus Unit (EBU) can control different flash devices, but
> these NAND flash commands have to be atomic and should not be
> interrupted in between. Lock the EBU from the beginning of the command
> till the end by moving the lock to the chip select.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 1511bdb..064ee41 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -94,13 +94,16 @@ static void xway_reset_chip(struct nand_chip *chip)
>  
>  static void xway_select_chip(struct mtd_info *mtd, int chip)
>  {
> +	static unsigned long csflags;
>  
>  	switch (chip) {
>  	case -1:
>  		ltq_ebu_w32_mask(NAND_CON_CE, 0, EBU_NAND_CON);
>  		ltq_ebu_w32_mask(NAND_CON_NANDM, 0, EBU_NAND_CON);
> +		spin_unlock_irqrestore(&ebu_lock, csflags);
>  		break;
>  	case 0:
> +		spin_lock_irqsave(&ebu_lock, csflags);
>  		ltq_ebu_w32_mask(0, NAND_CON_NANDM, EBU_NAND_CON);
>  		ltq_ebu_w32_mask(0, NAND_CON_CE, EBU_NAND_CON);

So now the spinlock is taken (and irq disabled) during the whole NAND
operation. Ouch! I hope you don't have real-time constraints in your
system.

>  		break;
> @@ -114,7 +117,6 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct xway_nand_data *data = nand_get_controller_data(chip);
>  	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
> -	unsigned long flags;
>  
>  	if (ctrl & NAND_CTRL_CHANGE) {
>  		if (ctrl & NAND_CLE)
> @@ -124,11 +126,9 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>  	}
>  
>  	if (cmd != NAND_CMD_NONE) {
> -		spin_lock_irqsave(&ebu_lock, flags);
>  		writeb(cmd, (void __iomem *) (nandaddr | data->xway_latchcmd));
>  		while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
>  			;
> -		spin_unlock_irqrestore(&ebu_lock, flags);
>  	}
>  }
>  
> @@ -141,14 +141,8 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
>  {
>  	struct nand_chip *this = mtd_to_nand(mtd);
>  	unsigned long nandaddr = (unsigned long) this->IO_ADDR_R;
> -	unsigned long flags;
> -	int ret;
> -
> -	spin_lock_irqsave(&ebu_lock, flags);
> -	ret = ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));
> -	spin_unlock_irqrestore(&ebu_lock, flags);
>  
> -	return ret;
> +	return ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));
>  }
>  
>  
> @@ -156,26 +150,20 @@ static void xway_read_buf(struct mtd_info *mtd, u_char *buf, int len)
>  {
>  	struct nand_chip *this = mtd_to_nand(mtd);
>  	unsigned long nandaddr = (unsigned long) this->IO_ADDR_R;
> -	unsigned long flags;
>  	int i;
>  
> -	spin_lock_irqsave(&ebu_lock, flags);
>  	for (i = 0; i < len; i++)
>  		buf[i] = ltq_r8((void __iomem *)(nandaddr | NAND_READ_DATA));
> -	spin_unlock_irqrestore(&ebu_lock, flags);
>  }
>  
>  static void xway_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
>  {
>  	struct nand_chip *this = mtd_to_nand(mtd);
>  	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
> -	unsigned long flags;
>  	int i;
>  
> -	spin_lock_irqsave(&ebu_lock, flags);
>  	for (i = 0; i < len; i++)
>  		ltq_w8(buf[i], (void __iomem *)(nandaddr | NAND_WRITE_DATA));
> -	spin_unlock_irqrestore(&ebu_lock, flags);
>  }
>  
>  /*

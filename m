Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEc4B-0006k6-9V
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 12:43:08 +0000
Date: Sun, 19 Jun 2016 14:42:45 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v2 7/8] MTD: xway: extract read and write function
Message-ID: <20160619144245.731d97a4@bbrezillon>
In-Reply-To: <1466277252-13867-8-git-send-email-hauke@hauke-m.de>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
 <1466277252-13867-8-git-send-email-hauke@hauke-m.de>
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

On Sat, 18 Jun 2016 21:14:11 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> Extract the functions to read and write to the register of the NAND
> flash controller.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 064ee41..b3badf9 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -70,6 +70,22 @@ struct xway_nand_data {
>  	u32			xway_latchcmd;
>  };
>  
> +static u8 xway_readb(struct mtd_info *mtd, int op)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_R;
> +
> +	return readb((void __iomem *)(nandaddr | op));

Please use the + operator and drop the cast.

> +}
> +
> +static void xway_writeb(struct mtd_info *mtd, int op, u8 value)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
> +
> +	writeb(value, (void __iomem *)(nandaddr | op));

Ditto.

> +}
> +
>  static void xway_reset_chip(struct nand_chip *chip)
>  {
>  	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
> @@ -116,7 +132,6 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct xway_nand_data *data = nand_get_controller_data(chip);
> -	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
>  
>  	if (ctrl & NAND_CTRL_CHANGE) {
>  		if (ctrl & NAND_CLE)
> @@ -126,7 +141,7 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>  	}
>  
>  	if (cmd != NAND_CMD_NONE) {
> -		writeb(cmd, (void __iomem *) (nandaddr | data->xway_latchcmd));
> +		xway_writeb(mtd, data->xway_latchcmd, cmd);
>  		while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
>  			;
>  	}
> @@ -139,31 +154,23 @@ static int xway_dev_ready(struct mtd_info *mtd)
>  
>  static unsigned char xway_read_byte(struct mtd_info *mtd)
>  {
> -	struct nand_chip *this = mtd_to_nand(mtd);
> -	unsigned long nandaddr = (unsigned long) this->IO_ADDR_R;
> -
> -	return ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));
> +	return xway_readb(mtd, NAND_READ_DATA);
>  }
>  
> -
>  static void xway_read_buf(struct mtd_info *mtd, u_char *buf, int len)
>  {
> -	struct nand_chip *this = mtd_to_nand(mtd);
> -	unsigned long nandaddr = (unsigned long) this->IO_ADDR_R;
>  	int i;
>  
>  	for (i = 0; i < len; i++)
> -		buf[i] = ltq_r8((void __iomem *)(nandaddr | NAND_READ_DATA));
> +		buf[i] = xway_readb(mtd, NAND_READ_DATA);
>  }
>  
>  static void xway_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
>  {
> -	struct nand_chip *this = mtd_to_nand(mtd);
> -	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
>  	int i;
>  
>  	for (i = 0; i < len; i++)
> -		ltq_w8(buf[i], (void __iomem *)(nandaddr | NAND_WRITE_DATA));
> +		xway_writeb(mtd, NAND_WRITE_DATA, buf[i]);
>  }
>  
>  /*

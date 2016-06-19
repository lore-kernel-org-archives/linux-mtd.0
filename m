Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEbzs-0002mY-MB
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 12:38:41 +0000
Date: Sun, 19 Jun 2016 14:38:18 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v2 5/8] MTD: xway: add missing write_buf and read_buf to
 nand driver
Message-ID: <20160619143818.1a0f556f@bbrezillon>
In-Reply-To: <1466277252-13867-6-git-send-email-hauke@hauke-m.de>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
 <1466277252-13867-6-git-send-email-hauke@hauke-m.de>
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

On Sat, 18 Jun 2016 21:14:09 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

Please add a commit message.

> From: John Crispin <john@phrozen.org>
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 61176c4..1511bdb 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -151,6 +151,33 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
>  	return ret;
>  }
>  
> +
> +static void xway_read_buf(struct mtd_info *mtd, u_char *buf, int len)
> +{
> +	struct nand_chip *this = mtd_to_nand(mtd);
> +	unsigned long nandaddr = (unsigned long) this->IO_ADDR_R;
> +	unsigned long flags;
> +	int i;
> +
> +	spin_lock_irqsave(&ebu_lock, flags);
> +	for (i = 0; i < len; i++)
> +		buf[i] = ltq_r8((void __iomem *)(nandaddr | NAND_READ_DATA));

Please remove these useless cast and use the + operator.

		buf[i] = ltq_r8(this->IO_ADDR_R + NAND_READ_DATA);

> +	spin_unlock_irqrestore(&ebu_lock, flags);

Reading data through the NAND bus can be quite long, do you really need
to take a spinlock and disable irqs for while doing that?
A mutex would be more appropriate IMO.

> +}
> +
> +static void xway_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
> +{
> +	struct nand_chip *this = mtd_to_nand(mtd);
> +	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
> +	unsigned long flags;
> +	int i;
> +
> +	spin_lock_irqsave(&ebu_lock, flags);
> +	for (i = 0; i < len; i++)
> +		ltq_w8(buf[i], (void __iomem *)(nandaddr | NAND_WRITE_DATA));

Ditto.

> +	spin_unlock_irqrestore(&ebu_lock, flags);
> +}
> +
>  /*
>   * Probe for the NAND device.
>   */
> @@ -184,6 +211,8 @@ static int xway_nand_probe(struct platform_device *pdev)
>  	data->chip.cmd_ctrl = xway_cmd_ctrl;
>  	data->chip.dev_ready = xway_dev_ready;
>  	data->chip.select_chip = xway_select_chip;
> +	data->chip.write_buf = xway_write_buf;
> +	data->chip.read_buf = xway_read_buf;
>  	data->chip.read_byte = xway_read_byte;
>  	data->chip.chip_delay = 30;
>  

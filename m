Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEfem-0006XW-5C
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 16:33:08 +0000
Date: Sun, 19 Jun 2016 18:32:45 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v3 8/8] MTD: xway: add missing write_buf and read_buf to
 nand driver
Message-ID: <20160619183245.5e8b0005@bbrezillon>
In-Reply-To: <1466352497-6806-9-git-send-email-hauke@hauke-m.de>
References: <1466352497-6806-1-git-send-email-hauke@hauke-m.de>
 <1466352497-6806-9-git-send-email-hauke@hauke-m.de>
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

On Sun, 19 Jun 2016 18:08:17 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

Still no descriptions...

> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 282258f..8f208cb 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -130,6 +130,22 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
>  	return xway_readb(mtd, NAND_READ_DATA);
>  }
>  
> +static void xway_read_buf(struct mtd_info *mtd, u_char *buf, int len)
> +{
> +	int i;
> +
> +	for (i = 0; i < len; i++)
> +		buf[i] = xway_readb(mtd, NAND_WRITE_DATA);
> +}
> +
> +static void xway_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
> +{
> +	int i;
> +
> +	for (i = 0; i < len; i++)
> +		xway_writeb(mtd, NAND_WRITE_DATA, buf[i]);
> +}
> +
>  /*
>   * Probe for the NAND device.
>   */
> @@ -162,6 +178,8 @@ static int xway_nand_probe(struct platform_device *pdev)
>  	data->chip.cmd_ctrl = xway_cmd_ctrl;
>  	data->chip.dev_ready = xway_dev_ready;
>  	data->chip.select_chip = xway_select_chip;
> +	data->chip.write_buf = xway_write_buf;
> +	data->chip.read_buf = xway_read_buf;
>  	data->chip.read_byte = xway_read_byte;
>  	data->chip.chip_delay = 30;
>  

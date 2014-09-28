Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYNCM-0006mT-Ce
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 22:44:11 +0000
From: Marek Vasut <marex@denx.de>
To: bpqw <bpqw@micron.com>
Subject: Re: [PATCH 1/1 v2] driver:mtd:spi-nor: Add Micron quad I/O support
Date: Mon, 29 Sep 2014 00:43:43 +0200
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCED6@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315DCED6@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201409290043.43750.marex@denx.de>
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday, September 28, 2014 at 03:59:42 AM, bpqw wrote:
> For Micron spi norflash,you can enable
> Quad spi transfer by clear EVCR(Enhanced
> Volatile Configuration Register) Quad I/O
> protocol bit.

OK, this information is nice and all, but what does this patch do? I can't learn 
this information from the commit message as it is, can I ? And , the purpose of 
the commit message is exactly to summarize the change the patch implements.

> Signed-off-by: bean huo <beanhuo@micron.com>
> ---
>  v1-v2:modified to that capture wait_till_ready()
> 	return value,if error,directly return its
> 	the value.
> 
>  drivers/mtd/spi-nor/spi-nor.c |   46
> +++++++++++++++++++++++++++++++++++++++++ include/linux/mtd/spi-nor.h   | 
>   6 ++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index b5ad6be..0c3b4fd 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -878,6 +878,45 @@ static int spansion_quad_enable(struct spi_nor *nor)
>  	return 0;
>  }
> 
> +static int micron_quad_enable(struct spi_nor *nor)
> +{
> +	int ret, val;
> +
> +	ret = nor->read_reg(nor, SPINOR_OP_RD_EVCR, &val, 1);
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error %d reading EVCR\n", ret);
> +		return -EINVAL;
> +	}
> +
> +	write_enable(nor);
> +
> +	/* set EVCR ,enable quad I/O */
> +	nor->cmd_buf[0] = val & ~EVCR_QUAD_EN_MICRON;
> +	ret = nor->write_reg(nor, SPINOR_OP_WD_EVCR, nor->cmd_buf, 1, 0);
> +	if (ret < 0) {
> +		dev_err(nor->dev,
> +			"error while writing EVCR register\n");
> +		return -EINVAL;

Why not just "return ret;" ?
[...]

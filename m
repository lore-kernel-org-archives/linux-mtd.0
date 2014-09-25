Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XX6dg-0003Ra-AJ
 for linux-mtd@lists.infradead.org; Thu, 25 Sep 2014 10:51:10 +0000
From: Marek Vasut <marex@denx.de>
To: bpqw <bpqw@micron.com>
Subject: Re: [PATCH 1/1] driver:mtd:spi-nor: Add Micron quad I/O support
Date: Thu, 25 Sep 2014 12:11:57 +0200
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201409251211.57183.marex@denx.de>
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "b32955@freescale.com" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, September 25, 2014 at 08:20:35 AM, bpqw wrote:
> For Micron spi norflash,you can enable Quad spi transfer
> by clear EVCR(Enhanced Volatile Configuration Register)
> Quad I/O protocol bit.
> 
> Signed-off-by: bean huo <beanhuo@micron.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c |   45
> +++++++++++++++++++++++++++++++++++++++++ include/linux/mtd/spi-nor.h   | 
>   6 ++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index b5ad6be..e72894f 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -878,6 +878,44 @@ static int spansion_quad_enable(struct spi_nor *nor)
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
> +	}
> +
> +	if (wait_till_ready(nor))
> +		return 1;

Why does this not return proper error code or even better, return value from 
wait_till_ready() ?

Other than that, there's nothing wrong with the patch I think.

Best regards,
Marek Vasut

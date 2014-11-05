Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xlyjp-0002gG-Ru
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 11:26:58 +0000
Received: by mail-pd0-f170.google.com with SMTP id z10so584558pdj.29
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 03:26:36 -0800 (PST)
Date: Wed, 5 Nov 2014 03:26:33 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: bpqw <bpqw@micron.com>
Subject: Re: [PATCH 1/1 v4] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
Message-ID: <20141105112633.GK22361@norris-Latitude-E6410>
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409251211.57183.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCDF1@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315E9B48@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315E9B48@NTXXIAMBX02.xacn.micron.com>
Cc: Marek Vasut <marex@denx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 04, 2014 at 01:25:14PM +0000, bpqw wrote:
> This patch adds code which enables Quad I/O mode on Micron SPI NOR flashes.
> 
> For Micron SPI NOR flash,enabling or disabling quad I/O protocol is controlled
> by EVCR (Enhanced Volatile Configuration Register), Quad I/O protocol bit 7.
> When EVCR bit 7 is reset to 0,the SPI NOR flash will operate in quad I/O mode.
> 
> Signed-off-by: bean huo <beanhuo@micron.com>
> Acked-by: Marek Vasut <marex@denx.de>
> ---
>  v1-v2:modified to that capture wait_till_ready()
> 	 return value,if error,directly return its
> 	 the value.
>  v2-v3:directly use the reurning error value of
> 	 read_reg and write_reg,instead of -EINVAL.
>  V3-v4:
> 	Modify commit logs that wraped into 80 columns 

Please be aware that resending your patch every few days does not really
help your cause.

Also, your patch is still corrupt and cannot be applied as-is. Please
double-check your mailer settings and resend once you have something I
can apply.

Brian

> 
>  drivers/mtd/spi-nor/spi-nor.c |   46 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h   |    6 ++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c index b5ad6be..486b167 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -878,6 +878,45 @@ static int spansion_quad_enable(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +static int micron_quad_enable(struct spi_nor *nor) {
> +	int ret, val;
> +
> +	ret = nor->read_reg(nor, SPINOR_OP_RD_EVCR, &val, 1);
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error %d reading EVCR\n", ret);
> +		return ret;
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
> +		return ret;
> +	}
> +
> +	ret = wait_till_ready(nor);
> +	if (ret)
> +		return ret;
> +
> +	/* read EVCR and check it */
> +	ret = nor->read_reg(nor, SPINOR_OP_RD_EVCR, &val, 1);
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error %d reading EVCR\n", ret);
> +		return ret;
> +	}
> +	if (val & EVCR_QUAD_EN_MICRON) {
> +		dev_err(nor->dev, "Micron EVCR Quad bit not clear\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int set_quad_mode(struct spi_nor *nor, u32 jedec_id)  {
>  	int status;
> @@ -890,6 +929,13 @@ static int set_quad_mode(struct spi_nor *nor, u32 jedec_id)
>  			return -EINVAL;
>  		}
>  		return status;
> +	case CFI_MFR_ST:
> +		status = micron_quad_enable(nor);
> +		if (status) {
> +			dev_err(nor->dev, "Micron quad-read not enabled\n");
> +			return -EINVAL;
> +		}
> +		return status;
>  	default:
>  		status = spansion_quad_enable(nor);
>  		if (status) {
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h index 9e6294f..d71b659 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -56,6 +56,10 @@
>  /* Used for Spansion flashes only. */
>  #define SPINOR_OP_BRWR		0x17	/* Bank register write */
>  
> +/* Used for Micron flashes only. */
> +#define SPINOR_OP_RD_EVCR	0x65	/* Read EVCR register */
> +#define SPINOR_OP_WD_EVCR	0x61	/* Write EVCR register */
> +
>  /* Status Register bits. */
>  #define SR_WIP			1	/* Write in progress */
>  #define SR_WEL			2	/* Write enable latch */
> @@ -67,6 +71,8 @@
>  
>  #define SR_QUAD_EN_MX		0x40	/* Macronix Quad I/O */
>  
> +#define EVCR_QUAD_EN_MICRON	0x80	/* Micron Quad I/O */
> +
>  /* Flag Status Register bits */
>  #define FSR_READY		0x80
>  

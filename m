Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aw44M-0004Bf-2r
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2016 08:46:38 +0000
Date: Fri, 29 Apr 2016 10:46:12 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <han.xu@nxp.com>
Cc: <shijie.huang@arm.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <standby24x7@gmail.com>, <jkosina@suse.cz>,
 <fabio.estevam@freescale.com>, <fransklaver@gmail.com>, <hofrat@osadl.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] mtd: nand: gpmi: support NAND on i.MX6UL
Message-ID: <20160429104612.51efd196@bbrezillon>
In-Reply-To: <1456268693-8630-5-git-send-email-han.xu@nxp.com>
References: <1456268693-8630-1-git-send-email-han.xu@nxp.com>
 <1456268693-8630-5-git-send-email-han.xu@nxp.com>
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

On Tue, 23 Feb 2016 17:04:52 -0600
Han Xu <han.xu@nxp.com> wrote:

> From: Han Xu <b45815@freescale.com>
> 
> support GPMI NAND on i.MX6UL
> 
> Signed-off-by: Han Xu <han.xu@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 +++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 4 +++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 6b3ca3b..1987f03 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -89,6 +89,12 @@ static const struct gpmi_devdata gpmi_devdata_imx7d = {
>  	.max_chain_delay = 12,
>  };
>  
> +static const struct gpmi_devdata gpmi_devdata_imx6ul = {
> +	.type = IS_MX6UL,
> +	.bch_max_ecc_strength = 40,
> +	.max_chain_delay = 12,
> +};
> +
>  static irqreturn_t bch_irq(int irq, void *cookie)
>  {
>  	struct gpmi_nand_data *this = cookie;
> @@ -2013,6 +2019,9 @@ static const struct of_device_id gpmi_nand_id_table[] = {
>  		.compatible = "fsl,imx6sx-gpmi-nand",
>  		.data = &gpmi_devdata_imx6sx,
>  	}, {
> +		.compatible = "fsl,imx6ul-gpmi-nand",
> +		.data = (void *)&gpmi_devdata_imx6ul,

Drop this (void *) cast.

> +	}, {
>  		.compatible = "fsl,imx7d-gpmi-nand",
>  		.data = (void *)&gpmi_devdata_imx7d,
>  	}, { /* sentinel */ }
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> index 605d96e..eb45a3c 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> @@ -126,6 +126,7 @@ enum gpmi_type {
>  	IS_MX6QP,
>  	IS_MX6SX,
>  	IS_MX7D,
> +	IS_MX6UL,
>  };
>  
>  struct gpmi_devdata {
> @@ -309,8 +310,9 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
>  #define GPMI_IS_MX6QP(x)	((x)->devdata->type == IS_MX6QP)
>  #define GPMI_IS_MX6SX(x)	((x)->devdata->type == IS_MX6SX)
>  #define GPMI_IS_MX7D(x)		((x)->devdata->type == IS_MX7D)
> +#define GPMI_IS_MX6UL(x)	((x)->devdata->type == IS_MX6UL)
>  
>  #define GPMI_IS_MX6(x)		(GPMI_IS_MX6Q(x) || GPMI_IS_MX6QP(x)\
> -	   || GPMI_IS_MX6SX(x))
> +	   || GPMI_IS_MX6SX(x) || GPMI_IS_MX6UL(x))

And fix the missing space and alignment issue here as well.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

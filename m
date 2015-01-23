Message-ID: <54C26FCA.5050600@free-electrons.com>
Date: Fri, 23 Jan 2015 16:59:06 +0100
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
References: <1422027703-3763-1-git-send-email-maxime.ripard@free-electrons.com>
 <1422027703-3763-2-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1422027703-3763-2-git-send-email-maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Maxime,

On 23/01/2015 16:41, Maxime Ripard wrote:
> The NDDB register holds the data that are needed by the read and write
> commands.
> 
> However, during a read PIO access, the datasheet specifies that after each 32
> bits read in that register, when BCH is enabled, we have to make sure that the
> RDDREQ bit is set in the NDSR register.
> 
> This fixes an issue that was seen on the Armada 385, and presumably other mvebu
> SoCs, when a read on a newly erased page would end up in the driver reporting a
> timeout from the NAND.
> 
> Cc: <stable@vger.kernel.org>

It would help the stable maintainer if you could indicate since which commit or
kernel release this fix should be applied.

> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 36 ++++++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 96b0b1d27df1..320c2ab14d4e 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -480,6 +480,30 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
>  	nand_writel(info, NDCR, ndcr | int_mask);
>  }
>  
> +static void drain_fifo(struct pxa3xx_nand_info *info,
> +		       void *data,
> +		       int len)
> +{
> +	u32 *dst = (u32 *)data;
> +
> +	if (info->ecc_bch) {
> +		while (len--) {
> +			*dst++ = nand_readl(info, NDDB);
> +
> +			/*
> +			 * According to the datasheet, when reading
> +			 * from NDDB with BCH enabled, after each 32
> +			 * bits reads, we have to make sure that the
> +			 * NDSR.RDDREQ bit is set
> +			 */
> +			while (!(nand_readl(info, NDSR) & NDSR_RDDREQ))
> +				cpu_relax();

Are we sure that we won't be blocked here?
If not, what about adding a timeout?

Thanks,

Gregory
> +		}
> +	} else {
> +		__raw_readsl(info->mmio_base + NDDB, data, len);
> +	}
> +}
> +
>  static void handle_data_pio(struct pxa3xx_nand_info *info)
>  {
>  	unsigned int do_bytes = min(info->data_size, info->chunk_size);
> @@ -496,14 +520,14 @@ static void handle_data_pio(struct pxa3xx_nand_info *info)
>  				      DIV_ROUND_UP(info->oob_size, 4));
>  		break;
>  	case STATE_PIO_READING:
> -		__raw_readsl(info->mmio_base + NDDB,
> -			     info->data_buff + info->data_buff_pos,
> -			     DIV_ROUND_UP(do_bytes, 4));
> +		drain_fifo(info,
> +			   info->data_buff + info->data_buff_pos,
> +			   DIV_ROUND_UP(do_bytes, 4));
>  
>  		if (info->oob_size > 0)
> -			__raw_readsl(info->mmio_base + NDDB,
> -				     info->oob_buff + info->oob_buff_pos,
> -				     DIV_ROUND_UP(info->oob_size, 4));
> +			drain_fifo(info,
> +				   info->oob_buff + info->oob_buff_pos,
> +				   DIV_ROUND_UP(info->oob_size, 4));
>  		break;
>  	default:
>  		dev_err(&info->pdev->dev, "%s: invalid state %d\n", __func__,
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

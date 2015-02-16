Date: Mon, 16 Feb 2015 14:34:18 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150216143418.3984652c@bbrezillon>
In-Reply-To: <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
References: <1424091072-7738-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
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

On Mon, 16 Feb 2015 13:51:11 +0100
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

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
> Cc: <stable@vger.kernel.org> # v3.14
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 47 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 96b0b1d27df1..b2d8d6960765 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -480,6 +480,41 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
>  	nand_writel(info, NDCR, ndcr | int_mask);
>  }
>  
> +static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
> +{
> +	if (info->ecc_bch) {
> +		int index = 0;
> +
> +		while (index < (len * 4)) {
> +			u32 timeout;
> +
> +			__raw_readsl(info->mmio_base + NDDB, data + index, 8);
> +

Shouldn't you break here if you've read all the data you were
expecting ?
As I said in my previous review, I don't know what's happening if you
wait for RDDREQ when the FIFO has been fully drained.

> +			/*
> +			 * According to the datasheet, when reading
> +			 * from NDDB with BCH enabled, after each 32
> +			 * bytes reads, we have to make sure that the
> +			 * NDSR.RDDREQ bit is set
> +			 */
> +			for (timeout = 0;
> +			     !(nand_readl(info, NDSR) & NDSR_RDDREQ);
> +			     timeout++) {
> +				if (timeout >= 5) {
> +					dev_err(&info->pdev->dev,
> +						"Timeout on RDDREQ while draining the FIFO\n");
> +					return;
> +				}
> +
> +				mdelay(1);
> +			}
> +
> +			index += 32;
> +		}
> +	} else {
> +		__raw_readsl(info->mmio_base + NDDB, data, len);
> +	}
> +}

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

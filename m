Date: Wed, 4 Feb 2015 11:10:28 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150204111028.2f0bd376@bbrezillon>
In-Reply-To: <1422284164-16867-2-git-send-email-maxime.ripard@free-electrons.com>
References: <1422284164-16867-1-git-send-email-maxime.ripard@free-electrons.com>
 <1422284164-16867-2-git-send-email-maxime.ripard@free-electrons.com>
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

On Mon, 26 Jan 2015 15:56:03 +0100
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
>  drivers/mtd/nand/pxa3xx_nand.c | 45 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 96b0b1d27df1..e6918befb951 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -23,6 +23,7 @@
>  #include <linux/mtd/partitions.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
> +#include <linux/jiffies.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> @@ -480,6 +481,38 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
>  	nand_writel(info, NDCR, ndcr | int_mask);
>  }
>  
> +static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
> +{
> +	u32 *dst = (u32 *)data;
> +
> +	if (info->ecc_bch) {
> +		while (len--) {
> +			u32 timeout;
> +
> +			*dst++ = nand_readl(info, NDDB);
> +
> +			/*
> +			 * According to the datasheet, when reading
> +			 * from NDDB with BCH enabled, after each 32
> +			 * bits reads, we have to make sure that the
> +			 * NDSR.RDDREQ bit is set
> +			 */

I know the datasheet says this bit should be checked after each
transfer, but I wonder if we shouldn't check it before reading the data.
What happens if you drain all the data available in the FIFO ? Is the
controller still setting the RDDREQ bit ?

Moreover, the datasheet says this RDDREQ bit should be checked after
each 32 bytes (not 32 bits) transfer.
Testing it after each readl call shouldn't hurt though.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

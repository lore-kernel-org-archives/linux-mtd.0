Message-ID: <54E49632.1000001@free-electrons.com>
Date: Wed, 18 Feb 2015 10:40:02 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
References: <1424255528-1717-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424255528-1717-2-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1424255528-1717-2-git-send-email-maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/18/2015 07:32 AM, Maxime Ripard wrote:
> The NDDB register holds the data that are needed by the read and write
> commands.
> 
> However, during a read PIO access, the datasheet specifies that after each 32
> bytes read in that register, when BCH is enabled, we have to make sure that the
> RDDREQ bit is set in the NDSR register.
> 
> This fixes an issue that was seen on the Armada 385, and presumably other mvebu
> SoCs, when a read on a newly erased page would end up in the driver reporting a
> timeout from the NAND.
> 
> Cc: <stable@vger.kernel.org> # v3.14
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 48 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 96b0b1d27df1..bc677362bc73 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -480,6 +480,42 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
>  	nand_writel(info, NDCR, ndcr | int_mask);
>  }
>  
> +static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
> +{
> +	if (info->ecc_bch) {
> +		int timeout;
> +
> +		/*
> +		 * According to the datasheet, when reading from NDDB
> +		 * with BCH enabled, after each 32 bytes reads, we
> +		 * have to make sure that the NDSR.RDDREQ bit is set.
> +		 *
> +		 * Drain the FIFO 8 32 bits reads at a time, and skip
> +		 * the polling on the last read.
> +		 */
> +		while (len > 8) {
> +			__raw_readsl(info->mmio_base + NDDB, data, 8);
> +
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

This is probably a stupid nit.. but here it goes is it any difference if
udelay is used here?

Does this makes anything better/worse?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com

Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fB0CO-0003w1-Sr
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2018 15:49:51 +0000
Date: Tue, 24 Apr 2018 17:49:32 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: thor.thayer@linux.intel.com
Cc: marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 richard@nod.at, linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCHv3] mtd: spi-nor: Fix Cadence QSPI page fault kernel panic
Message-ID: <20180424174932.00d6730f@bbrezillon>
In-Reply-To: <1524505511-4780-1-git-send-email-thor.thayer@linux.intel.com>
References: <1524505511-4780-1-git-send-email-thor.thayer@linux.intel.com>
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

On Mon, 23 Apr 2018 12:45:11 -0500
thor.thayer@linux.intel.com wrote:

> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> The current Cadence QSPI driver caused a kernel panic when loading
> a Root Filesystem from QSPI. The problem was caused by reading more
> bytes than needed because the QSPI operated on 4 bytes at a time.
> <snip>
> [    7.947754] spi_nor_read[1048]:from 0x037cad74, len 1 [bfe07fff]
> [    7.956247] cqspi_read[910]:offset 0x58502516, buffer=bfe07fff
> [    7.956247]
> [    7.966046] Unable to handle kernel paging request at virtual
> address bfe08002
> [    7.973239] pgd = eebfc000
> [    7.975931] [bfe08002] *pgd=2fffb811, *pte=00000000, *ppte=00000000
> </snip>
> Notice above how only 1 byte needed to be read but by reading 4 bytes
> into the end of a mapped page, an unrecoverable page fault occurred.
> 
> This patch uses a temporary buffer to hold the 4 bytes read and then
> copies only the bytes required into the buffer. A min() function is
> used to limit the length to prevent buffer overflows.
> 
> Request testing of this patch on other platforms. This was tested
> on the Intel Arria10 SoCFPGA DevKit.
> 
> Fixes: 0cf1725676a97fc8 ("mtd: spi-nor: cqspi: Fix build on arches missing readsl/writesl")
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> Cc: <stable@vger.kernel.org>
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

Applied to master. Will be part of the fixes PR I'll send later this
week.

> ---
> v2  Changes to only write dangling bytes at end of transfer since
>       previous patch may have multiple dangling byte transfers.
>     Remove write patch since no errors reported and write timeout
>       needs more investigation.
> v3  Add Fixes tag Cc-stable tag.
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 2f3a4d4232b3..c3f7aaa5d18f 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -507,7 +507,9 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor, u8 *rxbuf,
>  	void __iomem *reg_base = cqspi->iobase;
>  	void __iomem *ahb_base = cqspi->ahb_base;
>  	unsigned int remaining = n_rx;
> +	unsigned int mod_bytes = n_rx % 4;
>  	unsigned int bytes_to_read = 0;
> +	u8 *rxbuf_end = rxbuf + n_rx;
>  	int ret = 0;
>  
>  	writel(from_addr, reg_base + CQSPI_REG_INDIRECTRDSTARTADDR);
> @@ -536,11 +538,24 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor, u8 *rxbuf,
>  		}
>  
>  		while (bytes_to_read != 0) {
> +			unsigned int word_remain = round_down(remaining, 4);
> +
>  			bytes_to_read *= cqspi->fifo_width;
>  			bytes_to_read = bytes_to_read > remaining ?
>  					remaining : bytes_to_read;
> -			ioread32_rep(ahb_base, rxbuf,
> -				     DIV_ROUND_UP(bytes_to_read, 4));
> +			bytes_to_read = round_down(bytes_to_read, 4);
> +			/* Read 4 byte word chunks then single bytes */
> +			if (bytes_to_read) {
> +				ioread32_rep(ahb_base, rxbuf,
> +					     (bytes_to_read / 4));
> +			} else if (!word_remain && mod_bytes) {
> +				unsigned int temp = ioread32(ahb_base);
> +
> +				bytes_to_read = mod_bytes;
> +				memcpy(rxbuf, &temp, min((unsigned int)
> +							 (rxbuf_end - rxbuf),
> +							 bytes_to_read));
> +			}
>  			rxbuf += bytes_to_read;
>  			remaining -= bytes_to_read;
>  			bytes_to_read = cqspi_get_rd_sram_level(cqspi);

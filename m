Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgu1h-0003yX-Az
 for linux-mtd@lists.infradead.org; Sat, 21 Jul 2018 15:42:34 +0000
Subject: Re: [PATCH 1/2] mtd: spi-nor: cadence-quadspi: fix timeout handling
 in wait_for_completion_timeout
To: Nicholas Mc Guire <hofrat@osadl.org>
CC: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <1532182912-3674-1-git-send-email-hofrat@osadl.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <a0644f99-b997-2a94-01ac-dcc2656e984b@ti.com>
Date: Sat, 21 Jul 2018 21:11:51 +0530
MIME-Version: 1.0
In-Reply-To: <1532182912-3674-1-git-send-email-hofrat@osadl.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 21-Jul-18 7:51 PM, Nicholas Mc Guire wrote:
> wait_for_completion_timeout returns unsigned long not int so a variable of
> proper type is introduced. Further the check for <= 0 is ambiguous and should
> be == 0 here.
>

Oops, my bad. Thanks for the fix! I see you have fixed similar bug in
cqspi_indirect_read_execute(). There is similar code in
cqspi_indirect_write_execute(). Could you fix that as well?

Regards
Vignesh


> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> Fixes: ffa639e069fb ("mtd: spi-nor: cadence-quadspi: Add DMA support for direct mode reads")
> ---
> 
> Patch found by experimental coccinelle API conformance checker
>> Patch was compile tested with: socfpga_defconfig (implies
> CONFIG_SPI_CADENCE_QUADSPI=y)
> 
> Patch is against 4.18-rc5 (localversion-next is next-20180720)
> 
>  drivers/mtd/spi-nor/cadence-quadspi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index d7e10b3..79f6a54 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -953,6 +953,7 @@ static int cqspi_direct_read_execute(struct spi_nor *nor, u_char *buf,
>  	enum dma_ctrl_flags flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
>  	dma_addr_t dma_src = (dma_addr_t)cqspi->mmap_phys_base + from;
>  	int ret = 0;
> +	unsigned long timeout;
>  	struct dma_async_tx_descriptor *tx;
>  	dma_cookie_t cookie;
>  	dma_addr_t dma_dst;
> @@ -988,9 +989,9 @@ static int cqspi_direct_read_execute(struct spi_nor *nor, u_char *buf,
>  	}
>  
>  	dma_async_issue_pending(cqspi->rx_chan);
> -	ret = wait_for_completion_timeout(&cqspi->rx_dma_complete,
> -					  msecs_to_jiffies(len));
> -	if (ret <= 0) {
> +	timeout = wait_for_completion_timeout(&cqspi->rx_dma_complete,
> +					      msecs_to_jiffies(len));
> +	if (timeout == 0) {
>  		dmaengine_terminate_sync(cqspi->rx_chan);
>  		dev_err(nor->dev, "DMA wait_for_completion_timeout\n");
>  		ret = -ETIMEDOUT;
> 

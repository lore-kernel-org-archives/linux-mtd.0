Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqP0L-0002PJ-7x
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 15:13:49 +0000
From: Marek Vasut <marex@denx.de>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCHv2 03/10] spi/qspi: Add support to switc to memory mapped
 operation.
Date: Tue, 10 Dec 2013 13:54:43 +0100
References: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
 <1386339891-32717-4-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1386339891-32717-4-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201312101354.43674.marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, balbi@ti.com,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, December 06, 2013 at 03:24:44 PM, Sourav Poddar wrote:
> These add apis that can be used to switch to memory mapped operatons
> by configuring control module and qspi registers.
> It also add "master->mmap" property to show that qspi
> supports memory mapped operation.

Please fix the 'switc' in the subject, should be 'switch' :)

> Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
> ---
> v1->v2:
>  Squash a patch to add mater->mmap here itself.
>  drivers/spi/spi-ti-qspi.c |   29 +++++++++++++++++++++++++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
> index a0cee08..48294d1 100644
> --- a/drivers/spi/spi-ti-qspi.c
> +++ b/drivers/spi/spi-ti-qspi.c
> @@ -113,6 +113,10 @@ struct ti_qspi {
>  #define QSPI_CSPOL(n)			(1 << (1 + n * 8))
>  #define QSPI_CKPOL(n)			(1 << (n * 8))
> 
> +#define MM_SWITCH	(1 << 0)
> +#define MEM_CS		(1 << 8)
> +#define MEM_CS_DIS	(0 << 8)

You might want to be consistent here, I'd use MEM_CS_EN and MEM_CS_DIS. But 
please see below first as MEM_CS_DIS won't be needed, so MEM_CS can be preserved 
as is and MEM_CS_DIS removed altogether.

> +
>  #define	QSPI_FRAME			4096
> 
>  #define QSPI_AUTOSUSPEND_TIMEOUT         2000
> @@ -129,6 +133,30 @@ static inline void ti_qspi_write(struct ti_qspi *qspi,
>  	writel(val, qspi->base + reg);
>  }
> 
> +static void enable_qspi_memory_mapped(struct ti_qspi *qspi)
> +{
> +	u32 val;
> +
> +	ti_qspi_write(qspi, MM_SWITCH, QSPI_SPI_SWITCH_REG);
> +	if (qspi->ctrl_mod) {
> +		val = readl(qspi->ctrl_base);
> +		val |= MEM_CS;
> +		writel(val, qspi->ctrl_base);
> +	}
> +}
> +
> +static void disable_qspi_memory_mapped(struct ti_qspi *qspi)
> +{
> +	u32 val;
> +
> +	ti_qspi_write(qspi, ~MM_SWITCH, QSPI_SPI_SWITCH_REG);
> +	if (qspi->ctrl_mod) {
> +		val = readl(qspi->ctrl_base);
> +		val &= MEM_CS_DIS;

This will likely break once SWITCH_REG contains more than one bit, you can fix 
this by using "val &= ~MEM_CS;" instead, which will also get rid of the 
MEM_CS_DIS bit.

> +		writel(val, qspi->ctrl_base);
> +	}
> +}
> +
>  static int ti_qspi_setup(struct spi_device *spi)
>  {
>  	struct ti_qspi	*qspi = spi_master_get_devdata(spi->master);
> @@ -459,6 +487,7 @@ static int ti_qspi_probe(struct platform_device *pdev)
>  	master->transfer_one_message = ti_qspi_start_transfer_one;
>  	master->dev.of_node = pdev->dev.of_node;
>  	master->bits_per_word_mask = BIT(32 - 1) | BIT(16 - 1) | BIT(8 - 1);
> +	master->mmap = true;
> 
>  	if (!of_property_read_u32(np, "num-cs", &num_cs))
>  		master->num_chipselect = num_cs;

Best regards,
Marek Vasut

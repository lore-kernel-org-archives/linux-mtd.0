Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqP0L-0002PQ-7F
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 15:13:48 +0000
From: Marek Vasut <marex@denx.de>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCHv2 05/10] spi/qspi: Add api for get_buf/put_buf.
Date: Tue, 10 Dec 2013 13:58:46 +0100
References: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
 <1386339891-32717-6-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1386339891-32717-6-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201312101358.46922.marex@denx.de>
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

On Friday, December 06, 2013 at 03:24:46 PM, Sourav Poddar wrote:
> Adapt qspi driver to use (get_buf/put_buf) pointers added
> earlier.
> These can be called just before the memcpy operations to get hold
> of the memory mapped address and to turn on the controller clocks.
> 
> Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
> ---
> v1->v2:
>  enable/disable memory mapped only when get_buf/put_buf is
>  called (basicaaly only when memory mapped read operation is
>  desired).
>  drivers/spi/spi-ti-qspi.c |   19 +++++++++++++++++++
>  1 files changed, 19 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
> index e4a8afc..b83583c 100644
> --- a/drivers/spi/spi-ti-qspi.c
> +++ b/drivers/spi/spi-ti-qspi.c
> @@ -248,6 +248,23 @@ static void ti_qspi_configure_from_slave(struct
> spi_device *spi) ti_qspi_write(qspi, memval, QSPI_SPI_SETUP0_REG);
>  }
> 
> +static inline int  __iomem *ti_qspi_get_mem_buf(struct spi_master *master)

Should this not be a 'void __iomem *' instead of 'int __iomem *' in any case ?

> +{
> +	struct ti_qspi *qspi = spi_master_get_devdata(master);
> +
> +	pm_runtime_get_sync(qspi->dev);
> +	enable_qspi_memory_mapped(qspi);
> +	return qspi->mmap_base;
> +}
> +
> +static void ti_qspi_put_mem_buf(struct spi_master *master)
> +{
> +	struct ti_qspi *qspi = spi_master_get_devdata(master);
> +
> +	disable_qspi_memory_mapped(qspi);
> +	pm_runtime_put(qspi->dev);
> +}
> +
>  static void ti_qspi_restore_ctx(struct ti_qspi *qspi)
>  {
>  	struct ti_qspi_regs *ctx_reg = &qspi->ctx_reg;
> @@ -517,6 +534,8 @@ static int ti_qspi_probe(struct platform_device *pdev)
>  	master->bits_per_word_mask = BIT(32 - 1) | BIT(16 - 1) | BIT(8 - 1);
>  	master->mmap = true;
>  	master->configure_from_slave = ti_qspi_configure_from_slave;
> +	master->get_buf = ti_qspi_get_mem_buf;
> +	master->put_buf = ti_qspi_put_mem_buf;
> 
>  	if (!of_property_read_u32(np, "num-cs", &num_cs))
>  		master->num_chipselect = num_cs;

Best regards,
Marek Vasut

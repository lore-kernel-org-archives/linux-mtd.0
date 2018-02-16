Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1emdDc-0000uj-IU
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 10:26:37 +0000
Date: Fri, 16 Feb 2018 11:25:54 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Mark Brown
 <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc: Peter Pan <peterpansjtu@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>, Yogesh Gaur
 <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>, Sourav Poddar
 <sourav.poddar@ti.com>
Subject: Re: [RFC PATCH 4/6] spi: ti-qspi: Implement the spi_mem interface
Message-ID: <20180216112554.35f79e55@bbrezillon>
In-Reply-To: <20180205232120.5851-5-boris.brezillon@bootlin.com>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-5-boris.brezillon@bootlin.com>
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

On Tue,  6 Feb 2018 00:21:18 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:


> @@ -566,6 +567,62 @@ static int ti_qspi_spi_flash_read(struct spi_device *spi,
>  	return ret;
>  }
>  
> +static int ti_qspi_exec_mem_op(struct spi_mem *mem,
> +			       const struct spi_mem_op *op)
> +{
> +	struct ti_qspi *qspi = spi_master_get_devdata(mem->spi->master);
> +	int i, ret = 0;
> +	u32 from = 0;
> +
> +	/* Only optimize read path. */
> +	if (!op->data.nbytes || op->data.dir != SPI_MEM_DATA_IN ||
> +	    !op->addr.nbytes || op->addr.nbytes > 4)
> +		return -ENOTSUPP;
> +
> +	for (i = 0; i < op->addr.nbytes; i++) {
> +		from <<= 8;
> +		from |= op->addr.buf[i];
> +	}
> +
> +	/* Address exceeds MMIO window size, fall back to regular mode. */
> +	if (from > 0x4000000)
> +		return -ENOTSUPP;
> +
> +	mutex_lock(&qspi->list_lock);
> +
> +	if (!qspi->mmap_enabled)
> +		ti_qspi_enable_memory_map(mem->spi);
> +	ti_qspi_setup_mmap_read(mem->spi, op->cmd.opcode, op->data.buswidth,
> +				op->addr.nbytes, op->dummy.nbytes);
> +
> +	if (qspi->rx_chan) {
> +		struct sg_table sgt;
> +
> +		if (!virt_addr_valid(op->data.buf.in) &&
> +		    !spi_controller_dma_map_mem_op_data(mem->spi->master, op,
> +							&sgt)) {

As Vignesh just reported, it should be virt_addr_valid(op->data.buf.in)
and not !virt_addr_valid(op->data.buf.in).

> +			ret = ti_qspi_dma_xfer_sg(qspi, sgt, from);
> +			spi_controller_dma_unmap_mem_op_data(mem->spi->master,
> +							     op, &sgt);
> +		} else {
> +			ret = ti_qspi_dma_bounce_buffer(qspi, from,
> +							op->data.buf.in,
> +							op->data.nbytes);
> +		}
> +	} else {
> +		memcpy_fromio(op->data.buf.in, qspi->mmap_base + from,
> +			      op->data.nbytes);
> +	}
> +
> +	mutex_unlock(&qspi->list_lock);
> +
> +	return ret;
> +}
> +
> +static const struct spi_controller_mem_ops ti_qspi_mem_ops = {
> +	.exec_op = ti_qspi_exec_mem_op,
> +};
> +
>  static int ti_qspi_start_transfer_one(struct spi_master *master,
>  		struct spi_message *m)
>  {
> @@ -673,6 +730,7 @@ static int ti_qspi_probe(struct platform_device *pdev)
>  	master->bits_per_word_mask = SPI_BPW_MASK(32) | SPI_BPW_MASK(16) |
>  				     SPI_BPW_MASK(8);
>  	master->spi_flash_read = ti_qspi_spi_flash_read;
> +	master->mem_ops = &ti_qspi_mem_ops;
>  
>  	if (!of_property_read_u32(np, "num-cs", &num_cs))
>  		master->num_chipselect = num_cs;
> @@ -785,6 +843,7 @@ static int ti_qspi_probe(struct platform_device *pdev)
>  				 PTR_ERR(qspi->mmap_base));
>  			qspi->mmap_base = NULL;
>  			master->spi_flash_read = NULL;
> +			master->mem_ops = NULL;
>  		}
>  	}
>  	qspi->mmap_enabled = false;



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

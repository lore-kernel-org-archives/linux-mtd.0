Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7bKY-0004x5-4J
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 07:12:23 +0000
Date: Wed, 3 Oct 2018 09:12:00 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Han Xu <han.xu@nxp.com>, Marek Vasut <marek.vasut@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: fsl-quadspi: Don't let -EINVAL on the bus
Message-ID: <20181003091200.4191b2e6@bbrezillon>
In-Reply-To: <20180921093252.9115-1-a.fatoum@pengutronix.de>
References: <20180921093252.9115-1-a.fatoum@pengutronix.de>
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

On Fri, 21 Sep 2018 11:32:53 +0200
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> fsl_qspi_get_seqid() may return -EINVAL, but fsl_qspi_init_ahb_read()
> doesn't check for error codes with the result that -EINVAL could find
> itself signalled over the bus.
> 
> In conjunction with the LS1046A SoC's A-009283 errata
> ("Illegal accesses to SPI flash memory can result in a system hang")
> this illegal access to SPI flash memory results in a system hang
> if userspace attempts reading later on.
> 
> Avoid this by always checking fsl_qspi_get_seqid()'s return value
> and bail out otherwise.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Added

Fixes: e46ecda764dc ("mtd: spi-nor: Add Freescale QuadSPI driver")

and queued it to spi-nor/next.

Thanks,

Boris

> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 7d9620c7ff6c..1bb42e40c38b 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -543,6 +543,9 @@ fsl_qspi_runcmd(struct fsl_qspi *q, u8 cmd, unsigned int addr, int len)
>  
>  	/* trigger the LUT now */
>  	seqid = fsl_qspi_get_seqid(q, cmd);
> +	if (seqid < 0)
> +		return seqid;
> +
>  	qspi_writel(q, (seqid << QUADSPI_IPCR_SEQID_SHIFT) | len,
>  			base + QUADSPI_IPCR);
>  
> @@ -671,7 +674,7 @@ static void fsl_qspi_set_map_addr(struct fsl_qspi *q)
>   * causes the controller to clear the buffer, and use the sequence pointed
>   * by the QUADSPI_BFGENCR[SEQID] to initiate a read from the flash.
>   */
> -static void fsl_qspi_init_ahb_read(struct fsl_qspi *q)
> +static int fsl_qspi_init_ahb_read(struct fsl_qspi *q)
>  {
>  	void __iomem *base = q->iobase;
>  	int seqid;
> @@ -696,8 +699,12 @@ static void fsl_qspi_init_ahb_read(struct fsl_qspi *q)
>  
>  	/* Set the default lut sequence for AHB Read. */
>  	seqid = fsl_qspi_get_seqid(q, q->nor[0].read_opcode);
> +	if (seqid < 0)
> +		return seqid;
> +
>  	qspi_writel(q, seqid << QUADSPI_BFGENCR_SEQID_SHIFT,
>  		q->iobase + QUADSPI_BFGENCR);
> +	return 0;
>  }
>  
>  /* This function was used to prepare and enable QSPI clock */
> @@ -805,9 +812,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>  	fsl_qspi_init_lut(q);
>  
>  	/* Init for AHB read */
> -	fsl_qspi_init_ahb_read(q);
> -
> -	return 0;
> +	return fsl_qspi_init_ahb_read(q);
>  }
>  
>  static const struct of_device_id fsl_qspi_dt_ids[] = {

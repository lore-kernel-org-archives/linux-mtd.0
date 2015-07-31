Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLGvP-0007un-P4
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 20:29:04 +0000
Received: by pdjr16 with SMTP id r16so49088693pdj.3
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2015 13:28:41 -0700 (PDT)
Date: Fri, 31 Jul 2015 13:28:33 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frank.Li@freescale.com
Cc: linux-mtd@lists.infradead.org, b45815@freescale.com, lznuaa@gmail.com
Subject: Re: [PATCH v3 1/8] mtd: spi-nor: fsl-qspi: dynamically map memory
 space for AHB read
Message-ID: <20150731202833.GA10676@google.com>
References: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
 <1437761188-8179-2-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437761188-8179-2-git-send-email-Frank.Li@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Frank,

Thanks for getting all the dependencies in one place, so I can actually
review them. A few comments:

On Sat, Jul 25, 2015 at 02:06:21AM +0800, Frank.Li@freescale.com wrote:
> From: Allen Xu <b45815@freescale.com>
> 
> QSPI may failed to map enough memory (256MB) for AHB read in
> previous implementation, especially in 3G/1G memory layout kernel.
> Dynamically map memory to avoid such issue.
> 
> This implementation generally map 4MB memory for AHB read, it should
> be enough for common scenarios, and the side effect (0.6% performance
> drop) is minor.

So, you're running out of virtual address space? What says 4MB will be
small enough? At a minimum, we should factor out the magic constant
(SZ_4M) to a macro, so that if someone needs to change it, it's
relatively easy.

> Previous implementation
> 
> root@imx6qdlsolo:~# dd if=/dev/mtd0 of=/dev/null bs=1K count=32K
> 32768+0 records in
> 32768+0 records out
> 33554432 bytes (34 MB) copied, 2.16006 s, 15.5 MB/s
> 
> root@imx6qdlsolo:~# dd if=/dev/mtd0 of=/dev/null bs=32M count=1
> 1+0 records in
> 1+0 records out
> 33554432 bytes (34 MB) copied, 1.43149 s, 23.4 MB/s
> 
> After applied the patch
> 
> root@imx6qdlsolo:~# dd if=/dev/mtd0 of=/dev/null bs=1K count=32K
> 32768+0 records in
> 32768+0 records out
> 33554432 bytes (34 MB) copied, 2.1743 s, 15.4 MB/s
> 
> root@imx6qdlsolo:~# dd if=/dev/mtd0 of=/dev/null bs=32M count=1
> 1+0 records in
> 1+0 records out
> 33554432 bytes (34 MB) copied, 1.43158 s, 23.4 MB/s
> 
> Signed-off-by: Allen Xu <b45815@freescale.com>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 48 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 4fe13dd..ac9d633 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -223,8 +223,10 @@ struct fsl_qspi {
>  	struct mtd_info mtd[FSL_QSPI_MAX_CHIP];
>  	struct spi_nor nor[FSL_QSPI_MAX_CHIP];
>  	void __iomem *iobase;
> -	void __iomem *ahb_base; /* Used when read from AHB bus */
> +	void __iomem *ahb_addr;
>  	u32 memmap_phy;
> +	u32 memmap_offs;
> +	u32 memmap_len;
>  	struct clk *clk, *clk_en;
>  	struct device *dev;
>  	struct completion c;
> @@ -732,11 +734,41 @@ static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
>  	struct fsl_qspi *q = nor->priv;
>  	u8 cmd = nor->read_opcode;
>  
> -	dev_dbg(q->dev, "cmd [%x],read from (0x%p, 0x%.8x, 0x%.8x),len:%d\n",
> -		cmd, q->ahb_base, q->chip_base_addr, (unsigned int)from, len);
> +	/* if necessary,ioremap buffer before AHB read, */
> +	/* generally 4MB should be large enough */

Can you use the proper multiline comment style? It would look something
like this:

	/*
	 * If necessary, ioremap buffer before AHB read. Generally, 4MB
	 * should be large enough
	 */

> +	if (!q->ahb_addr) {
> +		q->ahb_addr = ioremap_nocache(
> +				q->memmap_phy + q->chip_base_addr + from,
> +				len > SZ_4M ? len : SZ_4M);

Here, we should factor out the magic constant as its own macro
(QUADSPI_MAX_IOMAP?). You can also reduce the duplication of these
offset and length computations by rearranging this block to look more
like:

		q->memmap_offs = q->chip_base_addr + from;
		q->memmap_len = len > SZ_4M ? len : SZ_4M;
		q->ahb_addr = ioremap_nocache(q->memmap_phy + q->memmap_offs,
					      q->memmap_len);
		if (!q->ahb_addr) {
			...

You can do similarly for the 'else if' clause.

> +		if (!q->ahb_addr) {
> +			dev_err(q->dev, "ioremap failed\n");
> +			return -ENOMEM;
> +		}
> +		q->memmap_offs = q->chip_base_addr + from;
> +		q->memmap_len = len > SZ_4M ? len : SZ_4M;
> +	/* ioremap if the data requested is out of range */
> +	} else if (q->chip_base_addr + from < q->memmap_offs
> +			|| q->chip_base_addr + from + len >
> +			q->memmap_offs + q->memmap_len) {
> +		iounmap(q->ahb_addr);
> +		q->ahb_addr = ioremap_nocache(
> +				q->memmap_phy + q->chip_base_addr + from,
> +				len > SZ_4M ? len : SZ_4M);
> +		if (!q->ahb_addr) {
> +			dev_err(q->dev, "ioremap failed\n");
> +			return -ENOMEM;
> +		}
> +		q->memmap_offs = q->chip_base_addr + from;
> +		q->memmap_len = len > SZ_4M ? len : SZ_4M;
> +	}
> +
> +	dev_dbg(q->dev, "cmd [%x],read from 0x%p, len:%d\n",
> +		cmd, q->ahb_addr + q->chip_base_addr + from - q->memmap_offs,
> +		len);
>  
>  	/* Read out the data directly from the AHB buffer.*/
> -	memcpy(buf, q->ahb_base + q->chip_base_addr + from, len);
> +	memcpy(buf, q->ahb_addr + q->chip_base_addr + from - q->memmap_offs,
> +		len);
>  
>  	*retlen += len;
>  	return 0;
> @@ -821,10 +853,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>  					"QuadSPI-memory");
> -	q->ahb_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(q->ahb_base))
> -		return PTR_ERR(q->ahb_base);
> -

Please reintroduce the call to devm_request_mem_region(). Something
like:

	if (!devm_request_mem_region(dev, res->start, resource_size(res),
				     res->name)) {
		dev_err(dev, "can't request region for resource %pR\n", res);
		return -EBUSY;
	}

>  	q->memmap_phy = res->start;
>  
>  	/* find the clocks */
> @@ -989,6 +1017,10 @@ static int fsl_qspi_remove(struct platform_device *pdev)
>  	mutex_destroy(&q->lock);
>  	clk_unprepare(q->clk);
>  	clk_unprepare(q->clk_en);
> +
> +	if (q->ahb_addr)
> +		iounmap(q->ahb_addr);
> +
>  	return 0;
>  }
>  

Regards,
Brian

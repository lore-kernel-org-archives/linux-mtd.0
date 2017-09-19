Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1duOsy-00082b-FG
 for linux-mtd@lists.infradead.org; Tue, 19 Sep 2017 20:13:07 +0000
Date: Tue, 19 Sep 2017 22:12:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 geert@linux-m68k.org, richard@nod.at, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH] mtd: spi-nor: fix DMA unsafe buffer issue in
 spi_nor_read_sfdp()
Message-ID: <20170919221215.46625560@bbrezillon>
In-Reply-To: <20170906214502.26748-1-cyrille.pitchen@wedev4u.fr>
References: <20170906214502.26748-1-cyrille.pitchen@wedev4u.fr>
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

On Wed,  6 Sep 2017 23:45:02 +0200
Cyrille Pitchen <cyrille.pitchen@wedev4u.fr> wrote:

> spi_nor_read_sfdp() calls nor->read() to read the SFDP data.
> When the m25p80 driver is used (pretty common case), nor->read() is then
> implemented by the m25p80_read() function, which is likely to initialize a
> 'struct spi_transfer' from its buf argument before appending this
> structure inside the 'struct spi_message' argument of spi_sync().
> 
> Besides the SPI sub-system states that both .tx_buf and .rx_buf members of
> 'struct spi_transfer' must point into dma-safe memory. However, two of the
> three calls of spi_nor_read_sfdp() were given pointers to stack allocated
> memory as buf argument, hence not in a dma-safe area.
> Hopefully, the third and last call of spi_nor_read_sfdp() was already
> given a kmalloc'ed buffer argument, hence dma-safe.
> 
> So this patch fixes this issue by introducing a
> spi_nor_read_sfdp_dma_unsafe() function which simply wraps the existing
> spi_nor_read_sfdp() function and uses some kmalloc'ed memory as a bounce
> buffer.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>

Applied.

Thanks,

Boris

> ---
> 
> Compiled but not tested yet!
> 
>  drivers/mtd/spi-nor/spi-nor.c | 36 +++++++++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index cf1d4a15e10a..05254dd6a4a0 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1784,7 +1784,7 @@ spi_nor_set_pp_settings(struct spi_nor_pp_command *pp,
>   * @nor:	pointer to a 'struct spi_nor'
>   * @addr:	offset in the SFDP area to start reading data from
>   * @len:	number of bytes to read
> - * @buf:	buffer where the SFDP data are copied into
> + * @buf:	buffer where the SFDP data are copied into (dma-safe memory)
>   *
>   * Whatever the actual numbers of bytes for address and dummy cycles are
>   * for (Fast) Read commands, the Read SFDP (5Ah) instruction is always
> @@ -1829,6 +1829,36 @@ static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
>  	return ret;
>  }
>  
> +/**
> + * spi_nor_read_sfdp_dma_unsafe() - read Serial Flash Discoverable Parameters.
> + * @nor:	pointer to a 'struct spi_nor'
> + * @addr:	offset in the SFDP area to start reading data from
> + * @len:	number of bytes to read
> + * @buf:	buffer where the SFDP data are copied into
> + *
> + * Wrap spi_nor_read_sfdp() using a kmalloc'ed bounce buffer as @buf is now not
> + * guaranteed to be dma-safe.
> + *
> + * Return: -ENOMEM if kmalloc() fails, the return code of spi_nor_read_sfdp()
> + *          otherwise.
> + */
> +static int spi_nor_read_sfdp_dma_unsafe(struct spi_nor *nor, u32 addr,
> +					size_t len, void *buf)
> +{
> +	void *dma_safe_buf;
> +	int ret;
> +
> +	dma_safe_buf = kmalloc(len, GFP_KERNEL);
> +	if (!dma_safe_buf)
> +		return -ENOMEM;
> +
> +	ret = spi_nor_read_sfdp(nor, addr, len, dma_safe_buf);
> +	memcpy(buf, dma_safe_buf, len);
> +	kfree(dma_safe_buf);
> +
> +	return ret;
> +}
> +
>  struct sfdp_parameter_header {
>  	u8		id_lsb;
>  	u8		minor;
> @@ -2101,7 +2131,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		    bfpt_header->length * sizeof(u32));
>  	addr = SFDP_PARAM_HEADER_PTP(bfpt_header);
>  	memset(&bfpt, 0, sizeof(bfpt));
> -	err = spi_nor_read_sfdp(nor,  addr, len, &bfpt);
> +	err = spi_nor_read_sfdp_dma_unsafe(nor,  addr, len, &bfpt);
>  	if (err < 0)
>  		return err;
>  
> @@ -2243,7 +2273,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  	int i, err;
>  
>  	/* Get the SFDP header. */
> -	err = spi_nor_read_sfdp(nor, 0, sizeof(header), &header);
> +	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
>  	if (err < 0)
>  		return err;
>  

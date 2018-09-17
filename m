Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1tjz-0000vY-PZ
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 13:39:09 +0000
Date: Mon, 17 Sep 2018 15:38:42 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: devices: m25p80: Make the buffer passed in op is
 DMA-able
Message-ID: <20180917153842.3700882e@bbrezillon>
In-Reply-To: <20180917133652.12442-1-boris.brezillon@bootlin.com>
References: <20180917133652.12442-1-boris.brezillon@bootlin.com>
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

Oops. You should read "Make *sure* ...".

On Mon, 17 Sep 2018 15:36:52 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> As documented in spi-mem.h, spi_mem_op->data.buf.{in,out} must be
> DMA-able, and commit 4120f8d158ef ("mtd: spi-nor: Use the spi_mem_xx()
> API") failed to follow this rule as buffers passed to
> ->{read,write}_reg() are usually placed on the stack.  
> 
> Fix that by allocating a scratch buffer and copying the data in there
> before passing it to the spi-mem layer.
> 
> Fixes: 4120f8d158ef ("mtd: spi-nor: Use the spi_mem_xx() API")
> Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Note that the ->{read,write}() path is still buggy since nothing
> guarantees that buffers passed by the MTD layer to the SPI NOR layer
> are DMA-able, but this is a long-standing issue which we'll have to
> address at the spi-nor level (this layer can choose the bounce buffer
> size based on nor->page_size).
> ---
>  drivers/mtd/devices/m25p80.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index cbfafc453274..3b7fafa4bbd6 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -39,14 +39,22 @@ static int m25p80_read_reg(struct spi_nor *nor, u8 code, u8 *val, int len)
>  	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(code, 1),
>  					  SPI_MEM_OP_NO_ADDR,
>  					  SPI_MEM_OP_NO_DUMMY,
> -					  SPI_MEM_OP_DATA_IN(len, val, 1));
> +					  SPI_MEM_OP_DATA_IN(len, NULL, 1));
> +	void *scratchbuf;
>  	int ret;
>  
> +	scratchbuf = kmemdup(val, len, GFP_KERNEL);
> +	if (!scratchbuf)
> +		return -ENOMEM;
> +
> +	op.data.buf.in = scratchbuf;
>  	ret = spi_mem_exec_op(flash->spimem, &op);
>  	if (ret < 0)
>  		dev_err(&flash->spimem->spi->dev, "error %d reading %x\n", ret,
>  			code);
>  
> +	kfree(scratchbuf);
> +
>  	return ret;
>  }
>  
> @@ -56,9 +64,19 @@ static int m25p80_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
>  	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 1),
>  					  SPI_MEM_OP_NO_ADDR,
>  					  SPI_MEM_OP_NO_DUMMY,
> -					  SPI_MEM_OP_DATA_OUT(len, buf, 1));
> +					  SPI_MEM_OP_DATA_OUT(len, NULL, 1));
> +	void *scratchbuf;
> +	int ret;
>  
> -	return spi_mem_exec_op(flash->spimem, &op);
> +	scratchbuf = kmemdup(buf, len, GFP_KERNEL);
> +	if (!scratchbuf)
> +		return -ENOMEM;
> +
> +	op.data.buf.out = scratchbuf;
> +	ret = spi_mem_exec_op(flash->spimem, &op);
> +	kfree(scratchbuf);
> +
> +	return ret;
>  }
>  
>  static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,

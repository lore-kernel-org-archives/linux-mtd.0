Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7bIf-0003IV-OR
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 07:10:27 +0000
Date: Wed, 3 Oct 2018 09:10:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: linux-mtd@lists.infradead.org, frieder.schrempf@exceet.de,
 computersforpeace@gmail.com, david.wolfe@nxp.com, han.xu@nxp.com,
 festevam@gmail.com, marek.vasut@gmail.com, prabhakar.kushwaha@nxp.com,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: devices: m25p80: Make sure WRITE_EN is issued
 before each write
Message-ID: <20181003091003.5fb134e1@bbrezillon>
In-Reply-To: <1528870158-14781-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1528870158-14781-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

On Wed, 13 Jun 2018 11:39:18 +0530
Yogesh Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Some SPI controllers can't write nor->page_size bytes in a single step
> because their TX FIFO is too small, but when that happens we should
> make sure a WRITE_EN command before each write access and READ_SR command
> after each write access is issued.
> 
> The core is already taking care of that, so all we have to do here is
> return the actual number of bytes that were written during the
> spi_mem_exec_op() operation.
> 
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>

Queued to spi-nor/next.

Thanks,

Boris

> ---
>  drivers/mtd/devices/m25p80.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index e84563d..60224fe 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -72,7 +72,6 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>  				   SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
>  				   SPI_MEM_OP_DUMMY(0, 1),
>  				   SPI_MEM_OP_DATA_OUT(len, buf, 1));
> -	size_t remaining = len;
>  	int ret;
>  
>  	/* get transfer protocols. */
> @@ -84,22 +83,16 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>  	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
>  		op.addr.nbytes = 0;
>  
> -	while (remaining) {
> -		op.data.nbytes = remaining < UINT_MAX ? remaining : UINT_MAX;
> -		ret = spi_mem_adjust_op_size(flash->spimem, &op);
> -		if (ret)
> -			return ret;
> -
> -		ret = spi_mem_exec_op(flash->spimem, &op);
> -		if (ret)
> -			return ret;
> +	ret = spi_mem_adjust_op_size(flash->spimem, &op);
> +	if (ret)
> +		return ret;
> +	op.data.nbytes = len < op.data.nbytes ? len : op.data.nbytes;
>  
> -		op.addr.val += op.data.nbytes;
> -		remaining -= op.data.nbytes;
> -		op.data.buf.out += op.data.nbytes;
> -	}
> +	ret = spi_mem_exec_op(flash->spimem, &op);
> +	if (ret)
> +		return ret;
>  
> -	return len;
> +	return op.data.nbytes;
>  }
>  
>  /*

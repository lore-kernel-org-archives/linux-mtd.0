Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKjwa-0000g8-L8
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 13:02:02 +0000
Date: Thu, 8 Nov 2018 14:01:35 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 5/7] mtd: spi_nor: pass DMA-able buffer to
 spi_nor_read_raw()
Message-ID: <20181108140135.09a23152@bbrezillon>
In-Reply-To: <20181108110653.21063-6-tudor.ambarus@microchip.com>
References: <20181108110653.21063-1-tudor.ambarus@microchip.com>
 <20181108110653.21063-6-tudor.ambarus@microchip.com>
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

On Thu, 8 Nov 2018 11:07:16 +0000
<Tudor.Ambarus@microchip.com> wrote:

> spi_nor_read_raw() calls nor->read() which might be implemented
> by the m25p80 driver. m25p80 uses the spi-mem layer which requires
> DMA-able in/out buffers. Pass kmalloc'ed dma buffer to spi_nor_read_raw().
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 79ca1102faed..2eaa21c85483 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2161,7 +2161,7 @@ spi_nor_set_pp_settings(struct spi_nor_pp_command *pp,
>   * @nor:	pointer to a 'struct spi_nor'
>   * @addr:	offset in the serial flash memory
>   * @len:	number of bytes to read
> - * @buf:	buffer where the data is copied into
> + * @buf:	buffer where the data is copied into (dma-safe memory)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> @@ -2868,11 +2868,16 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  					 u8 smpt_len)
>  {
>  	const u32 *ret;
> +	u8 *dma_safe;

I'd prefer to have it named buf, data_buf or scratch_buf...

>  	u32 addr;
>  	int err;
>  	u8 i, ncmds, nmaps;
>  	u8 addr_width, read_opcode, read_dummy;
> -	u8 read_data_mask, data_byte, map_id;
> +	u8 read_data_mask, map_id;
> +

... and have a comment here explaining why your allocating the buffer
instead of using a local var placed on the stack.

> +	dma_safe = kmalloc(sizeof(*dma_safe), GFP_KERNEL | GFP_DMA);

Please don't use GFP_DMA, kmalloc() should already return a DMA-safe
buffer (see [1]).

> +	if (!dma_safe)
> +		return ERR_PTR(-ENOMEM);
>  
>  	addr_width = nor->addr_width;
>  	read_dummy = nor->read_dummy;
> @@ -2890,7 +2895,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  		nor->read_opcode = SMPT_CMD_OPCODE(smpt[i]);
>  		addr = smpt[i + 1];
>  
> -		err = spi_nor_read_raw(nor, addr, 1, &data_byte);
> +		err = spi_nor_read_raw(nor, addr, 1, dma_safe);
>  		if (err) {
>  			ret = ERR_PTR(err);
>  			goto out;
> @@ -2900,7 +2905,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  		 * Build an index value that is used to select the Sector Map
>  		 * Configuration that is currently in use.
>  		 */
> -		map_id = map_id << 1 | !!(data_byte & read_data_mask);
> +		map_id = map_id << 1 | !!(*dma_safe & read_data_mask);
>  		ncmds++;
>  	}
>  
> @@ -2941,6 +2946,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>  
>  	/* fall through */
>  out:
> +	kfree(dma_safe);
>  	nor->addr_width = addr_width;
>  	nor->read_dummy = read_dummy;
>  	nor->read_opcode = read_opcode;

[1]https://elixir.bootlin.com/linux/latest/source/include/linux/gfp.h#L263

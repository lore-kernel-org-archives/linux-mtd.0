Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4hiC-0004CC-OY
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2018 07:24:50 +0000
Subject: Re: [PATCH] mtd: spi-nor: cadence-quadspi: Use proper enum for
 dma_unmap_single
To: Nathan Chancellor <natechancellor@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20180921102944.27968-1-natechancellor@gmail.com>
From: Tudor Ambarus <tudor.ambarus@microchip.com>
Message-ID: <5e1d2e30-764f-f3a9-d0c1-7a6c81f296b7@microchip.com>
Date: Tue, 25 Sep 2018 10:24:04 +0300
MIME-Version: 1.0
In-Reply-To: <20180921102944.27968-1-natechancellor@gmail.com>
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

Hi, Nathan,

On 09/21/2018 01:29 PM, Nathan Chancellor wrote:
> Clang warns when one enumerated type is converted implicitly to another.
> 
> drivers/mtd/spi-nor/cadence-quadspi.c:962:47: warning: implicit
> conversion from enumeration type 'enum dma_transfer_direction' to
> different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
>         dma_dst = dma_map_single(nor->dev, buf, len, DMA_DEV_TO_MEM);
>                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> ./include/linux/dma-mapping.h:428:66: note: expanded from macro
> 'dma_map_single'
> #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
>                                    ~~~~~~~~~~~~~~~~~~~~          ^
> drivers/mtd/spi-nor/cadence-quadspi.c:997:43: warning: implicit
> conversion from enumeration type 'enum dma_transfer_direction' to
> different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
>         dma_unmap_single(nor->dev, dma_dst, len, DMA_DEV_TO_MEM);
>         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> ./include/linux/dma-mapping.h:429:70: note: expanded from macro
> 'dma_unmap_single'
> #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, 0)
>                                      ~~~~~~~~~~~~~~~~~~~~~~          ^
> 2 warnings generated.
> 
> Use the proper enums from dma_data_direction to satisfy Clang.
> 
> DMA_TO_DEVICE = DMA_MEM_TO_DEV = 1
> DMA_FROM_DEVICE = DMA_DEV_TO_MEM = 2
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/108
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 8e714fbfa521..d0e57ac81098 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -959,7 +959,7 @@ static int cqspi_direct_read_execute(struct spi_nor *nor, u_char *buf,
>  		return 0;
>  	}
>  
> -	dma_dst = dma_map_single(nor->dev, buf, len, DMA_DEV_TO_MEM);
> +	dma_dst = dma_map_single(nor->dev, buf, len, DMA_FROM_DEVICE);
>  	if (dma_mapping_error(nor->dev, dma_dst)) {
>  		dev_err(nor->dev, "dma mapping failed\n");
>  		return -ENOMEM;
> @@ -994,7 +994,7 @@ static int cqspi_direct_read_execute(struct spi_nor *nor, u_char *buf,
>  	}
>  
>  err_unmap:
> -	dma_unmap_single(nor->dev, dma_dst, len, DMA_DEV_TO_MEM);
> +	dma_unmap_single(nor->dev, dma_dst, len, DMA_TO_DEVICE);

Should have used DMA_FROM_DEVICE, as you did above. Otherwise looks good.

Cheers,
ta

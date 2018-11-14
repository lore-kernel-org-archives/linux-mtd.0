Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMvjh-0006bF-Kk
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2018 14:01:43 +0000
Date: Wed, 14 Nov 2018 15:01:23 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Liu Xiang <liu.xiang6@zte.com.cn>
Cc: linux-mtd@lists.infradead.org, marek.vasut@gmail.com, richard@nod.at,
 linux-kernel@vger.kernel.org, liuxiang_1999@126.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Add 4B_OPCODES flag to is25lp256
Message-ID: <20181114150123.65623741@bbrezillon>
In-Reply-To: <1542200118-3024-1-git-send-email-liu.xiang6@zte.com.cn>
References: <1542200118-3024-1-git-send-email-liu.xiang6@zte.com.cn>
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

On Wed, 14 Nov 2018 20:55:18 +0800
Liu Xiang <liu.xiang6@zte.com.cn> wrote:

> The is25lp256 supports 4-byte opcodes and quad output.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>

This one looks good. Tudor, can you have a look?

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 3e54e31..3eba13a 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1357,7 +1357,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
>  			SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
> -			SECT_4K | SPI_NOR_DUAL_READ) },
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128,

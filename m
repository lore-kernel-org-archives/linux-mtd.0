Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLlNl-00057w-Sx
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 08:46:15 +0000
Date: Sun, 11 Nov 2018 09:45:59 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Liu Xiang <liu.xiang6@zte.com.cn>
Cc: linux-mtd@lists.infradead.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, liuxiang_1999@126.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Add 4-byte address support for is25lp256
Message-ID: <20181111094559.386f15e6@bbrezillon>
In-Reply-To: <1535121701-2925-1-git-send-email-liu.xiang6@zte.com.cn>
References: <1535121701-2925-1-git-send-email-liu.xiang6@zte.com.cn>
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

Hi Liu,

On Fri, 24 Aug 2018 22:41:41 +0800
Liu Xiang <liu.xiang6@zte.com.cn> wrote:

> The is25lp256 supports 4-byte opcodes and quad output.
> In is25lp256, the DWORD1 of JEDEC Basic Flash Parameter Header
> is 0xfff920e5. So the DWORD1[18:17] Address Bytes bits are 0b00,
> means that 3-Byte only addressing. Now this limits nor->addr_width
> to 3 and makes it inpossible to access the address above 16MB.
> I think the size of flash is the most important judgement for
> nor->addr_width. Once the size is larger than 16MB, nor->addr_width
> must be 4. This can avoid the bad situation that manufacturer sets
> incorrect value of register.

Please split this patch:
- Add 4B_OPCODES flag to is25lp256
- Rework the ->addr_width selection logic (more about that below).

> 
> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d9c368c..0203b09 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1065,7 +1065,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
>  			SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
> -			SECT_4K | SPI_NOR_DUAL_READ) },
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128,
> @@ -2926,16 +2926,16 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (ret)
>  		return ret;
>  
> -	if (nor->addr_width) {
> -		/* already configured from SFDP */
> -	} else if (info->addr_width) {
> -		nor->addr_width = info->addr_width;
> -	} else if (mtd->size > 0x1000000) {
> +	if (mtd->size > 0x1000000) {
>  		/* enable 4-byte addressing if the device exceeds 16MiB */
>  		nor->addr_width = 4;
>  		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
> -		    info->flags & SPI_NOR_4B_OPCODES)
> +			info->flags & SPI_NOR_4B_OPCODES)
>  			spi_nor_set_4byte_opcodes(nor, info);
> +	} else if (nor->addr_width) {
> +		/* already configured from SFDP */
> +	} else if (info->addr_width) {
> +		nor->addr_width = info->addr_width;
>  	} else {
>  		nor->addr_width = 3;
>  	}

We'd rather return an error and warn users when nor->addr_width does not
match the device size than fix this mismatch silently.

Regards,

Boris

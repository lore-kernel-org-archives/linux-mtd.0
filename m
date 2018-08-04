Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1flujO-0000Wb-Ms
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 11:28:24 +0000
Received: by mail-wm0-x243.google.com with SMTP id s9-v6so8913913wmh.3
 for <linux-mtd@lists.infradead.org>; Sat, 04 Aug 2018 04:28:11 -0700 (PDT)
Subject: Re: [PATCH] spi-nor: add support for is25wp256d
To: Palmer Dabbelt <palmer@sifive.com>, linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at, linux-kernel@vger.kernel.org,
 "Wesley W. Terpstra" <wesley@sifive.com>
References: <20180804014947.24601-1-palmer@sifive.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <6acaba6b-b645-7098-45f6-e37abc3414a8@gmail.com>
Date: Sat, 4 Aug 2018 11:27:54 +0200
MIME-Version: 1.0
In-Reply-To: <20180804014947.24601-1-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8
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

On 08/04/2018 03:49 AM, Palmer Dabbelt wrote:
> From: "Wesley W. Terpstra" <wesley@sifive.com>
> 
> This is used of the HiFive Unleashed development board.
> 
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 47 ++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/mtd/spi-nor.h   |  2 ++
>  2 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d9c368c44194..e9a3557a3c23 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1072,6 +1072,9 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "is25wp256d", INFO(0x9d7019, 0, 32 * 1024, 1024,

Is there a reason for the trailing 'd' in is25wp256d ? I'd drop it.

> +	                SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
> +	},
>  
>  	/* Macronix */
>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> @@ -1515,6 +1518,45 @@ static int macronix_quad_enable(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +/**
> + * issi_unlock() - clear BP[0123] write-protection.
> + * @nor:	pointer to a 'struct spi_nor'
> + *
> + * Bits [2345] of the Status Register are BP[0123].
> + * ISSI chips use a different block protection scheme than other chips.
> + * Just disable the write-protect unilaterally.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int issi_unlock(struct spi_nor *nor)
> +{
> +	int ret, val;
> +	u8 mask = SR_BP0 | SR_BP1 | SR_BP2 | SR_BP3;
> +
> +	val = read_sr(nor);
> +	if (val < 0)
> +		return val;
> +	if (!(val & mask))
> +		return 0;
> +
> +	write_enable(nor);
> +
> +	write_sr(nor, val & ~mask);
> +
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		return ret;
> +
> +	ret = read_sr(nor);
> +	if (ret > 0 && !(ret & mask)) {
> +		dev_info(nor->dev, "ISSI Block Protection Bits cleared\n");
> +		return 0;

Is the dev_info() really needed ?

> +	} else {
> +		dev_err(nor->dev, "ISSI Block Protection Bits not cleared\n");
> +		return -EINVAL;
> +	}
> +}

[...]
-- 
Best regards,
Marek Vasut

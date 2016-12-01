Received: from mail-wj0-x244.google.com ([2a00:1450:400c:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCTvt-0005Nm-F1
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 16:10:03 +0000
Received: by mail-wj0-x244.google.com with SMTP id he10so12716198wjc.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 08:09:39 -0800 (PST)
Subject: Re: [PATCH v8] mtd: spi-nor: Add support for S3AN spi-nor devices
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20161124165608.29816-1-ricardo.ribalda@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1e8b99b6-1110-70ae-e299-1c2c153a1908@gmail.com>
Date: Thu, 1 Dec 2016 17:05:00 +0100
MIME-Version: 1.0
In-Reply-To: <20161124165608.29816-1-ricardo.ribalda@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/24/2016 05:56 PM, Ricardo Ribalda Delgado wrote:
> Xilinx Spartan-3AN FPGAs contain an In-System Flash where they keep
> their configuration data and (optionally) some user data.
> 
> The protocol of this flash follows most of the spi-nor standard. With
> the following differences:
> 
> - Page size might not be a power of two.
> - The address calculation (default addressing mode).
> - The spi nor commands used.
> 
> Protocol is described on Xilinx User Guide UG333
> 
> Reviewed-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---

Hi, minor questions/nits below.

[...]

> -Remove inline qualifier
> -Improve documentation of Default Addressing Mode
> -Convert function callbacks into SNOR_F_
> -Fix missmatch braces
> -Improve documentation of SPI_S3AN flag
> 
>  drivers/mtd/spi-nor/spi-nor.c | 134 ++++++++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/spi-nor.h   |  12 ++++
>  2 files changed, 141 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165d7d66..cf0410d4e258 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -75,6 +75,12 @@ struct flash_info {
>  					 * bit. Must be used with
>  					 * SPI_NOR_HAS_LOCK.
>  					 */
> +#define	SPI_S3AN		BIT(10)	/*
> +					 * Xilinx Spartan 3AN In-System Flash
> +					 * (MFR cannot be used for probing
> +					 * because it has the same value as
> +					 * ATMEL flashes)
> +					 */

I have possibly off-topic question. Altera has something very similar --
EPCS/EPCQ flash which cannot be detected using standard READID .
Would this patch help with supporting those degenerate flashes too?

>  };
>  
>  #define JEDEC_MFR(info)	((info)->id[0])

[...]

> @@ -1170,8 +1241,15 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  
>  	for (i = 0; i < len; ) {
>  		ssize_t written;
> +		loff_t addr = to + i;
> +
> +		if (hweight32(nor->page_size) == 1) {
> +			page_offset = addr & (nor->page_size - 1);
> +		} else {
> +			uint64_t aux = addr;
>  
> -		page_offset = (to + i) & (nor->page_size - 1);
> +			page_offset = do_div(aux, nor->page_size);
> +		}

Why is this part necessary ?

>  		WARN_ONCE(page_offset,
>  			  "Writing at offset %zu into a NOR page. Writing partial pages may decrease reliability and increase wear of NOR flash.",
>  			  page_offset);

[...]

> +static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
> +{
> +	int ret;
> +	u8 val;
> +
> +	ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error %d reading XRDSR\n", (int) ret);
> +		return ret;
> +	}
> +
> +	nor->erase_opcode = SPINOR_OP_XSE;
> +	nor->program_opcode = SPINOR_OP_XPP;
> +	nor->read_opcode = SPINOR_OP_READ;
> +	nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> +
> +	/* Flash in Power of 2 mode */
> +	if (val & XSR_PAGESIZE) {
> +		nor->page_size = (nor->page_size == 264) ? 256 : 512;

264 is due to some ECC ?

> +		nor->mtd.writebufsize = nor->page_size;
> +		nor->mtd.size = 8 * nor->page_size * info->n_sectors;
> +		nor->mtd.erasesize = 8 * nor->page_size;
> +	} else {
> +		nor->flags |= SNOR_F_S3AN_ADDR_DEFAULT;
> +	}
> +
> +	return 0;
> +}

[...]

-- 
Best regards,
Marek Vasut

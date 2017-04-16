Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czsiA-0007lH-CS
 for linux-mtd@lists.infradead.org; Sun, 16 Apr 2017 22:32:04 +0000
Received: by mail-wm0-x242.google.com with SMTP id q125so6495261wmd.3
 for <linux-mtd@lists.infradead.org>; Sun, 16 Apr 2017 15:31:45 -0700 (PDT)
Subject: Re: [RFC PATCH v6 4/4] mtd: spi-nor: add spi_nor_init() function
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, kdasu.kdev@gmail.com
References: <cover.1492374675.git.cyrille.pitchen@atmel.com>
 <c1284f6bbb0284fccd1254066e1daeae6f95dc12.1492374675.git.cyrille.pitchen@atmel.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, jartur@cadence.com, mar.krzeminski@gmail.com
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <7c5abf12-380c-8c46-731c-950d90c89dbd@gmail.com>
Date: Mon, 17 Apr 2017 00:31:30 +0200
MIME-Version: 1.0
In-Reply-To: <c1284f6bbb0284fccd1254066e1daeae6f95dc12.1492374675.git.cyrille.pitchen@atmel.com>
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

On 04/16/2017 11:41 PM, Cyrille Pitchen wrote:
> This patch extracts some chunks from spi_nor_scan() and moves them into
> a new spi_nor_init() function.
> 
> Indeed, spi_nor_init() regroups all the required SPI flash commands to be
> sent to the SPI flash memory before performing any runtime operations
> (Fast Read, Page Program, Sector Erase, ...). Hence spi_nor_init():
> 1) removes the flash protection if applicable for certain vendors.
> 2) sets the Quad Enable bit, if needed, before using Quad SPI protocols.
> 3) makes the memory enter its (stateful) 4-byte address mode, if needed,
>    for SPI flash memory > 128Mbits not supporting the 4-byte address
>    instruction set.
> 
> spi_nor_scan() now ends by calling spi_nor_init() once the probe phase has
> completed. Further patches could also use spi_nor_init() to implement the
> mtd->_resume() handler for the spi-nor framework.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 71 ++++++++++++++++++++++++++++---------------
>  include/linux/mtd/spi-nor.h   |  8 +++++
>  2 files changed, 55 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 2377fe54f8b9..523fd9d85f57 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -255,6 +255,8 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
>  	nor->read_opcode = spi_nor_convert_3to4_read(nor->read_opcode);
>  	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
>  	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
> +
> +	nor->flags |= SNOR_F_4B_OPCODES;
>  }
>  
>  /* Enable/disable 4-byte addressing mode. */
> @@ -1836,6 +1838,45 @@ static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
>  	return 0;
>  }
>  
> +static int spi_nor_init(struct spi_nor *nor)
> +{
> +	const struct flash_info *info = nor->info;
> +	struct device *dev = nor->dev;
> +	int ret;
> +
> +	/*
> +	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
> +	 * with the software protection bits set
> +	 */
> +
> +	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
> +	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
> +	    JEDEC_MFR(info) == SNOR_MFR_SST ||
> +	    info->flags & SPI_NOR_HAS_LOCK) {
> +		write_enable(nor);
> +		write_sr(nor, 0);
> +		spi_nor_wait_till_ready(nor);
> +	}
> +
> +	/* Set the Quad Enable bit, if needed. */
> +	if (nor->flash_quad_enable) {
> +		ret = nor->flash_quad_enable(nor);
> +		if (ret) {
> +			dev_err(dev, "quad mode not supported\n");

Do we care about undoing changes (like doing write_disable()) in case of
failure ?

Also, if we have flash_quad_enable() and it fails, should we fall back
to 1-1-1 or something ?

> +			return ret;
> +		}
> +	}
> +
> +	/*
> +	 * For SPI flash memories above 128Mib, enter the 4-byte address mode
> +	 * only if the 4-byte address instruction set is not supported.
> +	 */
> +	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES))
> +		set_4byte(nor, info, 1);
> +
> +	return 0;
> +}
> +

[...]

-- 
Best regards,
Marek Vasut

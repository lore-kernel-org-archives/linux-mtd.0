Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bynZZ-0006nu-Qe
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 22:18:27 +0000
Subject: Re: [PATCH v3 2/9] mtd: spi-nor: add an alternative method to support
 memory >16MiB
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
References: <cover.1477325128.git.cyrille.pitchen@atmel.com>
 <87ace1a307f4d9899a84108de999a2eeb151da1a.1477325128.git.cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-kernel@vger.kernel.org
From: Marek Vasut <marex@denx.de>
Message-ID: <6eb07d71-cd1c-fa96-f576-c3ab6a62d246@denx.de>
Date: Tue, 25 Oct 2016 00:10:57 +0200
MIME-Version: 1.0
In-Reply-To: <87ace1a307f4d9899a84108de999a2eeb151da1a.1477325128.git.cyrille.pitchen@atmel.com>
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

On 10/24/2016 06:34 PM, Cyrille Pitchen wrote:
> This patch provides an alternative mean to support memory above 16MiB
> (128Mib) by replacing 3byte address op codes by their associated 4byte
> address versions.
> 
> Using the dedicated 4byte address op codes doesn't change the internal
> state of the SPI NOR memory as opposed to using other means such as
> updating a Base Address Register (BAR) and sending command to enter/leave
> the 4byte mode.
> 
> Hence when a CPU reset occurs, early bootloaders don't need to be aware
> of BAR value or 4byte mode being enabled: they can still access the first
> 16MiB of the SPI NOR memory using the regular 3byte address op codes.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Tested-by: Vignesh R <vigneshr@ti.com>
> ---
>  drivers/mtd/devices/serial_flash_cmds.h |   7 ---
>  drivers/mtd/devices/st_spi_fsm.c        |  28 ++++-----
>  drivers/mtd/spi-nor/spi-nor.c           | 104 +++++++++++++++++++++++++-------
>  include/linux/mtd/spi-nor.h             |  22 +++++--
>  4 files changed, 113 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/mtd/devices/serial_flash_cmds.h b/drivers/mtd/devices/serial_flash_cmds.h
> index f59a125295d0..8b81e15105dd 100644
> --- a/drivers/mtd/devices/serial_flash_cmds.h
> +++ b/drivers/mtd/devices/serial_flash_cmds.h
> @@ -18,19 +18,12 @@
>  #define SPINOR_OP_RDVCR		0x85
>  
>  /* JEDEC Standard - Serial Flash Discoverable Parmeters (SFDP) Commands */
> -#define SPINOR_OP_READ_1_2_2	0xbb	/* DUAL I/O READ */
> -#define SPINOR_OP_READ_1_4_4	0xeb	/* QUAD I/O READ */
> -
>  #define SPINOR_OP_WRITE		0x02	/* PAGE PROGRAM */
>  #define SPINOR_OP_WRITE_1_1_2	0xa2	/* DUAL INPUT PROGRAM */
>  #define SPINOR_OP_WRITE_1_2_2	0xd2	/* DUAL INPUT EXT PROGRAM */
>  #define SPINOR_OP_WRITE_1_1_4	0x32	/* QUAD INPUT PROGRAM */
>  #define SPINOR_OP_WRITE_1_4_4	0x12	/* QUAD INPUT EXT PROGRAM */
>  
> -/* READ commands with 32-bit addressing */
> -#define SPINOR_OP_READ4_1_2_2	0xbc
> -#define SPINOR_OP_READ4_1_4_4	0xec
> -

It'd be nice to have this move/rename bit factored out into a separate
patch.

>  /* Configuration flags */
>  #define FLASH_FLAG_SINGLE	0x000000ff
>  #define FLASH_FLAG_READ_WRITE	0x00000001
> diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
> index 5454b4113589..804313a33f2b 100644

[...]

> +static u8 spi_nor_convert_opcode(u8 opcode,
> +				 const struct spi_nor_address_entry *entries,
> +				 size_t num_entries)
> +{
> +	int min, max;
> +
> +	min = 0;
> +	max = num_entries - 1;
> +	while (min <= max) {

It's really not clear at all what this function does, so please add a
comment.

> +		int mid = (min + max) >> 1;
> +		const struct spi_nor_address_entry *entry = &entries[mid];
> +
> +		if (opcode == entry->src_opcode)
> +			return entry->dst_opcode;
> +
> +		if (opcode < entry->src_opcode)
> +			max = mid - 1;
> +		else
> +			min = mid + 1;
> +	}
> +
> +	/* No conversion found */
> +	return opcode;
> +}
> +
> +static u8 spi_nor_3to4_opcode(u8 opcode)
> +{
> +	/* MUST be sorted by 3byte opcode */

Because ... why ?

> +#define ENTRY_3TO4(_opcode)	{ _opcode, _opcode##_4B }

Will this break/be unflexible for flashes with some different 4B opcodes ?

> +	static const struct spi_nor_address_entry spi_nor_3to4_table[] = {
> +		ENTRY_3TO4(SPINOR_OP_PP),		/* 0x02 */
> +		ENTRY_3TO4(SPINOR_OP_READ),		/* 0x03 */
> +		ENTRY_3TO4(SPINOR_OP_READ_FAST),	/* 0x0b */
> +		ENTRY_3TO4(SPINOR_OP_BE_4K),		/* 0x20 */
> +		ENTRY_3TO4(SPINOR_OP_PP_1_1_4),		/* 0x32 */
> +		ENTRY_3TO4(SPINOR_OP_PP_1_4_4),		/* 0x38 */
> +		ENTRY_3TO4(SPINOR_OP_READ_1_1_2),	/* 0x3b */
> +		ENTRY_3TO4(SPINOR_OP_BE_32K),		/* 0x52 */
> +		ENTRY_3TO4(SPINOR_OP_READ_1_1_4),	/* 0x6b */
> +		ENTRY_3TO4(SPINOR_OP_READ_1_2_2),	/* 0xbb */
> +		ENTRY_3TO4(SPINOR_OP_SE),		/* 0xd8 */
> +		ENTRY_3TO4(SPINOR_OP_READ_1_4_4),	/* 0xeb */
> +	};
> +#undef ENTRY_3TO4
> +
> +	return spi_nor_convert_opcode(opcode, spi_nor_3to4_table,
> +				      ARRAY_SIZE(spi_nor_3to4_table));
> +}
> +

[...]

-- 
Best regards,
Marek Vasut

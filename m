Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czPjH-0008Nv-E2
 for linux-mtd@lists.infradead.org; Sat, 15 Apr 2017 15:35:17 +0000
Received: by mail-wr0-x241.google.com with SMTP id l44so15530102wrc.2
 for <linux-mtd@lists.infradead.org>; Sat, 15 Apr 2017 08:34:52 -0700 (PDT)
Subject: Re: [RFC PATCH v5 4/6] mtd: spi-nor: add support to non-uniform SPI
 NOR flash memories
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, jartur@cadence.com, kdasu.kdev@gmail.com,
 mar.krzeminski@gmail.com
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
 <fa832746dedee8d1b6ea97b0418f22da81031606.1490220411.git.cyrille.pitchen@atmel.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5cb3f0f1-b932-7d79-7aaf-2e08952b3a2c@gmail.com>
Date: Sat, 15 Apr 2017 17:24:45 +0200
MIME-Version: 1.0
In-Reply-To: <fa832746dedee8d1b6ea97b0418f22da81031606.1490220411.git.cyrille.pitchen@atmel.com>
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

On 03/23/2017 12:33 AM, Cyrille Pitchen wrote:

Hrmmmm, sigh, took me almost month to review this one, sorry :(

> This patch is a first step in introducing  the support of SPI memories
> with non-uniform erase sizes like Spansion s25fs512s.
> 
> It introduces the memory erase map which splits the memory array into one
> or many erase regions. Each erase region supports up to 4 erase commands,
> as defined by the JEDEC JESD216B (SFDP) specification.
> In turn, an erase command is defined by an op code and a sector size.
> 
> To be backward compatible, the erase map of uniform SPI NOR flash memories
> is initialized so it contains only one erase region and this erase region
> supports only one erase command. Hence a single size is used to erase any
> sector/block of the memory.
> 
> Besides, since the algorithm used to erase sectors on non-uniform SPI NOR
> flash memories is quite expensive, when possible, the erase map is tuned
> to come back to the uniform case.
> 
> This is a transitional patch: non-uniform erase maps will be used later
> when initialized based on the SFDP data.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

[...]

Before I dive into the code, I have two questions:

1) On ie. 128 MiB part, how many struct spi_nor_erase_region {}
   instances would be allocated in total (consider you support
   4k, 64k and 32M erase opcodes) ? Three ?

2) Would it make sense to represent the erase regions as a tree instead?
   For example

      [ region with 32MiB die erase opcode , start=0 , count=4 ]
            |
            V
[ region with 64k erase opcode ][ region with 64k erase opcode ]
[       start=0, count=1       ][      start=0, count=511      ]
            |
            V
[ region with 4k erase opcode ]
[      start=0, count=16      ]

I think it'd make the lookup for the best-fitting opcode combination
faster if the user decides to erase some arbitrarily-aligned block of
the flash.

What do you think ?

Note this tree-based approach does not handle the cases where erase
regions would overlap, although I doubt that could be a problem .

> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index d270788f5ab6..c12cafe99bee 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -216,6 +216,55 @@ enum spi_nor_option_flags {
>  };
>  
>  /**
> + * struct spi_nor_erase_command - Structure to describe a SPI NOR erase command
> + * @size:		the size of the sector/block erased by the command.
> + * @size_shift:		the size shift: if @size is a power of 2 then the shift
> + *			is stored in @size_shift, otherwise @size_shift is zero.
> + * @size_mask:		the size mask based on @size_shift.
> + * @opcode:		the SPI command op code to erase the sector/block.
> + */
> +struct spi_nor_erase_command {
> +	u32	size;
> +	u32	size_shift;
> +	u32	size_mask;
> +	u8	opcode;
> +};
> +
> +/**
> + * struct spi_nor_erase_region - Structure to describe a SPI NOR erase region
> + * @offset:		the offset in the data array of erase region start.
> + *			LSB bits are used as a bitmask encoding the erase
> + *			commands supported inside this erase region.
> + * @size:		the size of the region in bytes.
> + */
> +struct spi_nor_erase_region {
> +	u64		offset;
> +	u64		size;
> +};
> +
> +#define SNOR_CMD_ERASE_MAX	4
> +#define SNOR_CMD_ERASE_MASK	GENMASK_ULL(SNOR_CMD_ERASE_MAX - 1, 0)
> +#define SNOR_CMD_ERASE_OFFSET(_cmd_mask, _offset)	\
> +	((((u64)(_offset)) & ~SNOR_CMD_ERASE_MASK) |	\
> +	 (((u64)(_cmd_mask)) & SNOR_CMD_ERASE_MASK))
> +
> +/**
> + * struct spi_nor_erase_map - Structure to describe the SPI NOR erase map
> + * @commands:		an array of erase commands shared by all the regions.
> + * @uniform_region:	a pre-allocated erase region for SPI NOR with a uniform
> + *			sector size (legacy implementation).
> + * @regions:		point to an array describing the boundaries of the erase
> + *			regions.
> + * @num_regions:	the number of elements in the @regions array.
> + */
> +struct spi_nor_erase_map {
> +	struct spi_nor_erase_command	commands[SNOR_CMD_ERASE_MAX];
> +	struct spi_nor_erase_region	uniform_region;
> +	struct spi_nor_erase_region	*regions;
> +	u32				num_regions;
> +};
> +
> +/**
>   * struct flash_info -	Forward declaration of a structure used internally by
>   *			spi_nor_scan() and spi_nor_init().
>   */
> @@ -238,6 +287,7 @@ struct flash_info;
>   * @write_proto:	the SPI protocol for write operations
>   * @reg_proto		the SPI protocol for read_reg/write_reg/erase operations
>   * @cmd_buf:		used by the write_reg
> + * @erase_map:		the erase map of the SPI NOR
>   * @prepare:		[OPTIONAL] do some preparations for the
>   *			read/write/erase/lock/unlock operations
>   * @unprepare:		[OPTIONAL] do some post work after the
> @@ -273,6 +323,7 @@ struct spi_nor {
>  	bool			sst_write_second;
>  	u32			flags;
>  	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
> +	struct spi_nor_erase_map	erase_map;
>  
>  	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
>  	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
> @@ -293,6 +344,11 @@ struct spi_nor {
>  	void *priv;
>  };
>  
> +static inline bool spi_nor_has_uniform_erase(const struct spi_nor *nor)
> +{
> +	return (nor->erase_map.regions == &nor->erase_map.uniform_region);
> +}
> +
>  static inline void spi_nor_set_flash_node(struct spi_nor *nor,
>  					  struct device_node *np)
>  {
> 


-- 
Best regards,
Marek Vasut

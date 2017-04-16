Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czsiA-0007l9-CV
 for linux-mtd@lists.infradead.org; Sun, 16 Apr 2017 22:32:04 +0000
Received: by mail-wm0-x242.google.com with SMTP id d79so6518502wmi.2
 for <linux-mtd@lists.infradead.org>; Sun, 16 Apr 2017 15:31:41 -0700 (PDT)
Subject: Re: [PATCH v6 1/4] mtd: spi-nor: introduce more SPI protocols and the
 Dual Transfer Mode
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, kdasu.kdev@gmail.com
References: <cover.1492374675.git.cyrille.pitchen@atmel.com>
 <8586e18a0dcae7a5969201b1bf5dbde29ff24449.1492374675.git.cyrille.pitchen@atmel.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, jartur@cadence.com, mar.krzeminski@gmail.com
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <0c730ece-cb37-1ce2-dc3c-8fe2f1a63abb@gmail.com>
Date: Mon, 17 Apr 2017 00:26:04 +0200
MIME-Version: 1.0
In-Reply-To: <8586e18a0dcae7a5969201b1bf5dbde29ff24449.1492374675.git.cyrille.pitchen@atmel.com>
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
> This patch changes the prototype of spi_nor_scan(): its 3rd parameter
> is replaced by a 'struct spi_nor_hwcaps' pointer, which tells the spi-nor
> framework about the actual hardware capabilities supported by the SPI
> controller and its driver.
> 
> Besides, this patch also introduces a new 'struct spi_nor_flash_parameter'
> telling the spi-nor framework about the hardware capabilities supported by
> the SPI flash memory and the associated settings required to use those
> hardware caps.
> 
> Currently the 'struct spi_nor_flash_parameter' is filled with legacy
> values but a later patch will allow to fill it dynamically by reading the
> JESD216 Serial Flash Discoverable Parameter (SFDP) tables from the SPI
> memory.
> 
> With both structures, the spi-nor framework can now compute the best
> match between hardware caps supported by both the (Q)SPI memory and
> controller hence selecting the relevant SPI protocols and op codes for
> (Fast) Read and Page Program operations.
> 
> The 'struct spi_nor_flash_parameter' also provides the spi-nor framework
> with the number of dummy cycles to be used with each Fast Read commands.
> 
> Finally the 'struct spi_nor_flash_parameter', through the optional
> .quad_enable() hook, tells the spi-nor framework how to set the Quad
> Enable (QE) bit of the QSPI memory to enable its Quad SPI features.
> For now the .quad_enable() hook is set with the exact same functions as
> already used before this patch: the right function was and is still
> chosen only based on the memory manufacturer. In further patches, this
> choice will be made also based on the memory part. Indeed, we already
> know that some manufacturers, like Spansion, have updated their procedure
> to set the QE bit with their latest QSPI memories. The new procedure is
> safer but not supported by the oldest memory parts.
> The SFDP table could be one solution to select the relevant procedure but
> this issue will be addressed in further dedicated patches.

This IMO could've been factored out into separate small patch, so that
this patch isn't such a blob of multiple changes.

Otherwise, minor nits below ...

> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> ---
>  drivers/mtd/devices/m25p80.c          |  18 +-
>  drivers/mtd/spi-nor/aspeed-smc.c      |  23 +-
>  drivers/mtd/spi-nor/atmel-quadspi.c   |  83 ++++--
>  drivers/mtd/spi-nor/cadence-quadspi.c |  18 +-
>  drivers/mtd/spi-nor/fsl-quadspi.c     |   6 +-
>  drivers/mtd/spi-nor/hisi-sfc.c        |  31 ++-
>  drivers/mtd/spi-nor/intel-spi.c       |   7 +-
>  drivers/mtd/spi-nor/mtk-quadspi.c     |  15 +-
>  drivers/mtd/spi-nor/nxp-spifi.c       |  22 +-
>  drivers/mtd/spi-nor/spi-nor.c         | 472 +++++++++++++++++++++++++++-------
>  drivers/mtd/spi-nor/stm32-quadspi.c   |  27 +-
>  include/linux/mtd/spi-nor.h           | 158 +++++++++++-
>  12 files changed, 686 insertions(+), 194 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index c4df3b1bded0..34f33f6b88b4 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -111,10 +111,10 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>  
>  static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
>  {
> -	switch (nor->flash_read) {
> -	case SPI_NOR_DUAL:
> +	switch (nor->read_proto) {
> +	case SNOR_PROTO_1_1_2:
>  		return 2;
> -	case SPI_NOR_QUAD:
> +	case SNOR_PROTO_1_1_4:
>  		return 4;

Won't this become something like:

rx_bits = (nor->read_proto >> SNOR_PROTO_INST_SHIFT) & SNOR_PROTO_INST_MASK;

return rx_bits >= 1 ? rx_bits : 0;

And then you don't have to ever touch it once you add new SNOR_PROTO_1_1_x ?

Why do we return 0 by default though ? SPI_NBITS_SINGLE = 1 ... hmmm.

>  	default:
>  		return 0;
> @@ -196,7 +196,11 @@ static int m25p_probe(struct spi_device *spi)
>  	struct flash_platform_data	*data;
>  	struct m25p *flash;
>  	struct spi_nor *nor;
> -	enum read_mode mode = SPI_NOR_NORMAL;
> +	struct spi_nor_hwcaps hwcaps = {
> +		.mask = SNOR_HWCAPS_READ |
> +			SNOR_HWCAPS_READ_FAST |
> +			SNOR_HWCAPS_PP,
> +	};
>  	char *flash_name;
>  	int ret;


[...]

> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 36684ca7aa24..3bb2adff306b 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -150,24 +150,6 @@ static int read_cr(struct spi_nor *nor)
>  }
>  
>  /*
> - * Dummy Cycle calculation for different type of read.
> - * It can be used to support more commands with
> - * different dummy cycle requirements.
> - */
> -static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
> -{
> -	switch (nor->flash_read) {
> -	case SPI_NOR_FAST:
> -	case SPI_NOR_DUAL:
> -	case SPI_NOR_QUAD:
> -		return 8;
> -	case SPI_NOR_NORMAL:
> -		return 0;
> -	}
> -	return 0;
> -}
> -
> -/*
>   * Write status register 1 byte
>   * Returns negative if error occurred.
>   */
> @@ -221,6 +203,10 @@ static inline u8 spi_nor_convert_3to4_read(u8 opcode)
>  		{ SPINOR_OP_READ_1_2_2,	SPINOR_OP_READ_1_2_2_4B },
>  		{ SPINOR_OP_READ_1_1_4,	SPINOR_OP_READ_1_1_4_4B },
>  		{ SPINOR_OP_READ_1_4_4,	SPINOR_OP_READ_1_4_4_4B },
> +
> +		{ SPINOR_OP_READ_1_1_1_DTR,	SPINOR_OP_READ_1_1_1_DTR_4B },
> +		{ SPINOR_OP_READ_1_2_2_DTR,	SPINOR_OP_READ_1_2_2_DTR_4B },
> +		{ SPINOR_OP_READ_1_4_4_DTR,	SPINOR_OP_READ_1_4_4_DTR_4B },

If you moved this into separate patch, that patch would be a nice
example for future generations on how to add new protocols ...

>  	};
>  
>  	return spi_nor_convert_opcode(opcode, spi_nor_3to4_read,

[...]

> +struct spi_nor_flash_parameter {
> +	u64				size;
> +	u32				page_size;
> +
> +	struct spi_nor_hwcaps		hwcaps;
> +	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
> +	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
> +
> +	int (*quad_enable)(struct spi_nor *nor);
> +};
> +
> +

One newline too many here :)

> +static void
> +spi_nor_set_read_settings(struct spi_nor_read_command *read,
> +			  u8 num_mode_clocks,
> +			  u8 num_wait_states,
> +			  u8 opcode,
> +			  enum spi_nor_protocol proto)
> +{
> +	read->num_mode_clocks = num_mode_clocks;
> +	read->num_wait_states = num_wait_states;
> +	read->opcode = opcode;
> +	read->proto = proto;
> +}

[...]

-- 
Best regards,
Marek Vasut

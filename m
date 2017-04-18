Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0cDr-0000Fo-9a
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 23:07:48 +0000
Received: by mail-wr0-x241.google.com with SMTP id l44so965819wrc.2
 for <linux-mtd@lists.infradead.org>; Tue, 18 Apr 2017 16:07:26 -0700 (PDT)
Subject: Re: [PATCH v7 1/4] mtd: spi-nor: introduce SPI 1-2-2 and SPI 1-4-4
 protocols
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <cover.1492554665.git.cyrille.pitchen@atmel.com>
 <7cd2bdacb871b25ac90d01a475fd65497793b52d.1492554665.git.cyrille.pitchen@atmel.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <21ef8390-f079-85eb-76cc-0fd62338fb01@gmail.com>
Date: Wed, 19 Apr 2017 01:02:07 +0200
MIME-Version: 1.0
In-Reply-To: <7cd2bdacb871b25ac90d01a475fd65497793b52d.1492554665.git.cyrille.pitchen@atmel.com>
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

On 04/19/2017 12:51 AM, Cyrille Pitchen wrote:
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
> Then, to improve the readability of spi_nor_scan(), the discovery of the
> memory settings and the memory initialization are now split into two
> dedicated functions.
> 
> 1 - spi_nor_init_params()
> 
> The spi_nor_init_params() function is responsible for initializing the
> 'struct spi_nor_flash_parameter'. Currently this structure is filled with
> legacy values but further patches will allow to override some parameter
> values dynamically, for instance by reading the JESD216 Serial Flash
> Discoverable Parameter (SFDP) tables from the SPI memory.
> The spi_nor_init_params() function only deals with the hardware
> capabilities of the SPI flash memory: especially it doesn't care about
> the hardware capabilities supported by the SPI controller.
> 
> 2 - spi_nor_setup()
> 
> The second function is called once the 'struct spi_nor_flash_parameter'
> has been initialized by spi_nor_init_params().
> With both 'struct spi_nor_flash_parameter' and 'struct spi_nor_hwcaps',
> the new argument of spi_nor_scan(), spi_nor_setup() computes the best
> match between hardware caps supported by both the (Q)SPI memory and
> controller hence selecting the relevant settings for (Fast) Read and Page
> Program operations.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

[...]

> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -119,13 +119,57 @@
>  /* Configuration Register bits. */
>  #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
>  
> -enum read_mode {
> -	SPI_NOR_NORMAL = 0,
> -	SPI_NOR_FAST,
> -	SPI_NOR_DUAL,
> -	SPI_NOR_QUAD,
> +/* Supported SPI protocols */
> +#define SNOR_PROTO_INST_MASK	GENMASK(23, 16)
> +#define SNOR_PROTO_INST_SHIFT	16
> +#define SNOR_PROTO_INST(_nbits)	\
> +	((((u32)(_nbits)) << SNOR_PROTO_INST_SHIFT) & SNOR_PROTO_INST_MASK)

Is the u32 cast needed ?

> +#define SNOR_PROTO_ADDR_MASK	GENMASK(15, 8)
> +#define SNOR_PROTO_ADDR_SHIFT	8
> +#define SNOR_PROTO_ADDR(_nbits)	\
> +	((((u32)(_nbits)) << SNOR_PROTO_ADDR_SHIFT) & SNOR_PROTO_ADDR_MASK)
> +
> +#define SNOR_PROTO_DATA_MASK	GENMASK(7, 0)
> +#define SNOR_PROTO_DATA_SHIFT	0
> +#define SNOR_PROTO_DATA(_nbits)	\
> +	((((u32)(_nbits)) << SNOR_PROTO_DATA_SHIFT) & SNOR_PROTO_DATA_MASK)

[...]

> +static inline u8 spi_nor_get_protocol_inst_nbits(enum spi_nor_protocol proto)
> +{
> +	return ((u32)(proto & SNOR_PROTO_INST_MASK)) >> SNOR_PROTO_INST_SHIFT;

DTTO, is the cast needed ?

> +}
> +
> +static inline u8 spi_nor_get_protocol_addr_nbits(enum spi_nor_protocol proto)
> +{
> +	return ((u32)(proto & SNOR_PROTO_ADDR_MASK)) >> SNOR_PROTO_ADDR_SHIFT;
> +}
> +
> +static inline u8 spi_nor_get_protocol_data_nbits(enum spi_nor_protocol proto)
> +{
> +	return ((u32)(proto & SNOR_PROTO_DATA_MASK)) >> SNOR_PROTO_DATA_SHIFT;
> +}
> +
> +static inline u8 spi_nor_get_protocol_width(enum spi_nor_protocol proto)
> +{
> +	return spi_nor_get_protocol_data_nbits(proto);
> +}

[...]

Looks good otherwise.

-- 
Best regards,
Marek Vasut

Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1St7yK-0005pm-5Z
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2012 02:02:09 +0000
Received: by yenr9 with SMTP id r9so5354222yen.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Jul 2012 19:02:02 -0700 (PDT)
Message-ID: <500CB097.4000507@gmail.com>
Date: Sun, 22 Jul 2012 21:01:59 -0500
From: Rob Herring <robherring2@gmail.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2] mtd: m25p80: Make fast read configurable via DT
References: <1343006437-11669-1-git-send-email-marex@denx.de>
In-Reply-To: <1343006437-11669-1-git-send-email-marex@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "devicetree-discuss@lists.ozlabs.org"
 <devicetree-discuss@lists.ozlabs.org>, linux-mtd@lists.infradead.org,
 David Woodhouse <david.woodhouse@intel.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+devicetree-discuss

On 07/22/2012 08:20 PM, Marek Vasut wrote:
> Add DT property "m25p,fast-read" that signalises the particular
> chip supports "fast read" opcode.
> 
> NOTE: I'm not sure where to document this property, as m25p80 is
>       a simple DT device. Any hints please?
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: David Woodhouse <david.woodhouse@intel.com>
> ---
>  Documentation/devicetree/bindings/mtd/m25p80.txt |   27 ++++++++++++++++++
>  drivers/mtd/devices/m25p80.c                     |   32 +++++++++++++---------
>  2 files changed, 46 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/m25p80.txt
> 
> V2: Add documentation for the DT property. (Thanks Rob Herring for helping!)
>     Supersedes [PATCH 3/3] [RFC] mtd: m25p80: Make fast read configurable via DT
> 
> diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documentation/devicetree/bindings/mtd/m25p80.txt
> new file mode 100644
> index 0000000..e05d9b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
> @@ -0,0 +1,27 @@
> +* MTD SPI driver for ST M25Pxx (and similar) serial flash chips
> +
> +Required properties:
> +- #address-cells, #size-cells : Must be present if the device has sub-nodes
> +  representing partitions.
> +- compatible : Should be the name of the chip, see the "m25p_ids" table in
> +               drivers/mtd/devices/m25p80.c

Two things wrong with this:

- Bindings are not Linux specific, so the docs should not be based on Linux.
- This doesn't follow the existing user which is "spansion,m25p80"

Rob

> +- reg : Chip-Select number
> +- spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
> +
> +Optional properties:
> +- m25p,fast-read : Use the "fast read" opcode to read data from the chip instead
> +                   of the usual "read" opcode. This opcode isn not supported by
> +		   all chips and support for it can not be detected at runtime.
> +		   Refer to your chips' datasheet to check if this is supported
> +		   by your chip.
> +
> +Example:
> +
> +	flash: s25sl064p@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "s25sl064p";
> +		reg = <0>;
> +		spi-max-frequency = <40000000>;
> +		m25p,fast-read;
> +	};
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index d16f75c..c5284cd 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -73,14 +73,6 @@
>  #define	MAX_READY_WAIT_JIFFIES	(40 * HZ)	/* M25P16 specs 40s max chip erase */
>  #define	MAX_CMD_SIZE		5
>  
> -#ifdef CONFIG_M25PXX_USE_FAST_READ
> -#define OPCODE_READ 	OPCODE_FAST_READ
> -#define FAST_READ_DUMMY_BYTE 1
> -#else
> -#define OPCODE_READ 	OPCODE_NORM_READ
> -#define FAST_READ_DUMMY_BYTE 0
> -#endif
> -
>  #define JEDEC_MFR(_jedec_id)	((_jedec_id) >> 16)
>  
>  /****************************************************************************/
> @@ -93,6 +85,7 @@ struct m25p {
>  	u16			addr_width;
>  	u8			erase_opcode;
>  	u8			*command;
> +	bool			fast_read;
>  };
>  
>  static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
> @@ -342,6 +335,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	struct m25p *flash = mtd_to_m25p(mtd);
>  	struct spi_transfer t[2];
>  	struct spi_message m;
> +	uint8_t opcode;
>  
>  	pr_debug("%s: %s from 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
>  			__func__, (u32)from, len);
> @@ -354,7 +348,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	 * Should add 1 byte DUMMY_BYTE.
>  	 */
>  	t[0].tx_buf = flash->command;
> -	t[0].len = m25p_cmdsz(flash) + FAST_READ_DUMMY_BYTE;
> +	t[0].len = m25p_cmdsz(flash) + (flash->fast_read ? 1 : 0);
>  	spi_message_add_tail(&t[0], &m);
>  
>  	t[1].rx_buf = buf;
> @@ -376,12 +370,14 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	 */
>  
>  	/* Set up the write data buffer. */
> -	flash->command[0] = OPCODE_READ;
> +	opcode = flash->fast_read ? OPCODE_FAST_READ : OPCODE_NORM_READ;
> +	flash->command[0] = opcode;
>  	m25p_addr2cmd(flash, from, flash->command);
>  
>  	spi_sync(flash->spi, &m);
>  
> -	*retlen = m.actual_length - m25p_cmdsz(flash) - FAST_READ_DUMMY_BYTE;
> +	*retlen = m.actual_length - m25p_cmdsz(flash) -
> +			(flash->fast_read ? 1 : 0);
>  
>  	mutex_unlock(&flash->lock);
>  
> @@ -804,9 +800,10 @@ static int __devinit m25p_probe(struct spi_device *spi)
>  	struct flash_info		*info;
>  	unsigned			i;
>  	struct mtd_part_parser_data	ppdata;
> +	struct device_node		*np = spi->dev.of_node;
>  
>  #ifdef CONFIG_MTD_OF_PARTS
> -	if (!of_device_is_available(spi->dev.of_node))
> +	if (!of_device_is_available(np))
>  		return -ENODEV;
>  #endif
>  
> @@ -858,7 +855,8 @@ static int __devinit m25p_probe(struct spi_device *spi)
>  	flash = kzalloc(sizeof *flash, GFP_KERNEL);
>  	if (!flash)
>  		return -ENOMEM;
> -	flash->command = kmalloc(MAX_CMD_SIZE + FAST_READ_DUMMY_BYTE, GFP_KERNEL);
> +	flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 : 0),
> +					GFP_KERNEL);
>  	if (!flash->command) {
>  		kfree(flash);
>  		return -ENOMEM;
> @@ -915,6 +913,14 @@ static int __devinit m25p_probe(struct spi_device *spi)
>  	flash->page_size = info->page_size;
>  	flash->mtd.writebufsize = flash->page_size;
>  
> +	flash->fast_read = false;
> +	if (np && of_find_property(np, "m25p,fast-read", NULL))
> +		flash->fast_read = true;
> +
> +#ifdef CONFIG_M25PXX_USE_FAST_READ
> +	flash->fast_read = true;
> +#endif
> +
>  	if (info->addr_width)
>  		flash->addr_width = info->addr_width;
>  	else {
> 

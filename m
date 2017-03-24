Received: from 15.mo7.mail-out.ovh.net ([87.98.180.21])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1crM4K-0001HY-DW
 for linux-mtd@lists.infradead.org; Fri, 24 Mar 2017 10:03:45 +0000
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id ACEED48F37
 for <linux-mtd@lists.infradead.org>; Fri, 24 Mar 2017 11:03:16 +0100 (CET)
Subject: Re: [PATCH v5 1/6] mtd: spi-nor: introduce more SPI protocols and the
 Dual Transfer Mode
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, jartur@cadence.com, kdasu.kdev@gmail.com,
 mar.krzeminski@gmail.com
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
 <65619c23078469af03e4d53d781a8cffa92d5a61.1490220411.git.cyrille.pitchen@atmel.com>
 <c2c46efa-0678-438d-f2d5-93a6ae5cf315@kaod.org>
 <00c97cbc-9c19-96fa-cbc0-793ab13b8cb5@wedev4u.fr>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6d13488e-3558-6e97-49fe-130a2aef04bd@kaod.org>
Date: Fri, 24 Mar 2017 11:03:01 +0100
MIME-Version: 1.0
In-Reply-To: <00c97cbc-9c19-96fa-cbc0-793ab13b8cb5@wedev4u.fr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/23/2017 08:10 PM, Cyrille Pitchen wrote:
> Hi Cédic,
> 
> Le 23/03/2017 à 16:13, Cédric Le Goater a écrit :
>> On 03/23/2017 12:33 AM, Cyrille Pitchen wrote:
>>> This patch changes the prototype of spi_nor_scan(): its 3rd parameter
>>> is replaced by a 'struct spi_nor_hwcaps' pointer, which tells the spi-nor
>>> framework about the actual hardware capabilities supported by the SPI
>>> controller and its driver.
>>>
>>> Besides, this patch also introduces a new 'struct spi_nor_flash_parameter'
>>> telling the spi-nor framework about the hardware capabilities supported by
>>> the SPI flash memory and the associated settings required to use those
>>> hardware caps.
>>>
>>> Currently the 'struct spi_nor_flash_parameter' is filled with legacy
>>> values but a later patch will allow to fill it dynamically by reading the
>>> JESD216 Serial Flash Discoverable Parameter (SFDP) tables from the SPI
>>> memory.
>>>
>>> With both structures, the spi-nor framework can now compute the best
>>> match between hardware caps supported by both the (Q)SPI memory and
>>> controller hence selecting the relevant SPI protocols and op codes for
>>> (Fast) Read, Page Program and Sector Erase operations.
>>>
>>> The 'struct spi_nor_flash_parameter' also provides the spi-nor framework
>>> with the number of dummy cycles to be used with each Fast Read commands
>>> and the erase block size associated to the erase block op codes.
>>>
>>> Finally the 'struct spi_nor_flash_parameter', through the optional
>>> .enable_quad_io() hook, tells the spi-nor framework how to set the Quad
> 
> .enable_quad_io() was renamed into .quad_enable()
> 
>>> Enable (QE) bit of the QSPI memory to enable its Quad SPI features.
>>
>> The Aspeed controller only supports Dual I/O and a helper similar 
>> to the one for Quad I/O would be needed to setup the chip for 
>> multiple I/O: 
>>
>> 	int (*dual_enable)(struct spi_nor *nor);
>>
>> Is the approach correct ? or maybe rename the current 'quad_enable()'
>> to 'multiple_enable()' and add an extra parameter.
>>
> 
> No, nor->flash_quad_enable() [ = params->quad_enable() ] is a flash
> specific handler as described in spi-nor.h and like other flash specific
> handlers such as flash_lock(), flash_unlock() or flash_is_locked(), is
> only used internally in spi-nor.c: spi-nor controller drivers like
> aspeed-smc.c should not use those handlers at all.

I was talking about adding a spi-nor handler to set up the chip for 
dual I/O because today we only have one for quad I/O, and some
controllers (like the Aspeed) do not support Quad. So the only 
fast I/O we can do today for these controllers is dual I/O data 
(SPI_NOR_DUAL)

> the choice of the nor->flash_quad_enable() handler depends only on the
> memory manufacturer (and the memory part):
> - (none): Micron
> - macronix_quad_enable: Macronix
> - spansion_quad_enable: Spansion, Winbond, ...
> - spansion_new_quad_enable: Spansion (latest memories), ...
> - sr2_bit7_quad_enable: ??? (defined in the JESD216B specification)

yes. Some Micron have a VCONF register to set multiple I/O also.
 
> The purpose of those functions is to implement the vendor specific
> procedure to set the so called "Quad Enable" (QE) bit in some Status
> Register of the SPI NOR memory.
> 
> Indeed, most QSPI memories are pin to pin compatible with legacy SPI
> memories. 2 pins of those memories were dedicated to the Write Protect
> (WP) and Reset/Hold (RST) functions. Hence before using any Quad SPI
> commands, almost all QSPI memories (Micron being the only exception I
> know) require us to set their QE bit so the WP and RST pins are
> reassigned to functions IO2 and IO3, the 3rd and 4th IO lines needed by
> SPI 1-1-4 and SPI 1-4-4 protocols. Then the Write Protect and Hold/Reset
> functions are disabled.
> 
> From a software point of view, there is nothing to do before using the
> SPI 1-1-2 or SPI 1-2-2 protocols. As a matter of fact, with those
> protocols, MISO and MOSI pins are simply reassigned to functions IO0 and
> IO1.
> 
> 
> Back to the SPI flash controller, if the hardware needs to be configured
> in some way to use any Dual or Quad SPI protocols, it has to be done
> before calling spi_nor_scan() or more likely directly inside the
> controller driver specific implementation of nor->read(), nor->write().

yes.

> With nor->read(), the driver has to check the value of nor->read_proto
> to know the actual number of I/O lines used during Instruction (x),
> Address/Dummy (y) and Data (z) clock cycles: nor->read_proto provides
> the driver with the SPI x-y-z protocol to be used.
> 
> Also nor->write() has to check the value of nor->write_proto.
> 
> [ nor->erase() has to check the value of nor->reg_proto: I removed
> nor->erase_proto since it always had the same value as nor->reg_proto. ]
> 
> Both nor->write() and nor->read are controller driver specific: they
> must be implemented by the controller driver and set before calling
> spi_nor_scan().
> 
> Then nor->read_proto and nor->write_proto are chosen from spi_nor_scan()
> based on the actual hardware capabilities shared by both the SPI memory
> and controller. The SPI controller driver tells the spi-nor framework
> which SPI protocols it supports or wants to use by setting the new
> 'struct spi_nor_hwcaps' argument of spi_nor_scan() accordingly.
> 
> 
> You can have a look at the atmel-quadspi.c driver to have an example of
> what to do to support the SPI 1-2-2 or SPI 1-4-4 protocols at the
> controller side.
> 
> I've updated the Atmel Quad SPI driver since I'm the maintainer of this
> driver so I know the exact hardware capabilities of this controller but
> I don't have such a knowledge for Quad SPI controllers of other vendors.
> 
> Please note that patch is conservative: if a controller driver like the
> Aspeed one currently doesn't support the Quad or Dual SPI protocols, the
> patch doesn't enable them in hwcaps.mask.
> 
> Maintainers of the controller drivers will have to, if they want, extend
> their driver to add the support of new SPI protocols, otherwise those
> drivers will keep on working exactly as they used to do before this
> series. For instance, a controller driver which used SPI_NOR_QUAD before
> still uses the SPI 1-1-4 protocol.

Yes. I have some patches adding DUAL support to Aspeed but I will rebase 
on your patchset when it is merged because they currently conflict.

Thanks for the detailed explanations !

C. 


> Best regards,
> 
> Cyrille
> 
> 
>> I have a bunch of patches queued for Dual I/O data support but I 
>> think they will conflict with your patches. I will wait for this 
>> one to be merged. Then, I can look at Dual I/O address + data 
>> support.
>>
>> Thanks,
>>
>> C.     
>>
>>
>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>>> ---
>>>  drivers/mtd/devices/m25p80.c          |  16 +-
>>>  drivers/mtd/spi-nor/aspeed-smc.c      |  23 +-
>>>  drivers/mtd/spi-nor/atmel-quadspi.c   |  80 +++---
>>>  drivers/mtd/spi-nor/cadence-quadspi.c |  18 +-
>>>  drivers/mtd/spi-nor/fsl-quadspi.c     |   8 +-
>>>  drivers/mtd/spi-nor/hisi-sfc.c        |  31 ++-
>>>  drivers/mtd/spi-nor/intel-spi.c       |   7 +-
>>>  drivers/mtd/spi-nor/mtk-quadspi.c     |  16 +-
>>>  drivers/mtd/spi-nor/nxp-spifi.c       |  22 +-
>>>  drivers/mtd/spi-nor/spi-nor.c         | 441 +++++++++++++++++++++++++++-------
>>>  include/linux/mtd/spi-nor.h           | 158 +++++++++++-
>>>  11 files changed, 643 insertions(+), 177 deletions(-)
>>>
>>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>>> index c4df3b1bded0..68986a26c8fe 100644
>>> --- a/drivers/mtd/devices/m25p80.c
>>> +++ b/drivers/mtd/devices/m25p80.c
>>> @@ -111,10 +111,10 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>>>  
>>>  static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
>>>  {
>>> -	switch (nor->flash_read) {
>>> -	case SPI_NOR_DUAL:
>>> +	switch (nor->read_proto) {
>>> +	case SNOR_PROTO_1_1_2:
>>>  		return 2;
>>> -	case SPI_NOR_QUAD:
>>> +	case SNOR_PROTO_1_1_4:
>>>  		return 4;
>>>  	default:
>>>  		return 0;
>>> @@ -196,7 +196,9 @@ static int m25p_probe(struct spi_device *spi)
>>>  	struct flash_platform_data	*data;
>>>  	struct m25p *flash;
>>>  	struct spi_nor *nor;
>>> -	enum read_mode mode = SPI_NOR_NORMAL;
>>> +	struct spi_nor_hwcaps hwcaps = {
>>> +		.mask = (SNOR_HWCAPS_READ | SNOR_HWCAPS_PP),
>>> +	};
>>>  	char *flash_name;
>>>  	int ret;
>>>  
>>> @@ -222,9 +224,9 @@ static int m25p_probe(struct spi_device *spi)
>>>  	flash->spi = spi;
>>>  
>>>  	if (spi->mode & SPI_RX_QUAD)
>>> -		mode = SPI_NOR_QUAD;
>>> +		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
>>>  	else if (spi->mode & SPI_RX_DUAL)
>>> -		mode = SPI_NOR_DUAL;
>>> +		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
>>>  
>>>  	if (data && data->name)
>>>  		nor->mtd.name = data->name;
>>> @@ -241,7 +243,7 @@ static int m25p_probe(struct spi_device *spi)
>>>  	else
>>>  		flash_name = spi->modalias;
>>>  
>>> -	ret = spi_nor_scan(nor, flash_name, mode);
>>> +	ret = spi_nor_scan(nor, flash_name, &hwcaps);
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>>> index 56051d30f000..723026d9cf0c 100644
>>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>> @@ -585,14 +585,12 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>>  	 * TODO: Adjust clocks if fast read is supported and interpret
>>>  	 * SPI-NOR flags to adjust controller settings.
>>>  	 */
>>> -	switch (chip->nor.flash_read) {
>>> -	case SPI_NOR_NORMAL:
>>> -		cmd = CONTROL_COMMAND_MODE_NORMAL;
>>> -		break;
>>> -	case SPI_NOR_FAST:
>>> -		cmd = CONTROL_COMMAND_MODE_FREAD;
>>> -		break;
>>> -	default:
>>> +	if (chip->nor.read_proto == SNOR_PROTO_1_1_1) {
>>> +		if (chip->nor.read_dummy == 0)
>>> +			cmd = CONTROL_COMMAND_MODE_NORMAL;
>>> +		else
>>> +			cmd = CONTROL_COMMAND_MODE_FREAD;
>>> +	} else {
>>>  		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
>>>  		return -EINVAL;
>>>  	}
>>> @@ -608,6 +606,11 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>>  static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>>  				  struct device_node *np, struct resource *r)
>>>  {
>>> +	struct spi_nor_hwcaps hwcaps = {
>>> +		.mask = (SNOR_HWCAPS_READ |
>>> +			 SNOR_HWCAPS_READ_FAST |
>>> +			 SNOR_HWCAPS_PP),
>>> +	};
>>>  	const struct aspeed_smc_info *info = controller->info;
>>>  	struct device *dev = controller->dev;
>>>  	struct device_node *child;
>>> @@ -671,11 +674,11 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>>  			break;
>>>  
>>>  		/*
>>> -		 * TODO: Add support for SPI_NOR_QUAD and SPI_NOR_DUAL
>>> +		 * TODO: Add support for Dual and Quad SPI protocols
>>>
>>>  		 * attach when board support is present as determined
>>>  		 * by of property.
>>>  		 */
>>> -		ret = spi_nor_scan(nor, NULL, SPI_NOR_NORMAL);
>>> +		ret = spi_nor_scan(nor, NULL, &hwcaps);
>>>  		if (ret)
>>>  			break;
>>>  
>>> diff --git a/drivers/mtd/spi-nor/atmel-quadspi.c b/drivers/mtd/spi-nor/atmel-quadspi.c
>>> index 47937d9beec6..9f579f7c1733 100644
>>> --- a/drivers/mtd/spi-nor/atmel-quadspi.c
>>> +++ b/drivers/mtd/spi-nor/atmel-quadspi.c
>>> @@ -275,14 +275,48 @@ static void atmel_qspi_debug_command(struct atmel_qspi *aq,
>>>  
>>>  static int atmel_qspi_run_command(struct atmel_qspi *aq,
>>>  				  const struct atmel_qspi_command *cmd,
>>> -				  u32 ifr_tfrtyp, u32 ifr_width)
>>> +				  u32 ifr_tfrtyp, enum spi_nor_protocol proto)
>>>  {
>>>  	u32 iar, icr, ifr, sr;
>>>  	int err = 0;
>>>  
>>>  	iar = 0;
>>>  	icr = 0;
>>> -	ifr = ifr_tfrtyp | ifr_width;
>>> +	ifr = ifr_tfrtyp;
>>> +
>>> +	/* Set the SPI protocol */
>>> +	switch (proto) {
>>> +	case SNOR_PROTO_1_1_1:
>>> +		ifr |= QSPI_IFR_WIDTH_SINGLE_BIT_SPI;
>>> +		break;
>>> +
>>> +	case SNOR_PROTO_1_1_2:
>>> +		ifr |= QSPI_IFR_WIDTH_DUAL_OUTPUT;
>>> +		break;
>>> +
>>> +	case SNOR_PROTO_1_1_4:
>>> +		ifr |= QSPI_IFR_WIDTH_QUAD_OUTPUT;
>>> +		break;
>>> +
>>> +	case SNOR_PROTO_1_2_2:
>>> +		ifr |= QSPI_IFR_WIDTH_DUAL_IO;
>>> +		break;
>>> +
>>> +	case SNOR_PROTO_1_4_4:
>>> +		ifr |= QSPI_IFR_WIDTH_QUAD_IO;
>>> +		break;
>>> +
>>> +	case SNOR_PROTO_2_2_2:
>>> +		ifr |= QSPI_IFR_WIDTH_DUAL_CMD;
>>> +		break;
>>> +
>>> +	case SNOR_PROTO_4_4_4:
>>> +		ifr |= QSPI_IFR_WIDTH_QUAD_CMD;
>>> +		break;
>>> +
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>>  
>>>  	/* Compute instruction parameters */
>>>  	if (cmd->enable.bits.instruction) {
>>> @@ -434,7 +468,7 @@ static int atmel_qspi_read_reg(struct spi_nor *nor, u8 opcode,
>>>  	cmd.rx_buf = buf;
>>>  	cmd.buf_len = len;
>>>  	return atmel_qspi_run_command(aq, &cmd, QSPI_IFR_TFRTYP_TRSFR_READ,
>>> -				      QSPI_IFR_WIDTH_SINGLE_BIT_SPI);
>>> +				      nor->reg_proto);
>>>  }
>>>  
>>>  static int atmel_qspi_write_reg(struct spi_nor *nor, u8 opcode,
>>> @@ -450,7 +484,7 @@ static int atmel_qspi_write_reg(struct spi_nor *nor, u8 opcode,
>>>  	cmd.tx_buf = buf;
>>>  	cmd.buf_len = len;
>>>  	return atmel_qspi_run_command(aq, &cmd, QSPI_IFR_TFRTYP_TRSFR_WRITE,
>>> -				      QSPI_IFR_WIDTH_SINGLE_BIT_SPI);
>>> +				      nor->reg_proto);
>>>  }
>>>  
>>>  static ssize_t atmel_qspi_write(struct spi_nor *nor, loff_t to, size_t len,
>>> @@ -469,7 +503,7 @@ static ssize_t atmel_qspi_write(struct spi_nor *nor, loff_t to, size_t len,
>>>  	cmd.tx_buf = write_buf;
>>>  	cmd.buf_len = len;
>>>  	ret = atmel_qspi_run_command(aq, &cmd, QSPI_IFR_TFRTYP_TRSFR_WRITE_MEM,
>>> -				     QSPI_IFR_WIDTH_SINGLE_BIT_SPI);
>>> +				     nor->write_proto);
>>>  	return (ret < 0) ? ret : len;
>>>  }
>>>  
>>> @@ -484,7 +518,7 @@ static int atmel_qspi_erase(struct spi_nor *nor, loff_t offs)
>>>  	cmd.instruction = nor->erase_opcode;
>>>  	cmd.address = (u32)offs;
>>>  	return atmel_qspi_run_command(aq, &cmd, QSPI_IFR_TFRTYP_TRSFR_WRITE,
>>> -				      QSPI_IFR_WIDTH_SINGLE_BIT_SPI);
>>> +				      nor->reg_proto);
>>>  }
>>>  
>>>  static ssize_t atmel_qspi_read(struct spi_nor *nor, loff_t from, size_t len,
>>> @@ -493,27 +527,8 @@ static ssize_t atmel_qspi_read(struct spi_nor *nor, loff_t from, size_t len,
>>>  	struct atmel_qspi *aq = nor->priv;
>>>  	struct atmel_qspi_command cmd;
>>>  	u8 num_mode_cycles, num_dummy_cycles;
>>> -	u32 ifr_width;
>>>  	ssize_t ret;
>>>  
>>> -	switch (nor->flash_read) {
>>> -	case SPI_NOR_NORMAL:
>>> -	case SPI_NOR_FAST:
>>> -		ifr_width = QSPI_IFR_WIDTH_SINGLE_BIT_SPI;
>>> -		break;
>>> -
>>> -	case SPI_NOR_DUAL:
>>> -		ifr_width = QSPI_IFR_WIDTH_DUAL_OUTPUT;
>>> -		break;
>>> -
>>> -	case SPI_NOR_QUAD:
>>> -		ifr_width = QSPI_IFR_WIDTH_QUAD_OUTPUT;
>>> -		break;
>>> -
>>> -	default:
>>> -		return -EINVAL;
>>> -	}
>>> -
>>>  	if (nor->read_dummy >= 2) {
>>>  		num_mode_cycles = 2;
>>>  		num_dummy_cycles = nor->read_dummy - 2;
>>> @@ -536,7 +551,7 @@ static ssize_t atmel_qspi_read(struct spi_nor *nor, loff_t from, size_t len,
>>>  	cmd.rx_buf = read_buf;
>>>  	cmd.buf_len = len;
>>>  	ret = atmel_qspi_run_command(aq, &cmd, QSPI_IFR_TFRTYP_TRSFR_READ_MEM,
>>> -				     ifr_width);
>>> +				     nor->read_proto);
>>>  	return (ret < 0) ? ret : len;
>>>  }
>>>  
>>> @@ -590,6 +605,17 @@ static irqreturn_t atmel_qspi_interrupt(int irq, void *dev_id)
>>>  
>>>  static int atmel_qspi_probe(struct platform_device *pdev)
>>>  {
>>> +	struct spi_nor_hwcaps hwcaps = {
>>> +		.mask = (SNOR_HWCAPS_READ |
>>> +			 SNOR_HWCAPS_READ_FAST |
>>> +			 SNOR_HWCAPS_READ_1_1_2 |
>>> +			 SNOR_HWCAPS_READ_1_2_2 |
>>> +			 SNOR_HWCAPS_READ_1_1_4 |
>>> +			 SNOR_HWCAPS_READ_1_4_4 |
>>> +			 SNOR_HWCAPS_PP |
>>> +			 SNOR_HWCAPS_PP_1_1_4 |
>>> +			 SNOR_HWCAPS_PP_1_4_4),
>>> +	};
>>>  	struct device_node *child, *np = pdev->dev.of_node;
>>>  	struct atmel_qspi *aq;
>>>  	struct resource *res;
>>> @@ -679,7 +705,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>>>  	if (err)
>>>  		goto disable_clk;
>>>  
>>> -	err = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
>>> +	err = spi_nor_scan(nor, NULL, &hwcaps);
>>>  	if (err)
>>>  		goto disable_clk;
>>>  
>>> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
>>> index 9f8102de1b16..3f91a3e97892 100644
>>> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
>>> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
>>> @@ -855,15 +855,14 @@ static int cqspi_set_protocol(struct spi_nor *nor, const int read)
>>>  	f_pdata->data_width = CQSPI_INST_TYPE_SINGLE;
>>>  
>>>  	if (read) {
>>> -		switch (nor->flash_read) {
>>> -		case SPI_NOR_NORMAL:
>>> -		case SPI_NOR_FAST:
>>> +		switch (nor->read_proto) {
>>> +		case SNOR_PROTO_1_1_1:
>>>  			f_pdata->data_width = CQSPI_INST_TYPE_SINGLE;
>>>  			break;
>>> -		case SPI_NOR_DUAL:
>>> +		case SNOR_PROTO_1_1_2:
>>>  			f_pdata->data_width = CQSPI_INST_TYPE_DUAL;
>>>  			break;
>>> -		case SPI_NOR_QUAD:
>>> +		case SNOR_PROTO_1_1_4:
>>>  			f_pdata->data_width = CQSPI_INST_TYPE_QUAD;
>>>  			break;
>>>  		default:
>>> @@ -1069,6 +1068,13 @@ static void cqspi_controller_init(struct cqspi_st *cqspi)
>>>  
>>>  static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>>>  {
>>> +	struct spi_nor_hwcaps hwcaps = {
>>> +		.mask = (SNOR_HWCAPS_READ |
>>> +			 SNOR_HWCAPS_READ_FAST |
>>> +			 SNOR_HWCAPS_READ_1_1_2 |
>>> +			 SNOR_HWCAPS_READ_1_1_4 |
>>> +			 SNOR_HWCAPS_PP),
>>> +	};
>>>  	struct platform_device *pdev = cqspi->pdev;
>>>  	struct device *dev = &pdev->dev;
>>>  	struct cqspi_flash_pdata *f_pdata;
>>> @@ -1123,7 +1129,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>>>  			goto err;
>>>  		}
>>>  
>>> -		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
>>> +		ret = spi_nor_scan(nor, NULL, &hwcaps);
>>>  		if (ret)
>>>  			goto err;
>>>  
>>> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
>>> index 1476135e0d50..ec9c8e960fd2 100644
>>> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
>>> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
>>> @@ -957,6 +957,12 @@ static void fsl_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>>>  
>>>  static int fsl_qspi_probe(struct platform_device *pdev)
>>>  {
>>> +	struct spi_nor_hwcaps hwcaps = {
>>> +		.mask = (SNOR_HWCAPS_READ |
>>> +			 SNOR_HWCAPS_READ_FAST |
>>> +			 SNOR_HWCAPS_READ_1_1_4 |
>>> +			 SNOR_HWCAPS_PP),
>>> +	};
>>>  	struct device_node *np = pdev->dev.of_node;
>>>  	struct device *dev = &pdev->dev;
>>>  	struct fsl_qspi *q;
>>> @@ -1065,7 +1071,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>>>  		/* set the chip address for READID */
>>>  		fsl_qspi_set_base_addr(q, nor);
>>>  
>>> -		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
>>> +		ret = spi_nor_scan(nor, NULL, &hwcaps);
>>>  		if (ret)
>>>  			goto mutex_failed;
>>>  
>>> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
>>> index a286350627a6..80e2d173abdd 100644
>>> --- a/drivers/mtd/spi-nor/hisi-sfc.c
>>> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
>>> @@ -120,19 +120,24 @@ static inline int wait_op_finish(struct hifmc_host *host)
>>>  		(reg & FMC_INT_OP_DONE), 0, FMC_WAIT_TIMEOUT);
>>>  }
>>>  
>>> -static int get_if_type(enum read_mode flash_read)
>>> +static int get_if_type(enum spi_nor_protocol proto)
>>>  {
>>>  	enum hifmc_iftype if_type;
>>>  
>>> -	switch (flash_read) {
>>> -	case SPI_NOR_DUAL:
>>> +	switch (proto) {
>>> +	case SNOR_PROTO_1_1_2:
>>>  		if_type = IF_TYPE_DUAL;
>>>  		break;
>>> -	case SPI_NOR_QUAD:
>>> +	case SNOR_PROTO_1_2_2:
>>> +		if_type = IF_TYPE_DIO;
>>> +		break;
>>> +	case SNOR_PROTO_1_1_4:
>>>  		if_type = IF_TYPE_QUAD;
>>>  		break;
>>> -	case SPI_NOR_NORMAL:
>>> -	case SPI_NOR_FAST:
>>> +	case SNOR_PROTO_1_4_4:
>>> +		if_type = IF_TYPE_QIO;
>>> +		break;
>>> +	case SNOR_PROTO_1_1_1:
>>>  	default:
>>>  		if_type = IF_TYPE_STD;
>>>  		break;
>>> @@ -253,7 +258,10 @@ static int hisi_spi_nor_dma_transfer(struct spi_nor *nor, loff_t start_off,
>>>  	writel(FMC_DMA_LEN_SET(len), host->regbase + FMC_DMA_LEN);
>>>  
>>>  	reg = OP_CFG_FM_CS(priv->chipselect);
>>> -	if_type = get_if_type(nor->flash_read);
>>> +	if (op_type == FMC_OP_READ)
>>> +		if_type = get_if_type(nor->read_proto);
>>> +	else
>>> +		if_type = get_if_type(nor->write_proto);
>>>  	reg |= OP_CFG_MEM_IF_TYPE(if_type);
>>>  	if (op_type == FMC_OP_READ)
>>>  		reg |= OP_CFG_DUMMY_NUM(nor->read_dummy >> 3);
>>> @@ -321,6 +329,13 @@ static ssize_t hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
>>>  static int hisi_spi_nor_register(struct device_node *np,
>>>  				struct hifmc_host *host)
>>>  {
>>> +	struct spi_nor_hwcaps hwcaps = {
>>> +		.mask = (SNOR_HWCAPS_READ |
>>> +			 SNOR_HWCAPS_READ_FAST |
>>> +			 SNOR_HWCAPS_READ_1_1_2 |
>>> +			 SNOR_HWCAPS_READ_1_1_4 |
>>> +			 SNOR_HWCAPS_PP),
>>> +	};
>>>  	struct device *dev = host->dev;
>>>  	struct spi_nor *nor;
>>>  	struct hifmc_priv *priv;
>>> @@ -362,7 +377,7 @@ static int hisi_spi_nor_register(struct device_node *np,
>>>  	nor->read = hisi_spi_nor_read;
>>>  	nor->write = hisi_spi_nor_write;
>>>  	nor->erase = NULL;
>>> -	ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
>>> +	ret = spi_nor_scan(nor, NULL, &hwcaps);
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
>>> index 986a3d020a3a..515aa1f7f4f1 100644
>>> --- a/drivers/mtd/spi-nor/intel-spi.c
>>> +++ b/drivers/mtd/spi-nor/intel-spi.c
>>> @@ -715,6 +715,11 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
>>>  struct intel_spi *intel_spi_probe(struct device *dev,
>>>  	struct resource *mem, const struct intel_spi_boardinfo *info)
>>>  {
>>> +	struct spi_nor_hwcaps hwcaps = {
>>> +		.mask = (SNOR_HWCAPS_READ |
>>> +			 SNOR_HWCAPS_READ_FAST |
>>> +			 SNOR_HWCAPS_PP),
>>> +	};
>>>  	struct mtd_partition part;
>>>  	struct intel_spi *ispi;
>>>  	int ret;
>>> @@ -746,7 +751,7 @@ struct intel_spi *intel_spi_probe(struct device *dev,
>>>  	ispi->nor.write = intel_spi_write;
>>>  	ispi->nor.erase = intel_spi_erase;
>>>  
>>> -	ret = spi_nor_scan(&ispi->nor, NULL, SPI_NOR_NORMAL);
>>> +	ret = spi_nor_scan(&ispi->nor, NULL, &hwcaps);
>>>  	if (ret) {
>>>  		dev_info(dev, "failed to locate the chip\n");
>>>  		return ERR_PTR(ret);
>>> diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
>>> index e661877c23de..615e258866f7 100644
>>> --- a/drivers/mtd/spi-nor/mtk-quadspi.c
>>> +++ b/drivers/mtd/spi-nor/mtk-quadspi.c
>>> @@ -121,20 +121,20 @@ static void mt8173_nor_set_read_mode(struct mt8173_nor *mt8173_nor)
>>>  {
>>>  	struct spi_nor *nor = &mt8173_nor->nor;
>>>  
>>> -	switch (nor->flash_read) {
>>> -	case SPI_NOR_FAST:
>>> +	switch (nor->read_proto) {
>>> +	case SNOR_PROTO_1_1_1:
>>>  		writeb(nor->read_opcode, mt8173_nor->base +
>>>  		       MTK_NOR_PRGDATA3_REG);
>>>  		writeb(MTK_NOR_FAST_READ, mt8173_nor->base +
>>>  		       MTK_NOR_CFG1_REG);
>>>  		break;
>>> -	case SPI_NOR_DUAL:
>>> +	case SNOR_PROTO_1_1_2:
>>>  		writeb(nor->read_opcode, mt8173_nor->base +
>>>  		       MTK_NOR_PRGDATA3_REG);
>>>  		writeb(MTK_NOR_DUAL_READ_EN, mt8173_nor->base +
>>>  		       MTK_NOR_DUAL_REG);
>>>  		break;
>>> -	case SPI_NOR_QUAD:
>>> +	case SNOR_PROTO_1_1_4:
>>>  		writeb(nor->read_opcode, mt8173_nor->base +
>>>  		       MTK_NOR_PRGDATA4_REG);
>>>  		writeb(MTK_NOR_QUAD_READ_EN, mt8173_nor->base +
>>> @@ -381,6 +381,12 @@ static int mt8173_nor_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
>>>  static int mtk_nor_init(struct mt8173_nor *mt8173_nor,
>>>  			struct device_node *flash_node)
>>>  {
>>> +	struct spi_nor_hwcaps hwcaps = {
>>> +		.mask = (SNOR_HWCAPS_READ |
>>> +			 SNOR_HWCAPS_READ_FAST |
>>> +			 SNOR_HWCAPS_READ_1_1_2 |
>>> +			 SNOR_HWCAPS_PP),
>>> +	};
>>>  	int ret;
>>>  	struct spi_nor *nor;
>>>  
>>> @@ -399,7 +405,7 @@ static int mtk_nor_init(struct mt8173_nor *mt8173_nor,
>>>  	nor->write_reg = mt8173_nor_write_reg;
>>>  	nor->mtd.name = "mtk_nor";
>>>  	/* initialized with NULL */
>>> -	ret = spi_nor_scan(nor, NULL, SPI_NOR_DUAL);
>>> +	ret = spi_nor_scan(nor, NULL, &hwcaps);
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
>>> index 73a14f40928b..c5992e099542 100644
>>> --- a/drivers/mtd/spi-nor/nxp-spifi.c
>>> +++ b/drivers/mtd/spi-nor/nxp-spifi.c
>>> @@ -240,13 +240,12 @@ static int nxp_spifi_erase(struct spi_nor *nor, loff_t offs)
>>>  
>>>  static int nxp_spifi_setup_memory_cmd(struct nxp_spifi *spifi)
>>>  {
>>> -	switch (spifi->nor.flash_read) {
>>> -	case SPI_NOR_NORMAL:
>>> -	case SPI_NOR_FAST:
>>> +	switch (spifi->nor.read_proto) {
>>> +	case SNOR_PROTO_1_1_1:
>>>  		spifi->mcmd = SPIFI_CMD_FIELDFORM_ALL_SERIAL;
>>>  		break;
>>> -	case SPI_NOR_DUAL:
>>> -	case SPI_NOR_QUAD:
>>> +	case SNOR_PROTO_1_1_2:
>>> +	case SNOR_PROTO_1_1_4:
>>>  		spifi->mcmd = SPIFI_CMD_FIELDFORM_QUAD_DUAL_DATA;
>>>  		break;
>>>  	default:
>>> @@ -274,7 +273,11 @@ static void nxp_spifi_dummy_id_read(struct spi_nor *nor)
>>>  static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
>>>  				 struct device_node *np)
>>>  {
>>> -	enum read_mode flash_read;
>>> +	struct spi_nor_hwcaps hwcaps = {
>>> +		.mask = (SNOR_HWCAPS_READ |
>>> +			 SNOR_HWCAPS_READ_FAST |
>>> +			 SNOR_HWCAPS_PP),
>>> +	};
>>>  	u32 ctrl, property;
>>>  	u16 mode = 0;
>>>  	int ret;
>>> @@ -308,13 +311,12 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
>>>  
>>>  	if (mode & SPI_RX_DUAL) {
>>>  		ctrl |= SPIFI_CTRL_DUAL;
>>> -		flash_read = SPI_NOR_DUAL;
>>> +		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
>>>  	} else if (mode & SPI_RX_QUAD) {
>>>  		ctrl &= ~SPIFI_CTRL_DUAL;
>>> -		flash_read = SPI_NOR_QUAD;
>>> +		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
>>>  	} else {
>>>  		ctrl |= SPIFI_CTRL_DUAL;
>>> -		flash_read = SPI_NOR_NORMAL;
>>>  	}
>>>  
>>>  	switch (mode & (SPI_CPHA | SPI_CPOL)) {
>>> @@ -351,7 +353,7 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
>>>  	 */
>>>  	nxp_spifi_dummy_id_read(&spifi->nor);
>>>  
>>> -	ret = spi_nor_scan(&spifi->nor, NULL, flash_read);
>>> +	ret = spi_nor_scan(&spifi->nor, NULL, &hwcaps);
>>>  	if (ret) {
>>>  		dev_err(spifi->dev, "device scan failed\n");
>>>  		return ret;
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index d3cb44b28490..cc443c6cbae8 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -150,24 +150,6 @@ static int read_cr(struct spi_nor *nor)
>>>  }
>>>  
>>>  /*
>>> - * Dummy Cycle calculation for different type of read.
>>> - * It can be used to support more commands with
>>> - * different dummy cycle requirements.
>>> - */
>>> -static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
>>> -{
>>> -	switch (nor->flash_read) {
>>> -	case SPI_NOR_FAST:
>>> -	case SPI_NOR_DUAL:
>>> -	case SPI_NOR_QUAD:
>>> -		return 8;
>>> -	case SPI_NOR_NORMAL:
>>> -		return 0;
>>> -	}
>>> -	return 0;
>>> -}
>>> -
>>> -/*
>>>   * Write status register 1 byte
>>>   * Returns negative if error occurred.
>>>   */
>>> @@ -221,6 +203,10 @@ static inline u8 spi_nor_convert_3to4_read(u8 opcode)
>>>  		{ SPINOR_OP_READ_1_2_2,	SPINOR_OP_READ_1_2_2_4B },
>>>  		{ SPINOR_OP_READ_1_1_4,	SPINOR_OP_READ_1_1_4_4B },
>>>  		{ SPINOR_OP_READ_1_4_4,	SPINOR_OP_READ_1_4_4_4B },
>>> +
>>> +		{ SPINOR_OP_READ_1_1_1_DTR,	SPINOR_OP_READ_1_1_1_DTR_4B },
>>> +		{ SPINOR_OP_READ_1_2_2_DTR,	SPINOR_OP_READ_1_2_2_DTR_4B },
>>> +		{ SPINOR_OP_READ_1_4_4_DTR,	SPINOR_OP_READ_1_4_4_DTR_4B },
>>>  	};
>>>  
>>>  	return spi_nor_convert_opcode(opcode, spi_nor_3to4_read,
>>> @@ -1459,30 +1445,6 @@ static int spansion_quad_enable(struct spi_nor *nor)
>>>  	return 0;
>>>  }
>>>  
>>> -static int set_quad_mode(struct spi_nor *nor, const struct flash_info *info)
>>> -{
>>> -	int status;
>>> -
>>> -	switch (JEDEC_MFR(info)) {
>>> -	case SNOR_MFR_MACRONIX:
>>> -		status = macronix_quad_enable(nor);
>>> -		if (status) {
>>> -			dev_err(nor->dev, "Macronix quad-read not enabled\n");
>>> -			return -EINVAL;
>>> -		}
>>> -		return status;
>>> -	case SNOR_MFR_MICRON:
>>> -		return 0;
>>> -	default:
>>> -		status = spansion_quad_enable(nor);
>>> -		if (status) {
>>> -			dev_err(nor->dev, "Spansion quad-read not enabled\n");
>>> -			return -EINVAL;
>>> -		}
>>> -		return status;
>>> -	}
>>> -}
>>> -
>>>  static int spi_nor_check(struct spi_nor *nor)
>>>  {
>>>  	if (!nor->dev || !nor->read || !nor->write ||
>>> @@ -1535,8 +1497,322 @@ static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
>>>  	return 0;
>>>  }
>>>  
>>> -int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>> +
>>> +struct spi_nor_read_command {
>>> +	u8			num_mode_clocks;
>>> +	u8			num_wait_states;
>>> +	u8			opcode;
>>> +	enum spi_nor_protocol	proto;
>>> +};
>>> +
>>> +struct spi_nor_pp_command {
>>> +	u8			opcode;
>>> +	enum spi_nor_protocol	proto;
>>> +};
>>> +
>>> +enum spi_nor_read_command_index {
>>> +	SNOR_CMD_READ,
>>> +	SNOR_CMD_READ_FAST,
>>> +	SNOR_CMD_READ_1_1_1_DTR,
>>> +
>>> +	/* Dual SPI */
>>> +	SNOR_CMD_READ_1_1_2,
>>> +	SNOR_CMD_READ_1_2_2,
>>> +	SNOR_CMD_READ_2_2_2,
>>> +	SNOR_CMD_READ_1_2_2_DTR,
>>> +
>>> +	/* Quad SPI */
>>> +	SNOR_CMD_READ_1_1_4,
>>> +	SNOR_CMD_READ_1_4_4,
>>> +	SNOR_CMD_READ_4_4_4,
>>> +	SNOR_CMD_READ_1_4_4_DTR,
>>> +
>>> +	/* Octo SPI */
>>> +	SNOR_CMD_READ_1_1_8,
>>> +	SNOR_CMD_READ_1_8_8,
>>> +	SNOR_CMD_READ_8_8_8,
>>> +	SNOR_CMD_READ_1_8_8_DTR,
>>> +
>>> +	SNOR_CMD_READ_MAX
>>> +};
>>> +
>>> +enum spi_nor_pp_command_index {
>>> +	SNOR_CMD_PP,
>>> +
>>> +	/* Quad SPI */
>>> +	SNOR_CMD_PP_1_1_4,
>>> +	SNOR_CMD_PP_1_4_4,
>>> +	SNOR_CMD_PP_4_4_4,
>>> +
>>> +	/* Octo SPI */
>>> +	SNOR_CMD_PP_1_1_8,
>>> +	SNOR_CMD_PP_1_8_8,
>>> +	SNOR_CMD_PP_8_8_8,
>>> +
>>> +	SNOR_CMD_PP_MAX
>>> +};
>>> +
>>> +struct spi_nor_flash_parameter {
>>> +	u64				size;
>>> +	u32				page_size;
>>> +
>>> +	struct spi_nor_hwcaps		hwcaps;
>>> +	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
>>> +	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
>>> +
>>> +	int (*quad_enable)(struct spi_nor *nor);
>>> +};
>>> +
>>> +
>>> +static inline void
>>> +spi_nor_set_read_settings(struct spi_nor_read_command *read,
>>> +			  u8 num_mode_clocks,
>>> +			  u8 num_wait_states,
>>> +			  u8 opcode,
>>> +			  enum spi_nor_protocol proto)
>>> +{
>>> +	read->num_mode_clocks = num_mode_clocks;
>>> +	read->num_wait_states = num_wait_states;
>>> +	read->opcode = opcode;
>>> +	read->proto = proto;
>>> +}
>>> +
>>> +static inline void
>>> +spi_nor_set_pp_settings(struct spi_nor_pp_command *pp,
>>> +			u8 opcode,
>>> +			enum spi_nor_protocol proto)
>>> +{
>>> +	pp->opcode = opcode;
>>> +	pp->proto = proto;
>>> +}
>>> +
>>> +static int spi_nor_init_params(struct spi_nor *nor,
>>> +			       const struct flash_info *info,
>>> +			       struct spi_nor_flash_parameter *params)
>>> +{
>>> +	/* Set legacy flash parameters as default. */
>>> +	memset(params, 0, sizeof(*params));
>>> +
>>> +	/* Set SPI NOR sizes. */
>>> +	params->size = info->sector_size * info->n_sectors;
>>> +	params->page_size = info->page_size;
>>> +
>>> +	/* (Fast) Read settings. */
>>> +	params->hwcaps.mask |= SNOR_HWCAPS_READ;
>>> +	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
>>> +				  0, 0, SPINOR_OP_READ,
>>> +				  SNOR_PROTO_1_1_1);
>>> +	if (!(info->flags & SPI_NOR_NO_FR)) {
>>> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
>>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
>>> +					  0, 8, SPINOR_OP_READ_FAST,
>>> +					  SNOR_PROTO_1_1_1);
>>> +	}
>>> +	if (info->flags & SPI_NOR_DUAL_READ) {
>>> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
>>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
>>> +					  0, 8, SPINOR_OP_READ_1_1_2,
>>> +					  SNOR_PROTO_1_1_2);
>>> +	}
>>> +	if (info->flags & SPI_NOR_QUAD_READ) {
>>> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
>>> +		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
>>> +					  0, 8, SPINOR_OP_READ_1_1_4,
>>> +					  SNOR_PROTO_1_1_4);
>>> +	}
>>> +
>>> +	/* Page Program settings. */
>>> +	params->hwcaps.mask |= SNOR_HWCAPS_PP;
>>> +	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
>>> +				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
>>> +
>>> +	/* Select the procedure to set the Quad Enable bit. */
>>> +	if (params->hwcaps.mask & (SNOR_HWCAPS_READ_QUAD |
>>> +				   SNOR_HWCAPS_PP_QUAD)) {
>>> +		switch (JEDEC_MFR(info)) {
>>> +		case SNOR_MFR_MACRONIX:
>>> +			params->quad_enable = macronix_quad_enable;
>>> +			break;
>>> +
>>> +		case SNOR_MFR_MICRON:
>>> +			break;
>>> +
>>> +		default:
>>> +			params->quad_enable = spansion_quad_enable;
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int spi_nor_hwcaps2cmd(u32 hwcaps)
>>>  {
>>> +	switch (hwcaps) {
>>> +	case SNOR_HWCAPS_READ:			return SNOR_CMD_READ;
>>> +	case SNOR_HWCAPS_READ_FAST:		return SNOR_CMD_READ_FAST;
>>> +	case SNOR_HWCAPS_READ_1_1_1_DTR:	return SNOR_CMD_READ_1_1_1_DTR;
>>> +	case SNOR_HWCAPS_READ_1_1_2:		return SNOR_CMD_READ_1_1_2;
>>> +	case SNOR_HWCAPS_READ_1_2_2:		return SNOR_CMD_READ_1_2_2;
>>> +	case SNOR_HWCAPS_READ_2_2_2:		return SNOR_CMD_READ_2_2_2;
>>> +	case SNOR_HWCAPS_READ_1_2_2_DTR:	return SNOR_CMD_READ_1_2_2_DTR;
>>> +	case SNOR_HWCAPS_READ_1_1_4:		return SNOR_CMD_READ_1_1_4;
>>> +	case SNOR_HWCAPS_READ_1_4_4:		return SNOR_CMD_READ_1_4_4;
>>> +	case SNOR_HWCAPS_READ_4_4_4:		return SNOR_CMD_READ_4_4_4;
>>> +	case SNOR_HWCAPS_READ_1_4_4_DTR:	return SNOR_CMD_READ_1_4_4_DTR;
>>> +	case SNOR_HWCAPS_READ_1_1_8:		return SNOR_CMD_READ_1_1_8;
>>> +	case SNOR_HWCAPS_READ_1_8_8:		return SNOR_CMD_READ_1_8_8;
>>> +	case SNOR_HWCAPS_READ_8_8_8:		return SNOR_CMD_READ_8_8_8;
>>> +	case SNOR_HWCAPS_READ_1_8_8_DTR:	return SNOR_CMD_READ_1_8_8_DTR;
>>> +
>>> +	case SNOR_HWCAPS_PP:			return SNOR_CMD_PP;
>>> +	case SNOR_HWCAPS_PP_1_1_4:		return SNOR_CMD_PP_1_1_4;
>>> +	case SNOR_HWCAPS_PP_1_4_4:		return SNOR_CMD_PP_1_4_4;
>>> +	case SNOR_HWCAPS_PP_4_4_4:		return SNOR_CMD_PP_4_4_4;
>>> +	case SNOR_HWCAPS_PP_1_1_8:		return SNOR_CMD_PP_1_1_8;
>>> +	case SNOR_HWCAPS_PP_1_8_8:		return SNOR_CMD_PP_1_8_8;
>>> +	case SNOR_HWCAPS_PP_8_8_8:		return SNOR_CMD_PP_8_8_8;
>>> +	}
>>> +
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int spi_nor_select_read(struct spi_nor *nor,
>>> +			       const struct spi_nor_flash_parameter *params,
>>> +			       u32 shared_hwcaps)
>>> +{
>>> +	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_READ_MASK) - 1;
>>> +	const struct spi_nor_read_command *read;
>>> +
>>> +	if (best_match < 0)
>>> +		return -EINVAL;
>>> +
>>> +	cmd = spi_nor_hwcaps2cmd(BIT(best_match));
>>> +	if (cmd < 0)
>>> +		return -EINVAL;
>>> +
>>> +	read = &params->reads[cmd];
>>> +	nor->read_opcode = read->opcode;
>>> +	nor->read_proto = read->proto;
>>> +
>>> +	/*
>>> +	 * In the spi-nor framework, we don't need to make the difference
>>> +	 * between mode clock cycles and wait state clock cycles.
>>> +	 * Indeed, the value of the mode clock cycles is used by a QSPI
>>> +	 * flash memory to know whether it should enter or leave its 0-4-4
>>> +	 * (Continuous Read / XIP) mode.
>>> +	 * eXecution In Place is out of the scope of the mtd sub-system.
>>> +	 * Hence we choose to merge both mode and wait state clock cycles
>>> +	 * into the so called dummy clock cycles.
>>> +	 */
>>> +	nor->read_dummy = read->num_mode_clocks + read->num_wait_states;
>>> +	return 0;
>>> +}
>>> +
>>> +static int spi_nor_select_pp(struct spi_nor *nor,
>>> +			     const struct spi_nor_flash_parameter *params,
>>> +			     u32 shared_hwcaps)
>>> +{
>>> +	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_PP_MASK) - 1;
>>> +	const struct spi_nor_pp_command *pp;
>>> +
>>> +	if (best_match < 0)
>>> +		return -EINVAL;
>>> +
>>> +	cmd = spi_nor_hwcaps2cmd(BIT(best_match));
>>> +	if (cmd < 0)
>>> +		return -EINVAL;
>>> +
>>> +	pp = &params->page_programs[cmd];
>>> +	nor->program_opcode = pp->opcode;
>>> +	nor->write_proto = pp->proto;
>>> +	return 0;
>>> +}
>>> +
>>> +static int spi_nor_select_erase(struct spi_nor *nor,
>>> +				const struct flash_info *info)
>>> +{
>>> +	struct mtd_info *mtd = &nor->mtd;
>>> +
>>> +#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>>> +	/* prefer "small sector" erase if possible */
>>> +	if (info->flags & SECT_4K) {
>>> +		nor->erase_opcode = SPINOR_OP_BE_4K;
>>> +		mtd->erasesize = 4096;
>>> +	} else if (info->flags & SECT_4K_PMC) {
>>> +		nor->erase_opcode = SPINOR_OP_BE_4K_PMC;
>>> +		mtd->erasesize = 4096;
>>> +	} else
>>> +#endif
>>> +	{
>>> +		nor->erase_opcode = SPINOR_OP_SE;
>>> +		mtd->erasesize = info->sector_size;
>>> +	}
>>> +	return 0;
>>> +}
>>> +
>>> +static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
>>> +			 const struct spi_nor_flash_parameter *params,
>>> +			 const struct spi_nor_hwcaps *hwcaps)
>>> +{
>>> +	u32 ignored_mask, shared_mask;
>>> +	bool enable_quad_io;
>>> +	int err;
>>> +
>>> +	/*
>>> +	 * Keep only the hardware capabilities supported by both the SPI
>>> +	 * controller and the SPI flash memory.
>>> +	 */
>>> +	shared_mask = hwcaps->mask & params->hwcaps.mask;
>>> +
>>> +	/* SPI protocol classes N-N-N are not supported yet. */
>>> +	ignored_mask = (SNOR_HWCAPS_READ_2_2_2 |
>>> +			SNOR_HWCAPS_READ_4_4_4 |
>>> +			SNOR_HWCAPS_READ_8_8_8 |
>>> +			SNOR_HWCAPS_PP_4_4_4 |
>>> +			SNOR_HWCAPS_PP_8_8_8);
>>> +	if (shared_mask & ignored_mask) {
>>> +		dev_dbg(nor->dev,
>>> +			"SPI protocol classes N-N-N are not supported yet.\n");
>>> +		shared_mask &= ~ignored_mask;
>>> +	}
>>> +
>>> +	/* Select the (Fast) Read command. */
>>> +	err = spi_nor_select_read(nor, params, shared_mask);
>>> +	if (err) {
>>> +		dev_err(nor->dev, "invalid (fast) read\n");
>>> +		return err;
>>> +	}
>>> +
>>> +	/* Select the Page Program command. */
>>> +	err = spi_nor_select_pp(nor, params, shared_mask);
>>> +	if (err) {
>>> +		dev_err(nor->dev, "invalid page program\n");
>>> +		return err;
>>> +	}
>>> +
>>> +	/* Select the Sector Erase command. */
>>> +	err = spi_nor_select_erase(nor, info);
>>> +	if (err) {
>>> +		dev_err(nor->dev, "invalid sector/block erase\n");
>>> +		return err;
>>> +	}
>>> +
>>> +	/* Enable Quad I/O if needed. */
>>> +	enable_quad_io = (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
>>> +			  spi_nor_get_protocol_width(nor->write_proto) == 4);
>>> +	if (enable_quad_io && params->quad_enable)
>>> +		nor->flash_quad_enable = params->quad_enable;
>>> +	else
>>> +		nor->flash_quad_enable = NULL;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +int spi_nor_scan(struct spi_nor *nor, const char *name,
>>> +		 const struct spi_nor_hwcaps *hwcaps)
>>> +{
>>> +	struct spi_nor_flash_parameter params;
>>>  	const struct flash_info *info = NULL;
>>>  	struct device *dev = nor->dev;
>>>  	struct mtd_info *mtd = &nor->mtd;
>>> @@ -1548,6 +1824,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> +	/* Reset SPI protocol for all commands */
>>> +	nor->reg_proto = SNOR_PROTO_1_1_1;
>>> +	nor->read_proto = SNOR_PROTO_1_1_1;
>>> +	nor->write_proto = SNOR_PROTO_1_1_1;
>>> +
>>>  	if (name)
>>>  		info = spi_nor_match_id(name);
>>>  	/* Try to auto-detect if chip name wasn't specified or not found */
>>> @@ -1580,6 +1861,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>>  		}
>>>  	}
>>>  
>>> +	/* Parse the Serial Flash Discoverable Parameters table */
>>> +	ret = spi_nor_init_params(nor, info, &params);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>  	mutex_init(&nor->lock);
>>>  
>>>  	/*
>>> @@ -1610,7 +1896,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>>  	mtd->type = MTD_NORFLASH;
>>>  	mtd->writesize = 1;
>>>  	mtd->flags = MTD_CAP_NORFLASH;
>>> -	mtd->size = info->sector_size * info->n_sectors;
>>> +	mtd->size = params.size;
>>>  	mtd->_erase = spi_nor_erase;
>>>  	mtd->_read = spi_nor_read;
>>>  
>>> @@ -1641,76 +1927,47 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>>  	if (info->flags & NO_CHIP_ERASE)
>>>  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>>>  
>>> -#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>>> -	/* prefer "small sector" erase if possible */
>>> -	if (info->flags & SECT_4K) {
>>> -		nor->erase_opcode = SPINOR_OP_BE_4K;
>>> -		mtd->erasesize = 4096;
>>> -	} else if (info->flags & SECT_4K_PMC) {
>>> -		nor->erase_opcode = SPINOR_OP_BE_4K_PMC;
>>> -		mtd->erasesize = 4096;
>>> -	} else
>>> -#endif
>>> -	{
>>> -		nor->erase_opcode = SPINOR_OP_SE;
>>> -		mtd->erasesize = info->sector_size;
>>> -	}
>>> -
>>>  	if (info->flags & SPI_NOR_NO_ERASE)
>>>  		mtd->flags |= MTD_NO_ERASE;
>>>  
>>>  	mtd->dev.parent = dev;
>>> -	nor->page_size = info->page_size;
>>> +	nor->page_size = params.page_size;
>>>  	mtd->writebufsize = nor->page_size;
>>>  
>>>  	if (np) {
>>>  		/* If we were instantiated by DT, use it */
>>>  		if (of_property_read_bool(np, "m25p,fast-read"))
>>> -			nor->flash_read = SPI_NOR_FAST;
>>> +			params.hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
>>>  		else
>>> -			nor->flash_read = SPI_NOR_NORMAL;
>>> +			params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
>>>  	} else {
>>>  		/* If we weren't instantiated by DT, default to fast-read */
>>> -		nor->flash_read = SPI_NOR_FAST;
>>> +		params.hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
>>>  	}
>>>  
>>>  	/* Some devices cannot do fast-read, no matter what DT tells us */
>>>  	if (info->flags & SPI_NOR_NO_FR)
>>> -		nor->flash_read = SPI_NOR_NORMAL;
>>> +		params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
>>> +
>>> +	/*
>>> +	 * Configure the SPI memory:
>>> +	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
>>> +	 * - set the number of dummy cycles (mode cycles + wait states).
>>> +	 * - set the SPI protocols for register and memory accesses.
>>> +	 * - set the Quad Enable bit if needed (required by SPI x-y-4 protos).
>>> +	 */
>>> +	ret = spi_nor_setup(nor, info, &params, hwcaps);
>>> +	if (ret)
>>> +		return ret;
>>>  
>>> -	/* Quad/Dual-read mode takes precedence over fast/normal */
>>> -	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
>>> -		ret = set_quad_mode(nor, info);
>>> +	if (nor->flash_quad_enable) {
>>> +		ret = nor->flash_quad_enable(nor);
>>>  		if (ret) {
>>>  			dev_err(dev, "quad mode not supported\n");
>>>  			return ret;
>>>  		}
>>> -		nor->flash_read = SPI_NOR_QUAD;
>>> -	} else if (mode == SPI_NOR_DUAL && info->flags & SPI_NOR_DUAL_READ) {
>>> -		nor->flash_read = SPI_NOR_DUAL;
>>>  	}
>>>  
>>> -	/* Default commands */
>>> -	switch (nor->flash_read) {
>>> -	case SPI_NOR_QUAD:
>>> -		nor->read_opcode = SPINOR_OP_READ_1_1_4;
>>> -		break;
>>> -	case SPI_NOR_DUAL:
>>> -		nor->read_opcode = SPINOR_OP_READ_1_1_2;
>>> -		break;
>>> -	case SPI_NOR_FAST:
>>> -		nor->read_opcode = SPINOR_OP_READ_FAST;
>>> -		break;
>>> -	case SPI_NOR_NORMAL:
>>> -		nor->read_opcode = SPINOR_OP_READ;
>>> -		break;
>>> -	default:
>>> -		dev_err(dev, "No Read opcode defined\n");
>>> -		return -EINVAL;
>>> -	}
>>> -
>>> -	nor->program_opcode = SPINOR_OP_PP;
>>> -
>>>  	if (info->addr_width)
>>>  		nor->addr_width = info->addr_width;
>>>  	else if (mtd->size > 0x1000000) {
>>> @@ -1731,8 +1988,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>>  		return -EINVAL;
>>>  	}
>>>  
>>> -	nor->read_dummy = spi_nor_read_dummy_cycles(nor);
>>> -
>>>  	if (info->flags & SPI_S3AN) {
>>>  		ret = s3an_nor_scan(info, nor);
>>>  		if (ret)
>>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>>> index f2a718030476..732ee6cd5330 100644
>>> --- a/include/linux/mtd/spi-nor.h
>>> +++ b/include/linux/mtd/spi-nor.h
>>> @@ -73,6 +73,15 @@
>>>  #define SPINOR_OP_BE_32K_4B	0x5c	/* Erase 32KiB block */
>>>  #define SPINOR_OP_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
>>>  
>>> +/* Double Transfer Rate opcodes - defined in JEDEC JESD216B. */
>>> +#define SPINOR_OP_READ_1_1_1_DTR	0x0d
>>> +#define SPINOR_OP_READ_1_2_2_DTR	0xbd
>>> +#define SPINOR_OP_READ_1_4_4_DTR	0xed
>>> +
>>> +#define SPINOR_OP_READ_1_1_1_DTR_4B	0x0e
>>> +#define SPINOR_OP_READ_1_2_2_DTR_4B	0xbe
>>> +#define SPINOR_OP_READ_1_4_4_DTR_4B	0xee
>>> +
>>>  /* Used for SST flashes only. */
>>>  #define SPINOR_OP_BP		0x02	/* Byte program */
>>>  #define SPINOR_OP_WRDI		0x04	/* Write disable */
>>> @@ -119,13 +128,75 @@
>>>  /* Configuration Register bits. */
>>>  #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
>>>  
>>> -enum read_mode {
>>> -	SPI_NOR_NORMAL = 0,
>>> -	SPI_NOR_FAST,
>>> -	SPI_NOR_DUAL,
>>> -	SPI_NOR_QUAD,
>>> +
>>> +/* Supported SPI protocols */
>>> +#define SNOR_PROTO_WIDTH_MASK	GENMASK(7, 0)
>>> +
>>> +#define SNOR_PROTO_CLASS_MASK	GENMASK(9, 8)
>>> +#define SNOR_PROTO_CLASS_1_1_N	(0x0u << 8)
>>> +#define SNOR_PROTO_CLASS_1_N_N	(0x1u << 8)
>>> +#define SNOR_PROTO_CLASS_N_N_N	(0x2u << 8)
>>> +
>>> +#define SNOR_PROTO_IS_DTR	BIT(10)	/* Double Transfer Rate */
>>> +
>>> +#define SNOR_PROTO_STR(_pclass, _pwidth) \
>>> +	((_pclass) | (_pwidth))
>>> +#define SNOR_PROTO_DTR(_pclass, _pwidth) \
>>> +	(SNOR_PROTO_IS_DTR | (_pclass) | (_pwidth))
>>> +
>>> +enum spi_nor_protocol {
>>> +	SNOR_PROTO_1_1_1 = SNOR_PROTO_STR(SNOR_PROTO_CLASS_1_1_N, 1),
>>> +	SNOR_PROTO_1_1_2 = SNOR_PROTO_STR(SNOR_PROTO_CLASS_1_1_N, 2),
>>> +	SNOR_PROTO_1_1_4 = SNOR_PROTO_STR(SNOR_PROTO_CLASS_1_1_N, 4),
>>> +	SNOR_PROTO_1_1_8 = SNOR_PROTO_STR(SNOR_PROTO_CLASS_1_1_N, 8),
>>> +	SNOR_PROTO_1_2_2 = SNOR_PROTO_STR(SNOR_PROTO_CLASS_1_N_N, 2),
>>> +	SNOR_PROTO_1_4_4 = SNOR_PROTO_STR(SNOR_PROTO_CLASS_1_N_N, 4),
>>> +	SNOR_PROTO_1_8_8 = SNOR_PROTO_STR(SNOR_PROTO_CLASS_1_N_N, 8),
>>> +	SNOR_PROTO_2_2_2 = SNOR_PROTO_STR(SNOR_PROTO_CLASS_N_N_N, 2),
>>> +	SNOR_PROTO_4_4_4 = SNOR_PROTO_STR(SNOR_PROTO_CLASS_N_N_N, 4),
>>> +	SNOR_PROTO_8_8_8 = SNOR_PROTO_STR(SNOR_PROTO_CLASS_N_N_N, 8),
>>> +
>>> +	SNOR_PROTO_1_1_1_DTR = SNOR_PROTO_DTR(SNOR_PROTO_CLASS_1_1_N, 1),
>>> +	SNOR_PROTO_1_2_2_DTR = SNOR_PROTO_DTR(SNOR_PROTO_CLASS_1_N_N, 2),
>>> +	SNOR_PROTO_1_4_4_DTR = SNOR_PROTO_DTR(SNOR_PROTO_CLASS_1_N_N, 4),
>>> +	SNOR_PROTO_1_8_8_DTR = SNOR_PROTO_DTR(SNOR_PROTO_CLASS_1_N_N, 8),
>>>  };
>>>  
>>> +static inline bool spi_nor_protocol_is_dtr(enum spi_nor_protocol proto)
>>> +{
>>> +	return (proto & SNOR_PROTO_IS_DTR) == SNOR_PROTO_IS_DTR;
>>> +}
>>> +
>>> +static inline u32 spi_nor_get_protocol_class(enum spi_nor_protocol proto)
>>> +{
>>> +	return proto & SNOR_PROTO_CLASS_MASK;
>>> +}
>>> +
>>> +static inline u8 spi_nor_get_protocol_width(enum spi_nor_protocol proto)
>>> +{
>>> +	return proto & SNOR_PROTO_WIDTH_MASK;
>>> +}
>>> +
>>> +static inline u8 spi_nor_get_protocol_inst_width(enum spi_nor_protocol proto)
>>> +{
>>> +	return (spi_nor_get_protocol_class(proto) == SNOR_PROTO_CLASS_N_N_N) ?
>>> +		spi_nor_get_protocol_width(proto) :
>>> +		1u;
>>> +}
>>> +
>>> +static inline u8 spi_nor_get_protocol_addr_width(enum spi_nor_protocol proto)
>>> +{
>>> +	return (spi_nor_get_protocol_class(proto) != SNOR_PROTO_CLASS_1_1_N) ?
>>> +		spi_nor_get_protocol_width(proto) :
>>> +		1u;
>>> +}
>>> +
>>> +static inline u8 spi_nor_get_protocol_data_width(enum spi_nor_protocol proto)
>>> +{
>>> +	return spi_nor_get_protocol_width(proto);
>>> +}
>>> +
>>> +
>>>  #define SPI_NOR_MAX_CMD_SIZE	8
>>>  enum spi_nor_ops {
>>>  	SPI_NOR_OPS_READ = 0,
>>> @@ -154,9 +225,11 @@ enum spi_nor_option_flags {
>>>   * @read_opcode:	the read opcode
>>>   * @read_dummy:		the dummy needed by the read operation
>>>   * @program_opcode:	the program opcode
>>> - * @flash_read:		the mode of the read
>>>   * @sst_write_second:	used by the SST write operation
>>>   * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
>>> + * @read_proto:		the SPI protocol for read operations
>>> + * @write_proto:	the SPI protocol for write operations
>>> + * @reg_proto		the SPI protocol for read_reg/write_reg/erase operations
>>>   * @cmd_buf:		used by the write_reg
>>>   * @prepare:		[OPTIONAL] do some preparations for the
>>>   *			read/write/erase/lock/unlock operations
>>> @@ -173,6 +246,7 @@ enum spi_nor_option_flags {
>>>   * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
>>>   * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
>>>   *			completely locked
>>> + * @flash_quad_enable:	[FLASH-SPECIFIC] set the Quad Enable bit of the SPI NOR
>>>   * @priv:		the private data
>>>   */
>>>  struct spi_nor {
>>> @@ -185,7 +259,9 @@ struct spi_nor {
>>>  	u8			read_opcode;
>>>  	u8			read_dummy;
>>>  	u8			program_opcode;
>>> -	enum read_mode		flash_read;
>>> +	enum spi_nor_protocol	read_proto;
>>> +	enum spi_nor_protocol	write_proto;
>>> +	enum spi_nor_protocol	reg_proto;
>>>  	bool			sst_write_second;
>>>  	u32			flags;
>>>  	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
>>> @@ -204,6 +280,7 @@ struct spi_nor {
>>>  	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>>>  	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>>>  	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>>> +	int (*flash_quad_enable)(struct spi_nor *nor);
>>>  
>>>  	void *priv;
>>>  };
>>> @@ -219,11 +296,73 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
>>>  	return mtd_get_of_node(&nor->mtd);
>>>  }
>>>  
>>> +
>>> +/**
>>> + * struct spi_nor_hwcaps - Structure for describing the hardware capabilies
>>> + * supported by the SPI controller (bus master).
>>> + * @mask:		the bitmask listing all the supported hw capabilies
>>> + */
>>> +struct spi_nor_hwcaps {
>>> +	u32	mask;
>>> +};
>>> +
>>> +/*
>>> + *(Fast) Read capabilities.
>>> + * MUST be ordered by priority: the higher bit position, the higher priority.
>>> + * As a matter of performances, it is relevant to use Octo SPI protocols first,
>>> + * then Quad SPI protocols before Dual SPI protocols, Fast Read and lastly
>>> + * (Slow) Read.
>>> + */
>>> +#define SNOR_HWCAPS_READ_MASK		GENMASK(15, 0)
>>> +#define SNOR_HWCAPS_READ		BIT(0)
>>> +#define SNOR_HWCAPS_READ_FAST		BIT(1)
>>> +#define SNOR_HWCAPS_READ_1_1_1_DTR	BIT(2)
>>> +
>>> +#define SNOR_HWCAPS_READ_DUAL		GENMASK(7, 4)
>>> +#define SNOR_HWCAPS_READ_1_1_2		BIT(4)
>>> +#define SNOR_HWCAPS_READ_1_2_2		BIT(5)
>>> +#define SNOR_HWCAPS_READ_2_2_2		BIT(6)
>>> +#define SNOR_HWCAPS_READ_1_2_2_DTR	BIT(7)
>>> +
>>> +#define SNOR_HWCAPS_READ_QUAD		GENMASK(11, 8)
>>> +#define SNOR_HWCAPS_READ_1_1_4		BIT(8)
>>> +#define SNOR_HWCAPS_READ_1_4_4		BIT(9)
>>> +#define SNOR_HWCAPS_READ_4_4_4		BIT(10)
>>> +#define SNOR_HWCAPS_READ_1_4_4_DTR	BIT(11)
>>> +
>>> +#define SNOR_HWCPAS_READ_OCTO		GENMASK(15, 12)
>>> +#define SNOR_HWCAPS_READ_1_1_8		BIT(12)
>>> +#define SNOR_HWCAPS_READ_1_8_8		BIT(13)
>>> +#define SNOR_HWCAPS_READ_8_8_8		BIT(14)
>>> +#define SNOR_HWCAPS_READ_1_8_8_DTR	BIT(15)
>>> +
>>> +/*
>>> + * Page Program capabilities.
>>> + * MUST be ordered by priority: the higher bit position, the higher priority.
>>> + * Like (Fast) Read capabilities, Octo/Quad SPI protocols are preferred to the
>>> + * legacy SPI 1-1-1 protocol.
>>> + * Note that Dual Page Programs are not supported because there is no existing
>>> + * JEDEC/SFDP standard to define them. Also at this moment no SPI flash memory
>>> + * implements such commands.
>>> + */
>>> +#define SNOR_HWCAPS_PP_MASK	GENMASK(22, 16)
>>> +#define SNOR_HWCAPS_PP		BIT(16)
>>> +
>>> +#define SNOR_HWCAPS_PP_QUAD	GENMASK(19, 17)
>>> +#define SNOR_HWCAPS_PP_1_1_4	BIT(17)
>>> +#define SNOR_HWCAPS_PP_1_4_4	BIT(18)
>>> +#define SNOR_HWCAPS_PP_4_4_4	BIT(19)
>>> +
>>> +#define SNOR_HWCAPS_PP_OCTO	GENMASK(22, 20)
>>> +#define SNOR_HWCAPS_PP_1_1_8	BIT(20)
>>> +#define SNOR_HWCAPS_PP_1_8_8	BIT(21)
>>> +#define SNOR_HWCAPS_PP_8_8_8	BIT(22)
>>> +
>>>  /**
>>>   * spi_nor_scan() - scan the SPI NOR
>>>   * @nor:	the spi_nor structure
>>>   * @name:	the chip type name
>>> - * @mode:	the read mode supported by the driver
>>> + * @hwcaps:	the hardware capabilities supported by the controller driver
>>>   *
>>>   * The drivers can use this fuction to scan the SPI NOR.
>>>   * In the scanning, it will try to get all the necessary information to
>>> @@ -233,6 +372,7 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
>>>   *
>>>   * Return: 0 for success, others for failure.
>>>   */
>>> -int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode);
>>> +int spi_nor_scan(struct spi_nor *nor, const char *name,
>>> +		 const struct spi_nor_hwcaps *hwcaps);
>>>  
>>>  #endif
>>>
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
> 

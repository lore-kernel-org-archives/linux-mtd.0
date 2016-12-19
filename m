Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJ0xw-0004w0-8I
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 16:39:10 +0000
Subject: Re: [PATCH v4 4/8] mtd: spi-nor: add support of SPI protocols like
 SPI 1-2-2 and SPI 1-4-4
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
References: <cover.1479736401.git.cyrille.pitchen@atmel.com>
 <9adeee98798f3ba9bb01f86e1bd1a3543643a2ec.1479736401.git.cyrille.pitchen@atmel.com>
 <AM4PR0701MB2130C191B75A408799F4C4C7FE9B0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
CC: "nicolas.ferre@atmel.com" <nicolas.ferre@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <bb284caf-0623-c2e6-bb30-37d19b46f259@atmel.com>
Date: Mon, 19 Dec 2016 17:38:44 +0100
MIME-Version: 1.0
In-Reply-To: <AM4PR0701MB2130C191B75A408799F4C4C7FE9B0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marcin,

Le 13/12/2016 à 10:46, Krzeminski, Marcin (Nokia - PL/Wroclaw) a écrit :
> Cyrille,
> 
>> -----Original Message-----
>> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
>> Of Cyrille Pitchen
>> Sent: Monday, November 21, 2016 3:16 PM
>> To: computersforpeace@gmail.com; marek.vasut@gmail.com;
>> boris.brezillon@free-electrons.com; richard@nod.at; linux-
>> mtd@lists.infradead.org
>> Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>; nicolas.ferre@atmel.com;
>> linux-kernel@vger.kernel.org
>> Subject: [PATCH v4 4/8] mtd: spi-nor: add support of SPI protocols like SPI 1-
>> 2-2 and SPI 1-4-4
>>
>> This patch changes the prototype of spi_nor_scan(): its 3rd parameter is
>> replaced by a const struct spi_nor_modes pointer, which tells the spi-nor
>> framework about which SPI protocols are supported by the SPI controller.
>>
>> Besides, this patch also introduces a new spi_nor_basic_flash_parameter
>> structure telling the spi-nor framework about the SPI protocols supported by
>> the SPI memory and the needed op codes to use these SPI protocols.
>>
>> Currently the struct spi_nor_basic_flash_parameter is filled with legacy
>> values but a later patch will allow to fill it dynamically by reading the
>> JESD216 Serial Flash Discoverable Parameter (SFDP) tables from the SPI
>> memory.
>>
>> With both structures, the spi-nor framework can now compute the best
>> match between SPI protocols supported by both the (Q)SPI memory and
>> controller hence selecting the relevant op codes for (Fast) Read, Page
>> Program and Sector Erase operations.
>>
>> The spi_nor_basic_flash_parameter structure also provides the spi-nor
>> framework with the number of dummy cycles to be used with each Fast
>> Read commands and the erase block size associated to the erase block op
>> codes.
>>
>> Finally the spi_nor_basic_flash_parameter structure, through the optional
>> .enable_quad_io() hook, tells the spi-nor framework how to set the Quad
>> Enable (QE) bit of the QSPI memory to enable its Quad SPI features.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> ---
>>  drivers/mtd/devices/m25p80.c          |  17 ++-
>>  drivers/mtd/spi-nor/atmel-quadspi.c   |  83 ++++++----
>>  drivers/mtd/spi-nor/cadence-quadspi.c |  18 ++-
>>  drivers/mtd/spi-nor/fsl-quadspi.c     |   8 +-
>>  drivers/mtd/spi-nor/hisi-sfc.c        |  32 +++-
>>  drivers/mtd/spi-nor/mtk-quadspi.c     |  16 +-
>>  drivers/mtd/spi-nor/nxp-spifi.c       |  21 +--
>>  drivers/mtd/spi-nor/spi-nor.c         | 280 +++++++++++++++++++++++++++-
>> ------
[...]
>> +static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
>> +			 const struct spi_nor_basic_flash_parameter
>> *params,
>> +			 const struct spi_nor_modes *modes)
>>  {
>> +	bool enable_quad_io;
>> +	u32 rd_modes, wr_modes, mask;
>> +	const struct spi_nor_erase_type *erase_type = NULL;
>> +	const struct spi_nor_read *read;
>> +	int rd_pindex, wr_pindex, i, err = 0;
>> +	u8 erase_size = SNOR_ERASE_64K;
> 
> Erase size could be configurable, then user can chose best sector size that match his use case on multi-sized flash.
>

The purpose of this patch is only to add support to more SPI protocols.
About the sector erase operations, spi_nor_init_params() and
spi_nor_setup() are written so the resulting configuration is the same as
before the patch. Currently only 64K and 4K sector erase operations are
supported.

The only difference introduced by this patch is when neither the 64K Sector
Erase nor the 4K Sector Erase operations are supported, for instance when
the memory supports only 256K Sector Erase operations, spi_nor_setup() can
now select another size as a fallback according to the supported sizes
given in params->erase_types[i].
With this patch only, ie without the SFDP patch, spi_nor_init_params()
assumes that at least the 64K Sector Erase operations are supported and
depending on info->flags, the 4K Sector Erase operations might be supported
too. The current spi-nor framework makes the very same assumption.

Also before and after this patch, the spi-nor framework still assumes a
uniform sector erase size. I know this is not true for all memories but
this bug should be fixed by another dedicated patch.

I would like a smooth transition between the current spi-nor framework and
a new one changing the 3rd argument of spi_nor_scan().
Changing too many things in a single patch would complicate the review.
Once the "4byte address instruction set" series will be accepted, I plan to
send this patch as a standalone patch. Then later the SFDP changes and so on.

I'm splitting the SFDP series to ease its review.

>> +
>> +	/* 2-2-2 or 4-4-4 modes are not supported yet. */
>> +	mask = (SNOR_MODE_2_2_2 | SNOR_MODE_4_4_4);
>> +	rd_modes = modes->rd_modes & ~mask;
>> +	wr_modes = modes->wr_modes & ~mask;
>> +
>> +	/* Setup read operation. */
>> +	rd_pindex = fls(params->rd_modes & rd_modes) - 1;
>> +	if (spi_nor_pindex2proto(rd_pindex, &nor->read_proto)) {
>> +		dev_err(nor->dev, "invalid (fast) read\n");
>> +		return -EINVAL;
>> +	}
>> +	read = &params->reads[rd_pindex];
>> +	nor->read_opcode = read->opcode;
>> +	nor->read_dummy = read->num_mode_clocks + read-
>>> num_wait_states;
> 
> I would vote that num_mode_clocks, num_wait_states and mode value will be available for the driver.
> There are some QSPi controller that are aware of that. It generally should not hurt, but might help in the future.
>

I thought about that but finally I've chosen to hide the mode/wait_states
values and only provide the sum in nor->read_dummy, so for all SPI
controller drivers the nor->read_dummy value as the exact same meaning as
before this patch.

Indeed, the *only* purpose of the mode cycle value is during some Fast Read
operations (mainly Fast Read 1-2-2 or Fast Read 1-4-4) for asking the QSPI
memory to enter/leave it's 0-2-2 or 0-4-4 mode.

"0-x-x mode" meaning that the next SPI command sent on the bus to the
memory skips the now implicit Fast Read op code and starts directly to the
address cycles. Hence entering/leaving those 0-x-x modes is statefull and
like using the 4byte address mode, many bootloaders don't support that mode.

The performance improvement provided by the 0-x-x modes is only relevant
for a eXecution In Place usage of the QSPI memory, where very few bytes are
read in a single SPI command (a I-cache line). However XIP is out of the
scope of the spi-nor framework, which in most usage, reads at least a full
page (>= 256 bytes).

Also whatever the actual number of mode cycle is, I recommend to always set
at least the very first *byte* of dummy data to the 0xFF value.
Indeed, according to the SFDP specification, this value works with every
manufacturer to prevent their memory from entering a 0-x-x mode.

For instance, this is what I did in atmel_qspi_read().
I also plan to patch m25p80 so this driver sets all dummy cycles to 0xFF:
currently the dummy bytes are uninitialized.

Other QSPI controller drivers aware of the mode cycles should do the same.


>> +
>> +	/* Set page program op code and protocol. */
>> +	wr_pindex = fls(params->wr_modes & wr_modes) - 1;
>> +	if (spi_nor_pindex2proto(wr_pindex, &nor->write_proto)) {
>> +		dev_err(nor->dev, "invalid page program\n");
>> +		return -EINVAL;
>> +	}
>> +	nor->program_opcode = params->page_programs[wr_pindex];
>> +
>> +	/* Set sector erase op code and size. */
>> +	erase_type = &params->erase_types[0];
>> +#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>> +	erase_size = SNOR_ERASE_4K;
>> +#endif
>> +	for (i = 0; i < SNOR_MAX_ERASE_TYPES; ++i) {
>> +		if (params->erase_types[i].size == erase_size) {
>> +			erase_type = &params->erase_types[i];
>> +			break;
>> +		} else if (!erase_type->size && params->erase_types[i].size)
>> {
>> +			erase_type = &params->erase_types[i];
>> +		}
>> +	}
>> +	nor->erase_opcode = erase_type->opcode;
>> +	nor->mtd.erasesize = (1 << erase_type->size);
>> +
>> +
>> +	enable_quad_io = (SNOR_PROTO_DATA_FROM_PROTO(nor-
>>> read_proto) == 4 ||
>> +			  SNOR_PROTO_DATA_FROM_PROTO(nor-
>>> write_proto) == 4);
>> +
>> +	/* Enable Quad I/O if needed. */
>> +	if (enable_quad_io && params->enable_quad_io) {
>> +		err = params->enable_quad_io(nor);
>> +		if (err) {
>> +			dev_err(nor->dev,
>> +				"failed to enable the Quad I/O mode\n");
>> +			return err;
>> +		}
>> +	}
>> +
>> +	dev_dbg(nor->dev,
>> +		"(Fast) Read:  opcode=%02Xh, protocol=%03x, mode=%u,
>> wait=%u\n",
>> +		nor->read_opcode, nor->read_proto,
>> +		read->num_mode_clocks, read->num_wait_states);
>> +	dev_dbg(nor->dev,
>> +		"Page Program: opcode=%02Xh, protocol=%03x\n",
>> +		nor->program_opcode, nor->write_proto);
>> +	dev_dbg(nor->dev,
>> +		"Sector Erase: opcode=%02Xh, protocol=%03x, sector
>> size=%u\n",
>> +		nor->erase_opcode, nor->reg_proto, (u32)nor-
>>> mtd.erasesize);
> 
> At the end above debugs can be a bit misleading, because later opcodes could be replaced in
> set_4byte function.
>

Indeed, I agree with you: I will remove those dev_dbg() on the next version.


> Thanks,
> Marcin
> 

Thanks for the review :)

Best regards,

Cyrille

Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJ1Is-0006ul-3l
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 17:00:47 +0000
Subject: Re: [PATCH v4 4/8] mtd: spi-nor: add support of SPI protocols like
 SPI 1-2-2 and SPI 1-4-4
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>,
 "'computersforpeace@gmail.com'" <computersforpeace@gmail.com>,
 "'marek.vasut@gmail.com'" <marek.vasut@gmail.com>,
 "'boris.brezillon@free-electrons.com'" <boris.brezillon@free-electrons.com>,
 "'richard@nod.at'" <richard@nod.at>, "'linux-mtd@lists.infradead.org'"
 <linux-mtd@lists.infradead.org>
References: <cover.1479736401.git.cyrille.pitchen@atmel.com>
 <9adeee98798f3ba9bb01f86e1bd1a3543643a2ec.1479736401.git.cyrille.pitchen@atmel.com>
 <AM4PR0701MB2130C191B75A408799F4C4C7FE9B0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
 <AM4PR0701MB2130E83D0846EAAE21E99717FE9C0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
CC: "'nicolas.ferre@atmel.com'" <nicolas.ferre@atmel.com>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <8f70a04f-33f8-c703-0836-db1d3e07aca5@atmel.com>
Date: Mon, 19 Dec 2016 18:00:22 +0100
MIME-Version: 1.0
In-Reply-To: <AM4PR0701MB2130E83D0846EAAE21E99717FE9C0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
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

Le 16/12/2016 à 14:47, Krzeminski, Marcin (Nokia - PL/Wroclaw) a écrit :
>> -----Original Message-----
>> From: Krzeminski, Marcin (Nokia - PL/Wroclaw)
>> Sent: Tuesday, December 13, 2016 10:46 AM
>> To: Cyrille Pitchen <cyrille.pitchen@atmel.com>;
>> computersforpeace@gmail.com; marek.vasut@gmail.com;
>> boris.brezillon@free-electrons.com; richard@nod.at; linux-
>> mtd@lists.infradead.org
>> Cc: nicolas.ferre@atmel.com; linux-kernel@vger.kernel.org
>> Subject: RE: [PATCH v4 4/8] mtd: spi-nor: add support of SPI protocols like SPI
>> 1-2-2 and SPI 1-4-4
>>
>> Cyrille,
>>
>>> -----Original Message-----
>>> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On
>>> Behalf Of Cyrille Pitchen
>>> Sent: Monday, November 21, 2016 3:16 PM
>>> To: computersforpeace@gmail.com; marek.vasut@gmail.com;
>>> boris.brezillon@free-electrons.com; richard@nod.at; linux-
>>> mtd@lists.infradead.org
>>> Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>;
>>> nicolas.ferre@atmel.com; linux-kernel@vger.kernel.org
>>> Subject: [PATCH v4 4/8] mtd: spi-nor: add support of SPI protocols
>>> like SPI 1-
>>> 2-2 and SPI 1-4-4
>>>
>>> This patch changes the prototype of spi_nor_scan(): its 3rd parameter
>>> is replaced by a const struct spi_nor_modes pointer, which tells the
>>> spi-nor framework about which SPI protocols are supported by the SPI
>> controller.
>>>
>>> Besides, this patch also introduces a new
>>> spi_nor_basic_flash_parameter structure telling the spi-nor framework
>>> about the SPI protocols supported by the SPI memory and the needed op
>> codes to use these SPI protocols.
>>>
>>> Currently the struct spi_nor_basic_flash_parameter is filled with
>>> legacy values but a later patch will allow to fill it dynamically by
>>> reading the
>>> JESD216 Serial Flash Discoverable Parameter (SFDP) tables from the SPI
>>> memory.
>>>
>>> With both structures, the spi-nor framework can now compute the best
>>> match between SPI protocols supported by both the (Q)SPI memory and
>>> controller hence selecting the relevant op codes for (Fast) Read, Page
>>> Program and Sector Erase operations.
>>>
>>> The spi_nor_basic_flash_parameter structure also provides the spi-nor
>>> framework with the number of dummy cycles to be used with each Fast
>>> Read commands and the erase block size associated to the erase block
>>> op codes.
>>>
>>> Finally the spi_nor_basic_flash_parameter structure, through the
>>> optional
>>> .enable_quad_io() hook, tells the spi-nor framework how to set the
>>> Quad Enable (QE) bit of the QSPI memory to enable its Quad SPI features.
>>>
>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>>> ---
>>>  drivers/mtd/devices/m25p80.c          |  17 ++-
>>>  drivers/mtd/spi-nor/atmel-quadspi.c   |  83 ++++++----
>>>  drivers/mtd/spi-nor/cadence-quadspi.c |  18 ++-
>>>  drivers/mtd/spi-nor/fsl-quadspi.c     |   8 +-
>>>  drivers/mtd/spi-nor/hisi-sfc.c        |  32 +++-
>>>  drivers/mtd/spi-nor/mtk-quadspi.c     |  16 +-
>>>  drivers/mtd/spi-nor/nxp-spifi.c       |  21 +--
>>>  drivers/mtd/spi-nor/spi-nor.c         | 280
>> +++++++++++++++++++++++++++-
>>> ------
[...]
>>> +static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
>>> +			 const struct spi_nor_basic_flash_parameter
>>> *params,
>>> +			 const struct spi_nor_modes *modes)
>>>  {
>>> +	bool enable_quad_io;
>>> +	u32 rd_modes, wr_modes, mask;
>>> +	const struct spi_nor_erase_type *erase_type = NULL;
>>> +	const struct spi_nor_read *read;
>>> +	int rd_pindex, wr_pindex, i, err = 0;
>>> +	u8 erase_size = SNOR_ERASE_64K;
>>
>> Erase size could be configurable, then user can chose best sector size that
>> match his use case on multi-sized flash.
>>
>>> +
>>> +	/* 2-2-2 or 4-4-4 modes are not supported yet. */
>>> +	mask = (SNOR_MODE_2_2_2 | SNOR_MODE_4_4_4);
> IMHO could be nice to put a warning here :)
> 

Then maybe only a dev_dbg() because many developers complain that there are
already too many debug messages in the boot logs.

> Thanks,
> Marcin
> 

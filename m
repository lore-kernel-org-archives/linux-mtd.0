Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eN0Pt-0000BR-Jg
 for linux-mtd@lists.infradead.org; Thu, 07 Dec 2017 17:57:04 +0000
Subject: Re: [RFC 01/10] mtd: spi-nor: Add support of 1-2-2, 1-4-4 IO READ
 protocols
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Suresh Gupta <suresh.gupta@nxp.com>, Poonam Aggrwal <poonam.aggrwal@nxp.com>
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512548141-3319-2-git-send-email-prabhakar.kushwaha@nxp.com>
 <e3d1c05e-24a7-348c-a668-ce22827ad953@wedev4u.fr>
 <HE1PR04MB1241868CA8B83A64E1CA1DFF97330@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <HE1PR04MB1241A778AFFF2BD14D1878CF97330@HE1PR04MB1241.eurprd04.prod.outlook.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <42cf1788-9d5e-fe4e-c39f-48390df43ad1@wedev4u.fr>
Date: Thu, 7 Dec 2017 18:56:36 +0100
MIME-Version: 1.0
In-Reply-To: <HE1PR04MB1241A778AFFF2BD14D1878CF97330@HE1PR04MB1241.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 07/12/2017 à 12:04, Prabhakar Kushwaha a écrit :
> Thanks Cyrille for the pointers,
> 
> I have few queries on SFDP.
> 
>> -----Original Message-----
>> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
>> Prabhakar Kushwaha
>> Sent: Thursday, December 07, 2017 2:15 PM
>> To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>; linux-mtd@lists.infradead.org
>> Cc: boris.brezillon@free-electrons.com; computersforpeace@gmail.com;
>> dedekind1@gmail.com
>> Subject: RE: [RFC 01/10] mtd: spi-nor: Add support of 1-2-2, 1-4-4 IO READ
>> protocols
>>
>> Hi Cyrille,
>>
>>
>>> -----Original Message-----
>>> From: Cyrille Pitchen [mailto:cyrille.pitchen@wedev4u.fr]
>>> Sent: Wednesday, December 06, 2017 4:04 PM
>>> To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>; linux-
>>> mtd@lists.infradead.org
>>> Cc: boris.brezillon@free-electrons.com; computersforpeace@gmail.com;
>>> dedekind1@gmail.com
>>> Subject: Re: [RFC 01/10] mtd: spi-nor: Add support of 1-2-2, 1-4-4 IO READ
>>> protocols
>>>
>>> Hi Prabhakar,
>>>
>>> Le 06/12/2017 à 09:15, Prabhakar Kushwaha a écrit :
>>>> IO READ protocols transfers both address and data on multiple
>>>> data bits. 1-2-2(DUAL IO), 1-4-4(QUAD IO) transfer address on 2
>>>> data bits or 4 bits per rising edge of SCK respectively.
>>>>
>>>> This patch update spi_nor_flash_parameter->spi_nor_read_command
>>>> array based on DUAL or QUAD IO flag enabled in flash_info for a flash.
>>>>
>>>> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/spi-nor.c | 22 ++++++++++++++++++++--
>>>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>>> index 19c00072..7d3b52f 100644
>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>> @@ -61,7 +61,7 @@ struct flash_info {
>>>>  	u16		page_size;
>>>>  	u16		addr_width;
>>>>
>>>> -	u16		flags;
>>>> +	u32		flags;
>>>>  #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works
>>> uniformly */
>>>>  #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
>>>>  #define SST_WRITE		BIT(2)	/* use SST byte programming */
>>>> @@ -89,6 +89,8 @@ struct flash_info {
>>>>  #define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip
>>> erase */
>>>>  #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
>>>>  #define USE_CLSR		BIT(14)	/* use CLSR command */
>>>> +#define SPI_NOR_DUAL_IO_READ	BIT(15)	/* Flash supports Dual IO Read
>>> */
>>>> +#define SPI_NOR_QUAD_IO_READ	BIT(16)	/* Flash supports Quad IO
>>> Read */
>>>>  };
>>>>
>>>>  #define JEDEC_MFR(info)	((info)->id[0])
>>>> @@ -2399,6 +2401,13 @@ static int spi_nor_init_params(struct spi_nor
>> *nor,
>>>>  					  SNOR_PROTO_1_1_2);
>>>>  	}
>>>>
>>>> +	if (info->flags & SPI_NOR_DUAL_IO_READ) {
>>>> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_2_2;
>>>> +		spi_nor_set_read_settings(&params-
>>>> reads[SNOR_CMD_READ_1_2_2],
>>>> +					  0, 8, SPINOR_OP_READ_1_2_2,
>>>> +					  SNOR_PROTO_1_2_2);
>>>> +	}
>>>> +
>>>>  	if (info->flags & SPI_NOR_QUAD_READ) {
>>>>  		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
>>>>  		spi_nor_set_read_settings(&params-
>>>> reads[SNOR_CMD_READ_1_1_4],
>>>> @@ -2406,6 +2415,14 @@ static int spi_nor_init_params(struct spi_nor
>> *nor,
>>>>  					  SNOR_PROTO_1_1_4);
>>>>  	}
>>>>
>>>> +	if (info->flags & SPI_NOR_QUAD_IO_READ) {
>>>> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_4_4;
>>>> +		spi_nor_set_read_settings(&params-
>>>> reads[SNOR_CMD_READ_1_4_4],
>>>> +					  0, 10, SPINOR_OP_READ_1_4_4,
>>>
>>> The actual number of mode and wait state clock cycles depend on the
>>> manufacturer and the memory part number.
>>>
>>> Here are few examples of factory settings for Fast Read 1-4-4
>>> (mode/wait states):
>>>
>>> Micron: 1/9
>>> Macronix: 2/4
>>> Spansion: 2/8
>>>
>>> AFAIK, 0/10 is not used by any manufacturer and doesn't work with Macronix.
>>>
>>> For Fast Read 1-1-1, 1-1-2 and 1-1-4, all memories I know use 0/8. I guess
>>> those numbers were chosen for 1-1-2 and 1-1-4 too to be backward
>> compatible
>>> with older memories supporting only Fast Read 1-1-1, which always uses no
>>> node cycle and 8 wait-states.
>>>
>>> However with the introduction of Fast Read 1-2-2 and 1-4-4, things became
>>> messy and every manufacturer used its own settings. That's why we didn't
>>> introduce SPI_NOR_DUAL_IO_READ of SPI_NOR_QUAD_IO_READ flags:
>> because
>>> we
>>> can associate them settings that would apply to all manufacturers.
>>>
>>> We can still use Fast Read 1-2-2 and 1-4-4 when supported by both the
>>> memory and the SPI controller by parsing the memory SFDP tables and filling
>>> the 'struct spi_nor_flash_parameter' accordingly.
>>>
>>> We (MTD maintainers) don't want to add more hard-coded data in the
>>> 'struct flash_info' and in the spi_nor_ids[] array when those data can
>>> actually be retrieved from the SFDP tables.
>>>
>>> Latest SPI NOR memories almost all support SFDP tables (JEDEC JESD216B).
>>> I had a quick overview of you series and it seems that you have been
>>> testing with both Micron and Spansion memory parts: both should support
>>> SFDP.
>>>
>>> So sorry but I will reject this patch: as I said unlike Fast Read 1-1-z
>>> protocols which always use 0 mode cycle and 8 wait states, there are no
>>> settings for Fast Read 1-4-4 or 1-2-2 that could be valid for all
>>> memory manufacturers.
>>>
>>
>> I understand your point. Let me explore SFDP.
>>
> 
> I tried to understand the SFDP. 
> 
> Looks like struct sfdp_bfpt_read needs to be update to support mode bit. Other info(dummy cycle) is already part of current SFDP implementation. 
> 
> -pk
>

>From spi-nor.c: spi_nor_select_read():
	/*
	 * In the spi-nor framework, we don't need to make the difference
	 * between mode clock cycles and wait state clock cycles.
	 * Indeed, the value of the mode clock cycles is used by a QSPI
	 * flash memory to know whether it should enter or leave its 0-4-4
	 * (Continuous Read / XIP) mode.
	 * eXecution In Place is out of the scope of the mtd sub-system.
	 * Hence we choose to merge both mode and wait state clock cycles
	 * into the so called dummy clock cycles.
	 */
	nor->read_dummy = read->num_mode_clocks + read->num_wait_states;

So we don't care about the mode bit: just write the 0xFF value during the
2 mode cycles(or 0xF if only one mode cycle) and the spi-nor memory won't
enter its Continuous Read / XIP mode. This value works for all
manufacturers (based on the JESD216 rev B specification describing the 16
DWORDs of the BFPT table).

>From m25p80.c: m25p80_read():

	/*
	 * Set all dummy/mode cycle bits to avoid sending some manufacturer
	 * specific pattern, which might make the memory enter its Continuous
	 * Read mode by mistake.
	 * Based on the different mode cycle bit patterns listed and described
	 * in the JESD216B specification, the 0xff value works for all memories
	 * and all manufacturers.
	 */
	cmd_sz = t[0].len;
	memset(flash->command + cmd_sz - dummy, 0xff, dummy);

 
> 
> 
> 

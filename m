Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cC8kF-0007lD-2X
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 17:32:36 +0000
Subject: Re: [PATCH 3/3] mtd: spi-nor: Enable die erase for Micron 1GiB
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1477314214-17718-1-git-send-email-marcin.krzeminski@nokia.com>
 <1477314214-17718-4-git-send-email-marcin.krzeminski@nokia.com>
 <688b853c-6e08-81dd-63dd-eb528e2c6078@atmel.com>
 <AM4PR0701MB2130C9749AA5052676F51FF8FE8C0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
Message-ID: <9b8db8cd-5f46-067c-a661-9187b48fda80@atmel.com>
Date: Wed, 30 Nov 2016 18:32:10 +0100
MIME-Version: 1.0
In-Reply-To: <AM4PR0701MB2130C9749AA5052676F51FF8FE8C0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
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

Le 30/11/2016 à 18:00, Krzeminski, Marcin (Nokia - PL/Wroclaw) a écrit :
> 
> 
>> -----Original Message-----
>> From: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
>> Sent: Tuesday, November 29, 2016 5:54 PM
>> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
>> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
>> Cc: rfsw-patches@mlist.nokia.com; dwmw2@infradead.org;
>> computersforpeace@gmail.com; marek.vasut@gmail.com
>> Subject: Re: [PATCH 3/3] mtd: spi-nor: Enable die erase for Micron 1GiB
>>
>> Hi Marcin,
>>
>> Le 24/10/2016 à 15:03, marcin.krzeminski@nokia.com a écrit :
>>> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>>>
>>> Micron N25Q00 and MT25Q00 share same JEDEC Id, but it seem can be
>>> properly recognized by second ext_jedec id byte.
>>>
>>> This commits extends n25q00 ids by adding ext bytes and also adds
>>> mt25q00 family.
>>> For MT25Q00 family, the number of dies is two, N25Q00 has it four.
>>> Logic to support that is added.
>>>
>>> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 36
>>> ++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 34 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c
>>> b/drivers/mtd/spi-nor/spi-nor.c index 17bbec0..b33ead6 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -218,6 +218,28 @@ static inline int set_4byte(struct spi_nor *nor,
>> const struct flash_info *info,
>>>  		return nor->write_reg(nor, SPINOR_OP_BRWR, nor-
>>> cmd_buf, 1);
>>>  	}
>>>  }
>>> +
>>> +static void spi_nor_die_cnt(struct spi_nor *nor,
>>> +		const struct flash_info *info)
>>> +{
>>> +	switch (JEDEC_MFR(info)) {
>>> +	case SNOR_MFR_MICRON:
>>> +		/* 1GiB devices */
>>> +		if (info->id[2] == 0x21) {
>>> +			/* MT25Q00 has 2 dies N25Q00 has 4 */
>>> +			if (info->id[4] & BIT(6))
>>> +				nor->die_cnt = 2;
>>> +			else
>>> +				nor->die_cnt = 4;
>>> +		} else
>>> +			nor->die_cnt = 0;
>>
>> You set nor->die_cnt according to the JEDED ID but what is BIT(6) in the 5th
>> byte of the JEDEC ID?
> Unfortunately 1Gb MT25Q and N25Q00 has the same JEDEDC ID.
> Datasheet for MT25Q specified this bit as revision, N25Q00 as reserved but set to 0,
> so my guess was that it can be used to distinguish them.
>> How do you know whether this "rule of thumb" also applies to other Micron
>> memories?
> No idea, at least it also should work for 2Gb chips.
>>
>> I think we should find another solution to set nor->die_cnt properly.
>> Maybe adding some info in the relevant entries of the spi_nor_ids[] array?
> I wanted to have this solve in "automatic" way by updating this function if
> there will be a need, but you are right - more generic way is better.
> I'll take a look how it could be done using spi_nor_ids.
> Maybe there are some other idea how to make this  work?
> Unfortunately JEDEC216B will not help in this case.
> 
> Thanks,
> Marcin
>

Just two proposals but they still need to be discussed of course:

1 - we could add extra fields directly in the struct flash_info

However most entries of the spi_nor_ids[] array won't use those extra fields
and the memory footprint of this array will grow anyway...

2 - adding just a single pointer in the struct flash_info

This new member would point to an optional structure containing the extra
info you need. For most entries of the spi_nor_ids[], this new pointer would
be NULL, hence limiting the memory footprint.

As I said, this is just two proposals and I would be pleased to study other
proposals :)

Best regards,

Cyrille
 
>>
>> Best regards,
>>
>> Cyrille
>>
>>> +	break;
>>> +	default:
>>> +		nor->die_cnt = 0;
>>> +		break;
>>> +	}
>>> +}
>>> +
>>>  static inline int spi_nor_sr_ready(struct spi_nor *nor)  {
>>>  	int sr = read_sr(nor);
>>> @@ -970,8 +992,14 @@ static const struct flash_info spi_nor_ids[] = {
>>>  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
>> SPI_NOR_QUAD_READ) },
>>>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K |
>> USE_FSR | SPI_NOR_QUAD_READ) },
>>>  	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K |
>> USE_FSR | SPI_NOR_QUAD_READ) },
>>> -	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR
>> | SPI_NOR_QUAD_READ) },
>>> -	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR
>> | SPI_NOR_QUAD_READ) },
>>> +	{ "n25q00",      INFO(0x20ba21, 0x1000, 64 * 1024, 2048, SECT_4K |
>> USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
>>> +	{ "n25q00a",     INFO(0x20bb21, 0x1000, 64 * 1024, 2048, SECT_4K |
>> USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
>>> +	{ "n25q00",      INFO(0x20ba21, 0x1004, 64 * 1024, 2048, SECT_4K |
>> USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
>>> +	{ "n25q00a",     INFO(0x20bb21, 0x1004, 64 * 1024, 2048, SECT_4K |
>> USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
>>> +	{ "mt25ql01g",   INFO(0x20ba21, 0x1044, 64 * 1024, 2048, SECT_4K |
>> USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
>>> +	{ "mt25qu01g",   INFO(0x20bb21, 0x1044, 64 * 1024, 2048, SECT_4K |
>> USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
>>> +	{ "mt25ql01g",   INFO(0x20ba21, 0x1040, 64 * 1024, 2048, SECT_4K |
>> USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
>>> +	{ "mt25qu01g",   INFO(0x20bb21, 0x1040, 64 * 1024, 2048, SECT_4K |
>> USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
>>>
>>>  	/* PMC */
>>>  	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
>>> @@ -1479,6 +1507,10 @@ int spi_nor_scan(struct spi_nor *nor, const char
>> *name, enum read_mode mode)
>>>  		nor->flags |= SNOR_F_USE_FSR;
>>>  	if (info->flags & SPI_NOR_HAS_TB)
>>>  		nor->flags |= SNOR_F_HAS_SR_TB;
>>> +	if (info->flags & DIE_ERASE) {
>>> +		nor->flags |= SNOR_F_DIE_ERASE;
>>> +		spi_nor_die_cnt(nor, info);
>>> +	}
>>>
>>>  #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>>>  	/* prefer "small sector" erase if possible */
>>>
> 
> 

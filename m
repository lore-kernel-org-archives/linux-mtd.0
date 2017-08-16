Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhwjv-0007AB-8V
 for linux-mtd@lists.infradead.org; Wed, 16 Aug 2017 11:44:01 +0000
Subject: Re: [PATCH] mtd: spi-nor: add support for Microchip sst26vf064b QSPI
 memory
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>
References: <1501234898-13171-1-git-send-email-claudiu.beznea@microchip.com>
 <46bc0f6f-30ad-6367-a960-08cf7262e741@wedev4u.fr>
 <0d275df5-9eba-d18a-c007-a2c76e68c1d1@wedev4u.fr>
From: m18063 <Claudiu.Beznea@microchip.com>
Message-ID: <443a6b01-a8f0-198e-e6bf-c8693a177f45@microchip.com>
Date: Wed, 16 Aug 2017 14:43:31 +0300
MIME-Version: 1.0
In-Reply-To: <0d275df5-9eba-d18a-c007-a2c76e68c1d1@wedev4u.fr>
Content-Type: text/plain; charset="utf-8"
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



On 14.08.2017 19:03, Cyrille Pitchen wrote:
> Le 01/08/2017 à 23:57, Cyrille Pitchen a écrit :
>> Hi Claudiu,
>>
>> Le 28/07/2017 à 11:41, Claudiu Beznea a écrit :
>>> Add support for Microchip sst26vf064b QSPI memory.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index 196b52f..796aac4 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -1081,6 +1081,7 @@ static const struct flash_info spi_nor_ids[] = {
>>>  	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
>>>  	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
>>>  	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
>>> +	{ "sst26vf064b", INFO(0xbf2643, 0,  4 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>
> 
> Looking at the erase sector map in the SST26VF064B datasheet, the
> info->sector_size should be set to 64 * 1024 instead of 4 * 1024.
> 
> The 20h op code is supported uniformly to erase 4K sectors so the
> SECT_4K flag will work just as expected with
> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS defined.
> 
> On the other hand, when CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is undefined,
> the D8h op code is used instead of the 20h op code for erase operations.
> Then, for this op code, the memory layout of SST26 memories is:
> 
> +------------+
> |     8K     |
> +------------+
> |     8K     |
> +------------+
> |     8K     |
> +------------+
> |     8K     |
> +------------+
> |    32K     |
> +------------+
> |    64K     |
> +------------+
> |    64K     |
> +------------+
> |    ...     |
> +------------+
> |    64K     |
> +------------+
> |    64K     |
> +------------+
> |    32K     |
> +------------+
> |     8K     |
> +------------+
> |     8K     |
> +------------+
> |     8K     |
> +------------+
> |     8K     |
> +------------+
> 
> Hence if we set info->sector_size to 64K, the D8h op code would work as
> expected for all but the first and last 64K blocks.
> For now, we would fail to properly erase the whole first and last 64
> blocks but I think this issue should be fixed later when adding support
> to the erase sector map provided by some SFDP table.
> Indeed, it would be possible to erase the first and last 64K blocks and
> pretend the memory is also uniform for 64K sector size since
> 4 * 8 + 32 == 64
> 
> So please, just resend your patch with 64 * 1024 instead of 4 * 1024 :)
> 
Thanks, Cyrille! I will send a v2 with your proposals.

Claudiu

> I think this is currently the best we can reach without support of non
> uniform erase map.
> 
> Best regards,
> 
> Cyrille
> 
> 
>> I don't know what to do in this case; Marek any advice?
>>
>> The issue is that Microchip SST26 memories are uniform for the 4K erase
>> sector size but not uniform for other sector sizes (32K, 64K, ...).
>>
>> Like this, erase operations would work if
>> CONFIG_MTD_SPI_NOR_USE_4K_SECTOR is defined because then the 20h/21h
>> opcodes would be used in any case.
>>
>> However when the former macro is undefined, the D8h/DCh opcodes would be
>> used instead. Hence erasing sectors in the middle of the memory would
>> not work as expected because nor->mtd.erasesize == 4 * 1024 but the
>> actual erase size of middle erase blocks/sectors is bigger: you may
>> erase more than expected.
>>
>> Marek, do you think we could take this patch as is, with the known
>> limitations, and wait for a later patch dealing with non-uniform erase
>> sector map to fix them?
>>
>> Also, nor->mtd.erasesize is used by above mtd layer like UBIFS to decide
>> the size of the Physical and Logical Erase Bloc size. Not sure if this
>> is still true now but I had troubles the last time I've tried to create
>> a UBI file-system with a spi-nor memory using a 4K erase sector size
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2013-July/047665.html
>>
>> Best regards,
>>
>> Cyrille
>>
>>
>>>  
>>>  	/* ST Microelectronics -- newer production may have feature updates */
>>>  	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
>>>
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
> 

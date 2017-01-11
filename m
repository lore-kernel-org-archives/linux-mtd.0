Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRIdq-0006m2-3U
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 13:08:41 +0000
Received: by mail-wm0-x241.google.com with SMTP id r126so16375914wmr.3
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jan 2017 05:08:16 -0800 (PST)
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: Fix whole chip erasing for stacked
 chips.
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marcin Krzeminski <mar.krzeminski@gmail.com>, linux-mtd@lists.infradead.org
References: <20170106171901.27565-1-mar.krzeminski@gmail.com>
 <20170106171901.27565-2-mar.krzeminski@gmail.com>
 <e9a447d9-da58-87ac-3136-d1dc0c75d591@gmail.com>
 <d4bda462-ddcb-2ead-0e57-595aed633b67@atmel.com>
 <0eab4ac5-c27d-408f-956d-bf02d5996203@gmail.com>
 <07c62fbe-bbe9-98c8-98bb-88614322716a@atmel.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <725b6a8d-97b0-6a3c-4cca-10d3a05a2817@gmail.com>
Date: Wed, 11 Jan 2017 14:07:15 +0100
MIME-Version: 1.0
In-Reply-To: <07c62fbe-bbe9-98c8-98bb-88614322716a@atmel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/11/2017 12:03 PM, Cyrille Pitchen wrote:
> Le 10/01/2017 à 18:44, Marek Vasut a écrit :
>> On 01/10/2017 06:24 PM, Cyrille Pitchen wrote:
>>> Hi Marek,
>>>
>>> Le 07/01/2017 à 00:45, Marek Vasut a écrit :
>>>> On 01/06/2017 06:19 PM, Marcin Krzeminski wrote:
>>>>> Currently it is possible to disable chip erase for spi-nor driver.
>>>>> Some modern stacked (multi die) flash chips do not support chip
>>>>> erase opcode at all but spi-nor framework needs to cope with them too.
>>>>> This commit extends existing functionality to allow disable
>>>>> chip erase for a single flash chip.
>>>>
>>>> I wonder whether this should really be opt-out flag. Since we'll see
>>>> more multi-die chips (and chips with different die sizes), I'd say this
>>>> should rather be opt-in flag.
>>>>
>>>
>>> Just to be sure I've understood what you propose: do you suggest something
>>> like CAN_CHIP_ERASE instead of NO_CHIP_ERASE for the new info->flags bit?
>>
>> Yes
>>
>>> If so, don't forget that info->flags value is tested for every single entry
>>> of the spi_nor_ids[] array, including all legacy SPI memories such as AT25
>>> or M25P80. Currently spi-nor.c calls erase_chip() from spi_nor_erase()
>>> whenever the user tries to erase the whole memory (len == mtd->size),
>>> whatever SPI memory is connected to the controller. This implementation is
>>> not restricted to multi-die memory. Indeed, spi-nor.c is not currently
>>> aware of multi-die memories.
>>>
>>> Hence if we want an opt-in logic for the new flag and still want to be
>>> backward compatible, we would have to add the new flag into each entry of
>>> the spi_nor_ids[] array.
>>
>> Yeah
>>
>>> Also I asked Marcin to split his original patch into 2 parts because I
>>> think there are 2 different topics:
>>>
>>> 1 - disabling chip erase command on memories which don't support this SPI
>>> command. This is a bug fix: we can still provide this chip erase feature
>>> using only many regular sector/block erase commands. For sure it is not
>>> optimal but at least it works hence the bug is fixed.
>>>
>>> Some multi-die memories are examples of devices concerned by the bug but
>>> maybe they are not the only one. S3AN memories also suffer from this bug
>>> and it has already been dealt by some Ricardo's patches few weeks ago.
>>>
>>> 2 - adding support to the die erase command: this one is an optimization so
>>> for me, still useful but with a lower priority as we can still live without
>>> it so this would let use more time to think about the proper way to
>>> implement this feature. Also, as Marcin reported, we already have examples
>>> of multi-die memories which do support the chip erase command.
>>>
>>> Hence it shows us that (chip erase not supported != multi-die).
>>
>> I agree with this, my point was only about whether we should handle this
>> as opt-in or out-out .
>>
> 
> OK, then maybe we should check the datasheets of more multi-die memories
> from different manufacturers and maybe even wait for more of them to be
> released to find out whether most of them will support the chip erase
> command or not.
> 
> My guess is that the majority will support that command because I expect
> manufacturers to release new products backward compatible with older
> products. Hence the case of Micron n25q00 should be only one a the few
> exceptions to the rule. However I have absolutely no mean to be sure that
> manufacturers will follow the Macronix example (chip erase supported)
> rather than the Micron example (chip erase not supported). It's a bit hard
> to define a global rule from only two different manufacturers.
> 
> That's said, I not really fond of adding a flag into 99.9% of the entries
> of the spi_nor_ids[]. I would rather put a flag into the remaining 0.1%.

Yes, I agree on this one.

> Let's think about the SPI_NOR_NO_FR (Fast Read 0Bh not supported, Read 03h
> only): this is another opt-out flag because most SPI NOR memories support
> Fast Read commands.

The fast-read opcode is standard, while multi-die is only becoming a
thing nowadays. I don't think this is comparable.

> However, if manufacturers decide to break with the past and no longer
> provide the chip erase command then I agree with you, it might be
> interesting to study the opt-in approach. In such a case, I think we could
> also define some new macro close to the existing INFO() macro: we would add
> the opt-in flag directly inside the definition of the existing INFO() macro
> since legacy memories support the chip erase command whereas this opt-in
> flag would not be set in the other macro used add new entries for future
> memories (single/multi-die or whatever) not supporting the chip erase.
> Otherwise, the new entries of the spi_nor_ids[] array would be far too long.
> Currently there are already many entries that don't respect the "80 column"
> rule due to so numerous flags (SECT_4K, SPI_NOR_QUAD_READ, USE_FSR, ...) so
> maybe we should avoid introducing a flag that would increase the length of
> most entries even more.

There's another option, make it opt-out for now and wait how the
situation develops. If things tilt the other way later, we can always
change the flag to opt-in since it's an internal thing.

> I don't like that much hiding stuff into macro definitions but breaking
> entries into many lines makes the spi_nor_ids[] array even bigger. At some
> point maybe we should think about extracting this array from spi-nor.c then
> putting it into a dedicated file, which would be then included in
> spi-nor.c, just for a readiness purpose. However this is another topic not
> related this series :)

Agreed

>>> Best regards,
>>>
>>> Cyrille
>>>
>>>>> Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
>>>>> ---
>>>>>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>>>>>  1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>>>> index 2a643a1..595de54 100644
>>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>>> @@ -85,6 +85,7 @@ struct flash_info {
>>>>>  					 * Use dedicated 4byte address op codes
>>>>>  					 * to support memory size above 128Mib.
>>>>>  					 */
>>>>> +#define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
>>>>>  };
>>>>>  
>>>>>  #define JEDEC_MFR(info)	((info)->id[0])
>>>>> @@ -1621,6 +1622,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>>>>  		nor->flags |= SNOR_F_USE_FSR;
>>>>>  	if (info->flags & SPI_NOR_HAS_TB)
>>>>>  		nor->flags |= SNOR_F_HAS_SR_TB;
>>>>> +	if (info->flags & NO_CHIP_ERASE)
>>>>> +		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>>>>>  
>>>>>  #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>>>>>  	/* prefer "small sector" erase if possible */
>>>>>
>>>>
>>>>
>>>
>>
>>
> 


-- 
Best regards,
Marek Vasut

Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFOt8-00042G-Cj
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2016 17:23:17 +0000
Subject: Re: [PATCH 2/3] mtd: spi-nor: Implement die erase command logic
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1477314214-17718-1-git-send-email-marcin.krzeminski@nokia.com>
 <1477314214-17718-3-git-send-email-marcin.krzeminski@nokia.com>
 <7e94d439-114a-8827-9667-1472d3e4323a@atmel.com>
 <AM4PR0701MB2130740455BE1618C36E5020FE8C0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
 <852daf6e-a304-2dd3-0a54-0a24c7dc347b@atmel.com>
 <AM4PR0701MB213003E9E3A8C6DD71E3E2AEFE8C0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
CC: "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <2e4aa41d-19a6-6524-0e23-b8d64a614005@atmel.com>
Date: Fri, 9 Dec 2016 18:22:50 +0100
MIME-Version: 1.0
In-Reply-To: <AM4PR0701MB213003E9E3A8C6DD71E3E2AEFE8C0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
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

Le 30/11/2016 à 19:18, Krzeminski, Marcin (Nokia - PL/Wroclaw) a écrit :
> 
> 
>> -----Original Message-----
>> From: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
>> Sent: Wednesday, November 30, 2016 6:20 PM
>> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
>> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
>> Cc: rfsw-patches@mlist.nokia.com; dwmw2@infradead.org;
>> computersforpeace@gmail.com; marek.vasut@gmail.com
>> Subject: Re: [PATCH 2/3] mtd: spi-nor: Implement die erase command logic
>>
>> Le 30/11/2016 à 17:44, Krzeminski, Marcin (Nokia - PL/Wroclaw) a écrit :
>>>
>>>
>>>> -----Original Message-----
>>>> From: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
>>>> Sent: Tuesday, November 29, 2016 5:47 PM
>>>> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
>>>> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
>>>> Cc: rfsw-patches@mlist.nokia.com; dwmw2@infradead.org;
>>>> computersforpeace@gmail.com; marek.vasut@gmail.com
>>>> Subject: Re: [PATCH 2/3] mtd: spi-nor: Implement die erase command
>>>> logic
>>>>
>>>> Hi Marcin,
>>>>
>>>> I know you have already answered some of my questions of IRC but I
>>>> ask them again here on the mailing list so everybody can benefit from
>>>> your answers.
>>>>
>>>> Le 24/10/2016 à 15:03, marcin.krzeminski@nokia.com a écrit :
>>>>> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>>>>>
>>>>> This commit implements die erase logic.
>>>>> Sector at a time procedure is moved to function, then erase
>>>>> algorithm will try to use die erase cmd if size and address cover
>>>>> one or more dies.
>>>>>
>>>>
>>>> I'm reading your v2 series but indeed I try to understand the purpose
>>>> of the series simply because I don't know what does die erase do as
>>>> compared to chip erase of sector erase.
>>>> Is you series a bug fix or an optmization, maybe both?
>>>
>>> In current spi-nor framework when user want to erase whole flash (eg.
>>> mtd_debug erase /dev/mtdX 0 0x8000000) framework issue chip erase
>> cmd.
>>> N25Q00 does not support chip erase, instead there was introduced die
>>> erase command that can erase whole die (N25Q00 is a mulit-die NOR chip).
>>> So for this case this patch is a bug fix.
>>> Since I have die erase command implemented it was tempting to use die
>>> erase also in case where erase area cover one or more dies to speed up
>>> erase process, especially when user has enabled 4KiB sector. That is a small
>> optimization.
>>>
>>> I will rewrite commit message and add those informations.
>>>
>>> Thanks,
>>> Marcin
>>>
>>
>> OK, then I think your patch should be split into two different patches.
>>
>> 1 - bug fix:
>>
>> The first patch introducing an explicit flag such as SPI_NOR_NO_CHIP_ERASE,
>> which would be set in the relevant entries of the spi_nor_ids[] (see already
>> existing flags such as SPI_NOR_NO_FR, SPI_NOR_NO_ERASE, ...).
>>
>> In spi_nor_scan():
>>
>>  	if (info->flags & USE_FSR)
>>  		nor->flags |= SNOR_F_USE_FSR;
>>  	if (info->flags & SPI_NOR_HAS_TB)
>>  		nor->flags |= SNOR_F_HAS_SR_TB;
>> +	if (info->flags & SPI_NOR_NO_CHIP_ERASE)
>> +		nor->flags |= SNOR_F_NO_CHIP_ERASE;
>>
>> Then in spi_nor_erase():
>>
>>  	/* whole-chip erase? */
>> -	if (len == mtd->size) {
>> +	if (len == mtd->size && !(nor->flags & SNOR_F_NO_CHIP_ERASE)) {
>>  		unsigned long timeout;
>>
>> So you fall into the sector erase case, no optimization yet.
>>
>> 2 - optimization of spi_nor_erase()
>>
>> In the "sector"-at-a-time erase branch, try to optimize when possible using
>> die erase instead of sector erase.
>>
>> Each commit message describing the purpose of the patch.
> 
> 
> OK, I will split patches in this way.
> 
>>
>> I would like to also handle the cases where the memory supports:
>> - both chip and die erases: if so, no reason not to use chip erase on such
>>   multi-die memory.
> I do not think that there are chips supporting both.
> In this case two flags are needed one for disable chip erase
> and another one for enabling die erase. Is that OK?

I think it might be better to have 2 separated flags, at least for semantic
reason: "the memory supports Die-Erase hence we don't try to use
Chip-Erase" sounds a little bit odd to me.

This is what I understand when I read:
 	/* whole-chip erase? */
-	if (len == mtd->size) {
+	if (len == mtd->size && !die_erase) {

Why do we try Chip-Erase only if Die-Erase is not supported?

Reading something like "we try Chip-Erase unless Chip-Erase is not
supported" is more logic, isn't it?

I want to avoid the implicit assumption "Die Erase supported => Chip Erase
not supported", even if it *might* be true, because it is strange when we
read the code.

>> - neither chip nor die erases.
> This is supported DIE_ERASE flasg set and die_cnt == 0

DIE_ERASE flag set and die_cnt == 0 meaning Chip-Erase is not supported?
IHMO, semantically, it's not logical.

Also discussing another topic on #mtd, it seems that some memories don't
have a 4-byte address version of the Die Erase op code.

If so, it's preferred to use a 4-byte address Sector/Block Erase op code
than to enter/exit the statefull 4-byte address mode then use the Die Erase
op code: this statefull mode should be avoided as much as possible because
many bootloaders expect the SPI memory to be in 3byte address mode and if a
spurious reset occurs on the CPU side (but not on the memory side) those
bootloaders will fail to read data from the SPI memory.

>>
>> Maybe I'm wrong but the assumption (multi-die => chip erase not
>> supported) might be false.
> It is false, but all multi-die chip I know support die erase or chip erase.
> Never both.
> 
> Thanks,
> Marcin
> 
>>
>>
>> Best regards,
>>
>> Cyrille
>>
>>
>>>>
>>>> Best regards,
>>>>
>>>> Cyrille
>>>>
>>>>> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>>>>> ---
>>>>>  drivers/mtd/spi-nor/spi-nor.c | 90
>>>>> +++++++++++++++++++++++++++++++++++++------
>>>>>  1 file changed, 78 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c
>>>>> b/drivers/mtd/spi-nor/spi-nor.c index 3afe207..17bbec0 100644
>>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>>> @@ -360,6 +360,29 @@ static int spi_nor_erase_sector(struct spi_nor
>>>> *nor, u32 addr)
>>>>>  	return nor->write_reg(nor, nor->erase_opcode, buf, nor-
>>>>> addr_width); }
>>>>>
>>>>> +static inline int spi_nor_sector_at_time_erase(struct mtd_info
>>>>> +*mtd,
>>>>> +u32 addr, u32 len) {
>>>>> +	struct spi_nor *nor = mtd_to_spi_nor(mtd);
>>>>> +	int ret = 0;
>>>>> +
>>>>> +	while (len) {
>>>>> +		write_enable(nor);
>>>>> +
>>>>> +		ret = spi_nor_erase_sector(nor, addr);
>>>>> +		if (ret)
>>>>> +			return ret;
>>>>> +
>>>>> +		addr += mtd->erasesize;
>>>>> +		len -= mtd->erasesize;
>>>>> +
>>>>> +		ret = spi_nor_wait_till_ready(nor);
>>>>> +		if (ret)
>>>>> +			return ret;
>>>>> +	}
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>>  /*
>>>>>   * Erase an address range on the nor chip.  The address range may
>> extend
>>>>>   * one or more erase sectors.  Return an error is there is a problem
>> erasing.
>>>>> @@ -367,9 +390,11 @@ static int spi_nor_erase_sector(struct spi_nor
>>>>> *nor, u32 addr)  static int spi_nor_erase(struct mtd_info *mtd,
>>>>> struct erase_info *instr)  {
>>>>>  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
>>>>> -	u32 addr, len;
>>>>> +	u32 addr, len, die_no, die_size;
>>>>>  	uint32_t rem;
>>>>>  	int ret;
>>>>> +	unsigned long timeout;
>>>>> +	u8 die_erase = nor->die_cnt && SNOR_F_DIE_ERASE;
>>>>>
>>>>>  	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
>>>>>  			(long long)instr->len);
>>>>> @@ -386,7 +411,7 @@ static int spi_nor_erase(struct mtd_info *mtd,
>>>> struct erase_info *instr)
>>>>>  		return ret;
>>>>>
>>>>>  	/* whole-chip erase? */
>>>>> -	if (len == mtd->size) {
>>>>> +	if (len == mtd->size && !die_erase) {
>>>>>  		unsigned long timeout;
>>>>>
>>>>>  		write_enable(nor);
>>>>> @@ -416,17 +441,58 @@ static int spi_nor_erase(struct mtd_info *mtd,
>>>>> struct erase_info *instr)
>>>>>
>>>>>  	/* "sector"-at-a-time erase */
>>>>>  	} else {
>>>>> -		while (len) {
>>>>> -			write_enable(nor);
>>>>> -
>>>>> -			ret = spi_nor_erase_sector(nor, addr);
>>>>> -			if (ret)
>>>>> +		if (die_erase) {
>>>>> +			die_size = div_u64_rem(mtd->size, nor->die_cnt,
>>>> &rem);
>>>>> +			if (rem) {
>>>>> +				ret = -EINVAL;
>>>>>  				goto erase_err;
>>>>> -
>>>>> -			addr += mtd->erasesize;
>>>>> -			len -= mtd->erasesize;
>>>>> -
>>>>> -			ret = spi_nor_wait_till_ready(nor);
>>>>> +			}
>>>>> +			while (len) {
>>>>> +				die_no = div_u64_rem(addr, die_size,
>>>> &rem);
>>>>> +
>>>>> +				/* Check if address is aligned to die begin*/
>>>>> +				if (!rem) {
>>>>> +					/* die erase? */
>>>>> +					if (len >= die_size) {
>>>>> +						ret = spi_nor_die_erase(nor,
>>>> addr);
>>>>> +						if (ret)
>>>>> +							goto erase_err;
>>>>> +
>>>>> +						len -= die_size;
>>>>> +						addr += die_size;
>>>>> +
>>>>> +						timeout =
>>>> max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
>>>>> +
>>>> 	CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
>>>>> +								(unsigned
>>>> long)(die_size / SZ_2M));
>>>>> +						ret =
>>>> spi_nor_wait_till_ready_with_timeout(nor, timeout);
>>>>> +						if (ret)
>>>>> +							goto erase_err;
>>>>> +					} else {
>>>>> +						ret =
>>>> spi_nor_sector_at_time_erase(mtd, addr, len);
>>>>> +						if (ret)
>>>>> +							goto erase_err;
>>>>> +						len = 0;
>>>>> +					}
>>>>> +				} else {
>>>>> +					/* check if end address cover at least
>>>> one die */
>>>>> +					if (div64_ul(addr + len, die_size) >
>>>> ++die_no) {
>>>>> +						/* align to next die */
>>>>> +						rem = die_size - rem;
>>>>> +						ret =
>>>> spi_nor_sector_at_time_erase(mtd, addr, rem);
>>>>> +						if (ret)
>>>>> +							goto erase_err;
>>>>> +						len -= rem;
>>>>> +						addr += rem;
>>>>> +					} else {
>>>>> +						ret =
>>>> spi_nor_sector_at_time_erase(mtd, addr, len);
>>>>> +						if (ret)
>>>>> +							goto erase_err;
>>>>> +						len = 0;
>>>>> +					}
>>>>> +				}
>>>>> +			}
>>>>> +		} else {
>>>>> +			ret = spi_nor_sector_at_time_erase(mtd, addr, len);
>>>>>  			if (ret)
>>>>>  				goto erase_err;
>>>>>  		}
>>>>>
>>>
>>>
> 
> 

Received: from caladan.dune.hu ([78.24.191.180] helo=arrakis.dune.hu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adP1n-0005Wa-O2
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 21:18:53 +0000
Subject: Re: [PATCH] mtd: spi-nor: Add support for ISSI is25lp128
To: Brian Norris <computersforpeace@gmail.com>
References: <1455041563-12483-1-git-send-email-nnazarenko@radiofid.com>
 <20160307213202.GA52131@google.com> <56DF0B51.6040401@openwrt.org>
 <20160308181027.GI55664@google.com>
Cc: Nikita Nazarenko <nnazarenko@radiofid.com>,
 linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
From: Gabor Juhos <juhosg@openwrt.org>
Message-ID: <56DF4187.7050605@openwrt.org>
Date: Tue, 8 Mar 2016 22:17:59 +0100
MIME-Version: 1.0
In-Reply-To: <20160308181027.GI55664@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

> On Tue, Mar 08, 2016 at 06:26:41PM +0100, Gabor Juhos wrote:
>>> On Tue, Feb 09, 2016 at 09:12:43PM +0300, Nikita Nazarenko wrote:
>>>> Signed-off-by: Nikita Nazarenko <nnazarenko@radiofid.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>>> index ed0c19c..e0bb151 100644
>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>> @@ -739,6 +739,7 @@ static const struct flash_info spi_nor_ids[] = {
>>>>  
>>>>  	/* ISSI */
>>>
>>> Both of these ISSI entries look wrong.
>>>
>>>>  	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
>>>
>>> Looking at the datasheet for this part [1], shouldn't the ID be
>>> 0x9d7f20 (i.e., the MFR ID is 0x9d, not 0x7f)? That would match the
>>> existing CFI definition for "PMC". And IIUC, PMC got bought by ISSI? Or
>>> some kind of merger, I don't follow these things.
>>
>> The ID is definitely 0x7d9d20, the m28p80 driver detects the device correctly
>> with that:
>>
>>   m25p80 spi0.0: found is25cd512, expected m25p80
>>   m25p80 spi0.0: is25cd512 (64 Kbytes)
>>   Creating 4 MTD partitions on "spi0.0":
>>   0x000000000000-0x00000000c000 : "routerboot"
>>   0x00000000c000-0x00000000d000 : "hard_config"
>>   0x00000000d000-0x00000000e000 : "bios"
>>   0x00000000e000-0x00000000f000 : "soft_config"
>>
>> The first byte of the manufacturer ID is indeed 0x9d, but the device returns
>> that as the second byte throught the JEDEC ID READ command. Even though it is a
>> weird behaviour, it is described on page 11 of the datasheet.
> 
> What a stupid implementation. 

Maybe it is not so stupid if they wanted to integrate the continuation id in
that. And because 0x7f if not a valid manufacturer ID, it should not collide
with any other manufacturer.

> And they changed it to the sane implementation for is25lp128 it seems?

Yes it seems that they have changed that, but i can't decide that it is better
or not.

>>>> +	{ "is25lp128", INFO(0x9d6018, 0, 32 * 1024,   512, SECT_4K) },
>>>
>>> This datasheet [1] says that for SPI mode (not QPI mode), 4K erase is
>>> done with opcode 0xD7 (i.e., SPINOR_OP_BE_4K_PMC) not 0x20
>>> (SPINOR_OP_BE_4K). So we would need the SECT_4K_PMC, not the SECT_4K
>>> flag.
>>
>> I don't have a board with such flash device, but Table 8.1 "Instruction Set" is
>> misleading a bit. In my understanding, erasing 4K sectors should work with both
>> commands. Look at Clause 8.10 "SECTOR ERASE OPERATION (SER, D7h/20h)" on page 33
>> in the datasheet. Both Figure 8.12 "Sector Erase Sequence" and Figure 8.13
>> "Sector Erase Sequence (QPI) " says 'D7h/20h'.
> 
> Ah, I could see how the table could be read either way. I expect that
> the submitter (Nikita) should be able to confirm this through testing.
> 
>>> Also, the datasheet for this device says it supports 64K sectors, and
>>> the 32K sectors require a different erase command (SPINOR_OP_BE_32K; not
>>> currently supported in this driver). Did you test erase to be sure it
>>> worked as expected? Or are one or more datasheets wrong?
>>
>> It seems that you are correct about this.
> 
> To be clear, it looks like your submission (is25cd512) does use D8h for
> 32K erase blocks, since it's such a tiny device. 

Yes.

> But Nikita's device appears to use 64K erase blocks.

Yes, 64K blocks with the D8h opcode.

-Gabor

> I expect Nikita can test and resubmit a revised entry here.
> 
> Regards,
> Brian
> 

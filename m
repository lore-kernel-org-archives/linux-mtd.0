Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fucPD-0007st-EB
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 11:43:33 +0000
Received: by mail-wr1-x442.google.com with SMTP id z96-v6so1274651wrb.8
 for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2018 04:43:20 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Alexander Amelkin <a.amelkin@yadro.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
Date: Tue, 28 Aug 2018 13:43:17 +0200
MIME-Version: 1.0
In-Reply-To: <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/28/2018 01:29 PM, Alexander Amelkin wrote:
> 27.08.2018 14:34, Marek Vasut wrote:

Hi,

>>>>> According to the datasheet for mx66l51235f, "The device default is in
>>>>> 24-bit address mode" (section 9-10). Having option SPI_NOR_4B_OPCODES
>>>>> makes the code act as if the device was already in 4B mode and didn't
>>>>> need the EN4B command. That prevents this chip from functioning on
>>>>> systems where the boot loader left the chip in 3B mode (e.g. if the
>>>>> chip wasn't used during the boot process).
>>>>>
>>>>> Hence, this commit removes the SPI_NOR_4B_OPCODES option for
>>>>> mx66l51235f (added previously by commit d342b6a973af).
>>>> Could it be there are two variants of the chip, one which supports the
>>>> 4B opcodes and one which does not ? Wouldn't be the first time I saw
>>>> this. If this chip supports the SFDP tables, you can check those.
>>> I was unable to find another variant of the chip. There is only one specified in the datasheet:
>>> http://www.macronix.com/Lists/Datasheet/Attachments/7401/MX66L51235F,%203V,%20512Mb,%20v1.1.pdf
>>> and it says that the device supports both 3B and 4B modes, but defaults to 3B (24-bit) mode.
>> So keep the 4B part in. Linux will just not reconfigure the device to 4B
>> mode using register write, but will instead issue the 4B opcode
>> directly, without any stateful change.
> Marek, thank you for asking all these questions. They made me conduct a deeper investigation than just finding the commit that broke it and reverting it. It appears that OpenPOWER P8's SBE code (the thing that P8 CPU runs first from its built-in memory) expects the PNOR flash chip to be in EN4B mode. It reads the rest of OpenPOWER Firmware using a usual READ (0x03) command with 4 bytes of address. Always. That's why, I believe, Roman's commit broke host booting for us.

Uh oh, I seem to remember some flashes had this weird quirk where they
were in EN4B mode by default, and if U-Boot/Linux reset the flash into
"sane default" state (3B addressing etc), some systems failed to boot.
Furthermore, this EN4B is non-volatile bit on this flash, right ? That
means it is retained across power-cycles, which sucks even more.

> Probably it would be best not to merge this patch into Linux kernel. I'll discuss it with colleagues from OpenPOWER community and we'll probably fix it on SBE side.

Can you fix the firmware ? If so, that'd be amazing.
But still, there can be a software which does rogue transmission on the
SPI bus and flips the flash into 3B mode before reset, so the system
will not boot anyway. Do you have a way to deal with that somehow ?

> As for renaming the chip, I can provide a patch just for that. Or we can leave it as is.

A patch would be nice, yes.

> Thanks.
> Alexander.
> 


-- 
Best regards,
Marek Vasut

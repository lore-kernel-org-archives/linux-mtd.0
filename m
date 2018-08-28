Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fugTU-0004EG-O2
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 16:04:16 +0000
Received: by mail-wm0-x241.google.com with SMTP id j192-v6so2592594wmj.1
 for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2018 09:04:02 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Alexander Amelkin <a.amelkin@yadro.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
 <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>
Date: Tue, 28 Aug 2018 18:03:58 +0200
MIME-Version: 1.0
In-Reply-To: <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
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

On 08/28/2018 05:54 PM, Alexander Amelkin wrote:
> 28.08.2018 14:43, Marek Vasut wrote:
>> On 08/28/2018 01:29 PM, Alexander Amelkin wrote:
>>> 27.08.2018 14:34, Marek Vasut wrote:
>>>>>>> According to the datasheet for mx66l51235f, "The device
>>>>>>> default is in 24-bit address mode" (section 9-10). Having
>>>>>>> option SPI_NOR_4B_OPCODES makes the code act as if the
>>>>>>> device was already in 4B mode and didn't need the EN4B
>>>>>>> command. That prevents this chip from functioning on 
>>>>>>> systems where the boot loader left the chip in 3B mode
>>>>>>> (e.g. if the chip wasn't used during the boot process).
>>>>>>> 
>>>>>>> Hence, this commit removes the SPI_NOR_4B_OPCODES option
>>>>>>> for mx66l51235f (added previously by commit
>>>>>>> d342b6a973af).
>>>>>> Could it be there are two variants of the chip, one which
>>>>>> supports the 4B opcodes and one which does not ? Wouldn't
>>>>>> be the first time I saw this. If this chip supports the
>>>>>> SFDP tables, you can check those.
>>>>> I was unable to find another variant of the chip. There is
>>>>> only one specified in the datasheet: 
>>>>> http://www.macronix.com/Lists/Datasheet/Attachments/7401/MX66L51235F,%203V,%20512Mb,%20v1.1.pdf
>>>>>
>>>>> 
and it says that the device supports both 3B and 4B modes, but defaults
to 3B (24-bit) mode.
>>>> So keep the 4B part in. Linux will just not reconfigure the
>>>> device to 4B mode using register write, but will instead issue
>>>> the 4B opcode directly, without any stateful change.
>>> Marek, thank you for asking all these questions. They made me
>>> conduct a deeper investigation than just finding the commit that
>>> broke it and reverting it. It appears that OpenPOWER P8's SBE
>>> code (the thing that P8 CPU runs first from its built-in memory)
>>> expects the PNOR flash chip to be in EN4B mode. It reads the rest
>>> of OpenPOWER Firmware using a usual READ (0x03) command with 4
>>> bytes of address. Always. That's why, I believe, Roman's commit
>>> broke host booting for us.
>> Uh oh, I seem to remember some flashes had this weird quirk where
>> they were in EN4B mode by default, and if U-Boot/Linux reset the
>> flash into "sane default" state (3B addressing etc), some systems
>> failed to boot. Furthermore, this EN4B is non-volatile bit on this
>> flash, right ? That means it is retained across power-cycles, which
>> sucks even more.
> No, EN4B is volatile. It doesn't survive power cycling. A quote from
> datasheet:
>>>> The 4BYTE bit may be cleared by power-off or writing EX4B
>>>> instruction to reset the state to be "0".

OK, that's good. I probably thought of different flash.

>>> Probably it would be best not to merge this patch into Linux
>>> kernel. I'll discuss it with colleagues from OpenPOWER community
>>> and we'll probably fix it on SBE side.
>> Can you fix the firmware ? If so, that'd be amazing.
>
> It turns out that it is impossible to fix that on firmware side
> mainly because the firmware does not send any opcodes over SPI at
> all. It relies on the SPI flash controller to do the address mapping
> so the firmware accesses the chip as a usual memory address range.
> The flash controller is located in our case inside Aspeed AST2400 BMC
> SoC and does not support 4B opcodes. It expects the chip to respond
> to generic READ and WRITE opcodes with (configurable) either 3 or 4
> address byte cycles. So the only way to make it work is put the chip
> in EN4B mode when BMC boots.

And who does that ? Or is the EN4B set by default and U-Boot/Linux
_clears_ it , thus making the board unbootable ?

Doesn't it simply mean your board is missing SPI NOR hardware reset line?

> As this is quite a specific case, I
> guess you won't be willing to remove the SPI_NOR_4B_OPCODES option
> globally. We'll have to keep the patch local to openbmc project

I am more worried about this being actually unfixable in reliable way.

>> But still, there can be a software which does rogue transmission on
>> the SPI bus and flips the flash into 3B mode before reset, so the
>> system will not boot anyway. Do you have a way to deal with that
>> somehow ?
>
> Sure. As I said, there is no way to turn on the host without BMC
> knowing/controlling it. The BMC ensures the chip is in the right
> mode. That's actually the reason why this patch appeared in the first
> place. Also, there is no rogue software on BMC.

OK, but if the BMC puts the chip in a defined state, how come the system
will refuse to (re)boot if Linux interferes with the chip's volatile
register settings ?

-- 
Best regards,
Marek Vasut

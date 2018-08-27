Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuFnv-0002Cw-VK
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 11:35:33 +0000
Received: by mail-wm0-x242.google.com with SMTP id f21-v6so7750181wmc.5
 for <linux-mtd@lists.infradead.org>; Mon, 27 Aug 2018 04:35:21 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Alexander Amelkin <a.amelkin@yadro.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
Date: Mon, 27 Aug 2018 13:34:54 +0200
MIME-Version: 1.0
In-Reply-To: <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
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

On 08/27/2018 01:24 PM, Alexander Amelkin wrote:
> 27.08.2018 13:33, Marek Vasut wrote:
>> On 08/20/2018 12:26 PM, Alexander Amelkin wrote:
>>> Currently in spi-nor driver there is a line for mx66l51235l.
>>> According to Macronix site, there is no such part number. The chip
>>> detected as such is actually mx66l51235f. Hence, this commit renames
>>> the chip.
>> I wonder if this could pose a problem, since this might interfere with
>> the DT being an ABI. But I guess fixing the name is OK.
> Well, as far as I understand, in the DT you'll only have "compatible=jedec,spi-nor" for most cases.
> Anyway, I did `grep -r mx66l41235 arch/*/boot/dts` and found nothing, so I guess it's safe to rename.

The argument can go in the direction of out-of-tree DTs . I think it's
OK to fix it too though.

>>> According to the datasheet for mx66l51235f, "The device default is in
>>> 24-bit address mode" (section 9-10). Having option SPI_NOR_4B_OPCODES
>>> makes the code act as if the device was already in 4B mode and didn't
>>> need the EN4B command. That prevents this chip from functioning on
>>> systems where the boot loader left the chip in 3B mode (e.g. if the
>>> chip wasn't used during the boot process).
>>>
>>> Hence, this commit removes the SPI_NOR_4B_OPCODES option for
>>> mx66l51235f (added previously by commit d342b6a973af).
>> Could it be there are two variants of the chip, one which supports the
>> 4B opcodes and one which does not ? Wouldn't be the first time I saw
>> this. If this chip supports the SFDP tables, you can check those.
> I was unable to find another variant of the chip. There is only one specified in the datasheet:
> http://www.macronix.com/Lists/Datasheet/Attachments/7401/MX66L51235F,%203V,%20512Mb,%20v1.1.pdf
> and it says that the device supports both 3B and 4B modes, but defaults to 3B (24-bit) mode.

So keep the 4B part in. Linux will just not reconfigure the device to 4B
mode using register write, but will instead issue the 4B opcode
directly, without any stateful change.

> Most probably, Roman Yeryomin, the author of commit d342b6a973af, was fighting post-effects of u-boot or some other boot loader that set his chip to 4B mode before jumping to Linux kernel.

It's the other way around, U-Boot keeps the flash in 3B mode.

> It is hard to say for sure, though, as neither his patch itself, nor his post to the mailing list contained any rationale for the change.
> 
> It is for sure though that for OpenPOWER systems using this chip as PNOR (BIOS flash in x86 terms), commit d342b6a973af broke host booting.

I CCed him, so maybe he can clarify.

But this is weird. If you reboot the system, isn't the SPI NOR
power-cycled and reset into defined default state ? If not, your
hardware is severely broken and you should fix your reset routing.

-- 
Best regards,
Marek Vasut

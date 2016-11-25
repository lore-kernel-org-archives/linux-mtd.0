Received: from 2.mo7.mail-out.ovh.net ([87.98.143.68])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAI0g-0001EL-1e
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 15:01:55 +0000
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id AD527217F3
 for <linux-mtd@lists.infradead.org>; Fri, 25 Nov 2016 16:01:30 +0100 (CET)
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
To: Marek Vasut <marek.vasut@gmail.com>, Joel Stanley <joel@jms.id.au>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
 <bc14b6ba-800c-bf69-763e-65ead8d4efa7@gmail.com>
 <CACPK8Xc7Dy=4oaZ_+j3hCEkMY+sqZ_-QkCQ9okmUoOjTpuZvvA@mail.gmail.com>
 <9569aaca-5748-e82d-20e1-ed846fb762f6@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b9d8ba33-2bb9-cb93-d833-89ddd8cfd7f9@kaod.org>
Date: Fri, 25 Nov 2016 16:01:13 +0100
MIME-Version: 1.0
In-Reply-To: <9569aaca-5748-e82d-20e1-ed846fb762f6@gmail.com>
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

Hello Marek,

Sorry for the late answer. Here are a couple of answers to the naming 
problem 

On 11/25/2016 02:57 PM, Marek Vasut wrote:
> On 11/21/2016 05:45 AM, Joel Stanley wrote:
>> Hello Marek,
> 
> Hi!
> 
>> Thank you for the review. I have answered a few of your questions;
>> I'll leave the rest to Cedric.
>>
>> On Mon, Nov 21, 2016 at 8:13 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>>>> index 4a682ee0f632..96148600fdab 100644
>>>> --- a/drivers/mtd/spi-nor/Kconfig
>>>> +++ b/drivers/mtd/spi-nor/Kconfig
>>>> @@ -76,4 +76,16 @@ config SPI_NXP_SPIFI
>>>>         Flash. Enable this option if you have a device with a SPIFI
>>>>         controller and want to access the Flash as a mtd device.
>>>>
>>>> +config ASPEED_FLASH_SPI
>>>
>>> Should be SPI_ASPEED , see the other controllers and keep the list sorted.
>>
>> Perhaps SPI_NOR_ASPEED so it's clear it's not a driver for a generic SPI bus?
> 
> But it's not a driver for SPI-NOR only either, it seems it's a driver
> for multiple distinct devices.

yes and I think it was a mistake to send the whole at once. We have 
added the support in qemu controller by controller and it was easier 
to understand. I need to split the patchset in the next version. 

>>>> +     tristate "Aspeed flash controllers in SPI mode"
>>>> +     depends on HAS_IOMEM && OF
>>>> +     depends on ARCH_ASPEED || COMPILE_TEST
>>>> +     # IO_SPACE_LIMIT must be equivalent to (~0UL)
>>>> +     depends on !NEED_MACH_IO_H
>>>
>>> Why?
>>>
>>>> +     help
>>>> +       This enables support for the New Static Memory Controller
>>>> +       (FMC) in the Aspeed SoCs (AST2400 and AST2500) when attached
>>>> +       to SPI nor chips, and support for the SPI Memory controller
>>>> +       (SPI) for the BIOS.
>>>
>>> I think there is a naming chaos between FMC, SMC (as in Static MC) and
>>> SMC (as in SPI MC).
>>
>> Yes, you're spot on. This naming chaos comes form the vendor's documentation.
>>
>> I think we could re-work this sentence to make it clearer.
> 
> Please do before someone's head explodes from this :)

Indeed .. :) I will give a try. Here is the status :

Aspeed SoC AST2400 has a set of SMC (Static Memory Controller) 
controllers in which you find :

- Legacy Static Memory Controller (called SMC in the spec)  
  . base address at 0x16000000
  . BMC firmware
  . old register set
  . supports NOR flash, NAND flash and SPI flash memory. All bootable.
  . 1 chip select pin (CE0)

- New Static Memory Controller (called FMC in the spec)
  . base address at 0x16200000
  . BMC firmware
  . new register set
  . supports NOR flash, NAND flash and SPI flash memory. 
  . 5 chip select pins (CE0 ∼ CE4)

- SPI Flash Controller (called SPI in the spec)  
  . base address at 0x16300000
  . host Firmware
  . exotic register set, between old and new ...
  . supports SPI flash memory
  . 1 chip select pin (CE0)


Aspeed SoC AST2500 defines has a similar set of SMC (Static Memory 
Controller) controllers, more in the vein of the AST2400 FMC  :

- Legacy Static Memory Controller is gone, NOR and NAND support also

- Firmware SPI Memory Controller (called FMC in the spec)  
  . base address at 0x16200000
  . BMC firmware
  . new register set
  . supports SPI flash memory.
  . 3 chip select pins (CE0 ~ CE2)

- SPI Flash Controller (called SPI1 in the spec) first
  . base address at 0x16300000
  . host firmware
  . new register set
  . supports SPI flash memory.
  . 2 chip select pins (CE0 ~ CE1)

- SPI Flash Controller (called SPI2 in the spec) second
  . base address at 0x16310000
  . host firmware
  . new register set
  . supports SPI flash memory.
  . 2 chip select pins (CE0 ~ CE1)


So, these are the reasons behind the naming mess. Added to that the 
driver considers the acronym SMC to stand for SPI Memory Controller, 
which is wrong. I tried to reduce the confusion with some comments but 
that was a failure :)

In qemu, we have used FMC (Firmware ...) and SPI to name the controllers 
and we just dropped the legacy SMC. I think using the same naming scheme
is a good idea. We don't support anything else than SPI either so we can 
drop the other types for the moment.

>>>> +static int aspeed_smc_read_from_ahb(void *buf, const void __iomem *src,
>>>> +                                 size_t len)
>>>> +{
>>>
>>> What if start of buf is unaligned ?
>>>
>>>> +     if ((((unsigned long)src | (unsigned long)buf | len) & 3) == 0) {
>>>
>>> Uh, should use boolean OR, not bitwise or. Also, if you're testing
>>> pointer for NULL, do if (!ptr) .
>>>
>>> if (!src || !buf || !len)
>>>    return;
>>
>> That's a different test. We're testing here that the buffers are
>> aligned to see if we can do a word-at-a-time copy.
>>
>> If not, it falls through to do a byte-at-a-time copy. I think this
>> covers your first question about buf being unaligned.
> 
> Ah, I see, thanks for clarifying. Comment in the code would be helpful
> for why what you're doing is OK. And I think you want to cast to
> uintptr_t instead to make this work on 64bit.

yes

>> Cedric, perhaps you could create a macro called IS_ALLIGNED to make it
>> clear what this is doing?
> 
> Yup, thanks!

sure. I still need to go through Marek's comments in the initial email, 
I will split the pachset and fix the naming in next version.

Thanks,

C. 
 
>>>
>>> while (...)
>>>
>>>> +             while (len > 3) {
>>>> +                     *(u32 *)buf = readl(src);
>>>> +                     buf += 4;
>>>> +                     src += 4;
>>>> +                     len -= 4;
>>>> +             }
>>>> +     }
>>>> +
>>>> +     while (len--) {
>>>> +             *(u8 *)buf = readb(src);
>>>> +             buf += 1;
>>>> +             src += 1;
>>>> +     }
>>>> +     return 0;
>>>> +}
>>>> +/*
>>>> + * SPI Flash Configuration Register (AST2400 SPI)
>>>> + */
>>>> +#define CONFIG_REG                   0x0
>>>> +#define    CONFIG_ENABLE_CE_INACTIVE     BIT(1)
>>>> +#define    CONFIG_WRITE                          BIT(0)
>>>
>>> #define[space]FOO[tab]BIT(bar)
>>
>> These are bits within the CONFIG_REG. It follows the same style as
>> other spi-nor drivers, eg. nxp-spifi.
>>
>> I think it's somewhat clearer, but if you have a strong preference
>> against then fair enough.
> 
> It triggers my OCD, but I think it's a matter of taste, so I don't care
> that much.
> 

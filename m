Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8gUH-0006ZR-Bp
 for linux-mtd@lists.infradead.org; Mon, 21 Nov 2016 04:45:50 +0000
Received: by mail-oi0-x242.google.com with SMTP id v84so20435547oie.2
 for <linux-mtd@lists.infradead.org>; Sun, 20 Nov 2016 20:45:26 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <bc14b6ba-800c-bf69-763e-65ead8d4efa7@gmail.com>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
 <bc14b6ba-800c-bf69-763e-65ead8d4efa7@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 15:15:05 +1030
Message-ID: <CACPK8Xc7Dy=4oaZ_+j3hCEkMY+sqZ_-QkCQ9okmUoOjTpuZvvA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
To: Marek Vasut <marek.vasut@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Marek,

Thank you for the review. I have answered a few of your questions;
I'll leave the rest to Cedric.

On Mon, Nov 21, 2016 at 8:13 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>> index 4a682ee0f632..96148600fdab 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -76,4 +76,16 @@ config SPI_NXP_SPIFI
>>         Flash. Enable this option if you have a device with a SPIFI
>>         controller and want to access the Flash as a mtd device.
>>
>> +config ASPEED_FLASH_SPI
>
> Should be SPI_ASPEED , see the other controllers and keep the list sorted.

Perhaps SPI_NOR_ASPEED so it's clear it's not a driver for a generic SPI bus?

>
>> +     tristate "Aspeed flash controllers in SPI mode"
>> +     depends on HAS_IOMEM && OF
>> +     depends on ARCH_ASPEED || COMPILE_TEST
>> +     # IO_SPACE_LIMIT must be equivalent to (~0UL)
>> +     depends on !NEED_MACH_IO_H
>
> Why?
>
>> +     help
>> +       This enables support for the New Static Memory Controller
>> +       (FMC) in the Aspeed SoCs (AST2400 and AST2500) when attached
>> +       to SPI nor chips, and support for the SPI Memory controller
>> +       (SPI) for the BIOS.
>
> I think there is a naming chaos between FMC, SMC (as in Static MC) and
> SMC (as in SPI MC).

Yes, you're spot on. This naming chaos comes form the vendor's documentation.

I think we could re-work this sentence to make it clearer.

>> +static int aspeed_smc_read_from_ahb(void *buf, const void __iomem *src,
>> +                                 size_t len)
>> +{
>
> What if start of buf is unaligned ?
>
>> +     if ((((unsigned long)src | (unsigned long)buf | len) & 3) == 0) {
>
> Uh, should use boolean OR, not bitwise or. Also, if you're testing
> pointer for NULL, do if (!ptr) .
>
> if (!src || !buf || !len)
>    return;

That's a different test. We're testing here that the buffers are
aligned to see if we can do a word-at-a-time copy.

If not, it falls through to do a byte-at-a-time copy. I think this
covers your first question about buf being unaligned.

Cedric, perhaps you could create a macro called IS_ALLIGNED to make it
clear what this is doing?

>
> while (...)
>
>> +             while (len > 3) {
>> +                     *(u32 *)buf = readl(src);
>> +                     buf += 4;
>> +                     src += 4;
>> +                     len -= 4;
>> +             }
>> +     }
>> +
>> +     while (len--) {
>> +             *(u8 *)buf = readb(src);
>> +             buf += 1;
>> +             src += 1;
>> +     }
>> +     return 0;
>> +}
>> +/*
>> + * SPI Flash Configuration Register (AST2400 SPI)
>> + */
>> +#define CONFIG_REG                   0x0
>> +#define    CONFIG_ENABLE_CE_INACTIVE     BIT(1)
>> +#define    CONFIG_WRITE                          BIT(0)
>
> #define[space]FOO[tab]BIT(bar)

These are bits within the CONFIG_REG. It follows the same style as
other spi-nor drivers, eg. nxp-spifi.

I think it's somewhat clearer, but if you have a strong preference
against then fair enough.

>
>> +/*
>> + * SPI Flash Configuration Register (AST2500 SPI)
>> + * Type setting Register (AST2500 FMC and AST2400 FMC)
>> + */

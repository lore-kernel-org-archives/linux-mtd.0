Received: from mail-io0-x232.google.com ([2607:f8b0:4001:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmRzF-00010W-Gl
 for linux-mtd@lists.infradead.org; Mon, 28 Aug 2017 21:54:27 +0000
Received: by mail-io0-x232.google.com with SMTP id 81so8354500ioj.5
 for <linux-mtd@lists.infradead.org>; Mon, 28 Aug 2017 14:54:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX0b=J9AuPAvdRXGGVXvc7f9n7TJ0_VKR13P05toq9REw@mail.gmail.com>
References: <1503954854-30963-1-git-send-email-mw@semihalf.com>
 <1503954854-30963-2-git-send-email-mw@semihalf.com>
 <CAMuHMdX0b=J9AuPAvdRXGGVXvc7f9n7TJ0_VKR13P05toq9REw@mail.gmail.com>
From: Marcin Wojtas <mw@semihalf.com>
Date: Mon, 28 Aug 2017 23:54:03 +0200
Message-ID: <CAPv3WKf3ra5tiK2gjQYUaTpiiM=kg=UGqceVesinqtjjk=RUnA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: add an option to force 3byte adressing
 mode
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will.deacon@arm.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>,
 Neta Zur Hershkovits <neta@marvell.com>, Omri Itach <omrii@marvell.com>,
 Hanna Hawa <hannah@marvell.com>,
 Grzegorz Jaszczyk <jaz@semihalf.com>, Tomasz Nowicki <tn@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Geert,

>> +- spi-3byte-addressing - Empty property indicating device access to be done
>> +                   only in 3byte addressing mode.
>
> spi-force-3byte-addressing?

I can change it, no problem. I thought of this, but was affraid if the
property wouldn't be too long.

>
>>  Some SPI controllers and devices support Dual and Quad SPI transfer mode.
>>  It allows data in the SPI system to be transferred using 2 wires (DUAL) or 4
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 1413828..029c87d 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -2002,7 +2002,17 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>                 if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
>>                     info->flags & SPI_NOR_4B_OPCODES)
>>                         spi_nor_set_4byte_opcodes(nor, info);
>> -               else
>> +               else if (of_property_read_bool(np, "spi-3byte-addressing")) {
>> +                       /*
>> +                        * Do not enter 4byte mode in order to prevent
>> +                        * the early bootloader to come up on non-default
>> +                        * SPI NOR memory during boot. Limit accessible
>> +                        * size to 16MiB.
>> +                        */
>> +                       nor->addr_width = 3;
>> +                       mtd->size = 0x1000000;
>
> What if the device is smaller than 16 MiB?
>
> mtd->size = min(mtd->size, 0x1000000);

Not needed - this code is executed only for mtd->size > 0x1000000. See
bigger context:

        if (info->addr_width)
                nor->addr_width = info->addr_width;
        else if (mtd->size > 0x1000000) {
                /* enable 4-byte addressing if the device exceeds 16MiB */
                nor->addr_width = 4;
                if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
                    info->flags & SPI_NOR_4B_OPCODES)
                        spi_nor_set_4byte_opcodes(nor, info);
                else if (of_property_read_bool(np, "spi-3byte-addressing")) {
                        /*
                         * Do not enter 4byte mode in order to prevent
                         * the early bootloader to come up on non-default
                         * SPI NOR memory during boot. Limit accessible
                         * size to 16MiB.
                         */
                        nor->addr_width = 3;
                        mtd->size = 0x1000000;
                        dev_info(dev, "Force 3B addressing mode\n");
                } else
                        set_4byte(nor, info, 1);
        } else {
                nor->addr_width = 3;
        }


Best regards,
Marcin

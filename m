MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1410793627.3040.61.camel@decadent.org.uk>
References: <1410714624.3040.38.camel@decadent.org.uk>
 <1410714708.3040.43.camel@decadent.org.uk>
 <CAMuHMdUs+7uidcD6tivnq6+TbD4_piixLVqwuSa0Z1u3sF7EoA@mail.gmail.com>
 <1410793627.3040.61.camel@decadent.org.uk>
Date: Wed, 17 Sep 2014 10:23:26 +0200
Message-ID: <CAMuHMdVSYvUh3qVRhw15KmOn0MYocbJVQBr9TkHtebM19c8dJA@mail.gmail.com>
Subject: Re: [PATCH 5/5] m25p80, spi-nor: Share the list of supported chip type
 names again
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset=UTF-8
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 linux-spi <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ian Campbell <ijc@hellion.org.uk>, Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ben,

On Mon, Sep 15, 2014 at 5:07 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
>> >
>> > +#define __SPI_NOR_ENUM_TYPES(c_id, str_and_c_id)                         \
>> > +       c_id(at25fs010)         c_id(at25fs040)         c_id(at25df041a)  \
>> > +       c_id(at25df321a)        c_id(at25df641)         c_id(at26f004)    \
>>
>> Can't you just have the IDs in a header file only, and let the header file
>> generate either a struct flash_info or a struct spi_device_id table, using
>> a macro defined by the file that includes it?
>
> How would we match up the rest of the struct flash_info to the name?

Ah, you use the enums to match the names to the rest of the flash_info.
But you can do it in one-shot, can't you?

spi-nor-data.h:

FLASH_ENTRY("at25fs010", 0x1f6601, 0, 32 * 1024,   4, SECT_4K),
FLASH_ENTRY("at25fs040", 0x1f6604, 0, 64 * 1024,   8, SECT_4K),
...

m25p80.c:

#define FLASH_ENTRY(_name, _jedec_id, _ext_id, _sector_size,
_n_sectors, _flags) \
        { .name = _name },

static const struct spi_device_id m25p_ids[] = {
#include "spi-nor-data.h"
};

spi-nor.c:

#define FLASH_ENTRY(_name, _jedec_id, _ext_id, _sector_size,
_n_sectors, _flags) \
        { \
                 .name = _name, \
                .jedec_id = (_jedec_id), \
                .ext_id = (_ext_id), \
                .sector_size = (_sector_size), \
                .n_sectors = (_n_sectors), \
                .page_size = 256, \
                .flags = (_flags), \
        }

static const struct flash_info spi_nor_info[] = {
#include "spi-nor-data.h"
};

Then the whole table data in contained in one place (spi-nor-data.h).
Am I still missing something?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

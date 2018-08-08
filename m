MIME-Version: 1.0
In-Reply-To: <CAHp75VewdvD2D2BpyKAptFecr+hrW5O5YUcSzu9X4wGgV-oJ3A@mail.gmail.com>
References: <20180808153150.23444-1-brgl@bgdev.pl>
 <20180808153150.23444-22-brgl@bgdev.pl>
 <CAHp75VewdvD2D2BpyKAptFecr+hrW5O5YUcSzu9X4wGgV-oJ3A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Aug 2018 20:59:24 +0300
Message-ID: <CAHp75Vdh0qfyutF6stPe1=eREg5iEHeUfE6MZO-nwsuhcNFTrg@mail.gmail.com>
Subject: Re: [PATCH 21/28] ARM: davinci: dm644x-evm: use device properties for
 at24 eeprom
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 "David S . Miller" <davem@davemloft.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Naren <naren.kernel@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lukas Wunner <lukas@wunner.de>, Dan Carpenter <dan.carpenter@oracle.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 Sven Van Asbroeck <svendev@arcx.com>, Paolo Abeni <pabeni@redhat.com>,
 Alban Bedel <albeu@free.fr>,
 Rob Herring <robh@kernel.org>, David Lechner <david@lechnology.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 8, 2018 at 8:55 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Aug 8, 2018 at 6:31 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> We want to work towards phasing out the at24_platform_data structure.
>> There are few users and its contents can be represented using generic
>> device properties. Using device properties only will allow us to
>> significantly simplify the at24 configuration code.
>>
>> Remove the at24_platform_data structure and replace it with an array
>> of property entries. Drop the byte_len/size property, as the model name
>> already implies the EEPROM's size.
>>
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>  arch/arm/mach-davinci/board-dm644x-evm.c | 12 ++++--------
>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
>> index 6d35c6e1b0bd..abfcf42da6fb 100644
>> --- a/arch/arm/mach-davinci/board-dm644x-evm.c
>> +++ b/arch/arm/mach-davinci/board-dm644x-evm.c
>> @@ -16,8 +16,8 @@
>>  #include <linux/gpio/machine.h>
>>  #include <linux/i2c.h>
>>  #include <linux/platform_data/pcf857x.h>
>> -#include <linux/platform_data/at24.h>
>>  #include <linux/platform_data/gpio-davinci.h>
>> +#include <linux/property.h>
>>  #include <linux/mtd/mtd.h>
>>  #include <linux/mtd/rawnand.h>
>>  #include <linux/mtd/partitions.h>
>> @@ -486,12 +486,8 @@ static struct nvmem_cell_lookup dm6446evm_mac_address_cell = {
>>         .nvmem_name = "1-00500",
>>  };
>>
>> -static struct at24_platform_data eeprom_info = {
>> -       .byte_len       = (256*1024) / 8,
>> -       .page_size      = 64,
>> -       .flags          = AT24_FLAG_ADDR16,
>> -       .setup          = davinci_get_mac_addr,
>> -       .context        = (void *)0x7f00,
>> +static const struct property_entry eeprom_properties[] = {
>> +       PROPERTY_ENTRY_U32("pagesize", 64),

Missed terminator, though

>>  };
>>
>>  /*
>> @@ -601,7 +597,7 @@ static struct i2c_board_info __initdata i2c_info[] =  {
>>         },
>>         {
>>                 I2C_BOARD_INFO("24c256", 0x50),
>> -               .platform_data  = &eeprom_info,
>> +               .properties = eeprom_properties,
>>         },
>>         {
>>                 I2C_BOARD_INFO("tlv320aic33", 0x1b),
>> --
>> 2.18.0
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko

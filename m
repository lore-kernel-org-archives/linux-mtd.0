From: hauke@hauke-m.de (Hauke Mehrtens)
Date: Wed, 16 Jan 2019 23:38:48 +0100
Subject: [PATCH 2/2] mtd: spi-nor: Add support for mx25u3235f
In-Reply-To: <271e02fa-8ace-b59c-1f74-14231cd883e8@microchip.com>
References: <20181209170342.9554-1-hauke@hauke-m.de>
 <20181209170342.9554-3-hauke@hauke-m.de>
 <271e02fa-8ace-b59c-1f74-14231cd883e8@microchip.com>
Message-ID: <55443ea0-2ef8-cd2a-152e-0398dc086e13@hauke-m.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On 1/11/19 9:54 AM, Tudor.Ambarus at microchip.com wrote:
> Hi, Hauke,
> 
> On 12/09/2018 07:03 PM, Hauke Mehrtens wrote:
>> From: Andr? Valentin <avalentin@marcant.net>
>>
>> This flash chip was found on the ZyXEL NBG6817
>>
>> The datasheet can be found here:
>> http://www.macronix.com/Lists/Datasheet/Attachments/7438/MX25U3235F,%201.8V,%2032Mb,%20v1.6.pdf
> 
> Did you test the flash to see if it works correctly? You should specify this in
> the commit message.

Sorry I do not have a device with this flash chip, this patch was
shipped in OpenWrt for a long time and I wanted to reduce the number of
patches we carry in OpenWrt.

Andr? can you please confirm that this works for you on your device.

>>
>> Signed-off-by: Andr? Valentin <avalentin@marcant.net>
> 
> You should add your Signed-off-by tag as you are sending a patch that is not
> from you.

No Problem I can add this.

>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index a21b1a26130d..9925760339ba 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1375,6 +1375,7 @@ static const struct flash_info spi_nor_ids[] = {
>>  	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>>  	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
>>  	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
>> +	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64, SECT_4K) },
>>  	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
> 
> It's nicer to order this alphabetically, the entry should be added here.

Ok will change this.

> 
> The flash supports Fast Read 1-1-2 (3Bh) and Fast Read 1-1-4 (6Bh) hence both
> SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ flags should be set too. Can you please
> test with these flags and if all ok, submit a new patch?

I do not know if the controller in the ZyXEL NBG6817 and the board is
capable of dual and quad reads.

Hauke

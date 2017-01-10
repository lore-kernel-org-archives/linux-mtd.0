Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cR0AO-0001lb-V7
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 17:25:03 +0000
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: Fix whole chip erasing for stacked
 chips.
To: Marek Vasut <marek.vasut@gmail.com>, Marcin Krzeminski
 <mar.krzeminski@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20170106171901.27565-1-mar.krzeminski@gmail.com>
 <20170106171901.27565-2-mar.krzeminski@gmail.com>
 <e9a447d9-da58-87ac-3136-d1dc0c75d591@gmail.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <d4bda462-ddcb-2ead-0e57-595aed633b67@atmel.com>
Date: Tue, 10 Jan 2017 18:24:37 +0100
MIME-Version: 1.0
In-Reply-To: <e9a447d9-da58-87ac-3136-d1dc0c75d591@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

Le 07/01/2017 à 00:45, Marek Vasut a écrit :
> On 01/06/2017 06:19 PM, Marcin Krzeminski wrote:
>> Currently it is possible to disable chip erase for spi-nor driver.
>> Some modern stacked (multi die) flash chips do not support chip
>> erase opcode at all but spi-nor framework needs to cope with them too.
>> This commit extends existing functionality to allow disable
>> chip erase for a single flash chip.
> 
> I wonder whether this should really be opt-out flag. Since we'll see
> more multi-die chips (and chips with different die sizes), I'd say this
> should rather be opt-in flag.
>

Just to be sure I've understood what you propose: do you suggest something
like CAN_CHIP_ERASE instead of NO_CHIP_ERASE for the new info->flags bit?

If so, don't forget that info->flags value is tested for every single entry
of the spi_nor_ids[] array, including all legacy SPI memories such as AT25
or M25P80. Currently spi-nor.c calls erase_chip() from spi_nor_erase()
whenever the user tries to erase the whole memory (len == mtd->size),
whatever SPI memory is connected to the controller. This implementation is
not restricted to multi-die memory. Indeed, spi-nor.c is not currently
aware of multi-die memories.

Hence if we want an opt-in logic for the new flag and still want to be
backward compatible, we would have to add the new flag into each entry of
the spi_nor_ids[] array.

Also I asked Marcin to split his original patch into 2 parts because I
think there are 2 different topics:

1 - disabling chip erase command on memories which don't support this SPI
command. This is a bug fix: we can still provide this chip erase feature
using only many regular sector/block erase commands. For sure it is not
optimal but at least it works hence the bug is fixed.

Some multi-die memories are examples of devices concerned by the bug but
maybe they are not the only one. S3AN memories also suffer from this bug
and it has already been dealt by some Ricardo's patches few weeks ago.

2 - adding support to the die erase command: this one is an optimization so
for me, still useful but with a lower priority as we can still live without
it so this would let use more time to think about the proper way to
implement this feature. Also, as Marcin reported, we already have examples
of multi-die memories which do support the chip erase command.

Hence it shows us that (chip erase not supported != multi-die).

Best regards,

Cyrille

>> Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 2a643a1..595de54 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -85,6 +85,7 @@ struct flash_info {
>>  					 * Use dedicated 4byte address op codes
>>  					 * to support memory size above 128Mib.
>>  					 */
>> +#define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
>>  };
>>  
>>  #define JEDEC_MFR(info)	((info)->id[0])
>> @@ -1621,6 +1622,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>  		nor->flags |= SNOR_F_USE_FSR;
>>  	if (info->flags & SPI_NOR_HAS_TB)
>>  		nor->flags |= SNOR_F_HAS_SR_TB;
>> +	if (info->flags & NO_CHIP_ERASE)
>> +		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>>  
>>  #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>>  	/* prefer "small sector" erase if possible */
>>
> 
> 

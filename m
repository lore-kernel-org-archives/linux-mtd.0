Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cS3AU-00084k-G7
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2017 14:49:29 +0000
Subject: Re: [PATCH] mtd: spi-nor: don't claim mr25h40 to be JEDEC compatible
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>, Jagan Teki
 <jagan@openedev.com>, Marek Vasut <marex@denx.de>
References: <20170113093509.25737-1-u.kleine-koenig@pengutronix.de>
 <2b0640c0-09ce-22d4-bd02-729fbed8c608@atmel.com>
CC: <linux-mtd@lists.infradead.org>, <kernel@pengutronix.de>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <584d7ce5-981c-4fb3-05a1-1f6e7d329fdc@atmel.com>
Date: Fri, 13 Jan 2017 15:49:00 +0100
MIME-Version: 1.0
In-Reply-To: <2b0640c0-09ce-22d4-bd02-729fbed8c608@atmel.com>
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

Le 13/01/2017 à 15:30, Cyrille Pitchen a écrit :
> Hi all,
> 
> Le 13/01/2017 à 10:35, Uwe Kleine-König a écrit :
>> Commit edd0c8f4932d ("mtd: spi-nor: Add support for mr25h40") made it
>> possible to use a mr25h40 by writing
>>
>> 	compatible = "mr25h40", "jedec,spi-nor";
>>
>> in a device tree. This chip however isn't JEDEC compatible however, so
> 
> That's true but it should not be the only one working combination. Indeed
> the m25p80.c driver doesn't care about the manufacturer prefix and only
> checks the device name to match some DT compatible string. Hence
> technically you could use something like:
> 
> compatible = "everspin,mr25h40", "nonjedec,spi-nor";
> 
> 
> The "*,spi-nor" strings match the "spi-nor" entry of the m25p_ids[] array
> in m25p80.c so based on the DT compatible string, the kernel knows that the
> memory device can be handled by this m25p80.c driver.
> 

I think I made a mistake since I forgot about the m25p_of_table[] array:
the only string is "jedec,spi-nor" so "nonjedec,spi-nor" may not work with
DT platform.

> Then from m25p80.c, flash_name should point to the "mr25h40" string, which
> will be matched in spi_nor_scan() using the "mr25h40" entry of the
> spi_nor_ids[] array.
> 
> The "nonjedec,spi-nor" DT compatible string in not documented yet but we
> could document it if this solution is chosen. This would be a first solution.
> 
> Another solution is, like you did in this patch, to add the relevant
> entries in the m25p_ids[] array in m25p80.c. I have no problem with that.
> However I would just want some consistent naming scheme. I mean a
> "mr25h256" entry already exists in the m25p_ids[] array. We must keep this
> entry to be backward compatible with existing .dtb files. Then I think news
> entries should simply be named "mr25h10" and "mr25h40", without the
> "-nonjedec" suffix. This way, the naming scheme for Everspin memory would
> be consistent in both the m25p_ids[] and spi_nor_ids[] arrays.
> No change is needed in spi-nor.c
> 
> Then the 3rd solution: adding a "-nonjedec" suffix to the "mr25h10" and
> "mr25h40" entries but keep the "mr25h256" name unchanged. Then add the
> "mr25h10-nonjedec" and "mr25h40-nonjedec" entries in m25p_ids[].
> Indeed, this is what you propose with your patch, except that you didn't
> handle the case of the mr25h10 devices then ;) , but honestly this is not
> the solution I prefer.
> 
> I don't want to force anything, I just want this to be discussed a little
> bit more but maybe not so long because at some point we have to make a
> decision otherwise the patch would be forgotten.
> 
> Marek, what do you think about that?
> 
>> change the chip string and add a compatible entry to bless
>>
>> 	compatible = "mr25h40-nonjedec";
>>
>> as the right way.
>>
>> Fixes: edd0c8f4932d ("mtd: spi-nor: Add support for mr25h40")
> 
> I'm not sure whether this could really be considered as a bug since it is
> already possible to use this memory even with device trees.
> 
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
>>  drivers/mtd/devices/m25p80.c  | 1 +
>>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 9cf7fcd28034..bd0c335692d2 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -304,6 +304,7 @@ static const struct spi_device_id m25p_ids[] = {
>>  	{"m25p05-nonjedec"},	{"m25p10-nonjedec"},	{"m25p20-nonjedec"},
>>  	{"m25p40-nonjedec"},	{"m25p80-nonjedec"},	{"m25p16-nonjedec"},
>>  	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
>> +	{"mr25h40-nonjedec"},
>>  
>>  	{ },
>>  };
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index bbdbbd763c9d..3a8042fe44f0 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -825,7 +825,7 @@ static const struct flash_info spi_nor_ids[] = {
>>  	/* Everspin */
>>  	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>>  	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> -	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> +	{ "mr25h40-nonjedec",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> 
> Removing the old entry might create regressions if people have already
> started to use the "mr25h40" name in their .dtb files or in some platform
> device structures. It is possible even if this entry is quite recent.
> 
>>  
>>  	/* Fujitsu */
>>  	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
>>
> 
> 

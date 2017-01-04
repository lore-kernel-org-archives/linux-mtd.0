Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cOo4s-0004br-H4
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2017 16:06:16 +0000
Received: by mail-lf0-x242.google.com with SMTP id d16so33053943lfb.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jan 2017 08:05:53 -0800 (PST)
Subject: Re: [PATCH v2 1/2] Add flag to disable chip erase
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org
References: <20161230132325.14337-1-mar.krzeminski@gmail.com>
 <20161230132325.14337-2-mar.krzeminski@gmail.com>
 <c30c6017-1770-8617-61c7-496805ef2099@atmel.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <615b9de3-373a-9449-5529-4a73075b0ffc@gmail.com>
Date: Wed, 4 Jan 2017 17:05:50 +0100
MIME-Version: 1.0
In-Reply-To: <c30c6017-1770-8617-61c7-496805ef2099@atmel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



W dniu 04.01.2017 o 13:56, Cyrille Pitchen pisze:
> Hi Marcin,
>
> Globally this patch looks good but for next patches it would be better to
> add the "mtd: spi-nor: " prefix in the subject line. Hence when reading the
> git log output we can immediately identify which sub system is modified by
> some commit.
Sorry, I forgot about this.
>
> For this series, if Marek has no other comment, I can take it and fix the
> subject line. Otherwise, if another version is needed then please fix the
> subject lines :)

I'll wait for Marek comments if any, and send fixed subject line.
>
> Le 30/12/2016 à 14:23, Marcin Krzeminski a écrit :
>> Extend spi-nor framework to allow disable chip erase
>> command also for selected flash chips.
>>
> This describes what the patch does, so that's good. However you could also
> explain why we want/need to disable the chip erase and enforce this is a
> bug fix for some SPI NOR memories. You could also reword the subject line
> with something like "mtd: spi-nor: fix erase ...."
Sure.
>
> Best regards,
>
> Cyrille
>
>> Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
>> ---
>>   drivers/mtd/spi-nor/spi-nor.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 15fb8af..b6656b2 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -81,6 +81,7 @@ struct flash_info {
>>   					 * because it has the same value as
>>   					 * ATMEL flashes)
>>   					*/
>> +#define NO_CHIP_ERASE	BIT(10) /* Chip does not support chip erase */
>>   };
>>   
>>   #define JEDEC_MFR(info)	((info)->id[0])
>> @@ -1545,6 +1546,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>   		nor->flags |= SNOR_F_USE_FSR;
>>   	if (info->flags & SPI_NOR_HAS_TB)
>>   		nor->flags |= SNOR_F_HAS_SR_TB;
>> +	if (info->flags & NO_CHIP_ERASE)
>> +		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>>   
>>   #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>>   	/* prefer "small sector" erase if possible */
>>
>

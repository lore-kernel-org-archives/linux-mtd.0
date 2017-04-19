Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0s2l-0003pm-1G
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 16:01:29 +0000
Received: by mail-it0-x241.google.com with SMTP id e132so3991309ite.2
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 09:01:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a7345f5a-a8c6-b971-b11b-c65433d504fa@gmail.com>
References: <20170419152305.17226-1-andrew.smirnov@gmail.com>
 <20170419152305.17226-5-andrew.smirnov@gmail.com>
 <a7345f5a-a8c6-b971-b11b-c65433d504fa@gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 19 Apr 2017 09:01:00 -0700
Message-ID: <CAHQ1cqF=9dP8H+nkbvAKSrhvrBY+bkeEOiCvND9M3FO=W6hi3w@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] mtd: dataflash: Make use of "extened device
 information"
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 19, 2017 at 8:42 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 04/19/2017 05:23 PM, Andrey Smirnov wrote:
>> In anticipation of supporting chips that need it, extend the size of
>> struct flash_info's 'jedec_id' field to make room 2 byte of extended
>> device information as well as add code to fetch this data during
>> jedec_probe().
>>
>> Cc: cphealy@gmail.com
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
>> Cc: Marek Vasut <marek.vasut@gmail.com>
>> Cc: Richard Weinberger <richard@nod.at>
>> Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>
>> Changes since [v2]:
>>
>>       - Make 'id' have same size as 'jedec'
>>
>>       - Get rid of eid_mask variable in favour of using GENMASK
>>           in-place
>>
>> Changes since [v1]:
>>
>>       - Formatting
>>
>> [v1] http://lkml.kernel.org/r/20170411161722.11164-1-andrew.smirnov@gmail.com
>> [v2] http://lkml.kernel.org/r/20170418142127.23301-3-andrew.smirnov@gmail.com
>>
>>  drivers/mtd/devices/mtd_dataflash.c | 115 +++++++++++++++++++++---------------
>>  1 file changed, 68 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
>> index 2d3e403..941e8b7 100644
>> --- a/drivers/mtd/devices/mtd_dataflash.c
>> +++ b/drivers/mtd/devices/mtd_dataflash.c
>> @@ -687,7 +687,7 @@ struct flash_info {
>>       /* JEDEC id has a high byte of zero plus three data bytes:
>>        * the manufacturer id, then a two byte device id.
>>        */
>> -     u32             jedec_id;
>> +     u64             jedec_id;
>>
>>       /* The size listed here is what works with OP_ERASE_PAGE. */
>>       unsigned        nr_pages;
>> @@ -710,62 +710,34 @@ static struct flash_info dataflash_data[] = {
>>        * These newer chips also support 128-byte security registers (with
>>        * 64 bytes one-time-programmable) and software write-protection.
>>        */
>> -     { "AT45DB011B",  0x1f2200, 512, 264, 9, SUP_POW2PS},
>> -     { "at45db011d",  0x1f2200, 512, 256, 8, SUP_POW2PS | IS_POW2PS},
>> +     { "AT45DB011B",  0x1f22000000, 512, 264, 9, SUP_POW2PS},
>> +     { "at45db011d",  0x1f22000000, 512, 256, 8, SUP_POW2PS | IS_POW2PS},
>>
>> -     { "AT45DB021B",  0x1f2300, 1024, 264, 9, SUP_POW2PS},
>> -     { "at45db021d",  0x1f2300, 1024, 256, 8, SUP_POW2PS | IS_POW2PS},
>> +     { "AT45DB021B",  0x1f23000000, 1024, 264, 9, SUP_POW2PS},
>> +     { "at45db021d",  0x1f23000000, 1024, 256, 8, SUP_POW2PS | IS_POW2PS},
>>
>> -     { "AT45DB041x",  0x1f2400, 2048, 264, 9, SUP_POW2PS},
>> -     { "at45db041d",  0x1f2400, 2048, 256, 8, SUP_POW2PS | IS_POW2PS},
>> +     { "AT45DB041x",  0x1f24000000, 2048, 264, 9, SUP_POW2PS},
>> +     { "at45db041d",  0x1f24000000, 2048, 256, 8, SUP_POW2PS | IS_POW2PS},
>>
>> -     { "AT45DB081B",  0x1f2500, 4096, 264, 9, SUP_POW2PS},
>> -     { "at45db081d",  0x1f2500, 4096, 256, 8, SUP_POW2PS | IS_POW2PS},
>> +     { "AT45DB081B",  0x1f25000000, 4096, 264, 9, SUP_POW2PS},
>> +     { "at45db081d",  0x1f25000000, 4096, 256, 8, SUP_POW2PS | IS_POW2PS},
>>
>> -     { "AT45DB161x",  0x1f2600, 4096, 528, 10, SUP_POW2PS},
>> -     { "at45db161d",  0x1f2600, 4096, 512, 9, SUP_POW2PS | IS_POW2PS},
>> +     { "AT45DB161x",  0x1f26000000, 4096, 528, 10, SUP_POW2PS},
>> +     { "at45db161d",  0x1f26000000, 4096, 512, 9, SUP_POW2PS | IS_POW2PS},
>>
>> -     { "AT45DB321x",  0x1f2700, 8192, 528, 10, 0},           /* rev C */
>> +     { "AT45DB321x",  0x1f27000000, 8192, 528, 10, 0},       /* rev C */
>>
>> -     { "AT45DB321x",  0x1f2701, 8192, 528, 10, SUP_POW2PS},
>> -     { "at45db321d",  0x1f2701, 8192, 512, 9, SUP_POW2PS | IS_POW2PS},
>> +     { "AT45DB321x",  0x1f27010000, 8192, 528, 10, SUP_POW2PS},
>> +     { "at45db321d",  0x1f27010000, 8192, 512, 9, SUP_POW2PS | IS_POW2PS},
>>
>> -     { "AT45DB642x",  0x1f2800, 8192, 1056, 11, SUP_POW2PS},
>> -     { "at45db642d",  0x1f2800, 8192, 1024, 10, SUP_POW2PS | IS_POW2PS},
>> +     { "AT45DB642x",  0x1f28000000, 8192, 1056, 11, SUP_POW2PS},
>> +     { "at45db642d",  0x1f28000000, 8192, 1024, 10, SUP_POW2PS | IS_POW2PS},
>>  };
>>
>> -static struct flash_info *jedec_probe(struct spi_device *spi)
>> +static struct flash_info *jedec_lookup(struct spi_device *spi, u64 jedec)
>>  {
>> -     int ret;
>> -     u8 code = OP_READ_ID;
>> -     u8 id[3];
>> -     u32 jedec;
>> -     struct flash_info *info;
>>       int status;
>> -
>> -     /*
>> -      * JEDEC also defines an optional "extended device information"
>> -      * string for after vendor-specific data, after the three bytes
>> -      * we use here.  Supporting some chips might require using it.
>> -      *
>> -      * If the vendor ID isn't Atmel's (0x1f), assume this call failed.
>> -      * That's not an error; only rev C and newer chips handle it, and
>> -      * only Atmel sells these chips.
>> -      */
>> -     ret = spi_write_then_read(spi, &code, 1, id, 3);
>> -     if (ret < 0) {
>> -             dev_dbg(&spi->dev, "error %d reading JEDEC ID\n", ret);
>> -             return ERR_PTR(ret);
>> -     }
>> -
>> -     if (id[0] != CFI_MFR_ATMEL)
>> -             return NULL;
>> -
>> -     jedec = id[0];
>> -     jedec = jedec << 8;
>> -     jedec |= id[1];
>> -     jedec = jedec << 8;
>> -     jedec |= id[2];
>> +     struct flash_info *info;
>>
>>       for (info = dataflash_data;
>>            info < dataflash_data + ARRAY_SIZE(dataflash_data);
>> @@ -793,12 +765,61 @@ static struct flash_info *jedec_probe(struct spi_device *spi)
>>               }
>>       }
>>
>> +     return NULL;
>> +}
>> +
>> +static struct flash_info *jedec_probe(struct spi_device *spi)
>> +{
>> +     int ret;
>> +     u8 code = OP_READ_ID;
>> +     u64 jedec;
>> +     u8 id[sizeof(jedec)] = {0};
>> +     const unsigned int id_size = 5;
>> +     const unsigned int first_byte = sizeof(id) - id_size;
>> +     struct flash_info *info;
>> +
>> +     /*
>> +      * JEDEC also defines an optional "extended device information"
>> +      * string for after vendor-specific data, after the three bytes
>> +      * we use here.  Supporting some chips might require using it.
>> +      *
>> +      * If the vendor ID isn't Atmel's (0x1f), assume this call failed.
>> +      * That's not an error; only rev C and newer chips handle it, and
>> +      * only Atmel sells these chips.
>> +      */
>> +     ret = spi_write_then_read(spi, &code, 1, &id[first_byte], id_size);
>
> Hm, looking at this again, what prevents you from reading these bytes
> into &id[0] ? Might be easier, ie.
>
> ret = spi_write_then_read(spi, &code, 1, id, id_size);
>

Then I'd have to add 6 more '0's to each of the IDs in dataflash_data,
which would make that code even less readable.

>> +     if (ret < 0) {
>> +             pr_debug("%s: error %d reading JEDEC ID\n",
>> +                     dev_name(&spi->dev), ret);
>> +             return ERR_PTR(ret);
>> +     }
>> +
>> +     if (id[first_byte] != CFI_MFR_ATMEL)
>
> if (id[0] != CFI_MFR_ATMEL)
>
>> +             return NULL;
>> +
>> +     jedec = be64_to_cpup((__be64 *)id);
>> +
>> +     info = jedec_lookup(spi, jedec);
>
> ... define these somewhere at the beginning of the dataflash code ...
> #define DATAFLASH_MASK_STD      GENMASK(63, 40)
> #define DATAFLASH_MASK_EXT      GENMASK(63, 16)
>
> ... then ...
> info = jedec_lookup(spi, jedec & DATAFLASH_MASK_EXT);
>
>> +     if (info)
>> +             return info;
>> +
>> +     /*
>> +      * Clear extended id bits (bits 0 through 15) and try to find
>> +      * a match again in case our chip does not support returning
>> +      * extended ID information and we got invalid bits instead
>> +      */
>> +     jedec &= GENMASK_ULL(63, 16);
>
> info = jedec_lookup(spi, jedec & DATAFLASH_MASK_STD);
>

Sure, OK.

Thanks,
Andrey Smirnov

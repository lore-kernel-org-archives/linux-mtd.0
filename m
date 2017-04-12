Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cyJjp-0005sj-EF
 for linux-mtd@lists.infradead.org; Wed, 12 Apr 2017 14:59:20 +0000
Received: by mail-pg0-x242.google.com with SMTP id g2so5830965pge.2
 for <linux-mtd@lists.infradead.org>; Wed, 12 Apr 2017 07:58:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7a1ea2db-eda8-ceec-3ad2-45146bb43a53@gmail.com>
References: <20170411161722.11164-1-andrew.smirnov@gmail.com>
 <7a1ea2db-eda8-ceec-3ad2-45146bb43a53@gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 12 Apr 2017 07:58:56 -0700
Message-ID: <CAHQ1cqGD70eDGsKTU3ZSZtqm6-1VDkro+kFRgkHGszejTucDBg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: dataflash: Make use of "extened device
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

On Tue, Apr 11, 2017 at 11:29 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 04/11/2017 06:17 PM, Andrey Smirnov wrote:
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
>>  drivers/mtd/devices/mtd_dataflash.c | 113 +++++++++++++++++++++---------------
>>  1 file changed, 66 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
>> index f9e9bd1..9a98cdc 100644
>> --- a/drivers/mtd/devices/mtd_dataflash.c
>> +++ b/drivers/mtd/devices/mtd_dataflash.c
>> @@ -689,7 +689,7 @@ struct flash_info {
>>       /* JEDEC id has a high byte of zero plus three data bytes:
>>        * the manufacturer id, then a two byte device id.
>>        */
>> -     uint32_t        jedec_id;
>> +     uint64_t        jedec_id;
>>
>>       /* The size listed here is what works with OP_ERASE_PAGE. */
>>       unsigned        nr_pages;
>> @@ -712,61 +712,35 @@ static struct flash_info dataflash_data[] = {
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
>> +static struct flash_info *jedec_lookup(struct spi_device *spi,
>> +                                    uint64_t jedec)
>
> const u64 (not uint64_t , this is NOT userspace). Fix globally.
>

I am not sure what this has to do with userspace. There's plenty of
kernel code that uses standard C99 types, coding style guide calls
them out as being OK

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=refs/tags/v4.11-rc6#n364

but more to the point, the rest of this file uses nothing but C99
types. Why should this function be any different?


>>  {
>> -     int                     tmp;
>> -     uint8_t                 code = OP_READ_ID;
>> -     uint8_t                 id[3];
>> -     uint32_t                jedec;
>> -     struct flash_info       *info;
>> -     int status;
>> -
>> -     /* JEDEC also defines an optional "extended device information"
>> -      * string for after vendor-specific data, after the three bytes
>> -      * we use here.  Supporting some chips might require using it.
>> -      *
>> -      * If the vendor ID isn't Atmel's (0x1f), assume this call failed.
>> -      * That's not an error; only rev C and newer chips handle it, and
>> -      * only Atmel sells these chips.
>> -      */
>> -     tmp = spi_write_then_read(spi, &code, 1, id, 3);
>> -     if (tmp < 0) {
>> -             pr_debug("%s: error %d reading JEDEC ID\n",
>> -                     dev_name(&spi->dev), tmp);
>> -             return ERR_PTR(tmp);
>> -     }
>> -     if (id[0] != 0x1f)
>> -             return NULL;
>> -
>> -     jedec = id[0];
>> -     jedec = jedec << 8;
>> -     jedec |= id[1];
>> -     jedec = jedec << 8;
>> -     jedec |= id[2];
>> +     int tmp, status;
>> +     struct flash_info *info;
>>
>>       for (tmp = 0, info = dataflash_data;
>>                       tmp < ARRAY_SIZE(dataflash_data);
>> @@ -796,12 +770,57 @@ static struct flash_info *jedec_probe(struct spi_device *spi)
>>               }
>>       }
>>
>> +     return NULL;
>> +}
>> +
>> +static struct flash_info *jedec_probe(struct spi_device *spi)
>> +{
>> +     int                     tmp;
>> +     uint8_t                 code = OP_READ_ID;
>> +     uint8_t                 id[8] = {0};
>> +     const unsigned int      id_size = 5;
>> +     const unsigned int      first_byte = sizeof(id) - id_size;
>> +     const uint64_t          eid_mask = GENMASK_ULL(63, 16);
>
> Can we have some macro, like DATAFLASH_ID_BYTES and derive all the masks
> and crap from it instead of having this stack of variables ?
>

Can you give me an example of what you have in mind? A macro that
would simplify this code is not very obvious to me.

>> +     uint64_t                jedec;
>> +     struct flash_info       *info;
>
> Replace the tab after the type with space please.

Why? This code was originally using tabs, the only thing I changed was
type of 'jedec' variable from uint32_t to uint64_t.

>
>> +     /* JEDEC also defines an optional "extended device information"
>
> Multi-line comment format:
>
> /*
>  * foo
>  * bar
>  */
>

This is how the code was before my patch. I just moved this block
without changing it, so I'd prefer to not make that fact less clear by
doing re-formatting.

>> +      * string for after vendor-specific data, after the three bytes
>> +      * we use here.  Supporting some chips might require using it.
>> +      *
>> +      * If the vendor ID isn't Atmel's (0x1f), assume this call failed.
>> +      * That's not an error; only rev C and newer chips handle it, and
>> +      * only Atmel sells these chips.
>> +      */
>> +     tmp = spi_write_then_read(spi, &code, 1, &id[first_byte], id_size);
>> +     if (tmp < 0) {
>
> Use ret instead of tmp.

Ditto.

>
>> +             pr_debug("%s: error %d reading JEDEC ID\n",
>> +                     dev_name(&spi->dev), tmp);
>> +             return ERR_PTR(tmp);
>> +     }
>
> newline

Ditto.

>
>> +     if (id[first_byte] != 0x1f)
>
> Use a macro, like CFI_MFR_ATMEL ?
>

Ditto.

>> +             return NULL;
>> +
>> +     jedec = be64_to_cpup((__be64 *)id);
>> +
>> +     info = jedec_lookup(spi, jedec);
>> +     if (info)
>> +             return info;
>> +     /*
>> +      * Clear extended id bits and try to find a match again
>> +      */
>
> This could be a single-line comment.

OK, I'll change that.

Thanks,
Andrey Smirnov

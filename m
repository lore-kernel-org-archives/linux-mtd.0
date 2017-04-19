Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0lHI-0006CK-FA
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 08:47:58 +0000
Received: by mail-wm0-x244.google.com with SMTP id q125so3661524wmd.3
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 01:47:36 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] mtd: dataflash: Make use of "extened device
 information"
To: Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20170418142127.23301-1-andrew.smirnov@gmail.com>
 <20170418142127.23301-3-andrew.smirnov@gmail.com>
 <47e7cefa-b4b8-4557-0e95-f43c7431c4de@gmail.com>
 <CAHQ1cqETHoXeuiz7BUmMjoy9U4Koy65V=guppCt7bensKSPk8w@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1ce8f0b6-d225-3c60-433f-7e67cc7ab0ec@gmail.com>
Date: Wed, 19 Apr 2017 10:47:31 +0200
MIME-Version: 1.0
In-Reply-To: <CAHQ1cqETHoXeuiz7BUmMjoy9U4Koy65V=guppCt7bensKSPk8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/19/2017 04:58 AM, Andrey Smirnov wrote:
> On Tue, Apr 18, 2017 at 11:31 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 04/18/2017 04:21 PM, Andrey Smirnov wrote:
>>> In anticipation of supporting chips that need it, extend the size of
>>> struct flash_info's 'jedec_id' field to make room 2 byte of extended
>>> device information as well as add code to fetch this data during
>>> jedec_probe().
>>>
>>> Cc: cphealy@gmail.com
>>> Cc: David Woodhouse <dwmw2@infradead.org>
>>> Cc: Brian Norris <computersforpeace@gmail.com>
>>> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
>>> Cc: Marek Vasut <marek.vasut@gmail.com>
>>> Cc: Richard Weinberger <richard@nod.at>
>>> Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>>> Cc: linux-kernel@vger.kernel.org
>>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>>> ---
>>>
>>> Changes since [v1]:
>>>
>>>       - Formatting
>>>
>>> [v1] http://lkml.kernel.org/r/20170411161722.11164-1-andrew.smirnov@gmail.com
>>>
>>>
>>>  drivers/mtd/devices/mtd_dataflash.c | 113 +++++++++++++++++++++---------------
>>>  1 file changed, 65 insertions(+), 48 deletions(-)
>>>
>>> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
>>> index 5b7a8c3..5d694a4 100644
>>> --- a/drivers/mtd/devices/mtd_dataflash.c
>>> +++ b/drivers/mtd/devices/mtd_dataflash.c
>>> @@ -690,7 +690,7 @@ struct flash_info {
>>>       /* JEDEC id has a high byte of zero plus three data bytes:
>>>        * the manufacturer id, then a two byte device id.
>>>        */
>>> -     u32             jedec_id;
>>> +     u64             jedec_id;
>>>
>>>       /* The size listed here is what works with OP_ERASE_PAGE. */
>>>       unsigned        nr_pages;
>>> @@ -713,63 +713,34 @@ static struct flash_info dataflash_data[] = {
>>>        * These newer chips also support 128-byte security registers (with
>>>        * 64 bytes one-time-programmable) and software write-protection.
>>>        */
>>> -     { "AT45DB011B",  0x1f2200, 512, 264, 9, SUP_POW2PS},
>>> -     { "at45db011d",  0x1f2200, 512, 256, 8, SUP_POW2PS | IS_POW2PS},
>>> +     { "AT45DB011B",  0x1f22000000, 512, 264, 9, SUP_POW2PS},
>>> +     { "at45db011d",  0x1f22000000, 512, 256, 8, SUP_POW2PS | IS_POW2PS},
>>>
>>> -     { "AT45DB021B",  0x1f2300, 1024, 264, 9, SUP_POW2PS},
>>> -     { "at45db021d",  0x1f2300, 1024, 256, 8, SUP_POW2PS | IS_POW2PS},
>>> +     { "AT45DB021B",  0x1f23000000, 1024, 264, 9, SUP_POW2PS},
>>> +     { "at45db021d",  0x1f23000000, 1024, 256, 8, SUP_POW2PS | IS_POW2PS},
>>>
>>> -     { "AT45DB041x",  0x1f2400, 2048, 264, 9, SUP_POW2PS},
>>> -     { "at45db041d",  0x1f2400, 2048, 256, 8, SUP_POW2PS | IS_POW2PS},
>>> +     { "AT45DB041x",  0x1f24000000, 2048, 264, 9, SUP_POW2PS},
>>> +     { "at45db041d",  0x1f24000000, 2048, 256, 8, SUP_POW2PS | IS_POW2PS},
>>>
>>> -     { "AT45DB081B",  0x1f2500, 4096, 264, 9, SUP_POW2PS},
>>> -     { "at45db081d",  0x1f2500, 4096, 256, 8, SUP_POW2PS | IS_POW2PS},
>>> +     { "AT45DB081B",  0x1f25000000, 4096, 264, 9, SUP_POW2PS},
>>> +     { "at45db081d",  0x1f25000000, 4096, 256, 8, SUP_POW2PS | IS_POW2PS},
>>>
>>> -     { "AT45DB161x",  0x1f2600, 4096, 528, 10, SUP_POW2PS},
>>> -     { "at45db161d",  0x1f2600, 4096, 512, 9, SUP_POW2PS | IS_POW2PS},
>>> +     { "AT45DB161x",  0x1f26000000, 4096, 528, 10, SUP_POW2PS},
>>> +     { "at45db161d",  0x1f26000000, 4096, 512, 9, SUP_POW2PS | IS_POW2PS},
>>>
>>> -     { "AT45DB321x",  0x1f2700, 8192, 528, 10, 0},           /* rev C */
>>> +     { "AT45DB321x",  0x1f27000000, 8192, 528, 10, 0},       /* rev C */
>>>
>>> -     { "AT45DB321x",  0x1f2701, 8192, 528, 10, SUP_POW2PS},
>>> -     { "at45db321d",  0x1f2701, 8192, 512, 9, SUP_POW2PS | IS_POW2PS},
>>> +     { "AT45DB321x",  0x1f27010000, 8192, 528, 10, SUP_POW2PS},
>>> +     { "at45db321d",  0x1f27010000, 8192, 512, 9, SUP_POW2PS | IS_POW2PS},
>>>
>>> -     { "AT45DB642x",  0x1f2800, 8192, 1056, 11, SUP_POW2PS},
>>> -     { "at45db642d",  0x1f2800, 8192, 1024, 10, SUP_POW2PS | IS_POW2PS},
>>> +     { "AT45DB642x",  0x1f28000000, 8192, 1056, 11, SUP_POW2PS},
>>> +     { "at45db642d",  0x1f28000000, 8192, 1024, 10, SUP_POW2PS | IS_POW2PS},
>>>  };
>>>
>>> -static struct flash_info *jedec_probe(struct spi_device *spi)
>>> +static struct flash_info *jedec_lookup(struct spi_device *spi, u64 jedec)
>>>  {
>>> -     int ret, i;
>>> -     u8 code = OP_READ_ID;
>>> -     u8 id[3];
>>> -     u32 jedec;
>>> +     int status, i;
>>>       struct flash_info *info;
>>> -     int status;
>>> -
>>> -     /*
>>> -      * JEDEC also defines an optional "extended device information"
>>> -      * string for after vendor-specific data, after the three bytes
>>> -      * we use here.  Supporting some chips might require using it.
>>> -      *
>>> -      * If the vendor ID isn't Atmel's (0x1f), assume this call failed.
>>> -      * That's not an error; only rev C and newer chips handle it, and
>>> -      * only Atmel sells these chips.
>>> -      */
>>> -     ret = spi_write_then_read(spi, &code, 1, id, 3);
>>> -     if (ret < 0) {
>>> -             pr_debug("%s: error %d reading JEDEC ID\n",
>>> -                     dev_name(&spi->dev), ret);
>>> -             return ERR_PTR(ret);
>>> -     }
>>> -
>>> -     if (id[0] != CFI_MFR_ATMEL)
>>> -             return NULL;
>>> -
>>> -     jedec = id[0];
>>> -     jedec = jedec << 8;
>>> -     jedec |= id[1];
>>> -     jedec = jedec << 8;
>>> -     jedec |= id[2];
>>
>> Hm, the diff again screwed this up, oh well ...
>>
>>>       for (i = 0, info = dataflash_data;
>>>                       i < ARRAY_SIZE(dataflash_data);
>>> @@ -799,12 +770,58 @@ static struct flash_info *jedec_probe(struct spi_device *spi)
>>>               }
>>>       }
>>>
>>> +     return NULL;
>>> +}
>>> +
>>> +static struct flash_info *jedec_probe(struct spi_device *spi)
>>> +{
>>> +     int ret;
>>> +     u8 code = OP_READ_ID;
>>> +     u8 id[8] = {0};
>>> +     const unsigned int id_size = 5;
>>> +     const unsigned int first_byte = sizeof(id) - id_size;
>>> +     const u64 eid_mask = GENMASK_ULL(63, 16);
>>> +     u64 jedec;
>>> +     struct flash_info *info;
>>> +
>>> +     /*
>>> +      * JEDEC also defines an optional "extended device information"
>>> +      * string for after vendor-specific data, after the three bytes
>>> +      * we use here.  Supporting some chips might require using it.
>>> +      *
>>> +      * If the vendor ID isn't Atmel's (0x1f), assume this call failed.
>>> +      * That's not an error; only rev C and newer chips handle it, and
>>> +      * only Atmel sells these chips.
>>> +      */
>>> +     ret = spi_write_then_read(spi, &code, 1, &id[first_byte], id_size);
>>> +     if (ret < 0) {
>>> +             pr_debug("%s: error %d reading JEDEC ID\n",
>>> +                     dev_name(&spi->dev), ret);
>>
>> I think you can turn this into:
>>
>> dev_err(&spi->dev, "error %d reading JEDEC ID\n", ret);
> 
> OK, will do it in a separate patch, since this is original code.

OK

>>> +             return ERR_PTR(ret);
>>> +     }
>>> +
>>> +     if (id[first_byte] != CFI_MFR_ATMEL)
>>> +             return NULL;
>>> +
>>> +     jedec = be64_to_cpup((__be64 *)id);
>>> +
>>> +     info = jedec_lookup(spi, jedec);
>>> +     if (info)
>>> +             return info;
>>> +
>>> +     /* Clear extended id bits and try to find a match again */
>>> +     jedec &= eid_mask;
>>
>> Wouldn't that be jedec &= ~eid_mask; (with a tilde) if you want to clear
>> them ?
> 
> eid_mask is generated as bits 63 to 16 with GENMASK_ULL, so bits 15 to
> 0 should already be zeroed out. I can rename it to eid_mask_inverted
> so it's less confusing.

I think that's a good idea and you can make the mask u32 instead of u64.
But isn't eid_mask_inverted the same as id_mask ?

-- 
Best regards,
Marek Vasut

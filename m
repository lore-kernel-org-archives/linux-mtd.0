Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmpav-0007yC-9d
 for linux-mtd@lists.infradead.org; Tue, 07 Aug 2018 00:11:26 +0000
Received: by mail-pg1-x542.google.com with SMTP id k3-v6so6935583pgq.5
 for <linux-mtd@lists.infradead.org>; Mon, 06 Aug 2018 17:11:14 -0700 (PDT)
Date: Mon, 06 Aug 2018 17:11:12 -0700 (PDT)
Subject: Re: [PATCH] spi-nor: add support for is25wp256d
In-Reply-To: <e951a9b0-b365-5818-f66f-b48492d93eb2@gmail.com>
CC: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at, linux-kernel@vger.kernel.org,
 Wesley Terpstra <wesley@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: marek.vasut@gmail.com
Message-ID: <mhng-e542ffb6-757f-49a3-9fdd-6d1c1400dc52@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 06 Aug 2018 14:05:11 PDT (-0700), marek.vasut@gmail.com wrote:
> On 08/06/2018 10:58 PM, Palmer Dabbelt wrote:
>> On Sat, 04 Aug 2018 02:27:54 PDT (-0700), marek.vasut@gmail.com wrote:
>>> On 08/04/2018 03:49 AM, Palmer Dabbelt wrote:
>>>> From: "Wesley W. Terpstra" <wesley@sifive.com>
>>>>
>>>> This is used of the HiFive Unleashed development board.
>>>>
>>>> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
>>>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/spi-nor.c | 47
>>>> ++++++++++++++++++++++++++++++++++++++++++-
>>>>  include/linux/mtd/spi-nor.h   |  2 ++
>>>>  2 files changed, 48 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c
>>>> b/drivers/mtd/spi-nor/spi-nor.c
>>>> index d9c368c44194..e9a3557a3c23 100644
>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>> @@ -1072,6 +1072,9 @@ static const struct flash_info spi_nor_ids[] = {
>>>>              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>>>      { "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
>>>>              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>>> +    { "is25wp256d", INFO(0x9d7019, 0, 32 * 1024, 1024,
>>>
>>> Is there a reason for the trailing 'd' in is25wp256d ? I'd drop it.
>>
>> I'm honestly not sure.  There are data sheets for both of them, but I
>> don't see much of a difference
>>
>>    http://www.issi.com/WW/pdf/IS25LP(WP)256D.pdf
>>    http://www.issi.com/WW/pdf/25LP-WP256.pdf
>>
>> Following the pattern, I'd expect to see
>>
>>        { "is25wp256",  INFO(0x9d7019, 0, 64 * 1024, 512,
>>                        SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>
>> versus
>>
>>        { "is25wp256d", INFO(0x9d7019, 0, 32 * 1024, 1024,
>>                        SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> SPI_NOR_4B_OPCODES)
>>        },
>
> They have the same ID ? Do we support the variant without the d already?

Sorry for being a bit vague there.  There is no is25wp256 in the list already, 
but if I follow the pattern from the other similar chips I get a different 
value for is25wp256 than what was proposed in the patch for an is25wp256d.  
>From my understanding the different values are just because we picked a 
different block size, which seems possible because the original version of this 
patch was written before the other is25wp devices were added to the list.

What I'm proposing is adding an is25wp256 with the same block size as the other 
similar entries in the list.  Looking at the data sheets they appear to have 
the same values for the "Read Product Identification" instruction.

The data sheets are shared with the is25lp256, which there is an entry for and 
matches my expected ID and block sizes.

>> So in other words: the d less sections that are larger, and also has the
>> 4B opcodes flag set.  From the documentation in looks like the non-d
>> version supports 3 and 4 byte opcodes, so I guess it's just a different
>> physical layout?
>>
>> In the data sheet for both I see
>>
>>    "Pages can be erased in groups of 4Kbyte sectors, 32Kbyte blocks,
>> 64Kbyte    blocks, and/or the entire chip"
>>
>> which indicates to me that maybe we've just selected the larger section
>> size?  If so then I'll change it to the first one in the new patch.
>>
>>>> +                    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ
>>>> | SPI_NOR_4B_OPCODES)
>>>> +    },
>>>>
>>>>      /* Macronix */
>>>>      { "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
>>>> @@ -1515,6 +1518,45 @@ static int macronix_quad_enable(struct spi_nor
>>>> *nor)
>>>>      return 0;
>>>>  }
>>>>
>>>> +/**
>>>> + * issi_unlock() - clear BP[0123] write-protection.
>>>> + * @nor:    pointer to a 'struct spi_nor'
>>>> + *
>>>> + * Bits [2345] of the Status Register are BP[0123].
>>>> + * ISSI chips use a different block protection scheme than other chips.
>>>> + * Just disable the write-protect unilaterally.
>>>> + *
>>>> + * Return: 0 on success, -errno otherwise.
>>>> + */
>>>> +static int issi_unlock(struct spi_nor *nor)
>>>> +{
>>>> +    int ret, val;
>>>> +    u8 mask = SR_BP0 | SR_BP1 | SR_BP2 | SR_BP3;
>>>> +
>>>> +    val = read_sr(nor);
>>>> +    if (val < 0)
>>>> +        return val;
>>>> +    if (!(val & mask))
>>>> +        return 0;
>>>> +
>>>> +    write_enable(nor);
>>>> +
>>>> +    write_sr(nor, val & ~mask);
>>>> +
>>>> +    ret = spi_nor_wait_till_ready(nor);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    ret = read_sr(nor);
>>>> +    if (ret > 0 && !(ret & mask)) {
>>>> +        dev_info(nor->dev, "ISSI Block Protection Bits cleared\n");
>>>> +        return 0;
>>>
>>> Is the dev_info() really needed ?
>>
>> Nope.  I'll spin a v2 pending the above discussion.
>>
>>>> +    } else {
>>>> +        dev_err(nor->dev, "ISSI Block Protection Bits not cleared\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +}
>>>
>>> [...]
>>
>> Thanks!

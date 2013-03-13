Received: from mail-ia0-x233.google.com ([2607:f8b0:4001:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFlLv-00066G-Sz
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 13:04:20 +0000
Received: by mail-ia0-f179.google.com with SMTP id x24so943503iak.10
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2013 06:04:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1363172096.11441.11.camel@sauron.fi.intel.com>
References: <1362653364-29993-1-git-send-email-b32955@freescale.com>
 <1362653364-29993-2-git-send-email-b32955@freescale.com>
 <1363172096.11441.11.camel@sauron.fi.intel.com>
Date: Wed, 13 Mar 2013 21:04:16 +0800
Message-ID: <CAMiH66HyH7tQG96UMKed6prpqBa=sgyntdO1pf0yG+=qyigY0Q@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] mtd: add new fields to nand_flash_dev{}
From: Huang Shijie <shijie8@gmail.com>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 13, 2013 at 6:54 PM, Artem Bityutskiy
<artem.bityutskiy@linux.intel.com> wrote:
> On Thu, 2013-03-07 at 18:49 +0800, Huang Shijie wrote:
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index 591eeeb..f0a9d93 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -578,6 +578,8 @@ struct nand_chip {
>>   * @erasesize: eraseblock size in bytes (determined from the extended ID if 0)
>>   * @chipsize: total chip size in MiB
>>   * @options: stores various chip bit options
>> + * @id_len: The valid length of the @id.
>> + * @oobsize: OOB size
>>   */
>>  struct nand_flash_dev {
>>       char *name;
>> @@ -592,6 +594,8 @@ struct nand_flash_dev {
>>       unsigned long chipsize;
>>       unsigned long erasesize;
>>       unsigned long options;
>> +     unsigned long id_len;
>> +     unsigned long oobsize;
>>  };
>
> Why are these of type 'long', which is 64 bits in 64-bit architectures,
> which seems to be unnecessarily big. Wouldn't 'unsigned int' be enough?
>
Frankly speaking, "uint16_t" is enough.
"unsigned int" is too long for both the fields.

> Also, can we avoid having the 'id_len' field? Can the end of the

For these 4 toshiba nand, we do not need the id_len field.

> sequence of ID's be marked with a '0' or '0xFF' marker instead?

Are you sure that 0 or 0xff are not the valid data during the 8byte id data?
I am not sure.

Maybe in future, we may meet a nand which use the 0xff as a valid id-data.

But we can remove this id_len field now. It's ok to me.

thanks
Huang Shijie

>
> --
> Best Regards,
> Artem Bityutskiy
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

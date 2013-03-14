Received: from mail-ve0-f172.google.com ([209.85.128.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG0k0-0006jP-4G
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 05:30:13 +0000
Received: by mail-ve0-f172.google.com with SMTP id cz11so1408214veb.31
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2013 22:30:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMiH66HyH7tQG96UMKed6prpqBa=sgyntdO1pf0yG+=qyigY0Q@mail.gmail.com>
References: <1362653364-29993-1-git-send-email-b32955@freescale.com>
 <1362653364-29993-2-git-send-email-b32955@freescale.com>
 <1363172096.11441.11.camel@sauron.fi.intel.com>
 <CAMiH66HyH7tQG96UMKed6prpqBa=sgyntdO1pf0yG+=qyigY0Q@mail.gmail.com>
Date: Wed, 13 Mar 2013 22:30:11 -0700
Message-ID: <CAN8TOE_fYQmcFQin8ni8nYqBQRNM=ix4n=YNQg9qhXBaviSiAg@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] mtd: add new fields to nand_flash_dev{}
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: artem.bityutskiy@linux.intel.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 13, 2013 at 6:04 AM, Huang Shijie <shijie8@gmail.com> wrote:
> On Wed, Mar 13, 2013 at 6:54 PM, Artem Bityutskiy
> <artem.bityutskiy@linux.intel.com> wrote:
>> On Thu, 2013-03-07 at 18:49 +0800, Huang Shijie wrote:
>>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>>> index 591eeeb..f0a9d93 100644
>>> --- a/include/linux/mtd/nand.h
>>> +++ b/include/linux/mtd/nand.h
>>> @@ -578,6 +578,8 @@ struct nand_chip {
>>>   * @erasesize: eraseblock size in bytes (determined from the extended ID if 0)
>>>   * @chipsize: total chip size in MiB
>>>   * @options: stores various chip bit options
>>> + * @id_len: The valid length of the @id.
>>> + * @oobsize: OOB size
>>>   */
>>>  struct nand_flash_dev {
>>>       char *name;
>>> @@ -592,6 +594,8 @@ struct nand_flash_dev {
>>>       unsigned long chipsize;
>>>       unsigned long erasesize;
>>>       unsigned long options;
>>> +     unsigned long id_len;
>>> +     unsigned long oobsize;
>>>  };
>>
>> Why are these of type 'long', which is 64 bits in 64-bit architectures,
>> which seems to be unnecessarily big. Wouldn't 'unsigned int' be enough?
>>
> Frankly speaking, "uint16_t" is enough.
> "unsigned int" is too long for both the fields.
>
>> Also, can we avoid having the 'id_len' field? Can the end of the
>
> For these 4 toshiba nand, we do not need the id_len field.
>
>> sequence of ID's be marked with a '0' or '0xFF' marker instead?
>
> Are you sure that 0 or 0xff are not the valid data during the 8byte id data?
> I am not sure.

I am sure that 0x00 is valid data. But I do not see any with 0xFF. Check:

http://www.linux-mtd.infradead.org/nand-data/nanddata.html

Anyway, this sort of magic ID byte is no good, IMO.

> Maybe in future, we may meet a nand which use the 0xff as a valid id-data.
>
> But we can remove this id_len field now. It's ok to me.

As I noted elsewhere, I would prefer an id_len field. But I can also
add one if/when it comes up, if we really must.

BTW, I was just thinking; if you really want to save data space, we
should have just made two totally separate tables: one with full IDs
and one dev-id patterns. The first table should (hopefully) have fewer
entries but can have a few extra columns, for a good purpose.

But I'm not sure that space is worth it. We waste more (?) space with
our static nand_ecclayout structs which aren't even going to be used
by many drivers. Even those that are "used" aren't very useful, as no
one really uses OOB for FS data much. (And to go off on more
tangents...those structs could by shrunk easily with a few 'uint16_t',
as they are no longer directly exported as the user ABI.)

Brian

Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4KSz-0007S5-Q3
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2013 00:40:38 +0000
Received: by mail-pa0-f41.google.com with SMTP id bj1so196659pad.14
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 17:40:15 -0700 (PDT)
Message-ID: <51F85CED.3060807@gmail.com>
Date: Tue, 30 Jul 2013 17:40:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/4] mtd: nand: add accessors, macros for in-memory BBT
References: <1374647279-14083-1-git-send-email-computersforpeace@gmail.com>
 <1374647279-14083-2-git-send-email-computersforpeace@gmail.com>
 <20130730220254.GB2404@localhost>
In-Reply-To: <20130730220254.GB2404@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On 07/30/2013 03:02 PM, Ezequiel Garcia wrote:
> Hi Brian,
>
> Here's my attempt at reviewing this patchset, given the recent
> discussion about needing more MTD reviewing.
>
> I don't have enough experience with the NAND core to say anything about this,
> but I noticed you're doing a bunch of related but not necessarily tied changes.
>
> IMHO, splitting this patch further might make reviewing a lot easier, see below.

At first I disagreed, but after re-reading my work, I agree in part. The 
original code was quite ugly, but that doesn't excuse me for not making 
a little effort to make it easier to review.

> On Tue, Jul 23, 2013 at 11:27:56PM -0700, Brian Norris wrote:
>> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
>> index 2672643..3f18776 100644
>> --- a/drivers/mtd/nand/nand_bbt.c
>> +++ b/drivers/mtd/nand/nand_bbt.c
>> @@ -71,6 +71,28 @@
>>   #include <linux/export.h>
>>   #include <linux/string.h>
>>
>> +#define BBT_BLOCK_GOOD		0x00
>> +#define BBT_BLOCK_WORN		0x01
>> +#define BBT_BLOCK_RESERVED	0x02
>> +#define BBT_BLOCK_FACTORY_BAD	0x03
>> +
>> +#define BBT_ENTRY_MASK		0x03
>> +#define BBT_ENTRY_SHIFT		2
>> +
>
> You can have one patch to change all the magic numbers into this nice
> macros.
>
> [...]
>
> And then another patch to use the new accesors.

I plan to still lump the macros + accessors together, since most of the 
shifting and masking ugliness is very intertwined. It's easier (IMO) to 
just reason about a hunk like this:

[combined hunk]
-   this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
+   bbt_mark_entry(this, (offs << 2) + (act >> 1), BBT_BLOCK_RESERVED);

Than the next two (as if they are split to 2 patches):

[hunk for patch 1]
-   this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
+   this->bbt[offs + ((act >> 1) >> BBT_ENTRY_SHIFT)] |=
+              BBT_BLOCK_RESERVED << ((act >> 1) & BBT_ENTRY_MASK);

[hunk for patch 2]
-   this->bbt[offs + ((act >> 1) >> BBT_ENTRY_SHIFT)] |=
-              BBT_BLOCK_RESERVED << ((act >> 1) & BBT_ENTRY_MASK);
+   bbt_mark_entry(this, (offs << 2) + (act >> 1), BBT_BLOCK_RESERVED);

But I can split again, if the next series is still hard to review.

> [...]
>>   int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
>>   {
>>   	struct nand_chip *this = mtd->priv;
>> -	int block;
>> -	uint8_t res;
>> +	int block, res;
>>
>> -	/* Get block number * 2 */
>
> And then a third patch to make the block * 2 -> block change.

Yes, this one can be kept pretty separate, and it makes the intermediate 
changes easier to read.

>> -	block = (int)(offs >> (this->bbt_erase_shift - 1));
>> -	res = (this->bbt[block >> 3] >> (block & 0x06)) & 0x03;
>> +	block = (int)(offs >> this->bbt_erase_shift);
>> +	res = bbt_get_entry(this, block);
>>
>>   	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: "
>>   			"(block %d) 0x%02x\n",
>> -			(unsigned int)offs, block >> 1, res);
>> +			(unsigned int)offs, block, res);
>>
>> -	switch ((int)res) {
>> -	case 0x00:
>> +	switch (res) {
>
> Mmm.. and then if you are really paranoid (like me) you can
> make the uint8_t -> int type change in another patch.

I'll consider it, but I don't consider myself quite that paranoid ;)

>> +	case BBT_BLOCK_GOOD:
>>   		return 0;
>> -	case 0x01:
>> +	case BBT_BLOCK_WORN:
>>   		return 1;
>> -	case 0x02:
>> +	case BBT_BLOCK_RESERVED:
>>   		return allowbbt ? 0 : 1;
>>   	}
>>   	return 1;
>
> Hope this is of any help!

Yes, thanks for the review! I'll send a split v2 series, and I hope it 
will be more reviewable.

Brian

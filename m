Received: from koko.iders.ca ([206.45.72.61])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Matop-0004HP-9L
	for linux-mtd@lists.infradead.org; Tue, 11 Aug 2009 16:03:27 +0000
Message-ID: <4A819637.7080501@iders.ca>
Date: Tue, 11 Aug 2009 11:03:03 -0500
From: Andrew McKay <amckay@iders.ca>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: nand_update_bbt fix
References: <4A80A760.20901@iders.ca> <1250005159.25202.11.camel@localhost>
In-Reply-To: <1250005159.25202.11.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, JiSheng Zhang <jszhang3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Mon, 2009-08-10 at 18:04 -0500, Andrew McKay wrote:
>> Hello,
>>
>> For NAND parts with 2K pages or larger, kmalloc of one erase block will exceed 
>> 128K and fail.  A vmalloc is used in nand_scan_bbt to allocate enough memory for 
>> one erase block.  This should likely be the case for nand_update_bbt as well.
> 
> I think this is not about parts with 2K pages, but about parts with
> 256KiB eraseblocks.

Yes, you're correct, any part that has an erase block, including OOB, that 
exceeds 128K bytes.

> 
>> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
>> index 55c23e5..43b8d08 100644
>> --- a/drivers/mtd/nand/nand_bbt.c
>> +++ b/drivers/mtd/nand/nand_bbt.c
>> @@ -1030,7 +1030,7 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
>>    /* Allocate a temporary buffer for one eraseblock incl. oob */
>>    len = (1 << this->bbt_erase_shift);
>>    len += (len >> this->page_shift) * mtd->oobsize;
>> - buf = kmalloc(len, GFP_KERNEL);
>> + buf = vmalloc(len);
>>    if (!buf) {
>>      printk(KERN_ERR "nand_update_bbt: Out of memory\n");
>>      return -ENOMEM;
>> @@ -1063,7 +1063,7 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
>>    }
>>
>>    out:
>> - kfree(buf);
>> + vfree(buf);
>>    return res;
>>   }
> 
> I would disagree with this patch. Other people are fighting against
> vmalloc, because they want to do DMA in their drivers, but they cannot.
> I've CCed Zhang who is doing the opposite to what you do.

I understand vmalloc is frowned upon in general, but then why is it already 
being used in nand_scan_bbt?  Any fix that avoids vmalloc for nand_update_bbt 
should be used in nand_scan_bbt as well.

> I think you should instead split the array on several smaller parts
> and work with those parts. And since this is a very common task in
> MTD, it is better to create a helper library.
> 
> You may also take a look at what I suggested to Zhang:
> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026845.html

Thanks, I will take a look.

Andrew

Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOz1V-00044r-Cw
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 10:25:27 -0500
Message-ID: <442BF839.8060402@intel.com>
Date: Thu, 30 Mar 2006 19:24:41 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com>
In-Reply-To: <442B9FA5.9070901@ru.mvista.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vitaly,

Vitaly Wool wrote:
> Still it's unclear why not to provide a configurable extension to 
> mtdconcat rather than create a new layer.

Striping and concatenation have different purposes. And extension in 
that case will become significantly more complicated than original layer.

> Sooo many threads... :(

One per sub-device.

>>
>> 3. POSSIBLE CONFIGURATIONS AND LIMITATIONS
>> It is possible to stripe devices of the same type. We can't stripe NOR
>> and NAND, but only NOR and NOR or NAND and NAND. Flashes of the same
>> type can differ in erase size and total size.   
> Why is that? Being able to deal only with flash chips of the same 
> type, your approach has very limited applicability

Please explain how is it possible to stripe NOR device with NAND? And 
what are you expecting from such an action?

>>          };
>>      };
>>      up(&map_mutex);
>> +
>> +#ifdef CONFIG_MTD_CMDLINE_STRIPE
>> +#ifndef MODULE
>> +    if(mtd_stripe_init()) {
>> +        printk(KERN_WARNING "MTD stripe initialization from cmdline
>> has failed\n");
>> +    }
>> +#endif
>> +#endif
>>   
> @@ -155,6 +158,15 @@
> Bah, what's going on here?

I should remove #ifndef MODULE from here, and from mphysmap_exit() too. 
Thanks.

>> +/* Operation codes */
>> +#define MTD_STRIPE_OPCODE_READ        0x1
>> +#define MTD_STRIPE_OPCODE_WRITE        0x2
>> +#define MTD_STRIPE_OPCODE_READ_ECC    0x3
>> +#define MTD_STRIPE_OPCODE_WRITE_ECC    0x4
>> +#define MTD_STRIPE_OPCODE_WRITE_OOB    0x5
>> +#define MTD_STRIPE_OPCODE_ERASE        0x6
>>   
> You don't need READ_OOB, eh?

I do not use READ_OOB operation code here. In current implementation 
read_oob is being done from context of the caller thread and we do not 
push that operation into worker threads queues.

>> +/*
>> + * Miscelaneus support routines
>> + */  
> Aint this one and stuff alike gonna be static?

True. I'll do that.

>> +    for(i = 1; i < num_devs; i++)
>> +    {
>> +    if(mtd->oobinfo.useecc != subdev[i]->oobinfo.useecc ||
>> +        mtd->oobinfo.eccbytes != subdev[i]->oobinfo.eccbytes)
>> +    {
>> +        printk(KERN_ERR "stripe_merge_oobinfo(): oobinfo parameters
>> is not compatible for all subdevices\n");
>> +        return -EINVAL;
>> +    }
>> +    }
>>   
> I guess this is a limitation that is not mentioned anywhere.

While striping NAND pages become larger for striped device. Again we 
have virtual "merging" but somewhat complicated than "merging" applied 
to erase blocks. NAND devices to be striped must have the same 
characteristics in the current implementation. It is strong limitation 
and probably can be toned down in something. But only the most common 
usage case for NAND (the identical chips) is considered in presented 
patch. I missed that important point in documentation, sorry.

>> +EXPORT_SYMBOL(mtd_stripe_init);
>> +EXPORT_SYMBOL(mtd_stripe_exit);
>>   
> Why do you need these functions exported?

At the moment these functions are not supposed to be used by others if 
mtdstripe.ko is a standalone module. Actually we do not need them 
exported.  I'll remove that exports.

>> +/* + * This is the handler for our kernel parameter, called from + * 
>> main.c::checksetup(). Note that we can not yet kmalloc() anything,
>> + * so we only save the commandline for later processing.
>> + *
>> + * This function needs to be visible for bootloaders.
>>   
> Can you please elaborate on this?

That comment about bootloaders is not supposed to be here. I'll remove 
it. The code below that comment just stores part of kernel configuration 
string  for later processing.

> Cool, it's an important func, why not declare it twice? ;)
>

It is typo, sorry. I'll remove second declaration.


Thanks,
Alexander Belyakov

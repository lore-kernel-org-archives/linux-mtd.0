Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLANc-0003MO-Vt
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 13:29:47 +0000
Subject: Re: [RFC PATCH 1/2] mtd: nand: add nand_check_erased helper functions
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <mailman.4514.1438332781.1758.linux-mtd@lists.infradead.org>
 <mailman.4514.1438332781.1758.linux-mtd.{54f18e14-0058-4822-8ce0-2e36468ada80}.0@lists.infradead.org>
 <20150731091037.09c7ee57@bbrezillon> <55BB48A8.1060204@dave-tech.it>
 <20150731122157.78bad539@bbrezillon>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
From: Andrea Scian <rnd4@dave-tech.it>
Message-ID: <55BB7831.7040407@dave-tech.it>
Date: Fri, 31 Jul 2015 15:29:21 +0200
MIME-Version: 1.0
In-Reply-To: <20150731122157.78bad539@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Boris,

Il 31/07/2015 12:21, Boris Brezillon ha scritto:
> Hi Andrea,
>
> On Fri, 31 Jul 2015 12:06:32 +0200
> Andrea Scian <rnd4@dave-tech.it> wrote:
>
>>
>> Dear Boris,
>>
>> thanks for pointing this out again.
>>
>> I'm on the same topic too, using iMX6 (I'll try to test you patch on the
>> next days, if I found some spare time, unfortunately I got a 3.10
>> kernel, so I think the patch will not apply cleanly :-( ).
>>
>> See my comment below (and on the next mail too)
>>
>> Il 31/07/2015 09:10, Boris Brezillon ha scritto:
>>> On Thu, 30 Jul 2015 19:34:53 +0200
>>> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>>>
>>>> Add two helper functions to help NAND controller drivers test whether a
>>>> specific NAND region is erased or not.
>>>>
>>>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>>> ---
>>>>    drivers/mtd/nand/nand_base.c | 104 +++++++++++++++++++++++++++++++++++++++++++
>>>>    include/linux/mtd/nand.h     |   8 ++++
>>>>    2 files changed, 112 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>>>> index ceb68ca..1542ea7 100644
>>>> --- a/drivers/mtd/nand/nand_base.c
>>>> +++ b/drivers/mtd/nand/nand_base.c
>>>> @@ -1101,6 +1101,110 @@ out:
>>>>    EXPORT_SYMBOL(nand_lock);
>>>>
>>>>    /**
>>>> + * nand_check_erased_buf - check if a buffer contains (almost) only 0xff data
>>>> + * @buf: buffer to test
>>>> + * @len: buffer length
>>>> + * @bitflips_threshold:maximum number of bitflips
>>>> + *
>>>> + * Check if a buffer contains only 0xff, which means the underlying region
>>>> + * has been erased and is ready to be programmed.
>>>> + * The bitflips_threshold specify the maximum number of bitflips before
>>>> + * considering the region is not erased.
>>>> + * Note: The logic of this function has been extracted from the memweight
>>>> + * implementation, except that nand_check_erased_buf function exit before
>>>> + * testing the whole buffer if the number of bitflips exceed the
>>>> + * bitflips_threshold value.
>>>> + *
>>>> + * Returns a positive number of bitflips or -ERROR_CODE.
>>>> + */
>>>> +int nand_check_erased_buf(void *buf, int len, int bitflips_threshold)
>>>> +{
>>>> +	const unsigned char *bitmap = buf;
>>>> +	int bitflips = 0;
>>>> +	int weight;
>>>> +	int longs;
>>>> +
>>>> +	for (; len && ((unsigned long)bitmap) % sizeof(long);
>>>> +	     len--, bitmap++) {
>>>> +		weight = hweight8(*bitmap);
>>>> +
>>>> +		bitflips += sizeof(u8) - weight;
>>>> +		if (bitflips > bitflips_threshold)
>>>> +			return -EINVAL;
>>
>> I think it's better to do something like:
>>
>> if (UNLIKELY(bitflips > bitflips_threshold))
>> 	return -EINVAL;
>>
>> isn't it? :-)
>> (the same for the other if)
>
> Maybe, or maybe not. It depends on whether you expect to have a lot of
> corrupted pages or a lot of blank pages with bitflips ;-).
> Anyway, I'm not opposed to this change.

I think that everything implemented inside the MTD stack 
(NAND/MTD/UBI/UBIFS) should lead to a "working" solid state device, that 
do not show any uncorrectable bitflips.
Uncorrectable pages, IMO, should happens, on stable systems, only in 
some rare case, because it means that you loss some data (or power 
during erase/write. Any other case?).

What is more frequent is that bitflips > mtd->bitflip_threshold (by 
default DIV_ROUND_UP(mtd->ecc_strength * 3, 4)), which should avoid 
bitflips > ecc_strength

>>
>>
>>>> +	}
>>>> +
>>>> +
>>>> +	for (longs = len / sizeof(long); longs;
>>>> +	     longs--, bitmap += sizeof(long)) {
>>>> +		BUG_ON(longs >= INT_MAX / BITS_PER_LONG);
>>>> +		weight = hweight_long(*((unsigned long *)bitmap));
>>>> +
>>>> +		bitflips += sizeof(long) - weight;
>>>> +		if (bitflips > bitflips_threshold)
>>>> +			return -EINVAL;
>>>> +	}
>>>> +
>>>> +	len %= sizeof(long);
>>>> +
>>>> +	for (; len > 0; len--, bitmap++) {
>>>> +		weight = hweight8(*bitmap);
>>>> +		bitflips += sizeof(u8) - weight;
>>>> +	}
>>>> +
>>>> +	return bitflips;
>>>> +}
>>>> +EXPORT_SYMBOL(nand_check_erased_buf);
>>>> +
>>>> +/**
>>>> + * nand_check_erased_ecc_chunk - check if an ECC chunk contains (almost) only
>>>> + *				 0xff data
>>>> + * @data: data buffer to test
>>>> + * @datalen: data length
>>>> + * @ecc: ECC buffer
>>>> + * @ecclen: ECC length
>>>> + * @extraoob: extra OOB buffer
>>>> + * @extraooblen: extra OOB length
>>>> + * @bitflips_threshold: maximum number of bitflips
>>>> + *
>>>> + * Check if a data buffer and its associated ECC and OOB data contains only
>>>> + * 0xff pattern, which means the underlying region has been erased and is
>>>> + * ready to be programmed.
>>>> + * The bitflips_threshold specify the maximum number of bitflips before
>>>> + * considering the region as not erased.
>>>> + *
>>>> + * Returns a positive number of bitflips or -ERROR_CODE.
>>>> + */
>>>> +int nand_check_erased_ecc_chunk(void *data, int datalen,
>>>> +				void *ecc, int ecclen,
>>>> +				void *extraoob, int extraooblen,
>>>> +				int bitflips_threshold)
>>>> +{
>>>> +	int bitflips = 0;
>>>> +	int ret;
>>>> +
>>>> +	ret = nand_check_erased_buf(data, datalen, bitflips_threshold);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	bitflips += ret;
>>>> +	bitflips_threshold -= ret;
>>>> +
>>>> +	ret = nand_check_erased_buf(ecc, ecclen, bitflips_threshold);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	bitflips += ret;
>>>> +	bitflips_threshold -= ret;
>>>> +
>>>> +	ret = nand_check_erased_buf(extraoob, extraooblen, bitflips_threshold);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>
>>> Forgot the memset operations here:
>>>
>>> 	memset(data, 0xff, datalen);
>>> 	memset(ecc, 0xff, ecclen);
>>> 	memset(extraoob, 0xff, extraooblen);
>>
>> Yes, you're right.. I did the same mistake on my first implementation
>> too ;-)
>
> Hehe.
>
>>
>> As additional optimization you may also check if the lower layer already
>> did the check for you (e.g. if you have an iMXQP as we saw in latest
>> days), but I think it's a minor one, because you'll face this situation
>> very very unlikely.
>
> If the hardware is capable of doing such test (I mean counting the
> number of bits to one and considering the page as erased under a given
> limit of bitflips), there's a lot of chance it will implement its own
> ecc_read_page function, and will never use this helper.
>

Ops.. I misunderstand your patch. I think it was something similar to 
what Brian already proposed some time ago [1].
IIUC Brial solution works, out of the box, even with the ones that 
override read_page callback, as I think most of current nand controller 
do (please correct me if I'm wrong).
If we want to add erased block check to omap2.c, atmel_nand.c, 
sh_flctl.c we have to modify them all.

I'm really not the right one to make such a decision ;-) but I think you 
already thought about it and can tell me the pros and cons of your patch 
vs the Brian's one.

What I understand up until now, is that Brian solution does not fit into 
all weird stuff that we find in single NAND controller implementation 
and this is where your solution come in handy. Am I wrong?

Kind Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems

[1] http://article.gmane.org/gmane.linux.drivers.mtd/52216

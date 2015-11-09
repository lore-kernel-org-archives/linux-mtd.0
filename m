Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvhFZ-0004bi-FW
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 07:52:27 +0000
Subject: Re: jffs2: Excess summary entries
To: <Thomas.Betker@rohde-schwarz.com>
References: <OF1A12855F.4E78FEFE-ONC1257EF4.004CEFDC-C1257EF4.00663F07@rohde-schwarz.com>
 <56404913.3060104@huawei.com>
CC: <linux-mtd@lists.infradead.org>
From: Wei Fang <fangwei1@huawei.com>
Message-ID: <5640506C.1030005@huawei.com>
Date: Mon, 9 Nov 2015 15:51:08 +0800
MIME-Version: 1.0
In-Reply-To: <56404913.3060104@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

On 2015/11/9 15:19, Wei Fang wrote:
> Hi Thomas,
> 
> On 2015/11/6 2:36, Thomas.Betker@rohde-schwarz.com wrote:
>> We ran into a problem with jffs2 where the filesystem became unusable 
>> after some specific MTD failures; summary was enabled, write buffering was 
>> disabled:
> 
> [snip...]
> 
>> Here are the solutions I have considered so far:
>>
>> The minimal solution would be to check *retlen == 0 in 
>> jffs2_flash_direct_writev() and jffs2_flash_direct_write() before running 
>> jffs2_sum_add_kvec().
>>
>>         if (jffs2_sum_active() && *retlen) {
>>                 ...
>>                 res = jffs2_sum_add_kvec(...)
>>                 ...
>>         }
>>
>> The general failure case, though, is (ret != 0 || *retlen != len), where 
>> 'ret' is the return code of mtd_writev(), and 'len' is the data size to be 
>> written. When write buffering is enabled, jffs2_flash_writev() in wbuf.c 
>> skips the summary entry in this case; perhaps we should do this in 
>> writev.c as well?
>>
>>         if (jffs2_sum_active() && !ret && *retlen == len) {
>>                 ...
>>                 res = jffs2_sum_add_kvec(...)
>>                 ...
>>         }
> 
> I prefer:
> 	if (jffs2_sum_active() && *retlen == len) {
> 		...
> 		res = jffs2_sum_add_kvec(...)
> 		...
> 	}
> 
> In the case that part of node has been written to flash, this whole node
> will be marked as dirty node, only in memory, not marked without
> JFFS2_NODE_ACCURATE on flash.
> 
> If the summary is stored when *retlen != len, there are two cases:
> 
> * In most case, another write with the same node info performs
>   successfully later, the node written partially before will be marked
>   as obsolete node when scan, and we won't read from it
> * This node is the newest node about this region, it will be treated
>   as normal node when scan, and we may read the data already corrupted.
>   Yet it won't break any rules of JFFS2 and lead to a muddle

I forgot there's crc check about the data, so in this case, this node
couldn't pass the crc check and will be marked as obsolete too :)

Thanks,
Wei

> The node written partially will be treated as normal node in a full scan
> routine too, so I think we should mark this node as dirty on flash in
> the case that *retlen != len.
> 
> Thanks,
> Wei
> 
>> I ran some quick tests, simulating write failures, and it seems that 
>> adding the summary entry doesn't harm when *retlen != 0 [so the minimal 
>> solution would suffice]. This is because the calling function will reserve 
>> the node space, marking it as dirty, and there is no confusion about 
>> unchecked space.
>>
>> On the other hand, running the same quick tests _without_ adding the 
>> summary entry didn't seem to harm either [so the general solution would 
>> work as well]. It is entirely possible that I have overlooked something, 
>> though.
>>
>> Any opinions on that? When in doubt, I would provide a patch for the 
>> minimal solution, changing as little as possible. However, it may make 
>> sense to go for the general solution to be consistent with write 
>> buffering.
>>
>> Best regards,
>> Thomas Betker
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>>

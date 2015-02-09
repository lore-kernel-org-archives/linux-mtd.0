Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKmSB-0005TQ-Qo
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 11:24:37 +0000
Message-ID: <54D898B9.50404@huawei.com>
Date: Mon, 9 Feb 2015 19:23:37 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [RFC] UBIFS recovery
References: <54D33C36.9060805@huawei.com>	
 <1423242166.8637.566.camel@sauron.fi.intel.com>	
 <54D81C9B.8070500@huawei.com> <1423468308.2573.4.camel@sauron.fi.intel.com>
 <54D86858.2070705@nod.at> <54D88E31.10402@huawei.com>
 <54D8945E.4060807@nod.at>
In-Reply-To: <54D8945E.4060807@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Sheng
 Yong <shengyong1@huawei.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/2/9 19:05, Richard Weinberger wrote:
> Am 09.02.2015 um 11:38 schrieb hujianyang:
>> Hi Artem and Richard,
>>
>> On 2015/2/9 15:57, Richard Weinberger wrote:
>>> Am 09.02.2015 um 08:51 schrieb Artem Bityutskiy:
>>>> On Mon, 2015-02-09 at 10:34 +0800, hujianyang wrote:
>>>>> Good suggestions. I will try to realize periodically commit first. But I
>>>>> don't know if this feature is really needed. Switch to R/O and revert to
>>>>> last comitted state? But we just consider about log before, never think
>>>>> about index.
>>>>
>>>> I think the right way to approach this problem is to come up with a high
>>>> level summary of the problems we are trying to solve, and the solutions,
>>>> along with some analysis of the solutions. This does not have to be very
>>>> detailed, but it should put everyone involved into the same page.
>>>
>>> Agreed. I fear we're talking about different things. :)
>>>
>>
>> I'm afraid I didn't express the use case of the corruption recovery feature.
>> UBIFS is used mostly in embedded environment. After products selling out,
>> it's hard to debug it. So the production team may consider any failure that
>> could happen and put the recovery method into their operation scripts/utilities.
>>
>> Flash corruption is a problem they need to care about. Using high quality
>> cell is not enough, ECC error could not be avoid. So a recovery method which
>> is provided by filesystem itself is required. This feature is not used by
>> us, the developer of kernel, but the production team. They know little about
>> linux kernel. So the easier interface we provide, the much effective recovery
>> method of the products they could make. So, Artem, I'm agree with your another
>> email mail about R-gadget and H-gadget.
>>
>> I think mount R/O is a good beginning. We don't need consider much about how
>> to recover but can provide a usable(in some cases) file-system. And a R/O
>> mount means we could do some cleanup to revert to this R/O state. This R/O
>> mount should be provided by driver itself without any userspace tools.
> 
> So, at the end of the day you want an UBIFS that can deal with randomly failed PEBs?
> 

It depends. We know we can't deal with all kinds of failure. So in my considering,
We should first list the error type.

If log is corrupted, we could discard them, just revert to last commit state.
If index is corrupted, we could scan the whole partition and rebuild the index.
and so on.

There must be some cases we can't achieve our expect. What can we do at that
situation? Mount failed or mount an empty R/O partition? We could make a discussion
on it.

Recovery is hard, but mount R/O is much easier, I think. For recovery case, we may
need some kinds of userspace tools, but it's a much complex work. This tool is
different with any thing we already have. We should be cautious to start at that
point.

Thanks,
Hu

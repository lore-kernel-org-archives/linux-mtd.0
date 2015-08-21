Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZShGK-0001N5-Hj
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 08:01:21 +0000
Message-ID: <55D6D958.9060504@cn.fujitsu.com>
Date: Fri, 21 Aug 2015 15:55:04 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 14/35] ubifs: extend budget for blocks
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-15-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55BFD56B.3070904@nod.at> <55D6BE42.6090507@cn.fujitsu.com>
 <55D6CF65.3020103@nod.at>
In-Reply-To: <55D6CF65.3020103@nod.at>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/21/2015 03:12 PM, Richard Weinberger wrote:
> Am 21.08.2015 um 07:59 schrieb Dongsheng Yang:
>> On 08/04/2015 04:56 AM, Richard Weinberger wrote:
>>> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>>>> Currently, budget subsystem in ubifs are working on budgeting
>>
>> [...]
>>>>    #endif
>>>> +    unsigned int new_block_num;
>>>> +    unsigned int dirtied_block_num;
>>>
>>> Why are these not under UBIFS_DEBUG?
>>> I like the overflow checks.
>>
>> Sorry for the late reply.
>>
>> I did not find the overflow checks in my reading.
>> Could you help to explain what kind of the check
>> is it? and why we define in different way with
>> UBIFS_DEBUG defined or not.
>
> AFAICT the idea is that you see it from the value
> from a crash dump.
> i.e. if new_page is > 2 an overflow happened.

Thanx, on my second thought, the new_block could
be unsigned int :1. Because there should be no
reading size larger than one block size. Okey,
thanx for your good suggestion here. I will
update it in next version. :)
>
> I don't know that Artem's original plan was.
> But we could also automate this checks.
>
>> And, Where did we define the UBIFS_DEBUG? I did not
>> get the design of this macro. :(
>
> You have define the macro yourself.

But what is the purpose of UBIFS_DEBUG? I mean, why
we want to define the new_page as unsigned int rather than
bit field of unsigned int :1 in UBIFS_DEBUG mode?

Okey, defining it in bit mode is for overflow checking, I agree.
But why we define it in non-bit mode when UBIFS_DEBUG defined.

It's confusing to me. :(


Thanx
Yang
>
> Thanks,
> //richard
> .
>

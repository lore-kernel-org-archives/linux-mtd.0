Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKncZ-0002tg-U9
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 12:39:25 +0000
Message-ID: <54D8AA35.5040203@huawei.com>
Date: Mon, 9 Feb 2015 20:38:13 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [RFC] UBIFS recovery
References: <54D33C36.9060805@huawei.com>
 <1423242166.8637.566.camel@sauron.fi.intel.com> <54D81C9B.8070500@huawei.com>
 <1423468308.2573.4.camel@sauron.fi.intel.com> <54D86858.2070705@nod.at>
 <54D88E31.10402@huawei.com>
 <alpine.DEB.2.02.1502091301520.17631@lnxricardw1.se.axis.com>
In-Reply-To: <alpine.DEB.2.02.1502091301520.17631@lnxricardw1.se.axis.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sheng Yong <shengyong1@huawei.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/2/9 20:12, Ricard Wanderlof wrote:
> 
> On Mon, 9 Feb 2015, hujianyang wrote:
> 
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
>> is provided by filesystem itself is required.
> 
> Isn't this a bit backward? Given a certain acceptable failure rate for a 
> product, select an appropriate flash chip in combination with a reasonable 
> amount of ECC to get a medium that has a low enough error rate so that 
> higher levels do not need to concern themselves. If a high level of 
> reliability is needed, then some other form of nonvolatile storage should 
> be selected.
> 
> The only high level function should be some sort of periodic scrubbing of 
> NAND flash blocks to ensure the error rate does not rise too fast 
> unnoticed.
> 
> Having UBIFS manage random corruptions would seem hopeful at best, if some 
> critical file is corrupted then the system can't start anyway.
> 
> In any system all components have a failure rate, so it's a question of 
> getting the failure rate of the NAND subsystem on par with the failure 
> rate of other components. Just because there is a theoretical possibility 
> of fixing an UBIFS problem does not really make the system more reliable 
> per se. What if you get a fault in a RAM chip? The CPU? The PSU? In all 
> those cases the product will be simply "broken", and we can handle 
> defective flash the same way. A transistor in the PSU blew or the NAND 
> flash happened to be the the one-in-a-million part that keeps loosing 
> bits. Same result, product dead, repair or replace it.
> 
> /Ricard
> 

Hi Ricard,

Yes, that's true. We can't deal with any kinds of problem. And at worst
case, we could re-format the partition.

But we could do something when data corruptions occur during mount or
during IO. For mount case, actually current driver make no effort if
an none power-cut corruption occur. It could be improved in my considering.

I think the improvement is worth to be done than just say "It's broken,
you need a new one". We can come up with some solutions for small cases
now. But the problem is the definition of what kinds of problems we can
fix. I don't want to make a unachievable plan. But I really think we
could do something, just in kernel, to improve, in any side.

Thanks,
Hu

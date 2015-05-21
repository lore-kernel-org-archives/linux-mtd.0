Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvNTt-0002uI-Ow
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 10:13:38 +0000
Message-ID: <555DAFB6.7080208@redhat.com>
Date: Thu, 21 May 2015 12:13:10 +0200
From: Denys Vlasenko <dvlasenk@redhat.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: cfi: Deiline large functions
References: <1431946720-32281-1-git-send-email-dvlasenk@redhat.com>
 <20150520185641.GI11598@ld-irv-0074> <555D8E4E.9030109@redhat.com>
 <20150521083612.GH11112@norris-Latitude-E6410>
In-Reply-To: <20150521083612.GH11112@norris-Latitude-E6410>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Aaron Sierra <asierra@xes-inc.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/21/2015 10:36 AM, Brian Norris wrote:
> On Thu, May 21, 2015 at 09:50:38AM +0200, Denys Vlasenko wrote:
>>>> cfi_udelay(): 74 bytes, 26 callsites
>>>
>>> ^^ This is pretty dead-simple. If it's generating bad code, we might
>>> look at fixing it up instead. Almost all of its call sites are with
>>> constant input, so it *should* just become:
>>>
>>> 	udelay(1);
>>> 	cond_resched();
>>>
>>> in most cases. For the non-constant cases, we might still do an
>>> out-of-line implementation. Or maybe we just say it's all not worth it,
>>> and we just stick with what you have. But I'd like to consider
>>> alternatives to out-lining this one.
>>
>> You want to consider not-deinlining (IOW: speed-optimizing)
> 
> Inlining isn't always about speed.
> 
>> a *fixed time delay function*?
>>
>> Think about what delay functions do...
> 
> I wasn't really looking at speed. Just memory usage.

I don't follow.

A single, not-inlined cfi_udelay(1) call is
a minimal possible code size. Even

udelay(1);
cond_resched();

ought to be bigger.

> And I was only pointing this out because udelay() has a different
> implementation for the __builtin_constant_p() case. You can't take
> advantage of that for non-inlined versions of cfi_udelay().
> 
> But that may be irrelevant anyway, now that I think again. At best,
> you're trading one function call (arm_delay_ops.const_udelay() on ARM)
> for another (cfi_udelay()), since you can never completely optimize out
> the latter.

*delay() and *sleep() functions are special: they do NOT
want to be executed as fast as possible. They are *pausing*
execution. They are *intended* to be "slow".

You should not strive to optimize out function call overhead
when you call one of these. Otherwise, it would mean that you
essentially do this for e.g. udelay(NUM):

"I want to pause for NUM us, (which is about NUM*3000 CPU cycles),
let's optimize out call+ret so that we speed up execution
by 5 cycles".

Do you see why it does not make sense?

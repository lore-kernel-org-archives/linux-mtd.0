Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoJA8-00042c-OG
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 21:39:45 +0000
Message-ID: <54628207.5030205@nod.at>
Date: Tue, 11 Nov 2014 22:39:19 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, dedekind1@gmail.com
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>	
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>	
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>	
 <5450D6C4.4040400@nod.at> <54538ABC.1040605@codeaurora.org>	
 <5453ABF9.4070208@nod.at> <5453AD4D.2000303@nod.at>	
 <545630E1.8020505@codeaurora.org>	
 <1415261234.958.171.camel@sauron.fi.intel.com>	
 <545B66BA.4090904@codeaurora.org>
 <1415350722.958.286.camel@sauron.fi.intel.com>
 <54627350.9080509@codeaurora.org>
In-Reply-To: <54627350.9080509@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, jlauruhn@micron.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tanya,

Am 11.11.2014 um 21:36 schrieb Tanya Brokhman:
> Hi Artem,
> 
> Hope I didn't drop any ccs this time... Sorry about that. Not on purpose.
> 
> On 11/7/2014 10:58 AM, Artem Bityutskiy wrote:
>> On Thu, 2014-11-06 at 14:16 +0200, Tanya Brokhman wrote:
>>> What I'm trying to say - it
>>> may be too late and you may lose data here. "preferred to prevent rather
>>> than cure".
>>
>> First of all, just to clarify, I do not have a goal of turning down your
>> patches. I just want to understand why this is the best design, and if
>> it is helpful to all Linux MTD users.
>>
>> Modern flashes have strong ECC codes protecting against many bit-flips.
>> MTD even was modified to stop reporting about a single or few bit-flips,
>> because those happen too often and they are "harmless", and do not
>> require scrubbing. We have the threshold value in MTD for this, which is
>> configurable, of course.
>>
>> Bit-flips develop slowly over time. If you get one more bit-flips, it is
>> not too late yet. You can mitigate the "too late" part by reading more
>> often of course.
>>
>> You also may lower the bit-flip threshold when reading for scrubbing.
>>
>> Could you try to "sell" your design in a way that it becomes clear why
>> it is better than just reading the entire flash periodically.
> 
> Please see my "selling" bellow :)
> 
>  Some hard
>> experimental data would be preferable.
> 
> Unfortunately none. This is done for a new device that we received just now. The development was done on a virtual machine with nandsim. Testing was more of stability and regression
> 
>>
>> The advantages of the "read all periodically" approach were:
>>
>> 1. Simple, no modifications needed
>> 2. No need to write if the media is read-only, except when scrubbing
>> happens.
>> 3. Should cover all the NAND effects, including the "radiation" one.
> 
> Disadvantages (as I see it):
> 1. performance hit: when do you trigger the "read-all"? will effect performance

Only a stupid implementation will re-read/scrub all PEBs at once.
We can use a low priority thread. We can do this even in userspace.

> 2. finds bitflips only when they are present instead of preventing them from happening

We can scrub unconditionally.
Even if we scrub every PEB once a week the erase counters won't go up very much.

> Perhaps our design is an overkill for this and not covering 100% of te usecases. But it was requested by our customers to handle read-disturb and data retention specifically (as in
> "prevent" and not just "fix"). This is due to a new NAND device that should operate in high temperature and last for ~15-20 years.
> 
> But we did rethink this and we're dropping the "last erase timestamp" that was used to handle "data retention". We will force-scrub all PEBs once in a while (triggered by user) as
> Richard suggested.
> We're keeping the read counters though. I know that not all "read-disturb" scenarios are covered by this but it's more coverage then we have at the moment. So not 100% perfect
> solution but better then none.
> 
> I will update the implementation and change the fastmap layout (as suggested by Richard earlier) or try using internal UBI volume. Still have some study to do on that...

Please don't (ab)use fastmap. If you really need persistent read-counters use an internal UBI volume.
But I think that time-based unconditional scrubbing will also do it. As long we don't have sane threshold values
keeping counters is useless.

Thanks,
//richard

Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XotHY-0000gg-68
 for linux-mtd@lists.infradead.org; Thu, 13 Nov 2014 12:13:49 +0000
Message-ID: <5464A062.7040202@codeaurora.org>
Date: Thu, 13 Nov 2014 14:13:22 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
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
 <1415793323.22887.233.camel@sauron.fi.intel.com>
In-Reply-To: <1415793323.22887.233.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: richard@nod.at, jlauruhn@micron.com, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/12/2014 1:55 PM, Artem Bityutskiy wrote:
> On Tue, 2014-11-11 at 22:36 +0200, Tanya Brokhman wrote:
>> Unfortunately none. This is done for a new device that we received just
>> now. The development was done on a virtual machine with nandsim. Testing
>> was more of stability and regression
>
> OK. So the implementation is theory-driven and misses the experimental
> prove. This means that building a product based on this implementation
> has certain amount of risk involved.
>
> And from where I am, the theoretical base for the solution also does not
> look very strong.
>
>>> The advantages of the "read all periodically" approach were:
>>>
>>> 1. Simple, no modifications needed
>>> 2. No need to write if the media is read-only, except when scrubbing
>>> happens.
>>> 3. Should cover all the NAND effects, including the "radiation" one.
>>
>> Disadvantages (as I see it):
>> 1. performance hit: when do you trigger the "read-all"? will effect
>> performance
>
> Right. We do not know how often, just like we do not know how often and
> how much (read counter threshold) in your proposal.
>
> Performance - sure, matter of experiment, just like the performance of
> your solution. And as I notice, energy too (read - battery life).
>
> In your solution you have to do more work maintaining the counters and
> writing them. With read solution you do more work reading data.

But the maintaining work is minimal here. ++the counter on every read is 
all that is required and verify it's value. O(1)...
Saving them on fastmap also doesn't add any more maintenance work. They 
are saved as part of fastmap. I didn't increase the number of events 
that trigger saving fastmat to flash. So all is changes is that the 
number of scubbing events increased

>
> The promise that reading may be done in background, when there is no
> other I/O.
>
>> 2. finds bitflips only when they are present instead of preventing them
>> from happening
>
> But is this true? I do not see how is this true in your case. Yo want to
> scrub by threshold, which is a theoretical value with very large
> deviation from the real one. And there may be no real one even - the
> real one depends on the erase block, it depends on the I/O patterns, and
> it depends on the temperature.

I know... We got the threshold value (that is exposed in my patches as a 
define you just missed it) from NAND manufacturer asking to take into 
consideration the temperature the device will operate at. I know its 
still an estimation but so is the program/erase threshold. Since it was 
set by manufacturer - I think its the best one we can hope for.

>
> You will end up scrubbing a lot earlier than needed. Here comes the
> performance loss too (and energy). And you will eventually end up
> scrubbing too late.

I don't see why I would end up scrubbing too late?

>
> I do not see how your solution provides any hard guarantee. Please,
> explain how do you guarantee that my PEB does not bit-rot earlier than
> read counter reaches the threshold? It may bit-rot earlier because it is
> close to be worn out, or because of just higher temperature, or because
> it has a nano-defect.

I can't guarantee it wont bit-flip, I don't think any one could but I 
can say that with my implementation the chance of bit-flip is reduced. 
Even if not all the scenarios are covered. For example in the bellow 
case I reduce the chance of data loss:

In an endless loop - read page 3 of PEB-A.
This will effect near by pages (say 4 and 2 for simplicity). But if I 
scrub the whole PEB according to read-counter I will save data of pages 
2 and 4.
If I do nothing: when reading eventually page 4 it will produce 
bit-flips that may not be fixable.

>
>> Perhaps our design is an overkill for this and not covering 100% of te
>> usecases. But it was requested by our customers to handle read-disturb
>> and data retention specifically (as in "prevent" and not just "fix").
>> This is due to a new NAND device that should operate in high temperature
>> and last for ~15-20 years.
>
> I understand the whole customer orientation concept. But for me so far
> the solution does not feel like something suitable to a customer I could
> imagine. I mean, if I think about me as a potential customer, I would
> just want my data to be safe and covered from all the NAND effects.

I'm not sure that at the moment "all NAND effects" can be covered. In 
our case the result is that we reduce the chance of loosing data. not to 
0% unfortunately but still reduce.
And from the tests we ran we didn't observe performance hit with this 
implementation. And the customer doesn't really care how this was done.
I do not know about power. Its possible that our implementation will 
have negative effect on power consumption. I don't have the equipment to 
verify that unfortunately.
There are plans to test this implementation in extreme temperature 
conditions and get some real numbers and statistics on endurance. It 
wasn't done yet and wont be done by us. When I get the results I'll try 
to share (if allowed to by legal)

I
> would not want counters, I'd want the result. And in the proposed
> solution I would not see how I'd get the guaranteed result. But of
> course I do not know the customer requirements that you've got.
>
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project

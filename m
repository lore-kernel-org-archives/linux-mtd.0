Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XouZw-00070j-A9
 for linux-mtd@lists.infradead.org; Thu, 13 Nov 2014 13:36:53 +0000
Message-ID: <1415885788.22887.326.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Thu, 13 Nov 2014 15:36:28 +0200
In-Reply-To: <5464A062.7040202@codeaurora.org>
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
 <5464A062.7040202@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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

On Thu, 2014-11-13 at 14:13 +0200, Tanya Brokhman wrote:
> > In your solution you have to do more work maintaining the counters and
> > writing them. With read solution you do more work reading data.
> 
> But the maintaining work is minimal here. ++the counter on every read is 
> all that is required and verify it's value. O(1)...

Let's consider the R/O FS on top of UBI case. Fastmap will only be
updated when there are erase operations, which may only be cause by
scrubbing in this case. IOW, fastmap will be updated extremely rarely.
And suppose there is no clean unmount ever happening.

Will we always lose erase counters and set them to half the threshold
all the time? Even if it was Threshold-1 before, it becomes Threshold/2
after power cut?

Don't we actually want to write the read counters when they change
significantly enough?

> I know... We got the threshold value (that is exposed in my patches as a 
> define you just missed it) from NAND manufacturer asking to take into 
> consideration the temperature the device will operate at. I know its 
> still an estimation but so is the program/erase threshold. Since it was 
> set by manufacturer - I think its the best one we can hope for.

I wonder how constant is the threshold.

* Does it change with time, as eraseblock becomes more worn out. Say,
the PEB resource is 10000 erase cycles. Will the threshold be the same
for PEB at 0 erase cycles and at 5000 erase cycles?

* Does it depend on eraseblock?

* Does it depend on the I/O in other eraseblocks?

Just wonder how pessimistic is the threshold number manufacturers give.
Just curious to learn more about this number, and have an idea about how
reliable is it.

> > You will end up scrubbing a lot earlier than needed. Here comes the
> > performance loss too (and energy). And you will eventually end up
> > scrubbing too late.
> 
> I don't see why I would end up scrubbing too late?

Well, one example - see above, you lose the read counters often, always
reset to threshold/2, end up reading more than the threshold.

The other doubt is that the threshold you use is actually the right one
for a worst case usage scenario of the end product. But probably it is
about just learning more about this threshold value.

> I can't guarantee it wont bit-flip, I don't think any one could but I 
> can say that with my implementation the chance of bit-flip is reduced. 

That was my point. There is already a solution for the problem you are
trying to solve. It is implemented. And it covers not just the problem
you are solving, but the other problems of NAND.

So probably what is missing is some kind of better analysis or
experimental prove that the solution which is already implemented (let's
call it "periodic read") is defective.

May be I should expand a bit more on why the periodic read solution does
not look bad to me.

If the ECC is strong enough for the flash chip in question, then
bit-flips will accumulate slowly enough. First one bit-flip, then 2,
then 3, etc. All you need to do is to make your read period good enough
to make sure no PEB accumulates too many bit-flips.

E.g., modern ECCs cover 8 or more bit-flips.

And the other compelling point here that this will cover all other NAND
effects. All of them lead to more bit-flips at the end, right? And you
just fix bit-flips when they come. You do not care why they came. You
just deal with them.

And what is very nice is that you do not need to implement anything, or
you implement very little.

> In an endless loop - read page 3 of PEB-A.
> This will effect near by pages (say 4 and 2 for simplicity). But if I 
> scrub the whole PEB according to read-counter I will save data of pages 
> 2 and 4.
> If I do nothing: when reading eventually page 4 it will produce 
> bit-flips that may not be fixable.

This is quite artificial example, but yes, if you read the same page in
a tight loop, you may cause bit flips fast enough, faster than your
periodic read task starts reading your media.

But first of all, how realistic is this scenario? I am sure not,
especially if there is an FS on top of UBI and the data are cached, so
the second read actually reads from RAM.

Secondly, can this scenario be covered by simpler means? Say, UBI could
watch the read ratio, and if it grows, trigger the scrubber task
earlier?

> > I understand the whole customer orientation concept. But for me so far
> > the solution does not feel like something suitable to a customer I could
> > imagine. I mean, if I think about me as a potential customer, I would
> > just want my data to be safe and covered from all the NAND effects.
> 
> I'm not sure that at the moment "all NAND effects" can be covered.

I explained how I see it above in this e-mail. In short: read all data
often enough ("enough" is defined by your product), and you are done.
All "NAND effects" lead to bit-flips, you fix bit-flips faster than they
become hard errors, and you are done.

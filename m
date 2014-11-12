Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoWWZ-0001JY-Tv
 for linux-mtd@lists.infradead.org; Wed, 12 Nov 2014 11:55:48 +0000
Message-ID: <1415793323.22887.233.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Wed, 12 Nov 2014 13:55:23 +0200
In-Reply-To: <54627350.9080509@codeaurora.org>
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

On Tue, 2014-11-11 at 22:36 +0200, Tanya Brokhman wrote:
> Unfortunately none. This is done for a new device that we received just 
> now. The development was done on a virtual machine with nandsim. Testing 
> was more of stability and regression

OK. So the implementation is theory-driven and misses the experimental
prove. This means that building a product based on this implementation
has certain amount of risk involved.

And from where I am, the theoretical base for the solution also does not
look very strong.

> > The advantages of the "read all periodically" approach were:
> >
> > 1. Simple, no modifications needed
> > 2. No need to write if the media is read-only, except when scrubbing
> > happens.
> > 3. Should cover all the NAND effects, including the "radiation" one.
> 
> Disadvantages (as I see it):
> 1. performance hit: when do you trigger the "read-all"? will effect 
> performance

Right. We do not know how often, just like we do not know how often and
how much (read counter threshold) in your proposal.

Performance - sure, matter of experiment, just like the performance of
your solution. And as I notice, energy too (read - battery life).

In your solution you have to do more work maintaining the counters and
writing them. With read solution you do more work reading data.

The promise that reading may be done in background, when there is no
other I/O.

> 2. finds bitflips only when they are present instead of preventing them 
> from happening

But is this true? I do not see how is this true in your case. Yo want to
scrub by threshold, which is a theoretical value with very large
deviation from the real one. And there may be no real one even - the
real one depends on the erase block, it depends on the I/O patterns, and
it depends on the temperature.

You will end up scrubbing a lot earlier than needed. Here comes the
performance loss too (and energy). And you will eventually end up
scrubbing too late.

I do not see how your solution provides any hard guarantee. Please,
explain how do you guarantee that my PEB does not bit-rot earlier than
read counter reaches the threshold? It may bit-rot earlier because it is
close to be worn out, or because of just higher temperature, or because
it has a nano-defect.

> Perhaps our design is an overkill for this and not covering 100% of te 
> usecases. But it was requested by our customers to handle read-disturb 
> and data retention specifically (as in "prevent" and not just "fix"). 
> This is due to a new NAND device that should operate in high temperature 
> and last for ~15-20 years.

I understand the whole customer orientation concept. But for me so far
the solution does not feel like something suitable to a customer I could
imagine. I mean, if I think about me as a potential customer, I would
just want my data to be safe and covered from all the NAND effects. I
would not want counters, I'd want the result. And in the proposed
solution I would not see how I'd get the guaranteed result. But of
course I do not know the customer requirements that you've got.

Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0wko-0003di-Oa
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 17:17:19 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: eliedebrauwer@gmail.com (Elie De Brauwer)
Subject: Re: [PATCH v0] mtd: gpmi: Use cached syndromes to speedup erased
 region bitflip detection.
References: <1389123873-30663-1-git-send-email-eliedebrauwer@gmail.com>
 <20140108053816.GA28424@shlinux2.ap.freescale.net>
 <CAGWqfigWXs+0nJzxQMh6umhrm1bA5YUWbZmXmj7=aut3HsaAcA@mail.gmail.com>
Date: Wed, 08 Jan 2014 12:10:22 -0500
Message-ID: <871u0i9z7l.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

eliedebrauwer at gmail.com wrote:

> (Some background info, I expect these chips to be less than half used,
> hence plenty of erased blocks, also the NAND timings are already
> optimized for these chips).

That may not be true if the higher layer file system does wear
levelling.  Especially dynamic wear levelling where seldom read inodes are
moved in order to spread the wear.

> On Wed, Jan 8, 2014 at 6:38 AM, Huang Shijie <b32955 at freescale.com> wrote:
>> thanks for the new patch.
>>
>> I suddenly think out a new solution about this issue:
>> [1] when the bitflip occurs, the BCH will tells up the uncorrectable,
>> [2] if we catch a uncorrectable error, we could check the whole buffer, and
>> count the number of the bitflips. Assume we get the bitflips is N.
>>
>> [3] if N is < (gf_len ), we could think this is a erased page, and call the
>> memset to the whole buffer, and tell the upper layer that this is a good
>> empty page.
>>
>> [4] since the [1] is very rare, i think this method is much faster then the
>> current solution.

>> Elie De Brauwer wrote:

> What you suggest will obviously be able to reach the maximum speed,
> I've been playing with a similar idea too but always bumped into the issue
> that you cannot know whether or not a page is actually an erased page or
> not. In your solution for example you cannot distinguish between:
> - an erased page which suffers from bitflips
> - a genuine uncorrectable page whose original contents may be close to
> all 0xff's, but only has a handful of bits set to 0.

> The risk of this approach is that if you bump into an erased page, which the
> system should mark as uncorrectable, (and deal with accordingly)  is returned
> as a valid all 0xff's page which the system will consider as valid data.

> I agree this may sound a bit theoretical, and the risk (uncorrectable
> on a page with very few 0 bits) is small, but I'm not able to judge
> whether or not it can/should be neglected.

> What do you think ?

I think you have a good rational.  However, there will always be errors
which can by-pass the bit-flips checking of any ECC (just like any hash
has some theoretical collision/conflict).  The higher layer file system
should still have some integrity checks and the '-EUCLEAN' should have
been a clue that these pages/sectors were wearing previously.  Ie, the
NAND device should gradually fail.  I don't think it is fair to expect
the MTD drivers to perform on a flash that it excessively used to the
point where they are so broke it has bit flips way beyond the maximum
specified by the vendors.

Probably there is no completely right answer, just as you analyze.  How
do you tell between a mostly xff page with bit flips versus a bad
hardware-ECC of an erased page?  It maybe possible to 're-read' the page
with the hardware ECC turned off to validate that the whole page is xff
(I have guessed you are comparing data with ECC applied?). But this would
again affect performance.

I think that we should have some reliability at the upper layers.  How
do you combat against power fail, etc?  The ECC should be able to
correct errors.  This foists error detection to another layer, with it
highly likely to be caught at this layer.  Running file systems on
mtdblock, etc might like this but those have other issues, don't they?

My 2cents,
Bill Pringlemeir.

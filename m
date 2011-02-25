Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pt0jo-0005xk-QU
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 16:41:53 +0000
Received: by wyf23 with SMTP id 23so1854693wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 08:41:51 -0800 (PST)
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
In-Reply-To: <20110225144410.GC21841@parrot.com>
References: <Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
	<AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
	<Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
	<AANLkTi=zwmN2T7T=dePB0PJk_+Ahdvzjrn9t-rA7TtVa@mail.gmail.com>
	<Pine.LNX.4.64.1102171013090.2784@lnxricardw.se.axis.com>
	<1298623342.2798.9.camel@localhost>
	<Pine.LNX.4.64.1102250956200.2784@lnxricardw.se.axis.com>
	<1298629762.2798.38.camel@localhost>
	<20110225113609.GB21841@parrot.com>
	<1298635930.2798.96.camel@localhost>
	<20110225144410.GC21841@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 18:41:36 +0200
Message-ID: <1298652096.2346.14.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Peverley <pev@sketchymonkey.com>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-25 at 15:44 +0100, Ivan Djelic wrote:
> On Fri, Feb 25, 2011 at 12:12:10PM +0000, Artem Bityutskiy wrote:
> > On Fri, 2011-02-25 at 12:36 +0100, Ivan Djelic wrote:
> (...)
> > > 
> > > The fact that a bitflip detected during torture is enough to decide that a
> > > block is bad causes problems on some 4-bit ecc devices we are using. If we
> > > stick to this policy, we end up with a _lot_ of blocks being marked as bad
> > > (i.e. way too many).
> > 
> > I see. May be in your case 1 bit errors are completely harmless, but 2
> > and 3 are not?
> 
> When a NAND device requires 4-bit ecc or more, you do see a lot of 1-bit errors
> (compared to previous NAND devices). They are not "completely harmless" because
> you are still supposed to relocate data in some other block and erase the block
> (those bitflips are reversible errors), in order to avoid error accumulation
> and stay below the specified ecc requirement. But they probably should not be
> considered an indication that the block has gone bad.

So basically, this means that UBI need to distinguish between "gentle
bit-flips" and "evil bit-flips". This could be done, again, but teaching
MTD to return the bit-flip level and provide us some thresholds, which
could either be set automatically from OFNI data or heuristics or could
be provided by the user via some MTD sysfs files.

This should not be huge amount of job.


> > > Our NAND manufacturer tells us that, as long as a block erase operation
> > > completes without a failure reported by the device, it should not be classified
> > > as bad, even if it has bitflips (which sounds risky at best).
> > 
> > For any amount of flipped bits per page? Sounds a bit scary.
> 
> I agree. Our NAND manufacturer even told us that a single permanent 1-bit
> failure in a block is not enough for marking this block as bad on 4-bit ecc NAND
> devices. I still think there should be a specified amount of errors above which
> the block should be considered bad. Maybe only permanent bit failures should
> be considered.

Yes, this sounds logical and gives system designers flexibility.

> Yes, this makes sense. When you say "react", do you also mean not doing any
> scrubbing when the error count is below the threshold ?

Yes. There may be separate thresholds for different things: one for
scrubbing, one for marking bad. Feel free to send patches :-)

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)

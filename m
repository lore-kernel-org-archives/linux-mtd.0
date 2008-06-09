Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5l4p-0000s1-9U
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 17:22:39 +0000
Date: Mon, 9 Jun 2008 19:22:17 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: mtd_info->size again (lengthy)
Message-ID: <20080609172202.GB22447@logfs.org>
References: <OFD87C95E7.367C9580-ON88257462.00177BAD-88257462.001EF9FC@selinc.com>
	<20080608121020.GA13200@logfs.org>
	<20080609132117.GC29526@shareable.org>
	<20080609143633.GA22447@logfs.org>
	<20080609163149.GB2596@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080609163149.GB2596@shareable.org>
Cc: linux-mtd@lists.infradead.org, Bruce_Leonard@selinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 9 June 2008 17:31:49 +0100, Jamie Lokier wrote:
> 
> > But mtdio is even worse.  Dude, what are you smoking? ;)
> 
> submit_fio suggests "file I/O" to me....  Even if I knew better, it
> looks just that bit too much like submit_bio for something file-ish.
> 
> submit_mtd_request or async_mtd, then! :-)

No, the similarities to submit_bio are _not_ accidental.  In a perfect
world, I would have used submit_bio.  In our less than perfect world, I
want to retain as many similarities as possible.  We have two storage
subsystems in the kernel that have lived their own seperate lives for
all too long.  They should get combined by some brave soul.  And while I
am not that brave soul, at least I can make his/her work a little
easier.

> I didn't say it's a _good_ idea!  Just that I won't be surprised when
> someone produces hardware like that.  And, there will probably be a
> reason you haven't thought of why they did it that way.

If someone is stupid enough to create such hardware, I don't mind if
they suffer.  Quite the contrary.  Send them the darwin award of
hardware engineering!

> > Part of the reason for asynchronous interfaces is to make parallel chips
> > work fast without striping them.  Or rather, make them work even faster
> > than stripes.
> 
> And erasing simultaneous with streaming writes, let the CPU get on
> with something else, etc.

Same with asynchronous erases on all chips - except that the blocks
being erased don't need any special relationship.

> What should the behaviour be with devices which block the CPU during
> synchronous writes and erases?  Right now, you can be sure the
> temporary CPU blockage (if there is one) happens when you request the
> I/O.  If it's asynchronous, depending on how it's implemented, the CPU
> could block at an unexpected time later.

Good devices should have a dma engine and an interrupt line.  Lesser
devices can set a timer in the driver.  If the cpu has to actively do
some work during erase, you won't win any benchmark crowns with it
anyway and I care fairly little.

If you are designing hardware and want it to be fast, make sure it can
handle at least one request autonomously.  Better yet add a small queue
with - say - 16 entries and simply handle them in order.  Reads/writes
should dma the data to/from main memory.  Each completed request yields
an interrupt.

This is not rocket science.  If you have any trouble implementing
something like this, just talk to some network/ide/scsi person.  Crap
design like dual plane chips will disappear over time.  Once you get to
64 parallel planes, it is obvious that the same approach no longer
works.

Jörn

-- 
Doubt is not a pleasant condition, but certainty is an absurd one.
-- Voltaire

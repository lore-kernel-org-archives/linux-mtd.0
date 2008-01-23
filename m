Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHcnh-0002qS-4h
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 10:25:51 +0000
Date: Wed, 23 Jan 2008 11:19:15 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080123101915.GA24953@lazybastard.org>
References: <20080118181744.GA15039@lazybastard.org>
	<4794C107.7070600@parrot.com>
	<20080121212555.GA14472@lazybastard.org>
	<20080121161612.3ca2f093@zod.rchland.ibm.com>
	<20080121222952.GC14472@lazybastard.org> <4795AFE3.506@parrot.com>
	<20080122120300.GA18884@lazybastard.org>
	<Pine.LNX.4.64.0801221419240.25733@lnxricardw.se.axis.com>
	<20080122150514.GD18884@lazybastard.org>
	<Pine.LNX.4.64.0801231014540.25733@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0801231014540.25733@lnxricardw.se.axis.com>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>, Josh Boyer <jwboyer@gmail.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 23 January 2008 10:23:55 +0100, Ricard Wanderlof wrote:
> On Tue, 22 Jan 2008, Jörn Engel wrote:
> 
> >- Moderate: one block continuously spews -EUCLEAN, then becomes
> > terminally bad.
> > If those are just random bitflips, garbage collection will move the
> > data sooner or later.  Logfs does not force GC to happen soon when
> > encountering -EUCLEAN, which it should.  Are correctable errors an
> > indication of block going bad in the near future?  If yes, I should do
> > something about it.
> 
> I would say that correctable errors occurring "soon" after writing are an 
> indication that the block is going bad. My experience has been that 
> extensive reading can cause bitflips (and it probably happens over time 
> too), but that for fresh blocks, billions of read operations need to be 
> done before a bit flips. For blocks that are nearing their best before 
> date, a couple of hundred thousand reads can cause a bit to flip. So if I 
> was implementing some sort of 'when is this block considered 
> bad'-algorithm, I'd try to keep tabs on how often the block has been 
> (read-) accessed in relation to when it was last writen. If this number is 
> "low", the block should be considered bad and not used again.

That sounds like an impossible strategy.  Causing a write for every read
will significantly increase write pressure, thereby reduce flash
lifetime, reduce performance etc.

What would be possible was a counter for soft/hard errors per physical
block.  On soft error, move data elsewhere and reuse the block, but
increment the error counter.  If the counter increases beyond 17 (or any
other random number), mark the block as bad.  Limit can be an mkfs
option.

> I'm also think that when (if) logfs decides a block is bad, it should mark 
> it bad using mtd->block_markbad(). That way, if the flash is rewritten by 
> something else than logfs (say during a firmware upgrade), bad blocks can 
> be handled in a consistent and startad way.

Maybe I should revive the old patch then.  I don't think it matters much
either way.

> We ran some tests here on a particular flash chip type to try and 
> determine at least some of the failure modes that are related to block 
> wear (due to write/erase) and bit decay (due to reading). The end result 
> was basically what I tried to describe above, but I can go into more 
> detail if you're interested.

I do remember your mail describing the test.  One of the interesting
conclusions is that even awefully worn out block is still good enough to
store short-lived information.  It appears to be a surprisingly robust
strategy to have a high wear-out, as long as you keep the wear
constantly high and replace block contents at a high rate.

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike

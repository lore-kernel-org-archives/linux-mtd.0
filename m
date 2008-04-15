Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jlmy6-0002Qq-Dw
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 15:21:12 +0000
Date: Tue, 15 Apr 2008 16:21:04 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: Is there possible to integrate mtd ubi ubifs latest version in
	one git tree?
Message-ID: <20080415152104.GA8513@shareable.org>
References: <bae050c10804102348sceaef1bh557ecce22a96b03f@mail.gmail.com>
	<1207994233.5965.124.camel@sauron>
	<1207995042.5965.136.camel@sauron>
	<bae050c10804132146t284e9a3pd3952c30a7e892c7@mail.gmail.com>
	<1208163958.5965.158.camel@sauron>
	<20080415114135.GA3556@shareable.org>
	<1208259858.5965.220.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1208259858.5965.220.camel@sauron>
Cc: Nancy <nancydreaming@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Tue, 2008-04-15 at 12:41 +0100, Jamie Lokier wrote:
> > If erase counters are stored at the start of each block, for the block
> > itself, what happens in this sequence?
> > 
> >     1. Begin erase block.
> >     2. Erase succeeds.
> >     3. Power failure / system reset / watchdog / etc.
> >     4. ....?
> > 
> > Is the erase counter zeroed as a result of this?
> 
> It tries to minimize probability of situations like this by writing the
> EC right after the erasure. But this still can happen of course. In this
> case UBI uses the average erase-counter (calculated while scanning is
> done) and writes it to this eraseblock.

Oh, using the averase erase-counter is smart, I like that. :-)

Erase can be quite slow on some kinds of flash, and the race window is
the whole erase time.  And during some activities, many sequential
erases are done.

It would be good if the erase-counters (and indeed metadata needed for
fast mounting) were also records in the log/trees held in other
blocks, but I guess you'd need to closely couple with the filesystems
logging.  And that would be a layer violation, tricky and ugly in the
UBI API.

-- Jamie

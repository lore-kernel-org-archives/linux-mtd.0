Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CuGAu-0003Nl-3w
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2005 15:23:33 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501271719470.11160@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
	<Pine.LNX.4.58.0501271719470.11160@phoenix.infradead.org>
Content-Type: text/plain
Date: Thu, 27 Jan 2005 21:23:29 +0100
Message-Id: <1106857409.21196.58.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 memory consumption
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-01-27 at 17:35 +0000, Artem B. Bityuckiy wrote:
> On Wed, 26 Jan 2005, David Woodhouse wrote:
> > We can also look at true write-behind caching, if we're a _lot_ more
> > careful about free space than we are now. To have data outstanding in
> > the page cache, we need to be able to guarantee that we have enough free
> > space to write it out, and we need to be able to write it out _without_
> > allocating memory. That includes any memory which might be required for
> > GC. Doing that would allow us to coalesce writes so we fill a page (or a
> > full node size) more often.
> 
> How do you think, if we implement write-back caching (I do not imagine 
> how yet) then will we still need to distinguish between "pristine" and 
> "normal" nodes?
> 
> Since JFFS2 is now write-through, we do write small data chunks if there 
> are few changes in the cache. This is for space efficiency, right?

Keep it write-through !

Write caching is contrary to powerfail robustness.

It worked always that way and many embedded users rely on this. If you
want to have the writes cached, then make it an option and not the
default behaviour. But then you have still to think about the solution
for the non cached case.

We discussed the two writeblock approach for long. I think its the happy
medium.

Writeblock A is used for GC and direct write of pristine nodes. 

Writeblock B is used for direct write through of normal nodes and all
the noise which happens when files are written in small chunks.

When B becomes full, it is immidiately recycled into A. So GC can merge
the tiny nodes and remove the obsolete ones.

This will also reduce memory consumption, as you have only those noisy
nodes in two blocks (the active B block and the previous B block, which
is actually recycled). 

And you still preserve the powerfail robustness.

> In case of write-back cache, a lot of small changes will be merged to the 
> page and we possibly may just write it fully. Perhaps, we might not bother 
> writing only part of page.
>
> The agvantage of this is that we will not need to overcompicate the GC 
> getting it merge "normal" nodes and produce "pristine" ones. All our nodes 
> will be pristine.
> 
> On commit_write request we may really write several neigbour pages either 
> if they are marked dirty, thus having nodes with several pages.
> 
> If we have only 4K-multiple data chunks on nodes, we will even save some 
> RAM (both in-core and fragtree).

That's just imagination. Analyse a couple of JFFS2 images to figure out
how many 4k multiple data chunks you have. Those which are live usually
in a part of the filesystem which is almost never updated
(/bin, /lib ....) on embedded systems. 

The parts where data are written frequently are usually 

logging, data acquisition and data bases. All of them have one in
common: small writes. And most of them are sensitive to data loss.

tglx

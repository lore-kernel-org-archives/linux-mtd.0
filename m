Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163mTU-0005OM-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2001 22:56:12 +0000
Date: Wed, 14 Nov 2001 02:15:22 +0100 (CET)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: joakim.tjernlund@lumentis.se, linux-mtd@lists.infradead.org
Subject: Re: Fwd: Cache mappings and invalidate 
In-Reply-To: <11915.1005671360@redhat.com>
Message-ID: <Pine.LNX.4.21.0111140207080.11644-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 13 Nov 2001, David Woodhouse wrote:
> No. I suggested we implement simon_says_flush_dcache_range() et al, but 
> Linus didn't seem to like that :)
> 
> > > Linus seems to think this is a Good Thing. 
> > hmm, why should this be a Good Thing?
> 
> No clue.

I don't know what he is thinking exactly, but one reason is that there is
no way the arch-independent code can know for sure that a cache _needs_ to
be flushed in many cases, because there are so many ways to design a
cache. Erasing a flash sector is obvious, but other things are not and you
certainly don't want to flush the cache if you don't absolutely need to.

All it can do is give a hint which might be useful to implement in some
architectures only.. For example, a cache invalidate is called all the
time during page remappings, but for most architectures you don't need to
flush it at those times and doing it would just waste time. 

So what you really want, is to rename those cache flushes in the mm code
into a name saying what they try to do, let some archs implement that as a
cache flush if needed, and reserve the real cache flush code into a
function that you need to implement (and use that in MTD perhaps).

You _dont_ want to implement the flush_cache_* functions that exist right
now on all architectures, not the way they are used.

/BW

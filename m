Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Co0TR-0000Ub-9M
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 09:24:51 -0500
Date: Mon, 10 Jan 2005 15:24:31 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050110142431.GA12520@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<1f9886eb0412221014256b83e6@mail.gmail.com>
	<20041223135231.GB24503@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501060954230.5460@phoenix.infradead.org>
	<20050108201442.GA11728@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501091138240.19297@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501091138240.19297@phoenix.infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 9 January 2005 11:39:42 +0000, Artem B. Bityuckiy wrote:
> Joern Engel wrote:
> > 
> > static uint32_t adler32_tailcheck(const void *buf, size_t len)
> > {
> > 	uint32_t end = *(uint32_t*) (buf + len - 4); /* last word */
> > 	return adler32(end, buf, len);
> > }
> > 
> Looks like good idea!
> 
> We do not yet sure we're going to use adler32 CRC, may be engel32 or 
> reverse version. I hope test I've written will clarify this if people run 
> it on different platforms. But preliminary results show that 
> adler32/adler32r is the winner. Will wait and see.

Same trick should help engel32 as well.  Crc32 doesn't need it,
although it might be an idea to pick a non-zero initial value.
Rationale for that was in the excellent link you passed.

> By the way, I added your name to test Copyright, as you asked :-) If you 
> mention some inconsistency/bug there, fill free to change it yourself :-)

Thanks. :)
Work has started again, so don't expect too much from me for a while.

> > Correct, although I don't care too much.  If you pull the power while
> > writing, you'll lose data.  Yes, with some care you lose less data,
> > but some extra milliseconds of power would have done the same.
> I suppose you are right if we speak about errors due to unclean reboots.

We do.

> But if we speak about errors due to Flash media corruptions? This is 
> typical for NAND if bad blocks appear from time to time. I do not know 
> exactly how does this happen. But if we suppose when it happens - just 
> several bits on some page(es) become permanently bogus, there is big 
> difference if we recover good data from these pages or not. If we do not, 
> we loose much more. For example, we may loose direntry of some important 
> file (and file will disappear).

That is the GAU for jffs2, no doubt.  If at all possible, we MUST make
sure that data is moved from the bad blocks BEFORE they rot away!
As soon as we start to lose data due to rotten flash, the design is
broken.  Users might care enough to recover as much data as possible,
embedded systems can simply be put into the nearest trash bin.

So, I don't care much about how gracefully we handle this case.  Maybe
there is a 99% chance that only redundant/obsolete data is lost.
Doesn't matter.  The same thing will happen again and after 70 such
incidents, you're down to 50%.  So all you gained is some time before
the hardware hits the bin.  Oh golly!

...

So either we can make sure this case never happens, or we can't.  It
depends on the type of flash, for sure, and it may be pretty hard with
some types.  But if it doesn't work at all, the flash is broken,
period.

Same with hard drives.  They also rot over time, but their internal
logic is good enough to hide that fact from you.  Until - one fine day
- there has been too much rot going on and it fails completely.  You
can protect against that with backups, raids or simply buying a new
driver every other year.  No fs will ever help you.

Jörn

-- 
He who knows others is wise.
He who knows himself is enlightened.
-- Lao Tsu

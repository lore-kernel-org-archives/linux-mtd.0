Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JG3kC-0000t0-Qz
	for linux-mtd@lists.infradead.org; Sat, 19 Jan 2008 02:47:41 +0000
Date: Sat, 19 Jan 2008 03:38:39 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080119023838.GA17136@lazybastard.org>
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
	<20080117114353.0bc71dac@zod.rchland.ibm.com>
	<2B52FCEB-D871-4D9B-81D1-E03F7698AF96@logicaloutcome.ca>
	<20080118183900.GC21136@shareable.org>
	<20080118210019.GA16849@lazybastard.org>
	<20080119002302.GA567@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080119002302.GA567@shareable.org>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org,
	Glenn Henshaw <thraxisp@logicaloutcome.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 19 January 2008 00:23:02 +0000, Jamie Lokier wrote:
> Jörn Engel wrote:
> > 
> > There are two ways to solve this problem:
> > 1. Reserve some amount of free space for GC performance.
> 
> The real difficulty is that it's not clear how much to reserve for
> _reliable_ performance.  We're left guessing based on experience, and
> that gives only limited confidence.  The 5 blocks suggested in JFFS2
> docs seemed promising, but didn't work out.  Perhaps it does work with
> 5 blocks, but you have to count all potential metadata overhead and
> misalignment overhead when working out how much free "file" data that
> translates to?

The five blocks work well enough if your goal is that GC will return
_eventually_.  Now you come along and even want it to return within a
reasonable amount of time.  That is a different problem. ;)

Math is fairly simple.  The worst case is when the write pattern is
completely random and every block contains the same amount of data.  Let
us pick a 99% full filesystem for starters.

In order to write one block worth of data, GC need to move 99 blocks
worth of old data around, before it has freed a full block.  So on
average 99% of all writes handle GC data and only 1% handly the data you
- the user - care about.  If your filesystem is 80% full, 80% of all
writes are GC data and 20% are user data.  Very simple.

Latency is a different problem.  Depending on your design, those 80% or
99% GC writes can happen continuously or in huge batches.

> Really, some of us just want JFFS2 to return -ENOSPC
> at _some_ sensible deterministic point before the GC might behave
> peculiarly, rather than trying to squeeze as much as possible onto the
> partition.

Logfs has a field defined for GC reserve space.  I know the problem and
I care about it.  Although I have to admit that mkfs doesn't allow
setting this field yet.

> > 2. Write in some non-random fashion.
> > 
> > Solution 2 works even better if the filesystem actually sorts data
> > very roughly by life expectency.  That requires writing to several
> > blocks in parallel, i.e. one for long-lived data, one for short-lived
> > data.  Made an impressive difference in logfs when I implemented that.
> 
> Ah, a bit like generational GC :-)

Actually, no.  The different levels of the tree, which JFFS2 doesn't
store on the medium, also happen to have vastly different lifetimes.
Generational GC is the logical next step, which I haven't done yet.

Jörn

-- 
Science is like sex: sometimes something useful comes out,
but that is not the reason we are doing it.
-- Richard Feynman

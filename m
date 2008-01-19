Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JG2qP-0005k4-IG
	for linux-mtd@lists.infradead.org; Sat, 19 Jan 2008 01:50:01 +0000
Date: Sat, 19 Jan 2008 00:23:02 +0000
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080119002302.GA567@shareable.org>
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
	<20080117114353.0bc71dac@zod.rchland.ibm.com>
	<2B52FCEB-D871-4D9B-81D1-E03F7698AF96@logicaloutcome.ca>
	<20080118183900.GC21136@shareable.org>
	<20080118210019.GA16849@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080118210019.GA16849@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, Glenn Henshaw <thraxisp@logicaloutcome.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> If you want to make GC go berzerk, here's a simple recipe:
> 1. Fill filesystem 100%.
> 2. Randomly replace single blocks.
> 
> There are two ways to solve this problem:
> 1. Reserve some amount of free space for GC performance.

The real difficulty is that it's not clear how much to reserve for
_reliable_ performance.  We're left guessing based on experience, and
that gives only limited confidence.  The 5 blocks suggested in JFFS2
docs seemed promising, but didn't work out.  Perhaps it does work with
5 blocks, but you have to count all potential metadata overhead and
misalignment overhead when working out how much free "file" data that
translates to?  Really, some of us just want JFFS2 to return -ENOSPC
at _some_ sensible deterministic point before the GC might behave
peculiarly, rather than trying to squeeze as much as possible onto the
partition.

> 2. Write in some non-random fashion.
> 
> Solution 2 works even better if the filesystem actually sorts data
> very roughly by life expectency.  That requires writing to several
> blocks in parallel, i.e. one for long-lived data, one for short-lived
> data.  Made an impressive difference in logfs when I implemented that.

Ah, a bit like generational GC :-)

-- Jamie

Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AFXQU-0005CD-4E
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2003 11:26:46 +0000
Date: Fri, 31 Oct 2003 12:24:21 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20031031112421.GC5604@wohnheim.fh-wedel.de>
References: <Law11-F26lgYBr4BvRn0000b9c5@hotmail.com>
	<1067539988.3423.208.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1067539988.3423.208.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: jffs-dev@axis.com
cc: J B <mad_flasher@hotmail.com>
Subject: Re: jffs2 fragmentation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 October 2003 18:53:08 +0000, David Woodhouse wrote:
> On Sat, 2003-10-18 at 09:20 -0500, J B wrote:
> > Normally, a rm/cp pair takes about 2 minutes on my system.  After about 10 
> > iterations, the copies begin to take longer, about 3-4 minutes.   After 
> > about 10 iterations they take upwards of 1/2 an hour.
> 
> I suspect you've triggered the worst case of a performance bug which
> I've known about for a while.
> 
> We should write new data out to one empty block, while writing out
> garbage-collected data out to another. We don't do that at the moment;
> we interleave old and new data and then you erase your new file, leaving
> us with a very suboptimal mix of valid and obsolete nodes in each
> eraseblock we've been writing to.
> 
> I'm still a bit surprised it takes half an hour though. 

If your explanation is correct, a shift from 4 to 28 minutes would
correspond to 6 clean nodes reused for every 1 dirty node deleted and
new node written.

Doesn't make a lot of sense with a filesystem that should be >80% free
or dirty, does it?

Jörn

-- 
Fools ignore complexity.  Pragmatists suffer it.
Some can avoid it.  Geniuses remove it.
-- Perlis's Programming Proverb #58, SIGPLAN Notices, Sept.  1982

Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEr1H-0006eK-Vd
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 19:00:20 +0000
Date: Tue, 15 Jan 2008 17:35:10 +0000
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: JFFS2 determine writing state
Message-ID: <20080115173510.GC16677@shareable.org>
References: <298338.39997.qm@web56002.mail.re3.yahoo.com>
	<20080111075730.052c821d@zod.rchland.ibm.com>
	<20080112100343.GC1497@shareable.org>
	<20080112141508.22b19686@vader.jdub.homelinux.org>
	<20080115140759.GE11941@shareable.org>
	<20080115165043.GD22338@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080115165043.GD22338@lazybastard.org>
Cc: Jeff S <jsolman33@yahoo.com>, Josh Boyer <jwboyer@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> On Tue, 15 January 2008 14:08:00 +0000, Jamie Lokier wrote:
> > But the particular fs behaviour is relevant the other way around: I
> > have a program which calls open/write/close with small writes
> > moderately often (because it calls another program which actually
> > operates on the file).
> > 
> > If JFFS2 commits pending writes on every close, I should change things
> > to keep the file open between writes so they are coalesced and faster,
> > when I don't need the individual writes to be committed separately.
> 
> JFFS2 also commits on every write.  So you need userspace caching if you
> want to coalesce things.  fwrite might be enough for that...

Oh, ok, I thought it at least merged things in the page cache like
most other filesystems.  It seems it's more like O_DSYNC - or more
like O_SYNC (commits metadata changed for every write too)?

Is there a particular advantage, in terms of flash overhead,
compression, or mount/gc times, to writing blocks with a particular
size and alignment, such as 4k size and 4k offset-alignment-in-file?

Also, does LogFS (which I want to try later) have similar
characteristics?

> > When I do need the data committed I can use fsync of course.
> 
> ...as long as you also fflush (or fclose) before fsync.

Sure.  Thanks for your response.

-- Jamie

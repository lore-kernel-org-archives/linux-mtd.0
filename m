Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEnmj-0001ra-4P
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 15:33:05 +0000
Date: Tue, 15 Jan 2008 14:08:00 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: JFFS2 determine writing state
Message-ID: <20080115140759.GE11941@shareable.org>
References: <298338.39997.qm@web56002.mail.re3.yahoo.com>
	<20080111075730.052c821d@zod.rchland.ibm.com>
	<20080112100343.GC1497@shareable.org>
	<20080112141508.22b19686@vader.jdub.homelinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080112141508.22b19686@vader.jdub.homelinux.org>
Cc: linux-mtd@lists.infradead.org, Jeff S <jsolman33@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> On Sat, 12 Jan 2008 10:03:43 +0000 Jamie Lokier <jamie@shareable.org> wrote:
> 
> > Josh Boyer wrote:
> > > The open call doesn't cause any writes, and close
> > > is supposed to flush all pending writes before it returns.
> > 
> > Oh, that's interesting.  So on JFFS2, fsync() is unnecessary
> > before close()?
> > 
> > (On other filesystems it's necessary, of course).
> 
> To be honest, it doesn't really matter if it's necessary or not.
> Writing an application to do as little as possible based on implicit
> knowledge of the underlying filesystem seems like a really bad idea.
> Particularly with the behavior of the filesystem can change based on
> which config options you have set (writebuffer, etc).
> 
> Write you applications to be portable and cautious and you shouldn't
> have a problem.

That's quite reasonable and of course I do call fsync, both on a file
before closing it, and then on its parent directory after renaming a
replacement file into place (just like usual mail software).

But the particular fs behaviour is relevant the other way around: I
have a program which calls open/write/close with small writes
moderately often (because it calls another program which actually
operates on the file).

If JFFS2 commits pending writes on every close, I should change things
to keep the file open between writes so they are coalesced and faster,
when I don't need the individual writes to be committed separately.
When I do need the data committed I can use fsync of course.

In which case, if a program A opens a file on JFFS2, and forks/execs
program B which writes data, then does an implicit close (when it
exits), while B's writes be committed immediately (which isn't wanted)
even though A still has the descriptor open?

Thanks,
-- Jamie

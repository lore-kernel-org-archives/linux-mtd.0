Subject: Re: Exporting jffs2 by nfs with kernel 2.6
From: David Woodhouse <dwmw2@infradead.org>
To: Neil Brown <neilb@suse.de>
In-Reply-To: <17691.31720.574063.577742@cse.unsw.edu.au>
References: <305035a40609270731n150513b4obe4249b461a3d1bc@mail.gmail.com>
	<1159425799.3309.168.camel@pmac.infradead.org>
	<17691.28881.23347.92421@cse.unsw.edu.au>
	<1159427232.3309.186.camel@pmac.infradead.org>
	<17691.31720.574063.577742@cse.unsw.edu.au>
Content-Type: text/plain
Date: Thu, 28 Sep 2006 08:50:05 +0100
Message-Id: <1159429805.3309.204.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Gregory CLEMENT <gclement00@gmail.com>,
	viro@zeniv.uk.linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-09-28 at 17:38 +1000, Neil Brown wrote:
> You keep some data on all inodes in RAM all the time?  I didn't
> realise that.  Maybe I should look at jffs2 someday.  Might be interesting.

Purely log-structured. There _is_ no structure on the medium; just a
bunch of log entries (with incrementing version numbers) saying what
changed. To know the current state of the filesystem you have to
'replay' those log entries to work it out.

http://david.woodhou.se/jffs2.pdf
http://david.woodhou.se/jffs2-slides-transformed.pdf

We scan the medium at mount time and keep in core _just_ enough to be
able to do read_inode() on demand for each inode on the medium -- which
is mostly just a list of the physical log entries (nodes) belonging to
that inode, and its nlink.

It's a design which worked quite well on file systems of sizes around
64MiB, but now we have sizes like 512MiB on the $100 laptop we're
starting to get close to the limits of its usefulness.

Memory usage (and mount time) scales linearly with the size. We've done
a whole bunch of optimisations recently to reduce both, but we're just
tweaking the constants, and it still scales linearly -- but certainly
the prospect of _adding_ to the in-core data structures doesn't fill me
with joy.

> I think it has been the case every since the dcache existed.
> The locking that 'rename' does to ensure you don't create a disconnect
> subtree with concurrent renames requires a full path from the root
> down to each directory.

Hm, OK -- but doing this in the file system is a new thing isn't it? We
haven't had the get_parent() operation provided by the file system for
that long?

> > Hmm.... I wonder if I could abuse the nlink field we already have, and
> > use it to remember the parent inode in the case of directories. Is it OK
> > for get_parent() to return a correct answer only for directories, and
> > -ESTALE for files? Do we still use disconnected dentries for files in
> > that case, or will that be visible to the client as -ESTALE errors on
> > files?
> 
> If the filesystem is exported with no_subtree_check, then get_parent
> will only ever be called on directories.  The default is currently
> subtree_check, but I am planing on inverting the default one day soon.

OK. Can I force no_subtree_check for JFFS2 exports, or at least bitch
about it and fail if the user tries to do otherwise?

> > 
> > > > > Second, nfs need to identify the filesystem to export. It is done
> > > > > either by the device of the filesystem or by a "fsid". I didfn't see any
> > > > > filesystem use a "fsid" and I don't know how to use it. So identification
> > > > > is made if FS_REQUIRES_DEV is set. The problem was in kernel 2.5.7,
> > > > > this flag was removed because "We never really used the block device anyway".
> > > > > Do you mind setting this flag again? Or have you a better idea?
> > > > 
> > > > I suspect that we should add another export_ops function for get_fsid().
> > > 
> > > Possibly.  but the normal approach with none-FS_REQUIRES_DEV
> > > filesystems is to specify an fsid= in /etc/exports.
> > 
> > It's not infeasible that other types of file system will have constant
> > fsids which can be provided by the file system code though. I'll take a
> > look at doing this.
> 
> True.  But you need an id that is unique with respect to all other
> possible filesystems.  And you have only have about 32 bits.....

I'll just pretend it's a block device /dev/mtdblock$n corresponding to
the MTD device we're actually using -- that's how I do get_sb() too.

-- 
dwmw2

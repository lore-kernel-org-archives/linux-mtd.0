Received: from mx2.suse.de ([195.135.220.15])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GSqUS-00011L-8f
	for linux-mtd@lists.infradead.org; Thu, 28 Sep 2006 08:39:29 +0100
From: Neil Brown <neilb@suse.de>
To: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 28 Sep 2006 17:38:16 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17691.31720.574063.577742@cse.unsw.edu.au>
Subject: Re: Exporting jffs2 by nfs with kernel 2.6
In-Reply-To: message from David Woodhouse on Thursday September 28
References: <305035a40609270731n150513b4obe4249b461a3d1bc@mail.gmail.com>
	<1159425799.3309.168.camel@pmac.infradead.org>
	<17691.28881.23347.92421@cse.unsw.edu.au>
	<1159427232.3309.186.camel@pmac.infradead.org>
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

On Thursday September 28, dwmw2@infradead.org wrote:
> > Yes.  You need a get_parent function.
> > Minimally it can just return -ESTALE, but that can propagate out to
> > the client if your dcache gets flushed or you reboot.  It is best to
> > do it properly, and shouldn't be too hard (providing your directories
> > actually have a ".." or equivalent).
> 
> They don't. OTOH, it might not be impossible to record that information
> if it's really necessary. Since it's a purely log-structured file system
> we have to keep a lot of information in RAM at all times anyway,
> including a small amount of data for each inode on the file system. We
> _do_ know the parent inode when we initially scan the medium, so we
> could feasibly store that information by expanding the existing
> per-inode data structure. (struct jffs2_inode_cache)

You keep some data on all inodes in RAM all the time?  I didn't
realise that.  Maybe I should look at jffs2 someday.  Might be interesting.

> 
> > > By do we need that anyway? I thought we used to just have disconnected
> > > dentries until we happen to find their place in the tree, at which point
> > > we connect them.
> > 
> > Disconnected dentries are fine for files, but not for directories.
> > For directories, the VFS invariants really require a full path down
> > from the root to be in the dcache.
> 
> Hm. That wasn't the case in the past; that's an unfortunate development,
> from this point of view. This file system was designed for Linux, but
> that didn't include the possibility of finding parents like that. I
> suppose I could do it, but it means an increase in RAM usage.

I think it has been the case every since the dcache existed.
The locking that 'rename' does to ensure you don't create a disconnect
subtree with concurrent renames requires a full path from the root
down to each directory.

There might be other more subtle dependencies.

> 
> Hmm.... I wonder if I could abuse the nlink field we already have, and
> use it to remember the parent inode in the case of directories. Is it OK
> for get_parent() to return a correct answer only for directories, and
> -ESTALE for files? Do we still use disconnected dentries for files in
> that case, or will that be visible to the client as -ESTALE errors on
> files?

If the filesystem is exported with no_subtree_check, then get_parent
will only ever be called on directories.  The default is currently
subtree_check, but I am planing on inverting the default one day soon.

> 
> > > > Second, nfs need to identify the filesystem to export. It is done
> > > > either by the device of the filesystem or by a "fsid". I didfn't see any
> > > > filesystem use a "fsid" and I don't know how to use it. So identification
> > > > is made if FS_REQUIRES_DEV is set. The problem was in kernel 2.5.7,
> > > > this flag was removed because "We never really used the block device anyway".
> > > > Do you mind setting this flag again? Or have you a better idea?
> > > 
> > > I suspect that we should add another export_ops function for get_fsid().
> > 
> > Possibly.  but the normal approach with none-FS_REQUIRES_DEV
> > filesystems is to specify an fsid= in /etc/exports.
> 
> It's not infeasible that other types of file system will have constant
> fsids which can be provided by the file system code though. I'll take a
> look at doing this.

True.  But you need an id that is unique with respect to all other
possible filesystems.  And you have only have about 32 bits.....

Thought I guess if we didn't care too much about NFSv2 would could
allow nearly 32 bytes.... certainly 16bytes...  Maybe that is a good
direction to go.

NeilBrown

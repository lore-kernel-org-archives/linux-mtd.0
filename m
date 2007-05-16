Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ho93Z-0006jb-2K
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 22:16:02 -0400
Date: Wed, 16 May 2007 04:11:39 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070516021139.GA3175@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515133759.9ee434a2.akpm@linux-foundation.org>
	<20070516000630.GD1220@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070516000630.GD1220@lazybastard.org>
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
	Ingo Oeser <ioe-lkml@rameria.de>, Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 May 2007 02:06:31 +0200, Jörn Engel wrote:
>
> > > +
> > > +	if (dest) {
> > > +		/* symlink */
> > > +		ret = logfs_inode_write(inode, dest, destlen, 0);
> > > +	} else {
> > > +		/* creat/mkdir/mknod */
> > > +		ret = __logfs_write_inode(inode);
> > > +	}
> > > +	super->s_victim_ino = 0;
> > > +	if (ret) {
> > > +		if (!dest)
> > > +			li->li_flags |= LOGFS_IF_STILLBORN;
> > > +		/* FIXME: truncate symlink */
> > > +		inode->i_nlink--;
> > > +		iput(inode);
> > > +		goto out;
> > > +	}
> > > +
> > > +	if (inode->i_mode & S_IFDIR)
> > > +		dir->i_nlink++;
> > 
> > You have helper functions for i_nlink++, which remember to do
> > mark_inode_dirty()?
> 
> I do.  Looks like I should use them here and in at least one other
> place.  Will recheck them all.

Actually, this code was correct.  New inodes get written immediatly to
ensure catching -ENOSPC at a place where errors can get returned.  After
leaving this function, the inode is not dirty.  Either it has been
written or it is marked LOGFS_IF_STILLBORN never will be.

Your intuition was still good.  Link() did need the change you
indicated.

Jörn

-- 
Joern's library part 14:
http://www.sandpile.org/

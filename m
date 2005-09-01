Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EAnV3-0002XW-5e
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 07:45:04 -0400
Date: Thu, 1 Sep 2005 13:44:38 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
Message-ID: <20050901114438.GA694@wohnheim.fh-wedel.de>
References: <20050901100535.GA30932@wohnheim.fh-wedel.de>
	<1125573176.30825.17.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1125573176.30825.17.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
Subject: Re: PATCH: allow JFFS2 to write to really small disks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 1 September 2005 13:12:56 +0200, Øyvind Harboe wrote:
> 
> > > 	/* When do we let the GC thread run in the background */
> > >  
> > > 	c->resv_blocks_gctrigger = c->resv_blocks_write + 1;
> > 
> > Minor stuff: You indentation is broken.
> 
> Will fix of course. What emacs mode should I use for indentation? :-)

No idea, I use vim.  Try to mimic existing code, use scripts/Lindent
or read Documentation/CodingStyle.

> > If you changed the patch to add a mount option for the WORM case and
> > check for the mount option instead, this might go in.  Looks like it
> > could be useful.
> 
> I prefer it the way it is now. There are less options to read up on and
> document.
> 
> W.r.t. documentation it would possibly call for a footnote that the
> JFFS2 disk will only support read/write many times if it is large
> enough. If it is too small, it only supports Write Once Read Many. 
> 
> What do you think?

I think that most users don't want JFFS2 to run in WORM mode.  And for
those users, failing on every write is actually better.  They notice
the problem right away, not just after a while.

People that want WORM mode are the minority and therefore should be
the ones that are inconvenienced.

Jörn

-- 
The only real mistake is the one from which we learn nothing.
-- John Powell

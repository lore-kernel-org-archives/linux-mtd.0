Received: from exprod7og102.obsmtp.com ([64.18.2.157])
	by bombadil.infradead.org with smtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRqAh-0006pq-Ei
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 14:43:44 +0000
Date: Wed, 20 Feb 2008 14:43:39 +0000
From: Stephane Chazelas <stephane.chazelas@emerson.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2.6.24] block2mtd: removing a device and typo fixes
Message-ID: <chaz20080220144339.GK4539@artesyncp.com>
References: <chaz20080212134751.GI30304@artesyncp.com>
	<chaz20080212161034.GJ30304@artesyncp.com>
	<20080219150822.GA29587@lazybastard.org>
	<200802192333.39707.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200802192333.39707.arnd@arndb.de>
Cc: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008-02-19 23:33:38 +0100, Arnd Bergmann:
> On Tuesday 19 February 2008, you wrote:
> > > What about having a /dev/block2mtd (with owner/permissions that
> > > could allow non-root users to use it), with 2 ioctls:
> > > 
> > > - one to "link" a block dev to a mtd that would take as
> > >   parameter a fd to an open block dev (again allowing for
> > >   flexible permissions) and would return the number of the
> > >   allocated mtd and success/failure in errno. Upon sucess it
> > >   would increase the refcnt of block2mtd.
> > > 
> > > - and one to "release" the link. That would fail if the mtd is
> > >   in use and decrease block2mtd's refcnt upon success.
> > > 
> > > A bit like the loop devices (or /dev/ptmx) actually. What do you
> > > think?
> > 
> > Could work.  Passing the fd raises several alarm bells.  Arnd, any
> > comments from you?
> 
> Given that loop works in this way, I certainly see that as doable,
> but then I'd vote for using the existing ioctl semantics of
> LOOP_SET_FD and LOOP_DEL_FD on the mtdchar device, which already
> comes with an ioctl interface for mtd devices.
> I'd probably also allow the LOOP_{GET,SET}_STATUS{,64} commands,
> so you can actually use the existing losetup tool.
> That way, we wouldn't have to introduce a new API, just extend
> an existing one to work on more things.
[...]

Hi Arnd,

note that for "loop", you have /dev/loop0, /dev/loop1... which
makes it a pain to handle

For block2mtd, you don't need several device files in /dev, you
only need one to pass ioctls down to create mtd devices.

That may end up creating new /dev devices via mtdblock or
mtdblock_ro for instance.

So I'm not sure reusing the "loop" ioctls is a good idea.

Cheers,
Stephane

Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch2L6-0004kk-IV
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 03:59:26 -0500
Date: Wed, 22 Dec 2004 09:59:22 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
Message-ID: <20041222085921.GA31282@wohnheim.fh-wedel.de>
References: <20041221210916.00C8CA00096@mail.murgatroid.com>
	<m33bxzvyl7.fsf@maxwell.lnxi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m33bxzvyl7.fsf@maxwell.lnxi.com>
Cc: Christopher Hoover <ch@murgatroid.com>,
	'Linux MTD' <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 13/22] remove erase regions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 December 2004 19:47:00 -0700, Eric W. Biederman wrote:
> "Christopher Hoover" <ch@murgatroid.com> writes:
> > >From Jörn Engel [mailto:joern@wohnheim.fh-wedel.de] - 
> > > On Tue, 21 December 2004 10:42:07 -0800, Christopher Hoover wrote:
> > > > >From Jörn Engel -
> > > > > I see absolutely no reason for complicated erase reagions.  On the
> > > > > user side, everyone but mtdchar effectively ignores it anyway.
> > > > 
> > > > I don't grok this.   What about flash with variable-sized 
> > > blocks?  (I have a
> > > > board with such flash and code that uses eraseregions.)
> > > 
> > > Sure, from AMD or some other compatible manufacturer.  The
> > > variable-sized blocks were nice until there were better solutions to
> > > the problem, like jffs2.  Jffs2 exists, so they are largely useless.
> 
> jffs2 is only a solution on large NOR flash parts.

True.  I've been meaning to scale jffs2 down, but never found the
time.

> However I find this conversation confusing.  The patches appear to affect
> just mtdblock.c.

The other way around, blockmtd.c.  Which is a cleaned up version of
blkmtd.c.  It turns a block device into an mtd device, not vice versa.
Name is confusing, so if you have a better one...

> Which sounds like it is exclusively the mtd block device.
> At which point I don't see a problem with simply removing variable erase
> size for the silly block device emulation code.
> 
> Now if someone wants to remove something silly the block device emulation
> sounds like a fine place to start.  Just to place the silliness on the
> other foot.

Both emulations have valid uses:
mtd -> block device:
Very simple block devices.  It is much simpler to write an mtd device
than a block device.  Right now, all known-to-me users of phram use it
as a block device.

block device -> mtd:
Cheap flash media.  Jffs2 helps on usb sticks as well, so turn those
puppies into mtds and be done.

> > > 5 does, but is horribly ugly and noone cares enough to clean it up. 
> 
> If it ain't broke don't fix it.  Besides I have trouble seeing how 500 lines
> of code can be horribly ugly.  

o read-only devices that confuse every single new user
o #define MAX_KMALLOC_SIZE 0x20000
o FIXME: This _really_ needs to die. In 2.5, we should ...

> > This is not a reason to toss it.  We don't capriciously break user space
> > interfaces in Linux.

I don't.  Instead I take a driver I'm unhappy with, copy it, and
change the parts I don't like in the copy.  Nothing breaks on your
side.

> > Also this:
> > 
> > 6. The hook that unlocks locked-on-power-up flash, such as (*surprise*) C3
> > flash.  It needs to call unlock with the start address of each block.  It
> > needs eraseergions to do that.
> 
> If Christopher is reading this right I agree that killing variable
> erase sizes across the board is a very bad idea.

He isn't.

To finally lift all the confusion:
This is about the blockmtd driver, nothing else.  Said driver takes a
block device and turns it into an mtd.  And for an bd-based mtd, there
is _no_ point in having complicated erase regions.

For regular flash, I consider them to be silly as well, but there are
so many silly things that people like.  Let them have fun, as long as
noone gets hurt.

Jörn

-- 
The only real mistake is the one from which we learn nothing.
-- John Powell

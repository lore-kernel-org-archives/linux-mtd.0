Received: from atlantis.8hz.com ([212.129.237.78])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DisxZ-0008Q4-8o
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2005 07:55:04 -0400
Date: Thu, 16 Jun 2005 13:54:59 +0200
From: Sean Young <sean@mess.org>
To: Joern Engel <joern@wohnheim.fh-wedel.de>
Message-ID: <20050616115459.GA70753@atlantis.8hz.com>
References: <20050613123626.GB30868@wohnheim.fh-wedel.de>
	<20050614192809.GA46302@atlantis.8hz.com>
	<20050614221844.GB17547@wohnheim.fh-wedel.de>
	<20050615192754.GA60103@atlantis.8hz.com>
	<20050615210155.GA32750@wohnheim.fh-wedel.de>
	<20050616091546.GA68824@atlantis.8hz.com>
	<20050616102905.GA2166@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050616102905.GA2166@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Embedded bios FTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 16, 2005 at 12:29:05PM +0200, Joern Engel wrote:
> On Thu, 16 June 2005 11:15:46 +0200, Sean Young wrote:

-snip chucking unused sectors-

> > Indeed so. Besides, it would be more elegant if the file system driver 
> > passed this on to the block device, via an ioctl. Would such a thing
> > stand up to scrutiny? As far as I can see, only the ftl block devices 
> > would benefit.
> 
> An ioctl() would have a *really* hard time to make it into the kernel.

I agree that ioctl()s are ugly, but it does have the advantage that it 
is accessible from user-space. Excuse my ignorance, but what is the 
motivation for this?

> What you could do, however, might be something similar to this:
> 
> o Add an erase() function to stuct block_device_operations
> o Have fat call that function whenever a block is know unused.
> o Make sure only to call the function, if it's non-NULL.  Maybe a
>   wrapper, maybe just
> 	if (bd_ops->erase)
> 		bd_ops->erase(block);
>   inside fs/fat/.
> o Implement erase() for your ftl driver to do something smart.
> 
> Be careful, though.  I haven't worked on block devices for a very long
> time and could be talking out of my arse.  If you send such a patch to
> akpm and get flamed into a pile of ashes - don't blame me. ;)

I'll have to spend more time looking at the block devices/bio code 
before I can start. :)

erase() sounds rather mtd-specific. Wouldn't stale() be better?


Sean

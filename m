Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DircR-0007df-AF
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2005 06:29:08 -0400
Date: Thu, 16 Jun 2005 12:29:05 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Sean Young <sean@mess.org>
Message-ID: <20050616102905.GA2166@wohnheim.fh-wedel.de>
References: <20050613123626.GB30868@wohnheim.fh-wedel.de>
	<20050614192809.GA46302@atlantis.8hz.com>
	<20050614221844.GB17547@wohnheim.fh-wedel.de>
	<20050615192754.GA60103@atlantis.8hz.com>
	<20050615210155.GA32750@wohnheim.fh-wedel.de>
	<20050616091546.GA68824@atlantis.8hz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050616091546.GA68824@atlantis.8hz.com>
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

On Thu, 16 June 2005 11:15:46 +0200, Sean Young wrote:
> On Wed, Jun 15, 2005 at 11:01:55PM +0200, Joern Engel wrote:
> > On Wed, 15 June 2005 21:27:54 +0200, Sean Young wrote:
> 
> > > According to General Software documentation their implementation "snoops" 
> > > the fat table in order to see which sectors can be chucked. Hmm...
> > 
> > That's a smart thing to do if you can be certain the user is running
> > fat on top.  Being certain ain't so easy, though.
> 
> Indeed so. Besides, it would be more elegant if the file system driver 
> passed this on to the block device, via an ioctl. Would such a thing
> stand up to scrutiny? As far as I can see, only the ftl block devices 
> would benefit.

An ioctl() would have a *really* hard time to make it into the kernel.
What you could do, however, might be something similar to this:

o Add an erase() function to stuct block_device_operations
o Have fat call that function whenever a block is know unused.
o Make sure only to call the function, if it's non-NULL.  Maybe a
  wrapper, maybe just
	if (bd_ops->erase)
		bd_ops->erase(block);
  inside fs/fat/.
o Implement erase() for your ftl driver to do something smart.

Be careful, though.  I haven't worked on block devices for a very long
time and could be talking out of my arse.  If you send such a patch to
akpm and get flamed into a pile of ashes - don't blame me. ;)

Seriously, the erase() function should be considered an optimization
only, at least for now.  If it doesn't exist - fine.  If it exists but
doesn't do anything - fine.  If it does something - great.

Jörn

-- 
Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it.
-- Brian W. Kernighan

Received: from rezznor.smb.utfors.se ([195.58.112.22])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JyAo-0002ps-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 16:12:06 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] scan.c 
Date: Mon, 17 Jun 2002 17:12:04 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLIEKMFEAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <29082.1024317940@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> 
> 
> joakim.tjernlund@lumentis.se said:
> >  Why do you still want to scan them? It's safe not to by design. Maybe
> > as a debug opion?
> 
> It's safe in theory. I want it robust in practice. Shit happens.

Yes shit happens, but removing this scan here lowers my mount time alot(don't have
the figures anymore) and shit has yet to happen :-) 
> 
> >  yes, this is what I tested(skipping the crc32 check) some time ago
> > and I  noticed a big improvement. I also noticed that adler32 was much
> > faster than crc32(btw you should not use 0 as start seed to the crc32
> > since that will yield a correct csum(0) on a zeroed buffer). 
> 
> It's not safe to just skip it -- I just did that to see how it affected the 
> profiling results. We can only skip it if we make sure we do it later.

And right now we don't make sure that we do it later, I see.

> 
> The reason we build up all the fragment lists for each inode at boot, and
> hence the reason we had to check all the crcs, is because we need to know
> which nodes are obsolete, so we can build up accurate information about free/
> dirty space per block. But we don't really _need_ that information until we 
> start to garbage-collect, so there's no real reason for us to do it at boot 
> time.
OK.
> 
> What I did was just disable the CRC32 check and still build up the fragment 
> lists as if the CRC32 was OK -- so nodes with bad CRC could still obsolete 
> good nodes, causing corruption. It was only done as a test. The real way 
> forward would be to skip the building up of the per-inode fragment list 
> _too_, and just make sure it's done for all inodes by the time we start to 
> do GC, later.
Yes, this is what I did too(removing the check of the data CRC) and that reduces my mount
time alot. It's the biggest part of my mount time.

> 
> > Is it safe to do skip the CRC check in the 2.4 branch as well?  
> 
> The above will be quite intrusive ,and I would rather not change the 2.4
> branch. If you want optimisations, you should really be using the 
> development branch -- it shouldn't really any less stable in general than 
> the 2.4 branch was until we branched it. 
> 
> Don't think of them as stable and development, in the same way as the 2.4 
> and 2.5 Linux kernel trees -- think of them more as paranoia and stable, 
> respectively; more like 2.2 and 2.4.

Well, I will look into switching over to the devel branch when I get around 
to upgrade my kernel.

> 
> 
> > I have an addon idea: Add a new flag to node.nodetype. This flag is
> > set when a node is first written to the flash. The first time the node
> > is read the CRC is calculated and if the CRC:s match, clear the CRC
> > flag(on the flash as well). The next time the same node is  read you
> > don't have to check the CRC again since it has already been verified.
> > That will save a lot of CPU cycles during file I/O as well.  
> 
> But what if the act of clearing the CRC flag is just enough to trigger a 
> nearby bit to flip, in an ageing flash chip? Also, how does this increase 
> the probability of random data being interpreted as a real node? The CRC 
> gives us a fairly small probability of that.

I am not that familiar with flash HW, but I thought that once data was correctly written
to flash, it's more or less "safe". A nearby flipping bit can by checked for once the flag 
has been cleared. I don't see how this would increase the probability for random data being
interpreted as a real node, it's only the data CRC check that is omitted, not the whole node CRC.  
 
> 
> I'd be more willing to entertain the possibility of having such a flag in 
> _memory_, so we don't check the CRC32 more than once per mount cycle.

Yes, this is a positive side effect, but it would be nice to have it in the flash as well.

> 
> >  128! In my 2.4.2 kernel(from Montavista) I can not go higher than 13,
> > then it Oops on me.
> 
> Sounds like you don't have the jffs2_sb in the superblock union, so when 
> the JFFS2 superblock info gets larger than the existing size of the union, 
> the union doesn't grow to accommodate it.

probably, I will check. 
> 
> For 2.5 kernels this isn't a problem because we allocate our own fs-private 
> superblock info anyway, but for 2.4 we should probably allocate the hash 
> table separately if we want it that large -- otherwise _all_ superblocks 
> will have enough space for it. 

Yes, that would be bad.
> 
> In fact, we should probably allocate the hash table dynamically anyway, and 
> vary its size according to the size of the flash device.
> 
> I'd be willing to let that into the 2.4 branch, as it's so obviously 
> correct and makes such a difference.
> 
> --
> dwmw2

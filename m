Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19wlL8-0007XV-J1
	for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2003 17:27:38 +0100
Date: Tue, 9 Sep 2003 18:26:13 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: J B <mad_flasher@hotmail.com>
Message-ID: <20030909162613.GA20679@wohnheim.fh-wedel.de>
References: <Law11-F24DVK3aXvlcq000025d9@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Law11-F24DVK3aXvlcq000025d9@hotmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: jffs-dev@axis.com
Subject: Re: your mail
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 9 September 2003 08:44:21 -0500, J B wrote:
> 
> A jffs2 internals question for the masses:
> 
> Besides the 128Kb max kmalloc issue, is there any restriction on the size 
> of an eraseblock that jffs2 can use?
> 
> I am using the slram driver with a 4Kb eraseblock size to create a 4Mb ram 
> device.  I mount jffs2 on top of this and everything appears to work until 
> the filesystem becomes full.  I try removing a file and the remove command 
> returns "rm: cannot unlink `foo' : No space left on device".  df reports 
> 100% usage.
> 
> Also, looking at the output from having CONFIG_JFFS2_FS_DEBUG=1, it appears 
> that garbage collection is constantly running and picking blocks from the 
> clean list because there are none on the dirty list.  Eventually even this 
> fails and the garbage collector loops and complains repeatedly:
> 
> "Argh. No free space left for GC.  nr_erasing_blocks is 0.  nr_free_blocks 
> is 0. (erasingempty: yes, erasependingempty: yes)
> jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28"
> 
> The thread_should_wake is returning 1 because the dirty size is > an 
> eraseblock, so it loops forever.
> 
> If I switch the eraseblock size in slram back to 64Kb, this problem does 
> not appear.  So again, are there any restricitons on how small of an 
> eraseblock size you can use, or is this something that hasn't ever really 
> been an issue?

Not completely unexpected.  I've always disliked the 5-eraseblock
number and started a discussion with David on the mtd list some time
ago.  For some reason, other matters occupied our minds so this was
unfinished.  But it is still in the archives.

The problem is that jffs2 doesn't need 5 eraseblocks, but rather 2 +
number_of_eraseblocks / some_constant.  So with 1024 eraseblocks, you
appear to need more than 5 (empirically proven :), while with 64
eraseblocks, you could get away with 5.  Maybe not, but there are very
few (no) bug reports, so it should be safe.

What jffs2 needs is to get rid of the constants for
JFFS2_RESERVED_BLOCKS_* and make them superblock variables instead.
Then we have to calculate them during mount time using some formula.
A patch doing the first step should still be in the archives, in the
same thread as the discussion or nearby.

Hope that helps!

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens

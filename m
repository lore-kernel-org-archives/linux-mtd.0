Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6oCy-0007yc-07
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 06:09:32 -0500
Date: Thu, 3 Mar 2005 11:09:12 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050302144407.GA18893@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0503031108470.26599@phoenix.infradead.org>
References: <Pine.LNX.4.58.0503011627270.19992@phoenix.infradead.org>
	<20050302144407.GA18893@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 and RAM consumprion reincarnated
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Joern,

> I agree with tglx, your approach is complicated (aka horrible).  How
> about something much simpler:
Whel this is on of approaches I've already proposed :-)

> o The ICP is just a list of erase blocks.
> o For any non-obsolete node belonging to an inode, the containing
>   erase block number *must* be part of ICP.
> o If an erase block doesn't contain non-obsolute nodes for this inode,
>   its number *should* not be part of ICP.
> o The ICP *can* be stored in flash.
Ok.

> Advantages over current design:
> o Lower memory consumption, as we don't track individual nodes anymore.
Right.

> Advantages over your old ICP concept:
> o GC and write are simple.  They simply add the current eraseblock to
>   the ICP list, if it isn't part of it already.
Right.

> Disadvantages:
> o Whenever we need to check the full node list, we take a few more
>   indirections.
I'll elaborate your "whenever" - this is iget() call at most. The 
per-inode list might also be required when we have deals with 
deletion/deleted direntries.

> o Removal of erase blocks from the ICP list is done on lookup.
>   "Whoops, this erase block doesn't contain any of my nodes."
Right.

> Ultimate advantage: Design can be explained in less words. :)
I don't think this is so important :-)

Again:
> o Whenever we need to check the full node list, we take a few more
>   indirections.
Well, this might be serious disadvantage. Conceivably, there is a large 
file which is distributed over a lot of blocks. The iget() of the relating 
inode assumes:

for (all blocks relating to our inode)
{
	Read_the_block_summary();
	Identify_the_position_of_all_the_inode's_nodes();
	for (all the nodes found)
	{
		Read_the_node();
	}
}

We risk to end up with extremely slow iget().

But yes, as I wrote earlier and as you has affirmed, this is fairly simple 
and elegant idea. ICP is not needed here at all while summary nodes are 
obligatory. And this fits well to the idea of superblock which is 
distributed and encompasses summaries.

BTW, I assume that the technique we're talking about is applied *only* to 
inodes that aren't in the inode cache (i.e., iget() haven't been called 
for them yet). (Is there some term for them?). Those inodes that are in 
inode cache do not need this since they keep track of nodes in 
fragtree/dirent list.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

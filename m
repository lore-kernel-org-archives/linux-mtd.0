Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6V5A-0000NF-4b
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2005 09:44:13 -0500
Date: Wed, 2 Mar 2005 15:44:07 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050302144407.GA18893@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0503011627270.19992@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0503011627270.19992@phoenix.infradead.org>
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

On Tue, 1 March 2005 16:28:36 +0000, Artem B. Bityuckiy wrote:
> 
> We've stopped on the design like this: each inode has ICP which is stored 
> on flash. The ICP is being outdated by GC and users. Since it is 
> inefficient to rewrite new inode every time, we won't rewrite it but add 
> node_ref instead. Sometimes we'll flush ICP and free node_refs.

I agree with tglx, your approach is complicated (aka horrible).  How
about something much simpler:
o The ICP is just a list of erase blocks.
o For any non-obsolete node belonging to an inode, the containing
  erase block number *must* be part of ICP.
o If an erase block doesn't contain non-obsolute nodes for this inode,
  its number *should* not be part of ICP.
o The ICP *can* be stored in flash.

Advantages over current design:
o Lower memory consumption, as we don't track individual nodes anymore.

Advantages over your old ICP concept:
o GC and write are simple.  They simply add the current eraseblock to
  the ICP list, if it isn't part of it already.

Disadvantages:
o Whenever we need to check the full node list, we take a few more
  indirections.
o Removal of erase blocks from the ICP list is done on lookup.
  "Whoops, this erase block doesn't contain any of my nodes."

Ultimate advantage: Design can be explained in less words. :)

Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra

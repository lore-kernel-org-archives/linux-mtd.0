Date: Mon, 31 Jan 2005 18:05:02 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce05013108463a4d42e4@mail.gmail.com>
Message-ID: <Pine.LNX.4.58.0501311804550.17207@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106865326.783.146.camel@baythorne.infradead.org>
	<1106871577.21196.155.camel@tglx.tec.linutronix.de>
	<1106872400.6480.201.camel@localhost.localdomain>
	<1106873065.21196.168.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.58.0501280817330.11160@phoenix.infradead.org>
	<1106903029.21196.216.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.58.0501280914580.11160@phoenix.infradead.org>
	<Pine.LNX.4.58.0501281855370.11160@phoenix.infradead.org>
	<1107111514.18794.37.camel@sauron.oktetlabs.ru>
	<6934efce05013108463a4d42e4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I'm not sure I understand the difference.  In case 1) are you
> suggesting keeping the ICP like data in the summary nodes?
>
> I think the ICP's are a great idea.

Will try to express what I think.

So, we have summaries at the end of each block. Imagine an user has issued 
the open() call for some file. This means, that the VFS will invoke the 
JFFS3 inode iget() operation. The iget() is supposed to build the file's 
fragtree in order to be able to quickly read any file's data.

Obviously, to build the inode in the iget() we must know the positions of 
all the inode's nodes. In JFFS2 it is simply done by means of keeping the 
in-core objects for each node and having the per-inode lists. We do not 
want this, we want to save RAM.

How may we build the inode in the iget() operation?

1. For each inode we keep the in-core a list of block numbers (let's call 
this list the "inode_blocks list"). These are those blocks, which have at 
least one node belonging to our inode (the inode we are trying to build). 
Thus, to build the inode, we need:

for each block in the "inode_blocks list"
{
	read the block's summary node;
	find all nodes belonging to our inode in the summary;
}

If the inode's nodes are scattered over many blocks, this will quite slow;

But we may do the following optimizations:

A. Have special GC strategy to put (or try to put) nodes belonging to the 
same inode to the same blocks. Thus we may keep the number of blocks where 
the inode's nodes are scattered relatively small.

B. The summary entries in the summary nodes are sorted by the node offset. 
But when we are searching for the node which belongs to the specific 
inode, we would like to have the summary entries sorted by the inode 
number (then we may use quick binary search algorithm). So we may store in 
summary both physical offset-sorted entries and inode number-sorted 
entries. Possibly, the physical offset sorting is not really needed (the 
GC will just move nodes in another order).

So, having these both optimizations, we may keep the iget() operation fast 
enough.

2. ICP... The alternative is using ICP. ICP contains the ICP entries in 
its body. These entries describe all the nodes of our inode. Thus, for 
each inode, we may keep in-core only the inode's ICP offset. And when we 
need to build the inode in the iget() call, we need just to read the 
corresponding ICP, and that's all.

The problem here is that ICP contains the physical offsets of nodes. But 
the GC works and moves nodes brom one block to another, changing their 
offsets. And we need to often update ICPs - even for static RO files.

Thoughts?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

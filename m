From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Sun, 30 Mar 2003 21:01:20 +0200
Subject: not enough blocks for JFFS?
In-Reply-To: <1048602999.12528.156.camel@passion.cambridge.redhat.com>
References: <3E7E6DE5.5000003@interepoch.com.tw> <1048483100.3593.3.camel@gobbles> <20030325000503.GA14469@wohnheim.fh-wedel.de> <1048596666.12528.39.camel@passion.cambridge.redhat.com> <20030325133335.GF29035@wohnheim.fh-wedel.de> <1048602999.12528.156.camel@passion.cambridge.redhat.com>
Message-ID: <20030330190120.GA31483@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 25 March 2003 14:36:39 +0000, David Woodhouse wrote:
> 
> Back to basics... the garbage collector works by writing out new nodes
> to replace (and hence obsolete) the old ones that it's trying to get rid
> of.
> 
> The problem occurs when the node(s) it needs to write out in replacement
> take up _more_ space than the original node which is being obsoleted.
> 
> That can happen when the new node is being written to the end of an
> erase block, so what was a single node before is now two separate nodes,
> with an extra 70-odd bytes of node header (and less efficient
> compression).

In the worst case, this would mean one additional node header per
erase block. We need more slack space the more and the smaller the
erase blocks are.

Can the following scenario happen?
Node foo gets split up in foo1 and foo2, living in the first and last
bytes of two erase blocks. In the next GC round, foo1 gets split up
again, in foo11 and foo12, so the original node has three fragments
now.

> It can also happen when the old node was a _hole_ node (i.e. no data
> payload and JFFS2_COMPR_ZERO), which is allowed to cross page boundaries
> -- and since it was written, some _real_ data were written 'inside' the
> range it covers. The normal way to obsolete it would be to write _two_
> (or more) hole nodes covering the ranges which are still 'empty'. In
> fact I think we already have code to combat this -- we write out the
> original hole node with the _old_ version number so it stays 'behind'
> the new data, and all is well.

We should double check this. If so, that case should be harmless now.

> There may be others, but the third and worst one I can think of right
> now is that if you lose power _during_ a GC write, you end up with an
> incomplete node on the flash and you've basically lost that space. On
> some flash chips you can _try_ to be clever and actually make use of
> partially-written nodes -- if there's just a node header you can write
> out almost any other node to go with it, if there's an inode number and
> offset you can recreate what you're writing etc.... but that's hard. 

I don't really like clever tricks. :)

It should be more robust to remember the erase block that contains
such a node and GC it next. Finish the last block that was scheduled
for GC, delete it, GC this borked block and then continue with normal
operations.

If power fails again (and again and again...) this block will be worn
off faster than others. But if we ever get out of this nightmare, it
will be another blocks turn, so this doesn't matter. And if we never
get out of this nightmare, it doesn't matter anyway.

The problem of this case is that you cannot calculate it at all. If
you start to write a node and power fail, before it's completely
written, in a loop, no amount of extra block will help you.

But if the power fails are rare enough, so you can usually reclaim the
last block, where GC was in progress and this one, which is wasting
space, one erase block for slack should be enough.

> Basically, the main task is to calculate the amount of space that is
> required to allow for expansion by splitting nodes -- probably just 70
> bytes for each eraseblock in the file system -- and double-check that
> there are no other cases which can lead to expansion. 

70+x Bytes per block for case 1.
0 for case 2.
1 Block for case 3

> Then build in some slack to deal with stuff like the third possibility I
> mentioned above, and blocks actually going bad on us. 

For NOR, you don't have to worry about blocks going bad too much. If
it happens to hit one of the bootloader or kernel blocks, you're dead
anyway.

For NAND, yes, we should use some extra.

For RAM, we don't need anything extra either.

-----
Bottom line:
It might be a good idea to get rid of the macros and add those values
to the struct superblock instead. Then we can calculate their values
on mount. Everything else can follow.

J?rn

-- 
This above all: to thine own self be true.
-- Shakespeare

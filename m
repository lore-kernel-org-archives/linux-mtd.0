From: dwmw2@infradead.org (David Woodhouse)
Date: 25 Mar 2003 14:36:39 +0000
Subject: not enough blocks for JFFS?
In-Reply-To: <20030325133335.GF29035@wohnheim.fh-wedel.de>
References: <3E7E6DE5.5000003@interepoch.com.tw>
 <1048483100.3593.3.camel@gobbles>
 <20030325000503.GA14469@wohnheim.fh-wedel.de>
 <1048596666.12528.39.camel@passion.cambridge.redhat.com>
 <20030325133335.GF29035@wohnheim.fh-wedel.de>
Message-ID: <1048602999.12528.156.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 2003-03-25 at 13:33, J??rn Engel wrote:
> Because it is simple and does exactly what I need. And because I
> didn't know about the sort-of-planned stuff.

Fair enough :)

> My application is a ramdisk, where write speed is important. jffs2 is
> compressing, so ext2 beats the crap out of it. But without
> compression, I can get rid of ext2 (smaller kernel) and have journaling
> (yes, that does make sense for a ramdisk).

Why so? Wouldn't ramfs be better? Or is this a persistent ramdisk as
used on the iPAQ which isn't cleared between reboots?

> Compression has to be turned on/off per mounted filesystem, so a mount
> option is sufficient. It was also quite straight-forward to implement,
> so even I could do it. :)
> 
> To the sort-of-planned stuff:
> Can you give a short example, where this would be useful and how it
> would be used, when implemented? This is quite new to me and I don't
> know what to think about it yet.

> Also, what is the state of it. How much work do you expect to get it
> into place and how much would it cost? Just an extra bit per inode in
> an already existing field and one if per read/write?

See the 'flags' and 'usercompr' fields which have been in the
jffs2_raw_inode structure from the start. The latter was intended to
hold a compression type suggested by the user as the best compression
type for this inode, where that can be JFFS2_COMPR_NONE. It's relatively
easy to make the jffs2_compress() function obey it, to make sure it gets
stored and hence correctly preserved when new nodes are written out, and
to add an ioctl to read/set it for any given inode. Oh, and to make sure
it's inherited from the parent directory when an inode is created.

> ack. Compression does make a formal proof more complicated, though.
> Maybe we should do it w/out compression first and then see, how much
> more complicated it would be w/ compression.

I'll accept formal proof without compression, and a bit of handwaving
which says we're compensating for compression OK -- since the additional
GC overhead of compression is probably minimal.

> > Turning off compression because you don't have a lot of flash space
> > available seems rather bizarre to me :)
> 
> Flash has bizarre problems, so bizarre solutions are just natural. :)

True :)

> Tims problem is not flash space, it is the number of erase blocks. If
> he could double their number and half their size, the solution would
> be obvious. But if turning of compression frees one or two erase
> blocks, that should do as well. If.

I agree -- if indeed it does work. I don't think it _will_ work like
that,, but I'm prepared to be contradicted by the real world; it happens
0often enough that I'm no longer inclined to get upset when it happens
:)

> > TBH I'm not sure I want stuff that's just tested, I really want stuff
> > that is shown _mathematically_ to be correct in theory, although I do
> > tend to prefer if if that's backed up in practice of course :)
> 
> Currently, all you have is a conservative default and a lack of known
> problems with it. That is pretty far from what you want, isn't it?

Well, I'm not _entirely_ unhappy with the 'lack of known problems' bit,
but yes, I'd much rather be able to point at the calculations and know
that it _shouldn't_ fall over by filling itself up.

> Maybe I can help you with this. Do you have any documentation on known
> problems? Doesn't have to be pretty, just enough for me to understand
> it. Old emails might be fine as well.

Back to basics... the garbage collector works by writing out new nodes
to replace (and hence obsolete) the old ones that it's trying to get rid
of.

The problem occurs when the node(s) it needs to write out in replacement
take up _more_ space than the original node which is being obsoleted.

That can happen when the new node is being written to the end of an
erase block, so what was a single node before is now two separate nodes,
with an extra 70-odd bytes of node header (and less efficient
compression).

It can also happen when the old node was a _hole_ node (i.e. no data
payload and JFFS2_COMPR_ZERO), which is allowed to cross page boundaries
-- and since it was written, some _real_ data were written 'inside' the
range it covers. The normal way to obsolete it would be to write _two_
(or more) hole nodes covering the ranges which are still 'empty'. In
fact I think we already have code to combat this -- we write out the
original hole node with the _old_ version number so it stays 'behind'
the new data, and all is well.

There may be others, but the third and worst one I can think of right
now is that if you lose power _during_ a GC write, you end up with an
incomplete node on the flash and you've basically lost that space. On
some flash chips you can _try_ to be clever and actually make use of
partially-written nodes -- if there's just a node header you can write
out almost any other node to go with it, if there's an inode number and
offset you can recreate what you're writing etc.... but that's hard. 

Basically, the main task is to calculate the amount of space that is
required to allow for expansion by splitting nodes -- probably just 70
bytes for each eraseblock in the file system -- and double-check that
there are no other cases which can lead to expansion. 

Then build in some slack to deal with stuff like the third possibility I
mentioned above, and blocks actually going bad on us. 


> PS: Damn! I really didn't want to get back into this. Sometimes you
> just can't help it, I guess.

I know the feeling. When I first arrived at Red Hat almost three years
ago and my first task was to beat JFFS into shape for shipping to a
customer, I insisted that I knew _nothing_ about file systems... :)

-- 
dwmw2

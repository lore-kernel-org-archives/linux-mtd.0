From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Wed, 26 Mar 2003 14:27:23 +0100
Subject: not enough blocks for JFFS?
In-Reply-To: <1048602999.12528.156.camel@passion.cambridge.redhat.com>
References: <3E7E6DE5.5000003@interepoch.com.tw> <1048483100.3593.3.camel@gobbles> <20030325000503.GA14469@wohnheim.fh-wedel.de> <1048596666.12528.39.camel@passion.cambridge.redhat.com> <20030325133335.GF29035@wohnheim.fh-wedel.de> <1048602999.12528.156.camel@passion.cambridge.redhat.com>
Message-ID: <20030326132723.GF20098@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 25 March 2003 14:36:39 +0000, David Woodhouse wrote:
> 
> > My application is a ramdisk, where write speed is important. jffs2 is
> > compressing, so ext2 beats the crap out of it. But without
> > compression, I can get rid of ext2 (smaller kernel) and have journaling
> > (yes, that does make sense for a ramdisk).
> 
> Why so? Wouldn't ramfs be better? Or is this a persistent ramdisk as
> used on the iPAQ which isn't cleared between reboots?

Yes, the ramdisk is persistent between reboots.

Maybe some people dig out the requirement that we need dynamic
growing/shrinking as well, but that is quite simple to add to jffs2.
Should make less of an impact than linking yet another fs.

> See the 'flags' and 'usercompr' fields which have been in the
> jffs2_raw_inode structure from the start. The latter was intended to
> hold a compression type suggested by the user as the best compression
> type for this inode, where that can be JFFS2_COMPR_NONE. It's relatively
> easy to make the jffs2_compress() function obey it, to make sure it gets
> stored and hence correctly preserved when new nodes are written out, and
> to add an ioctl to read/set it for any given inode. Oh, and to make sure
> it's inherited from the parent directory when an inode is created.

Sounds quite sane.

But we would need a new userspace tool to "chattr compr=none foo",
wouldn't we?

> I'll accept formal proof without compression, and a bit of handwaving
> which says we're compensating for compression OK -- since the additional
> GC overhead of compression is probably minimal.

Still hard enough. Maybe I can come up with something...

> > Tims problem is not flash space, it is the number of erase blocks. If
> > he could double their number and half their size, the solution would
> > be obvious. But if turning of compression frees one or two erase
> > blocks, that should do as well. If.
> 
> I agree -- if indeed it does work. I don't think it _will_ work like
> that,, but I'm prepared to be contradicted by the real world; it happens
> 0often enough that I'm no longer inclined to get upset when it happens
> :)

It is easier to prove me wrong, than right. I'll try to set up a
testbed and punish it for some time. Let's see where things break
w/out compression.

> Well, I'm not _entirely_ unhappy with the 'lack of known problems' bit,
> but yes, I'd much rather be able to point at the calculations and know
> that it _shouldn't_ fall over by filling itself up.

Right. Our calculations will have one "magic" problem, if we ever get
there. We'll have to say, some like:
"There are exectly 15 different cases for the garbage collector. Now
we are going to formally prove each case to be harmless."

What if there are in fact 16 cases? Or, what if another case gets
introduced by code change, some time later?

> > Maybe I can help you with this. Do you have any documentation on known
> > problems? Doesn't have to be pretty, just enough for me to understand
> > it. Old emails might be fine as well.
> 
> Back to basics... the garbage collector works by writing out new nodes
> to replace (and hence obsolete) the old ones that it's trying to get rid
> of.
> 
> [...]

Thank you! I'll have a close look into this later. My brain returns
-EBUSY on a regular basis, since I got back to jffs2 - on top of my
other stuff. :)

> I know the feeling. When I first arrived at Red Hat almost three years
> ago and my first task was to beat JFFS into shape for shipping to a
> customer, I insisted that I knew _nothing_ about file systems... :)

Well, for being a bloody amateur, you are doing quite well. ;)

J?rn

-- 
Fancy algorithms are buggier than simple ones, and they're much harder
to implement. Use simple algorithms as well as simple data structures.
-- Rob Pike

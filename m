From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Tue, 25 Mar 2003 14:33:35 +0100
Subject: not enough blocks for JFFS?
In-Reply-To: <1048596666.12528.39.camel@passion.cambridge.redhat.com>
References: <3E7E6DE5.5000003@interepoch.com.tw> <1048483100.3593.3.camel@gobbles> <20030325000503.GA14469@wohnheim.fh-wedel.de> <1048596666.12528.39.camel@passion.cambridge.redhat.com>
Message-ID: <20030325133335.GF29035@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 25 March 2003 12:51:06 +0000, David Woodhouse wrote:
> On Tue, 2003-03-25 at 00:05, J?rn Engel wrote:
> > But a filesystem is nicer than a quick user space implementation. :)
> > 
> > Today I have tweaked jffs2 a little to work without compression,
> > depending on mount options. (patch will follow)
> 
> Hmmm. Why mount options and not take the path which was already sort-of
> planned, which was to implement ioctl() and have a per-inode (and
> inheritable for directories) set of flags, a la chattr?

Because it is simple and does exactly what I need. And because I
didn't know about the sort-of-planned stuff.

My application is a ramdisk, where write speed is important. jffs2 is
compressing, so ext2 beats the crap out of it. But without
compression, I can get rid of ext2 (smaller kernel) and have journaling
(yes, that does make sense for a ramdisk).

Compression has to be turned on/off per mounted filesystem, so a mount
option is sufficient. It was also quite straight-forward to implement,
so even I could do it. :)

To the sort-of-planned stuff:
Can you give a short example, where this would be useful and how it
would be used, when implemented? This is quite new to me and I don't
know what to think about it yet.

Also, what is the state of it. How much work do you expect to get it
into place and how much would it cost? Just an extra bit per inode in
an already existing field and one if per read/write?

> > The nice effect of this is that you should be able to work with less
> > reserved blocks. My estimate is somewhere between one and three. In
> > Tims case, that would leave him with 16kB net space, enough for his
> > data. Cool.
> 
> I'm not really convinced that the _compression_ makes much difference
> here. You still get pages taking up more space when you GC them from a
> single node to a pair of nodes because your new node would have crossed
> an eraseblock boundary. OK, so the loss of compression efficiency makes
> the resulting data payloads slightly larger _too_ but not by much, and
> if you want formal proof of correctness you have to have accounted for
> the expansion _anyway_.

ack. Compression does make a formal proof more complicated, though.
Maybe we should do it w/out compression first and then see, how much
more complicated it would be w/ compression.

> Turning off compression because you don't have a lot of flash space
> available seems rather bizarre to me :)

Flash has bizarre problems, so bizarre solutions are just natural. :)

Tims problem is not flash space, it is the number of erase blocks. If
he could double their number and half their size, the solution would
be obvious. But if turning of compression frees one or two erase
blocks, that should do as well. If.

> > Tim, would you volunteer to test patches?
> 
> TBH I'm not sure I want stuff that's just tested, I really want stuff
> that is shown _mathematically_ to be correct in theory, although I do
> tend to prefer if if that's backed up in practice of course :)

Currently, all you have is a conservative default and a lack of known
problems with it. That is pretty far from what you want, isn't it?

> First I want to start using the REF_PRISTINE bits we already have to
> write clean nodes to _different_ blocks, so we don't keep mixing old
> data with new and we get to improve GC efficiency. Then I want to look
> at eliminating all cases where the size of the data on the medium could
> expand, except for the one where we have to split a GC'd node into two.
> Then the amount of space we require for GC is basically calculable and
> not too large.

Maybe I can help you with this. Do you have any documentation on known
problems? Doesn't have to be pretty, just enough for me to understand
it. Old emails might be fine as well.

J?rn

PS: Damn! I really didn't want to get back into this. Sometimes you
just can't help it, I guess.

From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Sun, 30 Mar 2003 22:08:20 +0200
Subject: not enough blocks for JFFS?
In-Reply-To: <1049052224.16365.755.camel@imladris.demon.co.uk>
References: <3E7E6DE5.5000003@interepoch.com.tw> <1048483100.3593.3.camel@gobbles> <20030325000503.GA14469@wohnheim.fh-wedel.de> <1048596666.12528.39.camel@passion.cambridge.redhat.com> <20030325133335.GF29035@wohnheim.fh-wedel.de> <1048602999.12528.156.camel@passion.cambridge.redhat.com> <20030330190120.GA31483@wohnheim.fh-wedel.de> <1049052224.16365.755.camel@imladris.demon.co.uk>
Message-ID: <20030330200820.GB12927@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 30 March 2003 20:23:47 +0100, David Woodhouse wrote:
> On Sun, 2003-03-30 at 20:01, J?rn Engel wrote:
> > In the worst case, this would mean one additional node header per
> > erase block. We need more slack space the more and the smaller the
> > erase blocks are.
> 
> Yep. Hence my wanting to limit the _minimum_ size of erase blocks, when
> we started working on NAND flash. But I couldn't justify myself without
> handwaving so Thomas changed that back.

This case is interesting anyway. 70 Bytes per node and 512 Bytes per
erase block are 14% in my book. That is quite nasty, but it also is
worst case. You can calculate the propability of that with many
blocks. :)

Now, what propability are you going to accept? Or how can you make
sure that those 14% are never reached. A tough one.

> > Can the following scenario happen?
> > Node foo gets split up in foo1 and foo2, living in the first and last
> > bytes of two erase blocks. In the next GC round, foo1 gets split up
> > again, in foo11 and foo12, so the original node has three fragments
> > now.
> 
> It shouldn't. We try to combine pages whenever we can, so that split
> nodes, whether they be split through GC or just because the user wrote
> them out like that, get merged. 
> 
> Unfortunately we have logic to avoid doing this when we need it most --
> when we're right out of space and doing so would prevent us from making
> it to the end of the block. :)
> 
> Arguably if we get into that situation we're already buggered though.

Yes, I agree. If things get too low, we just have to accept the fs to
be read-only now and figure out, what got us into that situation in
the first place. I'm even somewhat inclined to rip such code out.

But first I have to identify it and make sure that we never hit it in
operation.

> > We should double check this. If so, that case should be harmless now.
> 
> Should be. I want to double-check its behaviour on NAND flash where we
> can't mark the old one obsolete, and hence on remount we end up with two
> identical copies of the same node. That's OK because we delete one --
> but I'm not convinced we delete the _right_ one, and I'm not entirely
> sure what brokenness that causes, if any.

Ack. That is a different problem, so I ignore it for now.

> > I don't really like clever tricks. :)
> 
> Agreed.
> 
> > It should be more robust to remember the erase block that contains
> > such a node and GC it next. Finish the last block that was scheduled
> > for GC, delete it, GC this borked block and then continue with normal
> > operations.
> 
> Nah, there's no point in that AFAICT. If you're going to let it remain
> borked, then it's just dirty space like any other, and you don't have to
> treat it at all specially. If you're short of space, you still want to
> GC the block with most dirty space, and it doesn't matter why it's dirty
> -- whether it's nodes which were valid and now are not, or nodes you
> never finished writing before you got interrupted.

I have to think about this some more. If the behaviour is not worse in
any case, I agree with you. Shouldn't be, but better give it some more
thought.

> > The problem of this case is that you cannot calculate it at all. If
> > you start to write a node and power fail, before it's completely
> > written, in a loop, no amount of extra block will help you.
> 
> Indeed. Hence the evil trick I suggested to try to avoid it. 

How long does it take for GC to write one erase block? How long does
it take to boot the machine far enough to start GC? If GC is not more
than 90% of the sum and we get trapped in such a loop, forever, things
are getting quite unlikely.

If this ever happens someone is trying to break jffs2 on purpose, just
to make it read-only. Do we need to worry about this? And if so, can
we prevent it under *any* circumstances? If not, let's ignore that
case.

> > For NOR, you don't have to worry about blocks going bad too much. If
> > it happens to hit one of the bootloader or kernel blocks, you're dead
> > anyway.
> 
> The bootloader very rarely gets written so isn't likely to go bad, and
> bootloaders like RedBoot and the Compaq bootldr can read kernels out of
> JFFS2 now so that one isn't an issue now either. But yeah -- we don't
> need to worry _too_ much. 

Manufacturers give us 100.000 erase cycles per block. I read that as
100.000 erase cycles before the first block fails. There is no number
saying 120.000 before the second or third block fails, so that number
should still be 100.000, if you want to be on the safe side.

I'd rather worry about the application that writes 100.000 times the
file system size to *flash*. :)

> > Bottom line:
> > It might be a good idea to get rid of the macros and add those values
> > to the struct superblock instead. Then we can calculate their values
> > on mount. Everything else can follow.
> 
> Makes sense, and perhaps we can make them user-tunable somehow too, or
> mount options. I'm wondering if we want to continue having them in units
> of blocks, or whether we want to count bytes.

Bytes make more sense to me.

I don't expect to work on it next week, but I can already give you my
mount option "parser", if you are interested.

J?rn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra

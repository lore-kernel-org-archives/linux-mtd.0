From: dwmw2@infradead.org (David Woodhouse)
Date: 30 Mar 2003 20:23:47 +0100
Subject: not enough blocks for JFFS?
In-Reply-To: <20030330190120.GA31483@wohnheim.fh-wedel.de>
References: <3E7E6DE5.5000003@interepoch.com.tw>
 <1048483100.3593.3.camel@gobbles>
 <20030325000503.GA14469@wohnheim.fh-wedel.de>
 <1048596666.12528.39.camel@passion.cambridge.redhat.com>
 <20030325133335.GF29035@wohnheim.fh-wedel.de>
 <1048602999.12528.156.camel@passion.cambridge.redhat.com>
 <20030330190120.GA31483@wohnheim.fh-wedel.de>
Message-ID: <1049052224.16365.755.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 2003-03-30 at 20:01, J?rn Engel wrote:
> In the worst case, this would mean one additional node header per
> erase block. We need more slack space the more and the smaller the
> erase blocks are.

Yep. Hence my wanting to limit the _minimum_ size of erase blocks, when
we started working on NAND flash. But I couldn't justify myself without
handwaving so Thomas changed that back.

> Can the following scenario happen?
> Node foo gets split up in foo1 and foo2, living in the first and last
> bytes of two erase blocks. In the next GC round, foo1 gets split up
> again, in foo11 and foo12, so the original node has three fragments
> now.

It shouldn't. We try to combine pages whenever we can, so that split
nodes, whether they be split through GC or just because the user wrote
them out like that, get merged. 

Unfortunately we have logic to avoid doing this when we need it most --
when we're right out of space and doing so would prevent us from making
it to the end of the block. :)

Arguably if we get into that situation we're already buggered though.

> We should double check this. If so, that case should be harmless now.

Should be. I want to double-check its behaviour on NAND flash where we
can't mark the old one obsolete, and hence on remount we end up with two
identical copies of the same node. That's OK because we delete one --
but I'm not convinced we delete the _right_ one, and I'm not entirely
sure what brokenness that causes, if any.

> > There may be others, but the third and worst one I can think of right
> > now is that if you lose power _during_ a GC write, you end up with an
> > incomplete node on the flash and you've basically lost that space. On
> > some flash chips you can _try_ to be clever and actually make use of
> > partially-written nodes -- if there's just a node header you can write
> > out almost any other node to go with it, if there's an inode number and
> > offset you can recreate what you're writing etc.... but that's hard. 
> 
> I don't really like clever tricks. :)

Agreed.

> It should be more robust to remember the erase block that contains
> such a node and GC it next. Finish the last block that was scheduled
> for GC, delete it, GC this borked block and then continue with normal
> operations.

Nah, there's no point in that AFAICT. If you're going to let it remain
borked, then it's just dirty space like any other, and you don't have to
treat it at all specially. If you're short of space, you still want to
GC the block with most dirty space, and it doesn't matter why it's dirty
-- whether it's nodes which were valid and now are not, or nodes you
never finished writing before you got interrupted.

> The problem of this case is that you cannot calculate it at all. If
> you start to write a node and power fail, before it's completely
> written, in a loop, no amount of extra block will help you.

Indeed. Hence the evil trick I suggested to try to avoid it. 

> But if the power fails are rare enough, so you can usually reclaim the
> last block, where GC was in progress and this one, which is wasting
> space, one erase block for slack should be enough.

Yeah, that's probably an accurate assessment.

> > Basically, the main task is to calculate the amount of space that is
> > required to allow for expansion by splitting nodes -- probably just 70
> > bytes for each eraseblock in the file system -- and double-check that
> > there are no other cases which can lead to expansion. 
> 
> 70+x Bytes per block for case 1.
> 0 for case 2.
> 1 Block for case 3
> 
> > Then build in some slack to deal with stuff like the third possibility I
> > mentioned above, and blocks actually going bad on us. 
> 
> For NOR, you don't have to worry about blocks going bad too much. If
> it happens to hit one of the bootloader or kernel blocks, you're dead
> anyway.

The bootloader very rarely gets written so isn't likely to go bad, and
bootloaders like RedBoot and the Compaq bootldr can read kernels out of
JFFS2 now so that one isn't an issue now either. But yeah -- we don't
need to worry _too_ much. 

> For NAND, yes, we should use some extra.
> 
> For RAM, we don't need anything extra either.
> 
> -----
> Bottom line:
> It might be a good idea to get rid of the macros and add those values
> to the struct superblock instead. Then we can calculate their values
> on mount. Everything else can follow.

Makes sense, and perhaps we can make them user-tunable somehow too, or
mount options. I'm wondering if we want to continue having them in units
of blocks, or whether we want to count bytes.


-- 
dwmw2

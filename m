From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Tue, 25 Mar 2003 01:05:03 +0100
Subject: not enough blocks for JFFS?
In-Reply-To: <1048483100.3593.3.camel@gobbles>
References: <3E7E6DE5.5000003@interepoch.com.tw> <1048483100.3593.3.camel@gobbles>
Message-ID: <20030325000503.GA14469@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 24 March 2003 15:17:31 -0700, Russ Dill wrote:
> On Sun, 2003-03-23 at 19:31, Tim Wu wrote:
> > Hi! Everybody:
> > 
> > The system I'm working on use a 4MB NOR flash.
> > The block size of the 4MB flash is 64KB.
> > It also has eight smaller(8KB) blocks at bottom.
> > Since, on this system, I don't have much data to write(less than 10KB),
> > a CRAMFS(readonly)+JFFS(writable) combination should be pretty good for me.
> > 
> > Here comes the problem.  The bootloader has occupied the first three 8KB 
> > blocks.  I have only five 8K blocks available for JFFS.  It always fails 
> > when I overwrite an existed file on the JFFS partition.
> 
> Just make a quick user space implementation.

But a filesystem is nicer than a quick user space implementation. :)

Today I have tweaked jffs2 a little to work without compression,
depending on mount options. (patch will follow)

The nice effect of this is that you should be able to work with less
reserved blocks. My estimate is somewhere between one and three. In
Tims case, that would leave him with 16kB net space, enough for his
data. Cool.

Changing the amount of reserved blocks per filesystem (not per kernel)
is a bit tricky. And figuring out, how many are really needed requires
quite a bit of testing or some math. Without compression, math might
even be doable. :)

Tim, would you volunteer to test patches?

J?rn

-- 
The cost of changing business rules is much more expensive for software
than for a secretaty.
-- unknown

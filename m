From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Wed, 12 Feb 2003 17:10:32 +0100
Subject: CFI/MTD weird problem
In-Reply-To: <1044637404.22176.37.camel@localhost.localdomain>
References: <1044637404.22176.37.camel@localhost.localdomain>
Message-ID: <20030212161031.GB5925@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 7 February 2003 18:03:24 +0100, Nicola wrote:
> When I start tracing the code execution putting some printk into the
> MTD/CFI code, I get a weird behavior where the console output is
> corrupted BEFORE the calling of the MTD/CFI code, (see minicom log
> below).
> And I get out some '%' chars instead of the regular numerical values. 

When adding/removing a printk changes the behaviour of the code, the
usual cause is memory and/or cache corruption. Among the stuff I have
seen:
- struct foo* cast to struct bar*, where sizeof(struct bar) >
  sizeof(struct foo). Writing to bar mangles someone elses memory, the
  concrete owner varies depending on the printks.
- dma buffer not alligned to cacheline size. part of dma buffer is in
  processor cache, dma transfers into buffer, variable on same
  cacheline is written and complete cacheline written back to memory.
  Part of the dma buffer now contains the old data again.
  Again, a printk might accidentally align the dma buffer, fixing the
  problem.

The problem with these bugs is that they take a long time to track
down. Weeks or month are not uncommon. Good luck!

J?rn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth

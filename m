Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACpLj-0003fD-J1
	for <linux-mtd@lists.infradead.org>; Fri, 24 Oct 2003 00:58:39 +0100
Date: Thu, 23 Oct 2003 16:57:26 -0700
From: Jun Sun <jsun@mvista.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Message-ID: <20031023165726.J1345@mvista.com>
References: <20031022182558.U19834@mvista.com>
	<20031023153307.GA11669@wohnheim.fh-wedel.de>
	<20031023100304.B1070@mvista.com>
	<20031023173148.GC16160@wohnheim.fh-wedel.de>
	<20031023104320.A1345@mvista.com>
	<20031023181541.GE16160@wohnheim.fh-wedel.de>
	<20031023130406.D1345@mvista.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031023130406.D1345@mvista.com>;
	from jsun@mvista.com on Thu, Oct 23, 2003 at 01:04:06PM -0700
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 23, 2003 at 01:04:06PM -0700, Jun Sun wrote:
> On Thu, Oct 23, 2003 at 08:15:41PM +0200, Jörn Engel wrote:
> > On Thu, 23 October 2003 10:43:20 -0700, Jun Sun wrote:
> > > > 
> > > > o All those translate to improvements in the source code.  How about the
> > > > binary?  Compile with and without patch and post the kernel image
> > > > size.  And remember that noone will use two map files at the same time
> > > > in the real world.
> > > > 
> > > > o Copy and paste is simple.  So simple in fact, that everyone does it,
> > > > as you have observed.  Why make it more complicated, unless you have
> > > > clear advantages.
> > > 
> > > ... as if my previous listings are not advantages. :)
> > 
> > They are, no doubt.  But there are disadvantages as well.
> > 
> > > > Yes, I like the basic idea, tried to do it myself.  But what's the use
> > > > if all your users care about binary size and that increases?
> > > 
> > > I find it hard to belive this patch would increase kernel size.
> > > Can someone using existing propriatary mapping driver apply this 
> > > patch, switch to use physmap.c, and let us know the size increase?
> > > 
> > > How much increase would you start to really care in a typical .5M to 2M
> > > kernel?  1K or 10K or 100K?  I think the increase should be minimum if any.
> > 
> > I don't know and I don't care.  You want the patch in, you show the
> > numbers or convince David otherwise.
> >
> 
> I will do some numbers, 
<snip>

OK, I converted jmr3927 flash driver to use physmap and kernel size increases
by whopping 96 bytes!  See the ELF header dump below. :)

Meanwhile, we sadly announce the loss of drivers/mtd/maps/jmr3927-flash.c
file and the death of CONFIG_MTD_JMR3927 (not in MTD tree yet).  :0


Jun

-------------------------------------------

original vmlinux with no modification:

vmlinux.orig:     file format elf32-tradlittlemips

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         001aa080  80050000  80050000  00001000  2**5
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .fixup        00001250  801fa080  801fa080  001ab080  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .kstrtab      00005000  801fb2d0  801fb2d0  001ac2d0  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 __ex_table    000016d8  802002d0  802002d0  001b12d0  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  4 __dbe_table   00000000  802019a8  802019a8  001b29a8  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  5 __ksymtab     000025a8  802019a8  802019a8  001b29a8  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  6 .data.init_task 00002000  80204000  80204000  001b5000  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  7 .text.init    0001757c  80206000  80206000  001b7000  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  8 .data.init    00005070  8021d57c  8021d57c  001ce57c  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  9 .setup.init   000000e8  802225f0  802225f0  001d35f0  2**2
                  CONTENTS, ALLOC, LOAD, DATA
 10 .initcall.init 000000ac  802226d8  802226d8  001d36d8  2**2
                  CONTENTS, ALLOC, LOAD, DATA
 11 .data.cacheline_aligned 00001470  80223000  80223000  001d4000  2**4
                  CONTENTS, ALLOC, LOAD, DATA
 12 .reginfo      00000018  80224470  80224470  001d5470  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA, LINK_ONCE_SAME_SIZE
 13 .data         0001a000  80225000  80225000  001d6000  2**12
                  CONTENTS, ALLOC, LOAD, DATA
 14 .bss          0002ce90  8023f000  8023f000  001f0000  2**4
                  ALLOC
 15 .comment      00002cce  8026be90  8026be90  001f0000  2**0
                  CONTENTS, READONLY
 16 .pdr          00027ae0  00000000  00000000  001f2cd0  2**2
                  CONTENTS, READONLY
 17 .mdebug.abi32 00000000  00000000  00000000  0021a7b0  2**0
                  CONTENTS, READONLY
 
-------------------------------------------

new vmlinux with patching:

vmlinux:     file format elf32-tradlittlemips

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         001aa000  80050000  80050000  00001000  2**5
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .fixup        00001250  801fa000  801fa000  001ab000  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .kstrtab      00005000  801fb250  801fb250  001ac250  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 __ex_table    000016d8  80200250  80200250  001b1250  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  4 __dbe_table   00000000  80201928  80201928  001b2928  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  5 __ksymtab     000025a8  80201928  80201928  001b2928  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  6 .data.init_task 00002000  80204000  80204000  001b5000  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  7 .text.init    0001763c  80206000  80206000  001b7000  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  8 .data.init    000050e0  8021d63c  8021d63c  001ce63c  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  9 .setup.init   000000e8  80222720  80222720  001d3720  2**2
                  CONTENTS, ALLOC, LOAD, DATA
 10 .initcall.init 000000ac  80222808  80222808  001d3808  2**2
                  CONTENTS, ALLOC, LOAD, DATA
 11 .data.cacheline_aligned 00001470  80223000  80223000  001d4000  2**4
                  CONTENTS, ALLOC, LOAD, DATA
 12 .reginfo      00000018  80224470  80224470  001d5470  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA, LINK_ONCE_SAME_SIZE
 13 .data         0001a000  80225000  80225000  001d6000  2**12
                  CONTENTS, ALLOC, LOAD, DATA
 14 .bss          0002ce40  8023f000  8023f000  001f0000  2**4
                  ALLOC
 15 .comment      00002cce  8026be40  8026be40  001f0000  2**0
                  CONTENTS, READONLY
 16 .pdr          00027a00  00000000  00000000  001f2cd0  2**2
                  CONTENTS, READONLY
 17 .mdebug.abi32 00000000  00000000  00000000  0021a6d0  2**0
                  CONTENTS, READONLY

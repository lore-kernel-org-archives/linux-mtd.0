Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1369Mv-00040r-00
	for mtd-list@infradead.org; Sun, 25 Jun 2000 11:10:25 +0100
Date: Sun, 25 Jun 2000 11:11:54 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Jason Gunthorpe <jgg@deltatee.com>
cc: mtd@infradead.org
Subject: Re: Compile problems
In-Reply-To: <Pine.LNX.3.96.1000624155702.31443A-100000@white.priv.deltatee.com>
Message-ID: <Pine.LNX.4.21.0006251044510.1019-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 24 Jun 2000, Jason Gunthorpe wrote:

> Just been working on getting the latest MTD cvs to compile on
> 2.3.99-pre8-rmk2 for an ARM platform.

I've tested it on 2.4/ia32 and 2.2/ARM. Not yet 2.4/ARM although I didn't
expect it to break.


> 1) Damn Odd compile errors
> 
> mtdcore.c:350: warning: `init_mtd' defined but not used
> mtdcore.c:374: warning: `cleanup_mtd' defined but not used
> {standard input}: Assembler messages:
> {standard input}:6: Warning: Ignoring changed section attributes for
> .modinfo
> 
> The first two are due to the init/cleanup functions being declared static.

That's known and harmless. They're not unused; they're aliased. Consider
it a GCC bug and ignore it.

> The second two are due to gcc emitting some very odd assembly:
	<snip>
> 
> The '.section .modinfo\n.previous' comes from the kernel module.h header,
> the second section declaration directly after comes from GCC.. I don't
> recall seeing this when compiling the kernel proper, so maybe there is
> something strange about the MTD stuff?

Not knowingly. Prod rmk or a gcc hacker. Also try cutting out stuff till
it goes away and work out exactly what's causing it. Do you have MTD_DEBUG
defined?

> 2) ioremap, memcpy_fromio, etc seem to be PCI things
> 
> Most of the low level drivers won't even compile, mostly because my ARM
> arch doesn't have PCI or ISA io functions :> 

Ah - on mine they're defined to panic()

> But reading around I think the slram,vmax and oct drivers are wrong..
> vmax and oct should probably use the isa_* flavors of all the
> functions, and I don't know how slram should try to portably access
> the end of memory, but ioremap probably isn't it?

Yes, vmax and oct should use the isa_ functions. Also, they should only be
configurable if CONFIG_ISA is set, if they're ISA boards.

slram I haven't looked at for a while, and I'm not sure what to do with it
either. 

To get the DiskOnChip drivers to work, just stick #ifndef __arm__ around:

#define ReadDOC(adr, reg)      readb(((unsigned long)adr) + DoC_##reg)
#define WriteDOC(d, adr, reg)  writeb(d, ((unsigned long)adr) + DoC_##reg)

... in include/linux/mtd/doc2000.h and #else the appropriate alternative.
Also ifdef the ioremap in docprobe.c and the iounmap in docprobe.c and
doc200[01].c


-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CEasy-0003Ly-J2
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 18:00:50 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Nicolas Pouillon <nipo@ssji.net>
In-Reply-To: <20041004215001.769d8017.nipo@ssji.net>
References: <20041004215001.769d8017.nipo@ssji.net>
Content-Type: text/plain
Message-Id: <1096926783.21297.535.camel@thomas>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 23:53:03 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Probing at 0x0
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-04 at 21:50, Nicolas Pouillon wrote:
> I updated to last CVS snapshot.
> After tweaking necessary declarations to interface with 2.6.7, I remade
> some modifications in order to be able to probe at 0x0.
> I made a patch for this (I hope that way is not too bad):
> http://nipo.ssji.net/patches/mtd/nulladdress.diff

Please add the patches to your mail. I'm not interested in collecting
outdated http references. Providing patches by http reference makes
sense for large modification which would either be rejected by the ML or
annoying the majority of readers.

> I still need to use readb and writeb, but this is not in the patch.

WTF did say you should not use readb/writeb ? 

> This time, chip is probed as a DoC-Mil+ 32MB, driver complains about it
> not being supported. It seems ok, and as mtd are much like rocket
> science to me, I'll wait a little until it is (i hope) supported...

It might be rocket science for you, but it still relies on simple
straight forward facts.

The DoC, which you pointed out, has Doc-chip-ID 0x41 according to the
datasheet.

from include/linux/mtd/doc2000.h
#define DOC_ChipID_DocMilPlus32	0x40
#define DOC_ChipID_DocMilPlus16	0x41

So how is it identified as a Mil+32 ? 
Same magic as the NAND-ID is 0x85 instead of 0x75 ? 
Same quick solution, by adding some magic code / hope ?

> I'll try to understand the mmio vs readb/writeb issue as a time
> holder. ;)

He, time holder. Did you mean placeholder ? 
It's neither nore. mmio is a technology. readb is a macro. writeb too.

mmio == Memory Mapped Input Output. That means you have no seperate IO
port instruction crap which was introduced by the worst CPU architecture
on this planet. Everything, even your Line Printer Port is accessible in
the memory space via a plain pointer without an extra IO-related
instruction like outb/inb.

see http://dri.sourceforge.net/cgi-bin/moin.cgi/MMIO 

and http://dri.sourceforge.net/cgi-bin/moin.cgi/PIO

possibly http://www.c-for-dummies.com

in any case see http://lxr.linux.no/ident?v=2.6.8.1;a=arm;i=readb
where you can find out following the refrences that readb resolves at
the end to
(*(volatile unsigned char  *)(a))

google for "volatile" yourself.


Sorry for being cynical, but I'm too old to believe in IT-witchcrafts.

tglx

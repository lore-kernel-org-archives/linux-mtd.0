Received: from josephine.discordia.ch ([193.246.253.137])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17O4oZ-0005sa-00
	for <linux-mtd@lists.infradead.org>; Sat, 29 Jun 2002 00:06:07 +0100
Date: Sat, 29 Jun 2002 01:06:05 +0200
From: Peter Keel <seegras@discordia.ch>
To: Mark Meade <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to Clean bad Grubfirmware off DOC?
Message-ID: <20020628230605.GB9136@discordia.ch>
References: <3D1B22F2.18643@webmta2> <20020628184740.GA6828@discordia.ch> <200206281756656.SM02488@there>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <200206281756656.SM02488@there>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

* on the Fri, Jun 28, 2002 at 05:58:29PM -0400, Mark Meade wrote:
> > - An Empty DOC
> > ??
> 
> To clarify, "an empty DoC board" simply means inserting the ISA or PCI eval 
> board, without installing the DoC.  Obviously, this would allow you to boot 
> without the DoC GRUB taking over, and then you could "hot-plug" the DoC to 
> erase it.
> 
> Keep in mind that these instructions assume a PC and a M-Sys eval-board.  If 
> your system is different, please post the specifics.

Ah, ok. I understand. My DoC is on the mainboard. I'm not even sure
if its socketed or soldered in, haven't checked. The machine is an
IGEL-Terminal, 233Mhz, 32MB Ram, 16MB DoC 2000, Cyrix Media GX. 
An older one. I think Its an IGEL-C. From http://www.igel.de
Originally came with linux 2.0.36, libc5 and M-Systems binary-only
driver, no ssh. So I had to fix that ;)) As it turned out, 2.4.18
was the first kernel able to handle the nasty DMA-bug of the 
Media GX chipset.. 

> What version of GRUB did you use, prior to applying the patch?  I'm still 
> curious as to why it doesn't recognize your root filesystem.  Are you running 
> GRUB on your hard drive?

No. On the Harddisk is lilo. Grub was 0.93 or something. the newest 
from cvs plus the newest MTD-patches, plus the Debian-diff, all 
neatly patched in, with the rejects ironed out. Compiled with all
the debian-options plus the docchip-2000 option. 

Cheers
Peter
-- 
Those who give up essential liberties for temporary safety deserve 
neither liberty nor safety. -- Benjamin Franklin

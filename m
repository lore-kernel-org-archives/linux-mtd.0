Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17O3m5-0005nl-00
	for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2002 22:59:29 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: How to Clean bad Grubfirmware off DOC?
Date: Fri, 28 Jun 2002 17:58:29 -0400
References: <3D1B22F2.18643@webmta2> <20020628184740.GA6828@discordia.ch>
In-Reply-To: <20020628184740.GA6828@discordia.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200206281756656.SM02488@there>
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

Peter Keel wrote:
> > By saying above ,do you mean "hot plug" ?
> And do you mean you have to have
> - DOS (why shouldn't I use Linux?)

You don't *have* to use DOS, it just might be slightly easier to run DFORMAT 
to erase GRUB and return the DoC to its "virgin" state.  

If you used Linux, you would need to have all of the proper MTD stuff 
compiled as modules, and do your "insmod" or "modprobe" *after* hot-plugging 
the DoC.  You would also need to use "eraseall" to wipe out GRUB, and I 
didn't recommend that option because of the possibility of wiping out the bad 
block table.

> - An Empty DOC
> ??

To clarify, "an empty DoC board" simply means inserting the ISA or PCI eval 
board, without installing the DoC.  Obviously, this would allow you to boot 
without the DoC GRUB taking over, and then you could "hot-plug" the DoC to 
erase it.

Keep in mind that these instructions assume a PC and a M-Sys eval-board.  If 
your system is different, please post the specifics.

For what it's worth, my development PC has an ISA eval-board, and the ability 
to "network" boot.  My target system has a *socketed* DoC, with no monitor or 
keyboard.  I make sure the DoC is bootable (from (dc0,0) with root file 
system on /dev/nftla1) prior to installing it on my target.

What version of GRUB did you use, prior to applying the patch?  I'm still 
curious as to why it doesn't recognize your root filesystem.  Are you running 
GRUB on your hard drive?

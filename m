Received: from pd9e41274.dip.t-dialin.net ([217.228.18.116] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nd4U-00056d-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 10:11:54 +0000
Message-Id: <200203201026.g2KAQH801788@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Paul <paul@oz.net>
Subject: Re: Linux SmartMedia driver advice requested
Date: Wed, 20 Mar 2002 11:26:17 +0100
References: <Pine.LNX.4.33.0203180449270.17977-100000@seattle.neotribe.com>
In-Reply-To: <Pine.LNX.4.33.0203180449270.17977-100000@seattle.neotribe.com>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Montag, 18. März 2002 22:19 , Paul wrote:

> Specifically, I'm interested in getting the SmartMedia controller
> chip inside my Toshiba laptop working under Linux.  My laptop has a
> builtin SmartMedia slot, controlled by some unspecified Toshiba PCI
> chip (at least according to /sbin/lspci).  The only Toshiba PCI
> SmartMedia controller chip I could find on the web is the TC6371AF,
> which claims to be compliant with SmartMedia Electrical
> Specification v1.20 and Physical Format Specification v1.20:
>     http://www.toshiba.co.jp/about/press/2000_10/pr0201.htm
> I've been trying to get information from Toshiba since last summer
> but they haven't even told me what chip is inside my Toshiba laptop.
> Finally, last week, they sent me the source to SMIL (SmartMedia
> Interface Library) without any docs / chip specifications.
> The SMIL appears to be a DOS or embedded program for a SmartMedia
> controller on an ISA card; it uses simple X86 port I/O on the Data,
> Mode, and Status registers.

> So while waiting for Toshiba to send me complete specs, I'm
> trying to get a head start by looking at the MTD stuff, like
> your autcpu12.c driver.
> The TC6371AF has no I/O ports, only 32 bytes of I/O memory according
> to /sbin/lspci.  So my question is this:
>     Is the SmartMedia interface standardized enough so that all
>     I have to do is to specify / ioremap the appropriate I/O memory base
>     address and make some modifations to autcpu12.c or spia.c?
>     Also, I can't find the header file "autcpu12.h" in the latest MTD CVS
>     snapshot or the latest 2.4.x kernel.  Where can I find this?
It's in the arm-kernel tree
> The reason I ask is that other SmartMedia controller chip specs
> that are documented on the web (e.g. the Ratoc RG85539CE), seem to
> differ from the SMIL source code.

I don't know much about the different SmartMedia Controllers. Most of them 
encapsulate power management for SMC, some registers to set/clr the 
ALE/CLE/CS lines of the SMC and a ECC logic.
I general it should be possible to write a driver for this, which uses most 
of the functions, we have in nand.c and the underlying chipdrivers like 
autcpu12.c or spia.c, as we have encapsulated all CS/ALE/CLE functions into 
the chipdriver. It seems to me that the TC6371AF has some registers, which 
allow you to access the CS/ALE/CLE lines, so you can easy provide this 
functionality in xxx_hwcontrol(int cmd).
RG85539CE has a similar functionality, but it's not a PCI chip like the 
TC6371AF.
All you have to do, is to provide a appropriate mapping of the data bus and 
hack the neccecary functions for ALE/CLE/CS and make sure, that power and 
Write enable lines have the appropriate level. The remaining stuff should be 
done by nand.c

That's one side of the problem. The other is, that you can use only JFFS2 on 
this devices at the moment . There is no other filesystem, which handles the 
nand stuff correct. 
If you want to use the original SMC DOS-FAT filesystem, which is used by 
MP3-Players, Digicams etc., you have to hack a new filesystem driver. The 
Toshiba source code contains the hardwarelayer, which we have already in nand 
& co, and the filesystemlayer. Due to the fact, that this code is obviously a 
DOS software, it's not seperated clearly. But you could use it as a base for 
a new filesystem, which uses the functionality of the nand & co hardware 
drivers.
I think more poeple would be interested in this. 
Not me, I use SMC as a removable disk for industrial applications and I'm not 
willing to use a DOS-FAT like filesystem for sensitive data storage. For MP3, 
Digicam etc. it's ok and you must use it to have compability with those 
systems. But I'm willing to help on all NAND related problems.

If you have more questions on this, don't bother to ask me. But keep such 
questions on the mtd-mailing list please. There might be other people 
interested too. :)

-- 
Thomas
_________________________________
Thomas Gleixner <gleixner@autronix.de>
autronix automation http://www.autronix.de

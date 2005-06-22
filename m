Received: from bay104-f41.bay104.hotmail.com ([65.54.175.51] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DktpH-0004rv-L5
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2005 21:14:49 -0400
Message-ID: <BAY104-F41416280989D8D5AF92BB484EB0@phx.gbl>
In-Reply-To: <cc9bf44d05062117103674bcc@mail.gmail.com>
From: "David L" <idht4n@hotmail.com>
To: paul@mawsonlakes.org
Date: Tue, 21 Jun 2005 17:57:27 -0700
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: loadlin boot from MTD-partitioned NAND?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>Hi David,
>Is this an Intel board rather than ARM? I'm currently working through this
>process for the ARMCore board...
Hi Paul,

It's an x86 (Geode) board from Compulab.  Their proprietary driver is able 
to mount DOS partitions and write to them and we can also read/write to/from 
the DOS partitions from DOS.  I'd like to maintain this functionality but 
I'd like to use non-proprietary drivers.  I think this means I have to add 
support for our board to MTD, but I don't know if it'll work for me when I'm 
done.

>
>What are the NAND chip details?
Compulab's driver prints out this info:
Maker code = EC, device code = 75, ID_data = BD

Their tech support gave me this info:

"Here is the info you need for the MTD:

NAND flash is memory mapped at 0x000C9000.
NAND flash ALE connected to Geode's GPWIO1
NAND flash CLE connected to Geode's GPWIO2

GPWIO are controlled via IO port 0x9C16. Bit 1 - GPWIO1,
bit 2 - GPWIO2.
** Accessing this port is relatively slow, so caching current value in
memory will improve performance.

Chipselect is GPIO20_DOCCS.

Sometimes (during read operation) chipselect must be forced active
even after the access cycle finished. It is achieved by changing the
chipselect to GPIO mode and forcing it low. See FlashChipSelect() in
NandSys.c for implementation details.

There is some preliminary hardware setup that must be performed before
accessing the NAND. See function FlashInitial() in NandSys.c

Ready/busy signal of the NAND flash chip is not connected. Therefore
each read operation must include forced delay of ~15-20uSec between
issuing read command and reading the data. In all other situation
(write/erase) status register of the NAND flash can be read.

** I wrote some speed-optimized read/write functions, see NandSys.c, see
FlashBlockRead, FlashBlockWrite. They work twice faster than regular
byte-by-byte reads/writes.

This information + NandSys.c should be enough to bring up the MTD +
JFFS2."

Cheers...

         David

>
>Paul Schulz
>
>On 6/22/05, David L <idht4n@hotmail.com> wrote:
> > Hi,
> >
> > I'm using a Nand flash driver on a Compulab board with a proprietary 
>driver
> > provided by Compulab.  I'd like to switch to a non-proprietary driver 
>like
> > MTD for a few reasons.  But having read through the MTD documentation, 
>I'm
> > not sure we can maintain our current boot strategy if we migrate to MTD.
> > Right now, we boot to DOS that comes with the board and then use loadlin 
>to
> > boot a kernel/initial ramdisk that reside on a partition of the Nand 
>flash
> > that has a DOS filesystem on it.  On the rare event that we need to 
>change
> > the kernel or initial ramdisk, we mount the DOS filesystem from Linux 
>and
> > change the file.
> >
> > Is there a way to maintain this strategy if we use MTD?  I saw in the 
>NAND
> > API document that only jffs2 and YAFFS filesystems can be used with MTD. 
>  Is
> > there any way around this? (I don't care how efficient it is).  And even 
>if
> > there is a workaround that would allow us to modify files in a DOS
> > filesystem from Linux, will MTD partitions be visible from DOS so that 
>we
> > can boot in the first place?

_________________________________________________________________
Don’t just search. Find. Check out the new MSN Search! 
http://search.msn.click-url.com/go/onm00200636ave/direct/01/

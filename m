Received: from tomts23-srv.bellnexxia.net ([209.226.175.185])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dg8r-0002eS-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2002 23:27:17 +0000
Date: Wed, 20 Feb 2002 18:38:27 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
In-Reply-To: <000301c1ba5d$91441e90$0101a8c0@dellc800>
Message-ID: <Pine.LNX.4.44.0202201803210.14779-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Mark,

After reading the int 19h description in Ralf Brown's interrupt list at
    http://www.ctyme.com/intr/rb-2270.htm 
I realize that the BIOS boot options (floppy drive, hard disk, CD-ROM,
network) should come to effect after BIOS calls the INT 19h handler.

At system startup the motherboard BIOS code checks for the BIOS extension
signatures in the region 0c0000h through 0e0000h and executes the
extensions if found:
    http://www.acl.lanl.gov/linuxbios/faq/archive/0059.html

I believe DoC has this signature in its "IPL" area.

Once the DoC "BIOS initialization", or "stage 1" area gets control, the
MTD DoC GRUB loader will install its own INT 19h handler.

This means that the BIOS boot drive order options will not have any effect
when DoC is present.  Once motherboard BIOS code invokes INT 19h, DoC
bootloader will load the kernel off particular filesystem placed on top of
NFTL DoC partition according to /boot/grub/menu.lst configuration file.

[I believe the interrupt number is mistyped as INT 18h in 
README_DiskOnChip, former grub/README].

Does the "Jumping to Grub" message show up during startup 
(stage1/doc_stage1.S)?  Does this message come next?
   Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0xff

If yes, enabling the DOC_DEBUG definition in stage2/shared.h might make 
sense.  If no, the stage1/doc_stage1{,b}.S code will need some work.

In either case the open source MTD drivers will have to be used later in 
the kernel.  The proprietory M-Sys drivers rely on their own boot loader 
which installs INT 13h as a disk I/O call.

Thanks for trying,

Ilguiz

On Wed, 20 Feb 2002, Mark Meade wrote:

> I'm trying to boot from the DOC ISA eval board on a PC with an AMI BIOS
> -- and I believe "boot from NETWORK" should call INT 18h.  I also tried
> booting from a floppy with the boot record modified to call int 18.  In
> either case, my PC doesn't seem to recognize the DOC at boot time.

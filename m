Received: from tomts15-srv.bellnexxia.net ([209.226.175.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170OkM-0006le-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 16:31:54 +0100
Date: Wed, 24 Apr 2002 11:31:51 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Thomas Preisig <preisig@darkwater.ch>
cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from a DiskOnChip2000
In-Reply-To: <3CC6A4D2.C230215@darkwater.ch>
Message-ID: <Pine.LNX.4.44.0204241113070.12872-100000@server.superbt.com>
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

Thomas,

I believe lilo can talk to devices by means of BIOS calls.  If I
understand correctly, the M-Systems patch to lilo adds the mapping of the
/dev/ftla (?) root device name to the appropriate BIOS disk number.

I infer from your description that you haven't made a complete choice
between using the M-System's Linux driver and the MTD doc2000.c driver.

If you are going for M-System's driver, I think you may need to specify
the correct device name (/dev/ftla ?) as a root device (and optionally as
a boot device) in /etc/lilo.conf.

Then the lilo command should be able to write down the block numbers of
the kernel image it needs to load at system startup.

If you are going for the MTD doc2000.c driver which doesn't attempt to
emulate age old real mode BIOS API, then the bootloader will have to
access the content of the NFTL layer by using a bootstrap driver similar
to the kernel doc2000.c module.  

The MTD CVS repository contains the patch to the GRUB bootloader which
performs the above bootstrap access.  As a bonus, the GRUB bootloader
doesn't require any block numbers list to find the kernel image as it has
the bootstrap drivers for the most of filesystems as well.

The latest DOC 2000 / Millennium patch is in CVS directory

        mtd/patches/grub-2002-02-19-doc.patch

You may need to download the source code of GRUB off its own CVS
repository at

        http://savannah.gnu.org/projects/grub/

The copy of the DOC 2000 / Millennium patch can also be found in the Patch
Area of the GRUB project.

Ilguiz

On Wed, 24 Apr 2002, Thomas Preisig wrote:

> I used a patched lilo version 21 from M-System. If I run lilo I get the
> message: Sorry don't know how to handle device 0x5d01.

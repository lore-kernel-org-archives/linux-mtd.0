Received: from tomts11.bellnexxia.net ([209.226.175.55] helo=tomts11-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17D6AI-0003tW-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 May 2002 17:19:10 +0100
Date: Wed, 29 May 2002 12:19:08 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Frederic Marmond <fmarmond@eprocess.fr>
cc: linux-mtd@lists.infradead.org
Subject: Re: UnitSizeFactor in nftlmount.c
In-Reply-To: <3CF4EDE4.2080100@eprocess.fr>
Message-ID: <Pine.LNX.4.44.0205291152410.3100-100000@server.superbt.com>
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

Frederic,

On Wed, 29 May 2002, Frederic Marmond wrote:

> i made a "nftl_format /dev/mtd0 2097152", from the lastest CVS from 

I believe the second parameter is a start offset for the NFTL layer.  It 
can be supplied to provide a space for the bootloader.

The error might persist because part of the older NFTL layer still remains 
in the beginning of the chip.

On Wed, 29 May 2002, Frederic Marmond wrote:

> but impossible to boot (even with the "lilo-mtd -r /diskonchip").

As far as I know the lilo patched by M-Sys operates with the boot media
through BIOS calls.  The M-Sys firmware stored in the beginning of the
flash memory hooks up to the BIOS disk interrupt and will emulate a hard
disk.

I haven't tried combining the M-Sys firmware with MTD drivers as they
perform the same task.  The choice of Linux driver for DOC 2000 (M-Sys or
MTD) will affect the choice of the bootloader.  With the M-Sys driver, the 
lilo loader provided by M-Sys will operate with the chip via BIOS.  It 
will make sense to stay with the same firmware when running Linux then.

One of the bootloader DOC2000 BIOS disk interface for the bootloader Using
MTD drivers instead of M-Sys allows to replace the M-Sys firmware because 
the latter is no longer critical for Linux kernel operation.

A patch exists to make another bootloader (GRUB) aware of DOC 2000 and its 
NFTL layer.  Essentially the patch provide a block read interface to the 
NFTL "payload".

The GRUB bootloader can be found at

    http://savannah.gnu.org/projects/grub

and the patch is the

    patches/grub-2002-02-19-doc.patch

file from MTD tree.  The patch contains a short instruction on building 
and installing the firmware in README_DiskOnChip.  See also

    http://lists.infradead.org/pipermail/linux-mtd/2002-May/004811.html

Ilguiz

Received: from tomts11.bellnexxia.net ([209.226.175.55] helo=tomts11-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 166xo9-0003ZI-00
	for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2001 17:38:41 +0000
Date: Thu, 22 Nov 2001 12:48:29 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: DAVID Guillaume <guillaume.david@mensi.com>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Can't modify my DoC anymore (pb with GRUB)
In-Reply-To: <20011122140413.3E0E7FE89@tasmanie.mensi.net>
Message-ID: <Pine.LNX.4.33.0111221125260.4201-100000@server.superbt.com>
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

David,

On Sat, 1 Jan 2000, DAVID Guillaume wrote:

> But it seems that loading the kernel fails and grub runs a minimal
> bash.

I am curious if it is just the kernel or the menu and the kernel that
could not be loaded.  Could you try to stop the possible automatic menu
selection by pressing an arrow key during system startup?

If the menu could not be loaded, I'd suggest to see the partitions of DOC
by using the autocomplete feature of the GRUB command line.  Type in "root
(dc0," and press the Tab key.

As David Woodhouse said, it is possible to create a filesystem on the NFTL
space of the chip without partitioning it.

DW, I did set the boot drive to dc0 in the updated grub-0.90 patch, so no
floppy seek will be issued by GRUB.  The menu file will be sought in the
whole NFTL space first.  This should be appropriate when the whole NFTL
space is marked by the make file system utility.  If the menu file could
not be found, then the patched GRUB will assume the space is partitioned.
There will be an attempt to mount the first partition.

I never tested the whole space filesystem case.

> Moreover, I'm forced to let the disk-on-chip plugged if I want to
> correct it !

I heard and applied few times a common sense dangerous trick.  Remove DOC
from motherboard, and put it back into the cradle when the system has
started.

This may cost not only the chip, but your life if there is a high voltage
around, as some HOWTO suggested,

[I suppose you have "DIP package" chip.  I myself find the cradle too
tight.  The legs can be damaged.  Inserting the chip in a wrong way can
toast it.]

The DiskOnChip debug information can be displayed by uncommenting "#define
DOC_DEBUG" in the GRUB's stage2/shared.h file, recompiling stage2 and
re-linking the DOC bootloader.  The screen will not be cleared in debug
mode.

Ilguiz

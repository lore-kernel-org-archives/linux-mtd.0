Received: from [64.90.21.200] (helo=atlaspdc.atlas-tech.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ARCrk-0005kE-Ae
	for <linux-mtd@lists.infradead.org>; Tue, 02 Dec 2003 15:55:08 +0000
Message-ID: <08F9C91BD42DD411A48900C04F109FD4C733AF@atlaspdc.atlas-tech.com>
From: "mark a. mixson" <mmixson@atlas-tech.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 2 Dec 2003 10:53:25 -0500 
MIME-Version: 1.0
Content-Type: text/plain
Subject: DOC + GRUB + MTD + compressed ext2 root ramdisk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ilguiz,

You essentially solved my problem (:  chroot was what I needed.  I found
that my libraries needed to be executable.  David Woodhouse pointed that out
on another post on this mailing-list
(http://lists.infradead.org/pipermail/linux-mtd/2001-December/003695.html).
At least I found out my problem -- thanks everyone.

Mark Mixson

-----Original Message-----
From: Ilguiz Latypov [mailto:ilatypov@infradead.org] 
Sent: Monday, December 01, 2003 9:16 PM
To: linux-mtd@lists.infradead.org
Subject: Re: DOC + GRUB + MTD + compressed ext2 root ramdisk


Mark,

On Mon, Dec 01, 2003 at 04:25:39PM -0500, mark a. mixson wrote:

> Kernel panic: No init found. Try passing init= option to kernel.

Have you tried chroot-ing into the ramdisk image and starting /bin/sh there?

One can also try to create a romfs ramdisk for a read-only boot.  This would
help to dissect the problem area.

-- 
Ilguiz

Received: from saturn.open-widgets.com ([209.251.101.200] helo=saturn.billgatliff.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184NHv-0000sm-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 16:19:15 +0100
Date: Wed, 23 Oct 2002 10:49:57 -0500
From: "William A. Gatliff" <bgat@billgatliff.com>
To: linux-mtd@lists.infradead.org
Subject: mtdblock_ro and ext2 yields panic: block not locked
Message-ID: <20021023104957.G8758@saturn.billgatliff.com>
Reply-To: bgat@billgatliff.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Guys:


I'm running linux-2.4.18-mips on an Au1500 board with an AMD AM29LV642
flash.  I'm using the readonly block driver and a partitioned flash.
The mtdblock_ro.c file has "mtdblock_ro.c,v 1.9" at the top.

I've been tinkering with mounting ext2 and romfs root filesystems at
boot from my mtdblock0 partition.  I seem to be able to mount romfs
fine, but when I use ext2, I get this:

...
ttyS03 at 0xb1400000 (irq = 3) is a 16550
mtdblock_open
ok
mtdblock_open
ok
mtdblock_release
ok
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 192k freed
Kernel panic: mtdblock: block not locked


The panic comes via the INIT_REQUEST macro in mtdblock_request, but
only after half a dozen requests or so.  The requests appear to be
associated with the execve at the end of the kernel boot process.

I also get this with yesterday's CVS.

Ideas?  I don't think this is an MTD problem per se, but I'm stumped
nonetheless.


Thanks!


b.g.
-- 
Bill Gatliff
I'm an embedded GNU developer first, GNU instructor second.
See http://billgatliff.com for details.

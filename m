Received: from 64-166-72-137.ayrnetworks.com ([64.166.72.137] helo=ayrnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16m5LF-0005TZ-00
	for <linux-mtd@lists.infradead.org>; Sat, 16 Mar 2002 03:58:49 +0000
Received: (from wjhun@localhost)
	by  ayrnetworks.com (8.11.2/8.11.2) id g2G49OL22782
	for linux-mtd@lists.infradead.org; Fri, 15 Mar 2002 20:09:24 -0800
Date: Fri, 15 Mar 2002 20:09:24 -0800
From: William Jhun <wjhun@ayrnetworks.com>
To: linux-mtd@lists.infradead.org
Subject: "Kernel panic: mtdblock: request list destroyed" with recent changes
Message-ID: <20020315200923.J6821@ayrnetworks.com>
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

Hi,

I'm a bit new to mtd-land, but I'm having a problem with a freshly
updated cvs tree and the mtdblock driver. My kernel is based on
linux-2.4.2 and has symlinks for drivers/mtd and include/linux/mtd to
point to my mtd cvs sources.  A kernel build with a sticky tag set to
03/10/2002 works perfectly fine, but the latest tree gives me this:

[...]
devfs: v0.102 (20000622) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
VFS: Mounted root (ext2 filesystem).
Mounted devfs on /dev
Freeing unused kernel memory: 64k freed
Kernel panic: mtdblock: request list destroyed

This happens whether there are MTD devices registered or not, so I
doubt this is related to any low-level flash drivers/devices. I
noticed some changes that happened to mtdblock.c on 3/11; perhaps
these are related?  Sorry, no call trace or anything...

Any ideas?

Thanks,
Will

[wjhun@mcnaulty mtd]$ cvs status mtdblock.c
===================================================================
File: mtdblock.c        Status: Up-to-date

   Working revision:    1.52
   Repository revision: 1.52    /home/cvs/mtd/drivers/mtd/mtdblock.c,v
   Sticky Tag:          (none)
   Sticky Date:         2002.03.10.08.00.00
   Sticky Options:      (none)
[wjhun@mcnaulty mtd]$ cd ../..
[wjhun@mcnaulty mtd-main]$ cvs update -A
[...]
cvs server: Updating .
cvs server: Updating boot
cvs server: Updating drivers
cvs server: Updating drivers/mtd
P drivers/mtd/mtdblock.c
P drivers/mtd/mtdblock_ro.c
P drivers/mtd/nftlmount.c
cvs server: Updating drivers/mtd/chips
M drivers/mtd/chips/jedec_probe.c
cvs server: Updating drivers/mtd/devices
cvs server: Updating drivers/mtd/maps
P drivers/mtd/maps/dilnetpc.c
P drivers/mtd/maps/sa1100-flash.c
cvs server: Updating drivers/mtd/nand
cvs server: Updating ffs2
cvs server: Updating fs
cvs server: Updating fs/ffs2
cvs server: Updating fs/jffs
cvs server: Updating fs/jffs2
P fs/jffs2/TODO
P fs/jffs2/build.c
P fs/jffs2/dir.c
P fs/jffs2/fs.c
P fs/jffs2/gc.c
P fs/jffs2/malloc.c
P fs/jffs2/nodelist.c
P fs/jffs2/nodelist.h
P fs/jffs2/nodemgmt.c
P fs/jffs2/scan.c
P fs/jffs2/super.c
P fs/jffs2/wbuf.c
cvs server: Updating fs/jffs2/compressors
cvs server: Updating fs/jffs2/test
cvs server: Updating grub
[...]

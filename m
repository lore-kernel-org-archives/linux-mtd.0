From: tglx@linutronix.de (Thomas Gleixner)
Date: Tue, 18 Feb 2003 14:09:25 +0100
Subject: NAND ECC and OOB usage
Message-ID: <200302181409.25070.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I have changed the oob-selection for NAND as follows:

1. A default oob selector is added to the mtd structure. It can be initialized 
on compile time or modified on runtime. For partitioned devices a default 
selector is included in the partition description structure. This can be set
on compile time (see autcpu12.c) or on runtime.

The runtime setting is done via ioctl (fd, MEMSETOOBSEL, &newsel), where
newsel is an integer containing your chosen select type.

Not that MEMREADDATA and MEMWRITEDATA are not longer available,
as they are obsolete now.

2. If read or write access occur from userspace the default obb-selector for 
the partition / chip is used. You can still set it to NAND_OOB_NONE, if you 
do not want to do ECC from userspace. This makes only sense if you copy a
fs-image with full oob-data including ECC to the chip.

3. Filesystem layers do not longer give the constants NAND_FS_OOB to the
read/write functions. They have to provide a pointer to an integer variable,
which conains the constant. JFFS2 is changed already. A YAFFS-patch is on the 
way.
__________________________________________________________________
I have added formatting capability to mtd-utils "eraseall". eraseall -j 
/dev/mtdx will erase the chip / partition and write the cleanmarkers to it. 
This works for NOR too.
__________________________________________________________________
In mtd-utils is a overhauled nandwrite, which lets you copy a fs-image bad 
block aware to your formatted partition.
nandwrite -j /dev/mtdX image
The -j option sets the default oob-selector of this partition to 
NAND_JFFS2_OOB. Bad blocks are skipped.

There is also an option for YAFFS layout. The commandline should be
nandwrite -y -o /dev/mtdx image
This will write oob data too and place the ECC into the yaffs places.
Your image should have the ECC-Data set to 0xff for this purpose.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de

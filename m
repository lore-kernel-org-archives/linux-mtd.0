Received: from shawidc-mo1.cg.shawcable.net ([24.71.223.10]
	helo=pd3mo3so.prod.shaw.ca)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AX4aW-0007eg-DZ
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2003 20:17:36 +0000
Received: from pd3mr4so.prod.shaw.ca (pd3mr4so-ser.prod.shaw.ca
	[10.0.141.180])2003))linux-mtd@lists.infradead.org;
	Thu, 18 Dec 2003 13:10:01 -0700 (MST)
Received: from shaw.ca (pd2ms2so-con.prod.shaw.ca [10.0.122.118])
 by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28 2003))
 with ESMTP id <0HQ300682XCPMG@l-daemon> for linux-mtd@lists.infradead.org;
 Thu, 18 Dec 2003 13:10:01 -0700 (MST)
Date: Thu, 18 Dec 2003 12:10:01 -0800
From: thomaspang@shaw.ca
To: linux-mtd@lists.infradead.org
Message-id: <96e8c92245.9224596e8c@shaw.ca>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-language: en
Content-transfer-encoding: 7BIT
Content-disposition: inline
Subject: Problem with mtd-snapshot-20031211.tar
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have problems with the latest MTD snapshot running on Linux kernel 2.4.22.

I have integrated the MTD snapshot (which is supposed to give better JFFS2
performance) dated 2003-12-11 into my linux kernel 2.4.22.  I modify my
kernel as per mtd-jffs-HOWTO.txt and cross-compile it for ARM9 processor.
Primary changes to the linux kernel include:

arch/arm/kernel/setup.c - calls physmap_configure and physmap_set_partitions
drivers/mtd/maps - to use ioremap_nocache() instead as my ARM9 processor
                   has cache in it

I download the boot image into my target system and successfully boot up
the board.  I also download the file systems, one is CRAMFS, another one
is JFFS2.

I am using the latest mkfs.jffs2 to create my JFFS2 file system as shown
below:

mkfs.jffs2 -p -e 0x10000 -c 12 -b -r rootfs -o jffsImage

where rootfs is my file system, and jffsImage is the corresponding JFFS2 
image.

Problem 1 (Fail to mount JFFS2 file system)
===========================================

I seem to be able to mount the JFFS2 file system but when I access the 
JFFS2 file system, the system complains "Chip not ready after erase 
suspended: status = 0x1985". Any idea?


Below are messages from the system:

...
physmap flash device: 8000000 at 0
phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit mode
phys_mapped_flash: Found 1 x16 devices at 0x2000000 in 16-bit mode
... 
number of CFI chips: 2
...
Using physmap partition definition
Creating 4 MTD partitions on "phys_mapped_flash":
0x00000000-0x00800000 : "Physically mapped flash"
mtd: Giving out device 0 to Physically mapped flash
0x00000000-0x00400000 : "boot"
mtd: Giving out device 1 to boot
0x00400000-0x00500000 : "root"
mtd: Giving out device 2 to root
0x00500000-0x00800000 : "fs"
mtd: Giving out device 3 to fs


# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00010000 "Physically mapped flash"
mtd1: 00400000 00010000 "boot"
mtd2: 00100000 00010000 "root"
mtd3: 00300000 00010000 "fs"


# mount -t jffs2 /dev/mtdblock3 /mnt
mtdblock_open
ok
# ls
bin      etc      linuxrc  proc     tmp      var
dev      lib      mnt      sbin     usr
# cd mnt
# ls
Chip not ready after erase suspended: status = 0x1985
error -5 reading node at 0x001901f8 in get_inode_nodes()
jffs2_get_inode_nodes() for ino 2 returned -5
ls: ./bin: Input/output error
Chip not ready after erase suspended: status = 0x1985
error -5 reading node at 0x000586b4 in get_inode_nodes()
jffs2_get_inode_nodes() for ino 3 returned -5
ls: ./dev: Input/output error
Chip not ready after erase suspended: status = 0x1985
error -5 reading node at 0x00058af0 in get_inode_nodes()
jffs2_get_inode_nodes() for ino 4 returned -5
ls: ./etc: Input/output error
Chip not ready after erase suspended: status = 0x1985
error -5 reading node at 0x00000188 in get_inode_nodes()
jffs2_get_inode_nodes() for ino 5 returned -5
ls: ./lib: Input/output error
Chip not ready after erase suspended: status = 0x1985
error -5 reading node at 0x00000358 in get_inode_nodes()
jffs2_get_inode_nodes() for ino 9 returned -5
ls: ./tmp: Input/output error
Chip not ready after erase suspended: status = 0x1985
error -5 reading node at 0x0005a660 in get_inode_nodes()
jffs2_get_inode_nodes() for ino 11 returned -5

... (I have to press ctrl-C to stop it.)

# 

Problem 2 (Writing to JFFS2 file system still slow)
===================================================

Try different way of setting up the JFFS2 file system.
Instead of downloading the file image directly into the MTD partition,
I follow the steps shown in mtd-jffs-HOWTO.txt and have the following
observations:

(1) ereaseall fails

    # eraseall --help
    Usage: eraseall [OPTION] MTD_DEVICE
    Erases all of the specified MTD device.

      -j, --jffs2    format the device for jffs2
      -q, --quiet    don't display progress messages
          --silent   same as --quiet
          --help     display this help and exit
          --version  output version information and exit

    # eraseall -j /dev/mtdblock3
    mtdblock_open
    ok
    eraseall: /dev/mtdblock3: unable to get mtdblock_release
    okD device info

(2) I therefore use erase command.  (seems okay)

    # erase /dev/mtdblock3 0 0x300000
    mtdblock_open
    ok
    Erase Total 3145728 Units
    mtdblock_release
    ok

(3) Copy the file image to MTD device  (seems okay, but why mtdblock_release?)
    # cp /tmp/jffsImage /dev/mtdblock3
    mtdblock_open
    ok
    mtdblock_release
    ok
    #

(4) Mounting JFFS2 file system to /mnt (seems ok)

    # mount -t jffs2 /dev/mtdblock3 /mnt
    mtdblock_open
    ok

(5) Copy a file but it takes long!

    cd /mnt
    cp bin/myfile .

    myfile is of the size of about 400k.  It takes 40 seconds!

(6) Remove the file and try again but fails!

    rm myfile
    cp bin/myfile .
    Chip not ready after erase suspended: status = 0xffff
    Chip not ready after erase suspended: status = 0xffff
    Write of 2021 bytes at 0x00268f74 failed. returned -5, retlen 0
    Not marking the space at 0x00268f74 as dirty because the flash driver 
    returned retlen zero
    Chip not ready after erase suspended: status = 0x1985
    Error reading node from 0x00268828: -5
    cp: write: Input/output error



Any helps would be much appreciated.

Thanks.

Thomas

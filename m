Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 135ndl-0001UJ-00
	for mtd-list@infradead.org; Sat, 24 Jun 2000 11:58:21 +0100
Date: Sat, 24 Jun 2000 11:59:38 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Juan Gonzo <kayemmess@yahoo.ca>
cc: MTD Mailing List <mtd@infradead.org>
Subject: Re: newbie trying to figure out MTD
In-Reply-To: <20000623200502.17301.qmail@web5303.mail.yahoo.com>
Message-ID: <Pine.LNX.4.21.0006241132180.1089-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 23 Jun 2000, Juan Gonzo wrote:

> I have little experience with the internals of Linux,
> but I have been tasked with getting FTL to work with
> an embedded Linux system.

Unless you're in the Free World, you're not permitted to use FTL on
non-PCMCIA devices. Use JFFS instead.



>     1. Boot target with ram disk.
>     2. Install the mtd module(s).
>     3. Create an Ext2 filesystem with 
>        'mkfs -t ext2 /dev/ftl'
>        or something to that effect.
>     4. Populate the flash disk with the neccessary
>        files
>     5. Make the ftl device the root device.

> Could someone comment on what I am trying to accomplish
> vs. what I am doing?  Or perhaps some general instructions on 
> how I should use MTD?   

Don't bother with modules - compile the stuff straight into the
kernel. The toy on my desk is using Intel Strataflash as a root filesystem
and booting straight into it. Currently, I'm using ext2-on-FTL but that's
a temporary step until I have JFFS working properly.

Check out the current version of the code from CVS, as per the
instructions on the web site. Even if you've never used CVS before, all
you need to do is cut and paste the two lines shown, and enter the
password 'anoncvs' when prompted for it.

Now copy the code into place in your kernel source tree as follows:

LINUXDIR=/usr/src/linux
cp -av mtd/kernel $LINUXDIR/drivers/mtd
cp -av mtd/include/linux/mtd $LINUXDIR/include/linux/mtd
cp -v mtd/include/linux/jffs.h $LINUXDIR/include/linux
cp -av mtd/fs/jffs $LINUXDIR/fs/jffs

Now make the appropriate changes to your kernel tree to make it use the
new code. There's a patch for 2.4 (which doesn't yet include JFFS) in the
mtd/patches directory, and I'll make a new one for 2.2 on Monday if
someone prods me to remind me.

make oldconfig and enable:

	Memory Technology Device (MTD) support
	  Common Flash Interface (CFI) support
	  CFI support for Intel/Sharp Extended Command Set chips
	  CFI chips on memory bus support
	  Direct blockdevice access to MTD devices
	Journalling Flash filesystem (JFFS) support

Now edit drivers/mtd/nora.c and change the WINDOW_ADDR and WINDOW_SIZE
definitions to match the address at which the flash chips are mapped in
your system.

Boot it up and mount -t jffs /dev/mtdblock0 /mnt

Now you should have a JFFS filesystem. By putting some useful files and
devices on it, and setting the kernel's root device to 0x1f,0 you can use
it as a root filesystem.

Of course it's not quite perfect yet. The CFI code is very new, and so far
it only detects a single chip - if you have more than one mapped next to
each other it won't find more than one. My testbed has two, though, so
it's fairly high on my priority list. Also, the code busy-waits for flash
erases and writes, rather than scheduling. That's to be fixed very shortly
too.

Also, my first attempt yesterday as using JFFS for a root filesystem
failed because of a problem with jffs_mknod - that should be fixed now but
I haven't tested it again yet.

To import any updates which are made to the CVS version of the code, all
you need to do is:

cd /usr/src/linux/drivers/mtd
cvs update
cd /usr/src/linux/include/linux/mtd
cvs update
cd /usr/src/linux/fs/jffs
cvs update

The only thing you _might_ miss that way is an update to
include/linux/jffs.h - what I actually do is set up a symlink farm -
rather than copying the files into the Linux kernel tree, I just make the
directories, and symlink the actual files from wherever I put the cvs copy
of the MTD code. That way, I just need to update in one place, and when
I'm testing code in three or four different kernel versions and
architectures, I only have to edit one copy.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

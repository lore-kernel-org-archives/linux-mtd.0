Received: from dcardamo.ott.istop.com ([66.11.174.105] helo=sparky.hld.ca)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19lMMW-0006RN-8e
	for <linux-mtd@lists.infradead.org>; Sat, 09 Aug 2003 06:33:56 +0100
Received: from sparky.hld.ca (localhost [127.0.0.1])
	by sparky.hld.ca (8.12.9/8.12.9/Debian-1) with ESMTP id h795XjCP027139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Sat, 9 Aug 2003 01:33:45 -0400
Received: (from dan@localhost)
	by sparky.hld.ca (8.12.9/8.12.9/Debian-1) id h795XjOB027137
	for linux-mtd@lists.infradead.org; Sat, 9 Aug 2003 01:33:45 -0400
Date: Sat, 9 Aug 2003 01:33:45 -0400
From: Dan Cardamore <dan.cardamore@officeserver.ca>
To: linux-mtd@lists.infradead.org
Message-ID: <20030809053345.GA27061@officeserver.ca>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
Subject: Problem mounting JFFS2 as root, works for ext2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to use a JFFS2 partition as my root file system.

Setup I have:
   - Compact flash connected to an IDE adapter:
      - /dev/hda1 = ext2 with kernel and initrd
      - /dev/hda2 aka /dev/mtdblock/1 is the JFFS2 image
      - /dev/hda3 = ext2, same contents as the JFFS2 image, just a
        differnet fstab
   - GRUB installed on /dev/hda boots using /dev/hda1's kernel and
     initrd.
   - kernel then mounts the real root device

The boot parameters I use for a JFFS2 root are:
blkmtd_device=/dev/hda2 blkmtd_erase=64 devfs=mount root=/dev/mtdblock/1 rw

The boot parameters I use for a JFFS2 root are:
blkmtd_device=/dev/hda2 blkmtd_erase=64 devfs=mount root=/dev/hda3 rw

If I boot using JFFS2 as my root, I get:
<snip>
VFS: Mounted root (jffs2 filesystem)
mount_devfs_fs(): unable to mount devfs, err: -2
Freeing unused kerneel memory: 132k freed
Warning: unable to open an initial console.
Kernel panic: No init found.  Try passing init= option to the kernel

If I boot from /dev/hda3 as my root (ext2), I get everything working
perfect.  Once I have my system up and running, I can then type:
mount -t jffs2 -o rw /dev/mtdblock/1  /mnt
And it works just fine with no warnings.  I can see that the filesystem
has all the contents that the ext2 filesystem has including /dev.  When
I mount it at this point, I can run lsmod and see that zero kernel
modules are loaded since I compiled everything built-in.

So I'm using the same kernel and the same filesystem, just different
root filesystem type.  Does anyone have an idea what could be going on
here?  Any help much appreciated.

Thanks,

Dan

--
Dan Cardamore                              dan.cardamore@officeserver.ca
Cell: (613)355-8048                        http://www.officeserver.ca

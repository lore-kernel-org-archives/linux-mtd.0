Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7hEt-0004iS-5i
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 11:54:09 +0000
Received: by mail-qk0-x235.google.com with SMTP id k74so49257299qke.1
 for <linux-mtd@lists.infradead.org>; Mon, 08 May 2017 04:53:46 -0700 (PDT)
MIME-Version: 1.0
From: Jonas Rydow <jrydow@gmail.com>
Date: Mon, 8 May 2017 13:53:44 +0200
Message-ID: <CAHwR_AUUZLLhLqz9zkQ5UqYZ1JMM8q764d1Jhvo=98LwxePtfQ@mail.gmail.com>
Subject: 
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using squashfs on ubiblock on a nand flash.
This works fine when flashed on target with ubi tools but when I try
to make ubi image with the
squash fs on I run into trouble. The version of the ubi tools is 1.5.2.

Short version:
I have searched but I don't find any info on how to use ubinize to
accomplish the setup with several
ubi volumes containing ubiblock devices with squashfs on top. Any help
would be appreciated.

The long version:
The squash rootfs is created like this:
*****************************************
/usr/bin/mksquashfs rootfs rootfs.sqfs
*****************************************
This works fine when flashing on target this way:

# flash_erase /dev/mtd10 0 0
# ubiformat /dev/mtd10 -O 2048

# ubiattach -p /dev/mtd10 -O 2048

# ubimkvol /dev/ubi0 -N rootfs -s 80MiB
# ubiblock -c /dev/ubi0_0
# ubiupdatevol /dev/ubi0_0 rootfs.sqfs
# ls /tmp/sqsh/ #Shows the expected rootfs

I then tried to make a ubi image of the above with the following ini file:
*****************************************
[rootfs-volume]
mode=ubi
image=rootfs.sqfs
vol_id=0
vol_size=80MiB
vol_type=dynamic
vol_name=rootfs

[rootfs-backup-volume]
mode=ubi
image=rootfs.sqfs
vol_id=1
vol_size=80MiB
vol_type=dynamic
vol_name=rootfs-backup
*****************************************

This is then ubinized with the following command:

# ubinize -o rootfs.ubi -m 2048 -p 128KiB -s 512 -O 2048 ubinize.ini

I previously used ubifs instead of squashfs and that worked correctly,
which means that should
have working parameters for the flash layout for in the ubinize command.

I flash this to target:
# flash_erase /dev/mtd10 0 0
# nandwrite -p /dev/mtd10 rootfs.ubi

When I try to attach:
# ubiattach -p /dev/mtd10 -O 2048
I get the following from the kernel:
*****************************************
[  241.198465] ubi0: default fastmap pool size: 95
[  241.203056] ubi0: default fastmap WL pool size: 47
[  241.208834] ubi0: attaching mtd10
[  241.213988] omap2-nand 8000000.nand: uncorrectable bit-flips found
[  241.220805] ubi0 warning: ubi_io_read: error -74 (ECC error) while
reading 64 bytes from PEB 0:0, read only 64 bytes, retry
[  241.232551] omap2-nand 8000000.nand: uncorrectable bit-flips found
[  241.239101] ubi0 warning: ubi_io_read: error -74 (ECC error) while
reading 64 bytes from PEB 0:0, read only 64 bytes, retry
[  241.250797] omap2-nand 8000000.nand: uncorrectable bit-flips found
[  241.257261] ubi0 warning: ubi_io_read: error -74 (ECC error) while
reading 64 bytes from PEB 0:0, read only 64 bytes, retry
[  241.268941] omap2-nand 8000000.nand: uncorrectable bit-flips found
[  241.275156] ubi0 error: ubi_io_read: error -74 (ECC error) while
reading 64 bytes from PEB 0:0, read 64 bytes
[  241.285453] CPU: 0 PID: 561 Comm: ubiattach Not tainted 4.4.41-g7c580a51af #1
[  241.292624] Hardware name: Generic AM33XX (Flattened Device Tree)
[  241.299074] [<c0015bb0>] (unwind_backtrace) from [<c0012d7c>]
(show_stack+0x10/0x14)
[  241.306908] [<c0012d7c>] (show_stack) from [<c02f5f90>]
(ubi_io_read+0x12c/0x308)
[  241.314436] [<c02f5f90>] (ubi_io_read) from [<c02f63a0>]
(ubi_io_read_ec_hdr+0x48/0x204)
[  241.322890] [<c02f63a0>] (ubi_io_read_ec_hdr) from [<c02fb680>]
(scan_peb.part.1+0x30/0x6f8)
[  241.331408] [<c02fb680>] (scan_peb.part.1) from [<c02fcd20>]
(ubi_attach+0x13c/0x3a8)
[  241.339508] [<c02fcd20>] (ubi_attach) from [<c02f0304>]
(ubi_attach_mtd_dev+0x72c/0xd14)
[  241.347673] [<c02f0304>] (ubi_attach_mtd_dev) from [<c02f1a30>]
(ctrl_cdev_ioctl+0xe8/0x1fc)
[  241.356379] [<c02f1a30>] (ctrl_cdev_ioctl) from [<c00f28a0>]
(do_vfs_ioctl+0x484/0x720)
[  241.364432] [<c00f28a0>] (do_vfs_ioctl) from [<c00f2ba8>]
(SyS_ioctl+0x6c/0x7c)
[  241.372004] [<c00f2ba8>] (SyS_ioctl) from [<c000f620>]
(ret_fast_syscall+0x0/0x3c)
[  241.380133] omap2-nand 8000000.nand: uncorrectable bit-flips found
[  241.386778] ubi0 warning: ubi_io_read: error -74 (ECC error) while
reading 512 bytes from PEB 0:2048, read only 512 bytes, retry
[  241.398943] omap2-nand 8000000.nand: uncorrectable bit-flips found
[  241.405161] ubi0 warning: ubi_io_read: error -74 (ECC error) while
reading 512 bytes from PEB 0:2048, read only 512 bytes, retry
[  241.417627] omap2-nand 8000000.nand: uncorrectable bit-flips found
[  241.423851] ubi0 warning: ubi_io_read: error -74 (ECC error) while
reading 512 bytes from PEB 0:2048, read only 512 bytes, retry
[  241.436229] omap2-nand 8000000.nand: uncorrectable bit-flips found
[  241.442451] ubi0 error: ubi_io_read: error -74 (ECC error) while
reading 512 bytes from PEB 0:2048, read 512 bytes
[  241.453097] CPU: 0 PID: 561 Comm: ubiattach Not tainted 4.4.41-g7c580a51af #1
[  241.460294] Hardware name: Generic AM33XX (Flattened Device Tree)
[  241.466659] [<c0015bb0>] (unwind_backtrace) from [<c0012d7c>]
(show_stack+0x10/0x14)
[  241.474455] [<c0012d7c>] (show_stack) from [<c02f5f90>]
(ubi_io_read+0x12c/0x308)
[  241.482221] [<c02f5f90>] (ubi_io_read) from [<c02f65a8>]
(ubi_io_read_vid_hdr+0x4c/0x204)
[  241.490470] [<c02f65a8>] (ubi_io_read_vid_hdr) from [<c02fb770>]
(scan_peb.part.1+0x120/0x6f8)
[  241.499342] [<c02fb770>] (scan_peb.part.1) from [<c02fcd20>]
(ubi_attach+0x13c/0x3a8)
[  241.507240] [<c02fcd20>] (ubi_attach) from [<c02f0304>]
(ubi_attach_mtd_dev+0x72c/0xd14)
[  241.515584] [<c02f0304>] (ubi_attach_mtd_dev) from [<c02f1a30>]
(ctrl_cdev_ioctl+0xe8/0x1fc)
[  241.524073] [<c02f1a30>] (ctrl_cdev_ioctl) from [<c00f28a0>]
(do_vfs_ioctl+0x484/0x720)
[  241.532335] [<c00f28a0>] (do_vfs_ioctl) from [<c00f2ba8>]
(SyS_ioctl+0x6c/0x7c)
[  241.539708] [<c00f2ba8>] (SyS_ioctl) from [<c000f620>]
(ret_fast_syscall+0x0/0x3c)
[  241.548115] omap2-nand 8000000.nand: uncorrectable bit-flips found
*****************************************
Which goes on and on.

I am obviously missing something when I create the rootfs.ubi. Any
ideas of what I am doing wrong? Do I need to prepare the squashfs in
some way to make it suitable for nand usage?

Jonas
Best regards

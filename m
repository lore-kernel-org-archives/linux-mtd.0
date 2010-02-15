Received: from mail-pz0-f179.google.com ([209.85.222.179])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ngwhu-0005N9-UA
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 08:53:35 +0000
Received: by pzk9 with SMTP id 9so2988282pzk.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Feb 2010 00:53:28 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 15 Feb 2010 00:53:28 -0800
Message-ID: <cf70f0211002150053w29f690bj542c4f7c3e9dc626@mail.gmail.com>
Subject: ubifs errors for BeagleBoard
From: Shivdas Gujare <shivdas.tech@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: beagleboard@googlegroups.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am trying to use UBIFS on Omap3 BeagleBoard (kernel version 2.6.33)
I am quite new to flash filesystems & ubifs.

currently for ubiattach I am getting following error,

uncorrectable error :
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB
198:512, read 512 bytes
[<c002e444>] (unwind_backtrace+0x0/0xdc) from [<c0217ddc>]
(ubi_io_read+0x20c/0x2ec)
[<c0217ddc>] (ubi_io_read+0x20c/0x2ec) from [<c0218048>]
(ubi_io_read_vid_hdr+0x94/0x294)
[<c0218048>] (ubi_io_read_vid_hdr+0x94/0x294) from [<c021cbf4>]
(ubi_scan+0xa50/0x1094)
[<c021cbf4>] (ubi_scan+0xa50/0x1094) from [<c02122f4>]
(ubi_attach_mtd_dev+0x624/0xd6c)
[<c02122f4>] (ubi_attach_mtd_dev+0x624/0xd6c) from [<c0212cd8>]
(ctrl_cdev_ioctl+0xe8/0x1a4)
[<c0212cd8>] (ctrl_cdev_ioctl+0xe8/0x1a4) from [<c00aa590>]
(vfs_ioctl+0x2c/0x70)
[<c00aa590>] (vfs_ioctl+0x2c/0x70) from [<c00aacc4>] (do_vfs_ioctl+0x518/0x55c)
[<c00aacc4>] (do_vfs_ioctl+0x518/0x55c) from [<c00aad3c>] (sys_ioctl+0x34/0x54)
[<c00aad3c>] (sys_ioctl+0x34/0x54) from [<c0028de0>] (ret_fast_syscall+0x0/0x2c)

and for "mount -t ubifs /dev/ubi0_0 /mnt" it gives following error,

uncorrectable error :
UBI error: ubi_io_read: error -74 while reading 188 bytes from PEB
220:8304, read 188 bytes
[<c002e444>] (unwind_backtrace+0x0/0xdc) from [<c0217ddc>]
(ubi_io_read+0x20c/0x2ec)
[<c0217ddc>] (ubi_io_read+0x20c/0x2ec) from [<c0216fd4>]
(ubi_eba_read_leb+0x2e4/0x3e8)
[<c0216fd4>] (ubi_eba_read_leb+0x2e4/0x3e8) from [<c0214c24>]
(ubi_leb_read+0x100/0x15c)
[<c0214c24>] (ubi_leb_read+0x100/0x15c) from [<c015d604>]
(ubifs_read_node+0x1b4/0x340)
[<c015d604>] (ubifs_read_node+0x1b4/0x340) from [<c017d9b0>]
(ubifs_load_znode+0xd0/0x5c0)
[<c017d9b0>] (ubifs_load_znode+0xd0/0x5c0) from [<c016136c>]
(ubifs_lookup_level0+0x114/0x2dc)
[<c016136c>] (ubifs_lookup_level0+0x114/0x2dc) from [<c0162e74>]
(ubifs_tnc_locate+0x40/0x170)
[<c0162e74>] (ubifs_tnc_locate+0x40/0x170) from [<c0158d00>]
(ubifs_iget+0xb0/0x7e4)
[<c0158d00>] (ubifs_iget+0xb0/0x7e4) from [<c015aa08>]
(ubifs_fill_super+0x15d4/0x1664)
[<c015aa08>] (ubifs_fill_super+0x15d4/0x1664) from [<c015ad20>]
(ubifs_get_sb+0x288/0x2fc)
[<c015ad20>] (ubifs_get_sb+0x288/0x2fc) from [<c009fd24>]
(vfs_kern_mount+0x4c/0xd0)
[<c009fd24>] (vfs_kern_mount+0x4c/0xd0) from [<c009fdec>]
(do_kern_mount+0x34/0xd8)
[<c009fdec>] (do_kern_mount+0x34/0xd8) from [<c00b4640>] (do_mount+0x5ec/0x64c)
[<c00b4640>] (do_mount+0x5ec/0x64c) from [<c00b4724>] (sys_mount+0x84/0xc4)
[<c00b4724>] (sys_mount+0x84/0xc4) from [<c0028de0>] (ret_fast_syscall+0x0/0x2c)

Does anyone encountered similar kind of error?
Also would like to know, does user space - ubitools read only 64 bytes
each from mtd drivers(while scan or format)

Thanks lot for all your helps.

Thanks and Regards,
Shivdas Gujare

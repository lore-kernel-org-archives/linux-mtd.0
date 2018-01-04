Received: from mail-yw0-x242.google.com ([2607:f8b0:4002:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eX9qh-0003Cz-Gc
 for linux-mtd@lists.infradead.org; Thu, 04 Jan 2018 18:03:08 +0000
Received: by mail-yw0-x242.google.com with SMTP id y187so876167ywd.12
 for <linux-mtd@lists.infradead.org>; Thu, 04 Jan 2018 10:02:28 -0800 (PST)
MIME-Version: 1.0
From: Bogdan Harjoc <harjoc@gmail.com>
Date: Thu, 4 Jan 2018 20:02:26 +0200
Message-ID: <CAF4+tmpp_kYqFVgdz+HhVPR61m10k7ZyjNKBq6fRZw0eDVfYhA@mail.gmail.com>
Subject: Read errors after an UBIFS update
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am encountering these messages after creating an UBIFS filesystem in
a new UBI volume on an existing UBI partition.

The rate of reproduction is one in about 20 sequences of: ubirmvol,
ubimkvol (256MB), unpack a rootfs.tgz (20MB, 40MB unpacked) in the
mounted UBIFS, umount, ubidetach, sync, reboot. There are no xattrs
created. No power cuts happen during the tests. I realize ubiupdatevol
may be better suited, I will consider using it instead of
rmvol+mkvol+tar although the update script is already flashed on
boards.

The board runs a 3.18.80 kernel on an ARM board. I tested other
identical test boards where only the NAND chip manufacturer was
different.

I had CONFIG_MTD_UBI_FASTMAP enabled when the error occured, but I
used no explicit fastmap boot cmdline option. I tried mounting the
ubifs with a rebuilt kernel that had the config option disabled after
the issue reproduced, but the read error still occured. I will test
with the no-fastmap kernel to see if the issue still happens.

I also tried mounting with a kernel that had "ubifs: Fix journal
replay wrt. xattr nodes" patch [1] applied, after reading some older
threads on linux-mtd, but once reproduced on a NAND, the read error
persisted.

[1] https://patchwork.ozlabs.org/patch/713213/

Is there some special requirement except just umount, ubidetach and
sync before running reboot, or regarding free space fixup ? Would
creating the fs image offline with mkfs.ubifs instead of unpacking it
via tar make a difference here ? Would it help to try to test with the
cherry picked 5-10 commits from linux 3.18.80 to 4.14 that touch
fs/ubifs ?

Thanks,
Bogdan

----

UBI-0: ubi_attach_mtd_dev:default fastmap pool size: 190
UBI-0: ubi_attach_mtd_dev:default fastmap WL pool size: 25
UBI-0: ubi_attach_mtd_dev:attaching mtd3 to ubi0
UBI-0: scan_all:scanning is finished
UBI-0: ubi_attach_mtd_dev:attached mtd3 (name "data", size 3824 MiB)
UBI-0: ubi_attach_mtd_dev:PEB size: 1048576 bytes (1024 KiB), LEB
size: 1040384 bytes
UBI-0: ubi_attach_mtd_dev:min./max. I/O unit sizes: 4096/4096,
sub-page size 4096
UBI-0: ubi_attach_mtd_dev:VID header offset: 4096 (aligned 4096), data
offset: 8192
UBI-0: ubi_attach_mtd_dev:good PEBs: 3816, bad PEBs: 8, corrupted PEBs: 0
UBI-0: ubi_attach_mtd_dev:user volume: 6, internal volumes: 1, max.
volumes count: 128
UBI-0: ubi_attach_mtd_dev:max/mean erase counter: 4/2, WL threshold:
4096, image sequence number: 1362948729
UBI-0: ubi_attach_mtd_dev:available PEBs: 2313, total reserved PEBs:
1503, PEBs reserved for bad PEB handling: 72
UBI-0: ubi_thread:background thread "ubi_bgt0d" started, PID 419
UBIFS: mounted UBI device 0, volume 6, name "slot1", R/O mode
UBIFS: LEB size: 1040384 bytes (1016 KiB), min./max. I/O unit sizes:
4096 bytes/4096 bytes
UBIFS: FS size: 259055616 bytes (247 MiB, 249 LEBs), journal size
12484608 bytes (11 MiB, 12 LEBs)
UBIFS: reserved for root: 4952683 bytes (4836 KiB)
UBIFS: media format: w4/r0 (latest is w4/r0), UUID
92C7B251-2666-4717-B735-5539900FE749, small LPT model

----

UBIFS error (pid 1810): ubifs_read_node: bad node type (255 but expected 1)
UBIFS error (pid 1810): ubifs_read_node: bad node at LEB 33:967120,
LEB mapping status 0
Not a node, first 24 bytes:
00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff
CPU: 0 PID: 1810 Comm: tar Tainted: P           O   3.18.80 #3
Backtrace:
 [<8001b664>] (dump_backtrace) from [<8001b880>] (show_stack+0x18/0x1c)
 r7:00000000 r6:00000000 r5:80000013 r4:80566cbc
 [<8001b868>] (show_stack) from [<801d77e0>] (dump_stack+0x88/0xa4)
 [<801d7758>] (dump_stack) from [<80171608>] (ubifs_read_node+0x1fc/0x2b8)
  r7:00000021 r6:00000712 r5:000ec1d0 r4:bd59d000
 [<8017140c>] (ubifs_read_node) from [<8018b654>]
(ubifs_tnc_read_node+0x88/0x124)
  r10:00000000 r9:b4f9fdb0 r8:bd59d264 r7:00000001 r6:b71e6000 r5:bd59d000
  r4:b6126148
 [<8018b5cc>] (ubifs_tnc_read_node) from [<80174690>]
(ubifs_tnc_locate+0x108/0x1e0)
  r7:00000001 r6:b71e6000 r5:00000001 r4:bd59d000
 [<80174588>] (ubifs_tnc_locate) from [<80168200>] (do_readpage+0x1c0/0x39c)
  r10:bd59d000 r9:000005b1 r8:00000000 r7:bd258710 r6:a5914000 r5:b71e6000
  r4:be09e280
 [<80168040>] (do_readpage) from [<80169398>] (ubifs_readpage+0x44/0x424)
  r10:00000000 r9:00000000 r8:bd59d000 r7:be09e280 r6:00000000 r5:bd258710
  r4:00000000
 [<80169354>] (ubifs_readpage) from [<80089654>]
(generic_file_read_iter+0x48c/0x5d8)
  r10:00000000 r9:00000000 r8:00000000 r7:be09e280 r6:bd2587d4 r5:bd5379e0
  r4:00000000
 [<800891c8>] (generic_file_read_iter) from [<800bbd60>]
(new_sync_read+0x84/0xa8)
  r10:00000000 r9:b4f9e000 r8:80008e24 r7:bd6437a0 r6:bd5379e0 r5:b4f9ff80
  r4:00001000
 [<800bbcdc>] (new_sync_read) from [<800bc85c>] (__vfs_read+0x20/0x54)
  r7:b4f9ff80 r6:7ec2d800 r5:00001000 r4:800bbcdc
 [<800bc83c>] (__vfs_read) from [<800bc91c>] (vfs_read+0x8c/0xf4)
  r5:00001000 r4:bd5379e0
 [<800bc890>] (vfs_read) from [<800bc9cc>] (SyS_read+0x48/0x80)
  r9:b4f9e000 r8:80008e24 r7:00001000 r6:7ec2d800 r5:bd5379e0 r4:bd5379e0
 [<800bc984>] (SyS_read) from [<80008c80>] (ret_fast_syscall+0x0/0x3c)
  r7:00000003 r6:7ec2d800 r5:00000008 r4:00082a08
UBIFS error (pid 1811): do_readpage: cannot read page 0 of inode 1457, error -22

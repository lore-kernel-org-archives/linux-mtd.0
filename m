Received: from mail-io0-x234.google.com ([2607:f8b0:4001:c06::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cztc1-0003Kh-2h
 for linux-mtd@lists.infradead.org; Sun, 16 Apr 2017 23:29:47 +0000
Received: by mail-io0-x234.google.com with SMTP id o22so15046328iod.3
 for <linux-mtd@lists.infradead.org>; Sun, 16 Apr 2017 16:29:24 -0700 (PDT)
MIME-Version: 1.0
From: Raphael Pereira <raphaelpereira@gmail.com>
Date: Sun, 16 Apr 2017 20:29:23 -0300
Message-ID: <CAAN9NvfwjBaHWBo=5P=s9+ivPy_r-peSEdHK7UwJaOz4-8R9Pw@mail.gmail.com>
Subject: UBIFS replay journal failure on power cuts
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

Hello,

I have been using UBIFS on a device and have been getting some
unrecoverable errors on journal replay after some power cuts.

I have not stablished the specific way to reproduce the problem, but
it is happening with some repeatability.

The error seems quite like both threads:

http://lists.infradead.org/pipermail/linux-mtd/2014-July/054620.html
http://lists.infradead.org/pipermail/linux-mtd/2016-June/068339.html

And before you ask, I do indeed use fastmap.

I understand that it seems the journal is trying to reproduce an inode
removal that has been interrupted by a power cut, so the block on NAND
seems to be in an intermediary state.

Wouldn't be enough to just erase the block instead of reading it
(which is where it seems to fail)?

The error log is below:

kernel: UBI: default fastmap pool size: 190
kernel: UBI: default fastmap WL pool size: 25
kernel: UBI: attaching mtd2 to ubi0
kernel: UBI: attached by fastmap
kernel: UBI: fastmap pool size: 190
kernel: UBI: fastmap WL pool size: 25
kernel: UBI: attached mtd2 (name "besav2rx_rootfs", size 476 MiB) to ubi0
kernel: UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
kernel: UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
kernel: UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
kernel: UBI: good PEBs: 3804, bad PEBs: 4, corrupted PEBs: 0
kernel: UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
kernel: UBI: max/mean erase counter: 63062/239, WL threshold: 4096,
image sequence number: 377102491
kernel: UBI: available PEBs: 2, total reserved PEBs: 3802, PEBs
reserved for bad PEB handling: 76
kernel: UBI: background thread "ubi_bgt0d" started, PID 459
kernel: UBIFS: recovery needed
kernel: UBIFS error (pid 460): ubifs_read_node: bad node type (0 but expected 3)
kernel: UBIFS error (pid 460): ubifs_read_node: bad node at LEB
3246:96960, LEB mapping status 1
kernel: Not a node, first 24 bytes:
kernel: 00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00                          ........................
kernel: CPU: 0 PID: 460 Comm: mount Not tainted 3.18.48 #15
kernel: [<c001491c>] (unwind_backtrace) from [<c0011fe4>] (show_stack+0x10/0x14)
kernel: [<c0011fe4>] (show_stack) from [<bf158c50>]
(ubifs_read_node+0x260/0x2f0 [ubifs])
kernel: [<bf158c50>] (ubifs_read_node [ubifs]) from [<bf176300>]
(ubifs_tnc_read_node+0x4c/0x140 [ubifs])
kernel: [<bf176300>] (ubifs_tnc_read_node [ubifs]) from [<bf159e70>]
(tnc_read_node_nm+0xbc/0x1dc [ubifs])
kernel: [<bf159e70>] (tnc_read_node_nm [ubifs]) from [<bf15d610>]
(ubifs_tnc_next_ent+0x138/0x1a0 [ubifs])
kernel: [<bf15d610>] (ubifs_tnc_next_ent [ubifs]) from [<bf15d748>]
(ubifs_tnc_remove_ino+0xd0/0x150 [ubifs])
kernel: [<bf15d748>] (ubifs_tnc_remove_ino [ubifs]) from [<bf1607d4>]
(ubifs_replay_journal+0xf88/0x1510 [ubifs])
kernel: [<bf1607d4>] (ubifs_replay_journal [ubifs]) from [<bf154aa0>]
(ubifs_mount+0x1194/0x1750 [ubifs])
kernel: [<bf154aa0>] (ubifs_mount [ubifs]) from [<c00e6b84>]
(mount_fs+0x14/0xd0)
kernel: [<c00e6b84>] (mount_fs) from [<c0101e94>] (vfs_kern_mount+0x54/0x12c)
kernel: [<c0101e94>] (vfs_kern_mount) from [<c01054b4>] (do_mount+0x18c/0xbe8)
kernel: [<c01054b4>] (do_mount) from [<c0106230>] (SyS_mount+0x74/0xa0)
kernel: [<c0106230>] (SyS_mount) from [<c000ed60>] (ret_fast_syscall+0x0/0x4c)

-- 
Raphael Derosso Pereira

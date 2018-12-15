Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY93f-00059N-N3
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 12:28:41 +0000
From: Hou Tao <houtao1@huawei.com>
Subject: [bug report] Got "read_pnode: error -22 reading pnode" during ubifs
 mount
To: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
CC: Adrian Hunter <adrian.hunter@intel.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Message-ID: <402695c6-7ba9-abe9-4ccd-ea598ea2511e@huawei.com>
Date: Sat, 15 Dec 2018 20:28:12 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We had encountered an ubi-fs mount failure during our repeated power-cut tests,
and the failure was caused by an invalid pnode during commit:

<5>[   25.557349]UBI: attaching mtd9 to ubi2
<5>[   28.835135]UBI: scanning is finished
<5>[   28.894720]UBI: attached mtd9 (name "system", size 415 MiB) to ubi2
<5>[   28.894754]UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
<5>[   28.894771]UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
<5>[   28.894784]UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
<5>[   28.894798]UBI: good PEBs: 3320, bad PEBs: 0, corrupted PEBs: 0
<5>[   28.894811]UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
<5>[   28.894827]UBI: max/mean erase counter: 1528/269, WL threshold: 4096, image sequence number: 1247603810
<5>[   28.894843]UBI: available PEBs: 0, total reserved PEBs: 3320, PEBs reserved for bad PEB handling: 65
<5>[   28.895130]UBI: background thread "ubi_bgt2d" started, PID 2056
<5>[   29.033842]UBIFS: background thread "ubifs_bgt2_0" started, PID 2066
<5>[   29.056907]UBIFS: recovery needed
<3>[   29.477167]UBIFS error (pid 2064): read_pnode: error -22 reading pnode at 12:34909
<3>[   29.477201](pid 2064) dumping pnode:
<3>[   29.477220]	address ddd75840 parent ddc43a80 cnext 0
<3>[   29.477234]	flags 0 iip 0 level 0 num 0
<3>[   29.477248]	0: free 0 dirty 2656 flags 1 lnum 0
<3>[   29.477263]	1: free 0 dirty 127304 flags 1 lnum 0
<3>[   29.477276]	2: free 0 dirty 2656 flags 1 lnum 0
<3>[   29.477289]	3: free 0 dirty 2656 flags 1 lnum 0
<4>[   29.477311]CPU: 0 PID: 2064 Comm: mount Tainted: P           O 3.10.53 #2
<4>[   29.477392][<c0013cfc>] (unwind_backtrace+0x0/0x118) from [<c000f738>] (show_stack+0x10/0x14)
<4>[   29.477453][<c000f738>] (show_stack+0x10/0x14) from [<c0208d34>] (ubifs_get_pnode+0x1f8/0x264)
<4>[   29.477494][<c0208d34>] (ubifs_get_pnode+0x1f8/0x264) from [<c0211460>] (ubifs_lpt_start_commit+0x1cc/0xd28)
<4>[   29.477524][<c0211460>] (ubifs_lpt_start_commit+0x1cc/0xd28) from [<c01fe6bc>] (do_commit+0x204/0x868)
<4>[   29.477554][<c01fe6bc>] (do_commit+0x204/0x868) from [<c020eae8>] (ubifs_rcvry_gc_commit+0x16c/0x2f0)
<4>[   29.477602][<c020eae8>] (ubifs_rcvry_gc_commit+0x16c/0x2f0) from [<c01ee64c>] (ubifs_mount+0xef4/0x1dfc)
<4>[   29.477647][<c01ee64c>] (ubifs_mount+0xef4/0x1dfc) from [<c01022a0>] (mount_fs+0x6c/0x164)
<4>[   29.477687][<c01022a0>] (mount_fs+0x6c/0x164) from [<c0118388>] (vfs_kern_mount+0x48/0xc4)
<4>[   29.477719][<c0118388>] (vfs_kern_mount+0x48/0xc4) from [<c011ad64>] (do_mount+0x78c/0x884)
<4>[   29.477748][<c011ad64>] (do_mount+0x78c/0x884) from [<c011aee0>] (SyS_mount+0x84/0xb8)
<4>[   29.477776][<c011aee0>] (SyS_mount+0x84/0xb8) from [<c000bd00>] (ret_fast_syscall+0x0/0x60)
<3>[   29.477794]UBIFS error (pid 2064): read_pnode: calc num: 108
<3>[   29.477820]UBIFS error (pid 2064): do_commit: commit failed, error -22
<3>[   29.477840]UBIFS error (pid 2064): ubifs_ro_mode: ubifs occurred error, error -22
<4>[   29.477862]CPU: 0 PID: 2064 Comm: mount Tainted: P           O 3.10.53 #2
<4>[   29.477904][<c0013cfc>] (unwind_backtrace+0x0/0x118) from [<c000f738>] (show_stack+0x10/0x14)
<4>[   29.477938][<c000f738>] (show_stack+0x10/0x14) from [<c01fece4>] (do_commit+0x82c/0x868)
<4>[   29.477973][<c01fece4>] (do_commit+0x82c/0x868) from [<c020eae8>] (ubifs_rcvry_gc_commit+0x16c/0x2f0)
<4>[   29.478007][<c020eae8>] (ubifs_rcvry_gc_commit+0x16c/0x2f0) from [<c01ee64c>] (ubifs_mount+0xef4/0x1dfc)
<4>[   29.478038][<c01ee64c>] (ubifs_mount+0xef4/0x1dfc) from [<c01022a0>] (mount_fs+0x6c/0x164)
<4>[   29.478071][<c01022a0>] (mount_fs+0x6c/0x164) from [<c0118388>] (vfs_kern_mount+0x48/0xc4)
<4>[   29.478100][<c0118388>] (vfs_kern_mount+0x48/0xc4) from [<c011ad64>] (do_mount+0x78c/0x884)
<4>[   29.478127][<c011ad64>] (do_mount+0x78c/0x884) from [<c011aee0>] (SyS_mount+0x84/0xb8)
<4>[   29.478154][<c011aee0>] (SyS_mount+0x84/0xb8) from [<c000bd00>] (ret_fast_syscall+0x0/0x60)
<5>[   29.478575]UBIFS: background thread "ubifs_bgt2_0" stops
<5>[   29.545388]UBI: attaching mtd7 to ubi3

The problem is hard to reproduce and we are still trying.  As showed in the
above dmesg, the version of our kernel is v3.10.53, but the problem also
had been occurred on board using v4.1.

It seems there is no easy way to fix or circumvent the problem (e.g. fsck.ubifs),
so does anyone or any-organization have a plan to implement fsck.ubifs ?

We have checked ubifs_change_lp() and found it doesn't check whether or not
the new free space or dirty space is less the leb_size, and we will add these
checks during reproduction first.

So any direction or suggestion for the reproduction & the solution ?

Regards,
Tao

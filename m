Received: from mail3.emtrion.de ([80.150.99.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3HJV-00072f-7c
 for linux-mtd@lists.infradead.org; Tue, 03 Apr 2018 08:29:11 +0000
From: "Erdrich, Frank" <Frank.Erdrich@emtrion.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 3 Apr 2018 10:28:29 +0200
Subject: UBIFS - ubifs_get_pnode.part.4: error -22 reading pnode
Message-ID: <95F51F4B902CAC40AF459205F6322F01B80E921AE3@BMK019S01.emtrion.local>
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

we are encountering an error on UBIFS that prevents mounting of a partition=
. Maybe one of you can tell me the directly the reason for that or can help=
 me hunting this error down.

Some data of the system:

- Linux Kernel version 4.9 (unmodified)
- SAMA5D36
- Flash: Micron 29F8G0ABABA (PEB size of 512k)
- 256 MB of RAM

The error seems to occur after some power-cycles and is therefore hard to r=
eproduce. We are seeing it also on only some of the systems.
The error looks like the following:

UBIFS (ubi2:0): background thread "ubifs_bgt2_0" started, PID 867 UBIFS (ub=
i2:0): recovery needed UBIFS error (ubi2:0 pid 865): ubifs_get_pnode.part.4=
: error -22 reading pnode at 6:188460 (pid 865) dumping pnode:
	address cd9bb7c0 parent cd9bb700 cnext 0
	flags 0 iip 0 level 0 num 0
	0: free 0 dirty 501576 flags 1 lnum 0
	1: free 0 dirty 254864 flags 1 lnum 0
	2: free 0 dirty 515672 flags 1 lnum 0
	3: free 507904 dirty 524128 flags 34 lnum 0
CPU: 0 PID: 865 Comm: mount Not tainted 4.9.51 #124 Hardware name: Atmel SA=
MA5 [<c0110570>] (unwind_backtrace) from [<c010d488>] (show_stack+0x20/0x24=
) [<c010d488>] (show_stack) from [<c0390c7c>] (dump_stack+0x24/0x28) [<c039=
0c7c>] (dump_stack) from [<c0319e54>] (ubifs_get_pnode.part.4+0x250/0x2b8)
[<c0319e54>] (ubifs_get_pnode.part.4) from [<c031bf08>] (ubifs_lpt_lookup_d=
irty+0x2f8/0x340)
[<c031bf08>] (ubifs_lpt_lookup_dirty) from [<c031f910>] (ubifs_update_one_l=
p+0x44/0x150) [<c031f910>] (ubifs_update_one_lp) from [<c0309540>] (ubifs_t=
nc_add+0x170/0x1ec) [<c0309540>] (ubifs_tnc_add) from [<c030d638>] (ubifs_r=
eplay_journal+0xfcc/0x1670)
[<c030d638>] (ubifs_replay_journal) from [<c0300380>] (ubifs_mount+0x1194/0=
x1e8c) [<c0300380>] (ubifs_mount) from [<c0209ea0>] (mount_fs+0x54/0x170) [=
<c0209ea0>] (mount_fs) from [<c0228dec>] (vfs_kern_mount+0x58/0x124) [<c022=
8dec>] (vfs_kern_mount) from [<c022c6e0>] (do_mount+0x1bc/0xcc0) [<c022c6e0=
>] (do_mount) from [<c022d548>] (SyS_mount+0x84/0xac) [<c022d548>] (SyS_mou=
nt) from [<c0109380>] (ret_fast_syscall+0x0/0x3c) UBIFS error (ubi2:0 pid 8=
65): ubifs_get_pnode.part.4: calc num: 4 UBIFS error (ubi2:0 pid 865): ubif=
s_update_one_lp: cannot update properties of LEB 29, error -22 UBIFS (ubi2:=
0): background thread "ubifs_bgt2_0" stops

Output of ubinfo:

Volumes count:                           1
Logical eraseblock size:                 516096 bytes, 504.0 KiB
Total amount of logical eraseblocks:     140 (72253440 bytes, 68.9 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  40
Current maximum erase counter value:     11
Minimum input/output unit size:          4096 bytes
Character device major/minor:            247:0
Present volumes:                         0


I'm not deep enough in the ubifs system to completely understand what is ha=
ppening here but for me it seems that there are more dirty data to write th=
an the size of the LEB.
-> 3: free 507904 dirty 524128 flags 34 lnum 0
I've seen that the values are checked in validate_pnode() where the -EINVAL=
 (-22) comes from. The question is, how can dirty data bigger that the LEB =
size?

Does someone have a suggestion what is happening here? Or do you need more =
information to rate that error?


Best Regards,
Frank Erdrich

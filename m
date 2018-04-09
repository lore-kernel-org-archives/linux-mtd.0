Received: from mail3.emtrion.de ([80.150.99.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5TKF-0004FQ-Ib
 for linux-mtd@lists.infradead.org; Mon, 09 Apr 2018 09:43:01 +0000
From: "Erdrich, Frank" <Frank.Erdrich@emtrion.de>
To: "richard@nod.at" <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 9 Apr 2018 11:41:15 +0200
Subject: WG: Re: UBIFS - ubifs_get_pnode.part.4: error -22 reading pnode
Message-ID: <95F51F4B902CAC40AF459205F6322F01B80E921C5F@BMK019S01.emtrion.local>
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

Hello Richard,

At the end of the last week I analyzed the data of our test setup. We have =
around 26 devices in a long time test setup where we are doing several stre=
ss tests on the devices. A typical test run is to power up the device, exec=
ute the test, power down (hard power cut). The tests were run for around 2 =
Weeks and we have two devices that show that error. The interesting thing a=
bout that is that it never corrupted the root-partition, although this part=
ition is written during every testrun. And there seems to be a pattern when=
 that error happens.

During the bootup before the error from my first post pops up (ubifs_get_pn=
ode.part.4: error -22 reading pnode) this error messages were seen on all o=
f the two devices that have shown the other error:

ubi2: attaching mtd2
ubi2: scanning is finished
ubi2: attached mtd2 (name \"log\", size 70 MiB)
ubi2: PEB size: 524288 bytes (512 KiB), LEB size: 516096 bytes
ubi2: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
ubi2: VID header offset: 4096 (aligned 4096), data offset: 8192
ubi2: good PEBs: 140, bad PEBs: 0, corrupted PEBs: 0
ubi2: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi2: max/mean erase counter: 66/30, WL threshold: 4096, image sequence num=
ber: 1574181447
ubi2: available PEBs: 0, total reserved PEBs: 140, PEBs reserved for bad PE=
B handling: 40
ubi2: background thread \"ubi_bgt2d\" started, PID 129
         Mounting log partition...
UBIFS (ubi2:0): background thread \"ubifs_bgt2_0\" started, PID 145 UBIFS (=
ubi2:0): recovery needed UBIFS assert failed in ubifs_change_lp at 559 (pid=
 143)
CPU: 0 PID: 143 Comm: mount Not tainted 4.9.51 #152 Hardware name: Atmel SA=
MA5 [<c0110570>] (unwind_backtrace) from [<c010d488>] (show_stack+0x20/0x24=
) [<c010d488>] (show_stack) from [<c0390cdc>] (dump_stack+0x24/0x28) [<c039=
0cdc>] (dump_stack) from [<c031f7b8>] (ubifs_change_lp+0x754/0x794) [<c031f=
7b8>] (ubifs_change_lp) from [<c030d6c8>] (ubifs_replay_journal+0x105c/0x16=
70)
[<c030d6c8>] (ubifs_replay_journal) from [<c0300380>] (ubifs_mount+0x1194/0=
x1e8c) [<c0300380>] (ubifs_mount) from [<c0209ea0>] (mount_fs+0x54/0x170) [=
<c0209ea0>] (mount_fs) from [<c0228dec>] (vfs_kern_mount+0x58/0x124) [<c022=
8dec>] (vfs_kern_mount) from [<c022c6e0>] (do_mount+0x1bc/0xcc0) [<c022c6e0=
>] (do_mount) from [<c022d548>] (SyS_mount+0x84/0xac) [<c022d548>] (SyS_mou=
nt) from [<c0109380>] (ret_fast_syscall+0x0/0x3c) UBIFS assert failed in pa=
ck_bits at 242 (pid 143)
CPU: 0 PID: 143 Comm: mount Not tainted 4.9.51 #152 Hardware name: Atmel SA=
MA5 [<c0110570>] (unwind_backtrace) from [<c010d488>] (show_stack+0x20/0x24=
) [<c010d488>] (show_stack) from [<c0390cdc>] (dump_stack+0x24/0x28) [<c039=
0cdc>] (dump_stack) from [<c0319408>] (pack_bits+0x244/0x248) [<c0319408>] =
(pack_bits) from [<c031a274>] (ubifs_pack_pnode+0xa0/0x12c) [<c031a274>] (u=
bifs_pack_pnode) from [<c0325ad4>] (ubifs_lpt_end_commit+0x29c/0x8d4)
[<c0325ad4>] (ubifs_lpt_end_commit) from [<c0310044>] (do_commit+0x2b4/0x5d=
8) [<c0310044>] (do_commit) from [<c03106c0>] (ubifs_run_commit+0xcc/0x184)=
 [<c03106c0>] (ubifs_run_commit) from [<c03219ec>] (ubifs_rcvry_gc_commit+0=
xc0/0x348)
[<c03219ec>] (ubifs_rcvry_gc_commit) from [<c030049c>] (ubifs_mount+0x12b0/=
0x1e8c) [<c030049c>] (ubifs_mount) from [<c0209ea0>] (mount_fs+0x54/0x170) =
[<c0209ea0>] (mount_fs) from [<c0228dec>] (vfs_kern_mount+0x58/0x124) [<c02=
28dec>] (vfs_kern_mount) from [<c022c6e0>] (do_mount+0x1bc/0xcc0) [<c022c6e=
0>] (do_mount) from [<c022d548>] (SyS_mount+0x84/0xac) [<c022d548>] (SyS_mo=
unt) from [<c0109380>] (ret_fast_syscall+0x0/0x3c) UBIFS (ubi2:0): recovery=
 completed UBIFS (ubi2:0): UBIFS: mounted UBI device 2, volume 0, name \"lo=
g\"
UBIFS (ubi2:0): LEB size: 516096 bytes (504 KiB), min./max. I/O unit sizes:=
 4096 bytes/4096 bytes UBIFS (ubi2:0): FS size: 44384256 bytes (42 MiB, 86 =
LEBs), journal size 4128769 bytes (3 MiB, 6 LEBs) UBIFS (ubi2:0): reserved =
for root: 2096377 bytes (2047 KiB) UBIFS (ubi2:0): media format: w4/r0 (lat=
est is w4/r0), UUID 05834B37-B18C-476F-BFA5-DB76ADF26D50, small LPT model
systemd[1]: Mounted log partition.

So the cycle is as follows:

- power up the device
- error " UBIFS assert failed in ubifs_change_lp" was seen during bootup
- tests are run
- device gets power cut
- device is powered up again
- error ubifs_get_pnode.part.4: error -22 reading pnode pops up during boot=
up

I'm not sure if that helps.
I also have to retest your patches. I tried to backport them to kernel 4.9 =
which isn't that easy due to fscrypt so I will prepare a newer kernel where=
 the patches will apply in an easier way.


Best regards,
Frank Erdrich

Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebu4k-0005Bs-BU
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 20:12:48 +0000
From: Richard Weinberger <richard@nod.at>
To: Bradley Bolen <bradleybolen@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] UBI: block: Must use a mutex when using
 idr_alloc/idr_remove
Date: Wed, 17 Jan 2018 21:04:24 +0100
Message-ID: <2145261.UlTadXsT1L@blindfold>
In-Reply-To: <5aaad0f3-2d7d-2c1f-3ad1-6049a5a0c088@gmail.com>
References: <1514946369-3674-1-git-send-email-bradleybolen@gmail.com>
 <CAAEAJfDB59gnAJf+m7gPRhT-oknJ=bOEYdEvv=5snLW9G1yNqQ@mail.gmail.com>
 <5aaad0f3-2d7d-2c1f-3ad1-6049a5a0c088@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, 17. Januar 2018, 20:46:51 CET schrieb Bradley Bolen:
> On 01/14/2018 05:20 PM, Ezequiel Garcia wrote:
> > On 14 January 2018 at 11:39, Boris Brezillon
> > 
> > <boris.brezillon@free-electrons.com> wrote:
> >> +Ezequiel
> >> 
> >> Hi Bradley,
> >> 
> >> On Tue,  2 Jan 2018 21:26:09 -0500
> >> 
> >> Bradley Bolen <bradleybolen@gmail.com> wrote:
> >>> This fixes a race condition where running ubiblock on multiple volumes
> >>> simultaneously produces the following splat.
> >>> 
> >>> kernel BUG at kernel-source/fs/sysfs/group.c:113!
> >>> Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> >>> [<c01e4160>] (internal_create_group) from [<c01e43fc>]
> >>> (sysfs_create_group+0x20/0x24)
> >>> [<c01e43fc>] (sysfs_create_group) from [<c00e4800>]
> >>> (blk_trace_init_sysfs+0x18/0x20)
> >>> [<c00e4800>] (blk_trace_init_sysfs) from [<c02bc734>]
> >>> (blk_register_queue+0x6c/0x154)
> >>> [<c02bc734>] (blk_register_queue) from [<c02cd610>]
> >>> (device_add_disk+0x2c8/0x450)
> >>> [<c02cd610>] (device_add_disk) from [<c0430fac>]
> >>> (ubiblock_create+0x254/0x2e4)
> >>> [<c0430fac>] (ubiblock_create) from [<c0421a3c>]
> >>> (vol_cdev_ioctl+0x3e0/0x564)
> >>> [<c0421a3c>] (vol_cdev_ioctl) from [<c018a55c>] (vfs_ioctl+0x30/0x44)
> >>> [<c018a55c>] (vfs_ioctl) from [<c018ad2c>] (do_vfs_ioctl+0x694/0x798)
> >>> [<c018ad2c>] (do_vfs_ioctl) from [<c018ae74>] (SyS_ioctl+0x44/0x6c)
> >>> [<c018ae74>] (SyS_ioctl) from [<c0010720>] (ret_fast_syscall+0x0/0x34)
> > 
> > I'm a little confused, how does this stack trace relates to idr?
> 
> I apologize.  The commit message was a little terse.  Here is the full
> output of the issue I ran into.
> 
> ------------[ cut here ]------------
> block ubiblock0_3: created from ubi0:3(Partition3)
> block ubiblock0_2: created from ubi0:2(Partition2)
> block ubiblock0_4: created from ubi0:4(Partition4)
> WARNING: CPU: 1 PID: 179 at kernel-source/fs/sysfs/dir.c:31
> sysfs_warn_dup+0x68/0x88 sysfs: cannot create duplicate filename
> '/devices/virtual/bdi/252:2' Modules linked in:
> CPU: 1 PID: 179 Comm: ubiblock Tainted: P           O   
> 4.11.12-yocto-standard-414e5550071e0ca8639b0d8fb84fed31 #1 Hardware name:
> (Device Tree)
> [<c0019e50>] (unwind_backtrace) from [<c0014b20>] (show_stack+0x20/0x24)
> [<c0014b20>] (show_stack) from [<c02e2618>] (dump_stack+0x78/0x94)
> [<c02e2618>] (dump_stack) from [<c002ae6c>] (__warn+0xf0/0x110)
> [<c002ae6c>] (__warn) from [<c002aee0>] (warn_slowpath_fmt+0x54/0x74)
> [<c002aee0>] (warn_slowpath_fmt) from [<c01e2028>]
> (sysfs_warn_dup+0x68/0x88) [<c01e2028>] (sysfs_warn_dup) from [<c01e2120>]
> (sysfs_create_dir_ns+0x84/0x94) [<c01e2120>] (sysfs_create_dir_ns) from
> [<c02e44cc>] (kobject_add_internal+0x130/0x2f8) [<c02e44cc>]
> (kobject_add_internal) from [<c02e4730>] (kobject_add+0x9c/0xb8)
> [<c02e4730>] (kobject_add) from [<c03b2744>] (device_add+0xfc/0x56c)
> [<c03b2744>] (device_add) from [<c03b2d38>]
> (device_create_groups_vargs+0x90/0xd0) [<c03b2d38>]
> (device_create_groups_vargs) from [<c03b2dac>]
> (device_create_vargs+0x34/0x3c) [<c03b2dac>] (device_create_vargs) from
> [<c01301e4>] (bdi_register+0x70/0x1cc) [<c01301e4>] (bdi_register) from
> [<c01308f8>] (bdi_register_owner+0x3c/0x7c) [<c01308f8>]
> (bdi_register_owner) from [<c02cec04>] (device_add_disk+0x114/0x44c)
> [<c02cec04>] (device_add_disk) from [<c0436ec8>]
> (ubiblock_create+0x284/0x2e0) [<c0436ec8>] (ubiblock_create) from
> [<c0427bb8>] (vol_cdev_ioctl+0x450/0x554) [<c0427bb8>] (vol_cdev_ioctl)
> from [<c0189110>] (vfs_ioctl+0x30/0x44) [<c0189110>] (vfs_ioctl) from
> [<c01892e0>] (do_vfs_ioctl+0xa0/0x790) [<c01892e0>] (do_vfs_ioctl) from
> [<c0189a14>] (SyS_ioctl+0x44/0x68) [<c0189a14>] (SyS_ioctl) from
> [<c0010640>] (ret_fast_syscall+0x0/0x34) ---[ end trace e541910253daa337
> ]---
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 179 at kernel-source/lib/kobject.c:240
> kobject_add_internal+0x1ec/0x2f8 kobject_add_internal failed for 252:2 with
> -EEXIST, don't try to register things with the same name in the same direc
> tory.
> Modules linked in:
> CPU: 1 PID: 179 Comm: ubiblock Tainted: P        W  O   
> 4.11.12-yocto-standard-414e5550071e0ca8639b0d8fb84fed31 #1 Hardware name:
> (Device Tree)
> [<c0019e50>] (unwind_backtrace) from [<c0014b20>] (show_stack+0x20/0x24)
> [<c0014b20>] (show_stack) from [<c02e2618>] (dump_stack+0x78/0x94)
> [<c02e2618>] (dump_stack) from [<c002ae6c>] (__warn+0xf0/0x110)
> [<c002ae6c>] (__warn) from [<c002aee0>] (warn_slowpath_fmt+0x54/0x74)
> [<c002aee0>] (warn_slowpath_fmt) from [<c02e4588>]
> (kobject_add_internal+0x1ec/0x2f8) [<c02e4588>] (kobject_add_internal) from
> [<c02e4730>] (kobject_add+0x9c/0xb8) [<c02e4730>] (kobject_add) from
> [<c03b2744>] (device_add+0xfc/0x56c) [<c03b2744>] (device_add) from
> [<c03b2d38>] (device_create_groups_vargs+0x90/0xd0) [<c03b2d38>]
> (device_create_groups_vargs) from [<c03b2dac>]
> (device_create_vargs+0x34/0x3c) [<c03b2dac>] (device_create_vargs) from
> [<c01301e4>] (bdi_register+0x70/0x1cc) [<c01301e4>] (bdi_register) from
> [<c01308f8>] (bdi_register_owner+0x3c/0x7c) [<c01308f8>]
> (bdi_register_owner) from [<c02cec04>] (device_add_disk+0x114/0x44c)
> [<c02cec04>] (device_add_disk) from [<c0436ec8>]
> (ubiblock_create+0x284/0x2e0) [<c0436ec8>] (ubiblock_create) from
> [<c0427bb8>] (vol_cdev_ioctl+0x450/0x554) [<c0427bb8>] (vol_cdev_ioctl)
> from [<c0189110>] (vfs_ioctl+0x30/0x44) [<c0189110>] (vfs_ioctl) from
> [<c01892e0>] (do_vfs_ioctl+0xa0/0x790) [<c01892e0>] (do_vfs_ioctl) from
> [<c0189a14>] (SyS_ioctl+0x44/0x68) [<c0189a14>] (SyS_ioctl) from
> [<c0010640>] (ret_fast_syscall+0x0/0x34) ---[ end trace e541910253daa338
> ]---
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 179 at kernel-source/fs/sysfs/dir.c:31
> sysfs_warn_dup+0x68/0x88 sysfs: cannot create duplicate filename
> '/dev/block/252:2'
> Modules linked in:
> CPU: 1 PID: 179 Comm: ubiblock Tainted: P        W  O   
> 4.11.12-yocto-standard-414e5550071e0ca8639b0d8fb84fed31 #1 Hardware name:
> (Device Tree)
> [<c0019e50>] (unwind_backtrace) from [<c0014b20>] (show_stack+0x20/0x24)
> [<c0014b20>] (show_stack) from [<c02e2618>] (dump_stack+0x78/0x94)
> [<c02e2618>] (dump_stack) from [<c002ae6c>] (__warn+0xf0/0x110)
> [<c002ae6c>] (__warn) from [<c002aee0>] (warn_slowpath_fmt+0x54/0x74)
> [<c002aee0>] (warn_slowpath_fmt) from [<c01e2028>]
> (sysfs_warn_dup+0x68/0x88) [<c01e2028>] (sysfs_warn_dup) from [<c01e23c8>]
> (sysfs_do_create_link_sd+0xa0/0xbc) [<c01e23c8>] (sysfs_do_create_link_sd)
> from [<c01e2418>] (sysfs_create_link+0x34/0x44) [<c01e2418>]
> (sysfs_create_link) from [<c03b2a74>] (device_add+0x42c/0x56c) [<c03b2a74>]
> (device_add) from [<c02cec50>] (device_add_disk+0x160/0x44c) [<c02cec50>]
> (device_add_disk) from [<c0436ec8>] (ubiblock_create+0x284/0x2e0)
> [<c0436ec8>] (ubiblock_create) from [<c0427bb8>]
> (vol_cdev_ioctl+0x450/0x554) [<c0427bb8>] (vol_cdev_ioctl) from
> [<c0189110>] (vfs_ioctl+0x30/0x44) [<c0189110>] (vfs_ioctl) from
> [<c01892e0>] (do_vfs_ioctl+0xa0/0x790) [<c01892e0>] (do_vfs_ioctl) from
> [<c0189a14>] (SyS_ioctl+0x44/0x68) [<c0189a14>] (SyS_ioctl) from
> [<c0010640>] (ret_fast_syscall+0x0/0x34) ---[ end trace e541910253daa339
> ]---
> ubiblock (179): undefined instruction: pc=c01e26cc
> CPU: 1 PID: 179 Comm: ubiblock Tainted: P        W  O   
> 4.11.12-yocto-standard-414e5550071e0ca8639b0d8fb84fed31 #1 Hardware name:
> (Device Tree)
> task: c185d780 task.stack: d053a000
> PC is at internal_create_group+0x3c/0x2a0
> LR is at sysfs_create_group+0x20/0x24
> pc : [<c01e26cc>]    lr : [<c01e2950>]    psr: 60000013
> sp : d053bd38  ip : d053bd70  fp : d053bd6c
> r10: c095fddc  r9 : 00000000  r8 : c1b59c00
> r7 : c1b59870  r6 : c090f488  r5 : c09276f8  r4 : 00000000
> r3 : 00000000  r2 : c09276f8  r1 : 00000000  r0 : c1b59870
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
> Control: 30c5383d  Table: 104b6840  DAC: ffab73de
> Code: e89da8f0 e1a0c00d e92ddff0 e24cb004 e24dd00c e52de004 e8bd4000
> e2507000 e1a09001 e1a05002 0a000004 e3510000 e59 74018 1a000002 e3540000
> 1a000002 (e7f001f2) e3540000 0a00000f e595300c e5951000 e3530000 1a00000d
> e5953010 e3530000 1 a00000a e59f2220 e3510000 e5973000 e59f0218 01a01002
> e59f2214
> ------------[ cut here ]------------
> kernel BUG at kernel-source/fs/sysfs/group.c:113!
> Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> -----------[ user debug ]-----------
> Current process: ubiblock   pid=179
> Running on CPU1 (2 online)
> 
> current=c185d780   preempt_count=0x0
> CPU: 1 PID: 179 Comm: ubiblock Tainted: P        W  O   
> 4.11.12-yocto-standard-414e5550071e0ca8639b0d8fb84fed31 #1 Hardware name:
> (Device Tree)
> task: c185d780 task.stack: d053a000
> PC is at 0x4b767d8c
> LR is at 0x10b78
> pc : [<4b767d8c>]    lr : [<00010b78>]    psr: 60000010
> sp : be73fc34  ip : 4b767d80  fp : 00000000
> r10: 00000003  r9 : be73fdb4  r8 : 00000000
> r7 : 00000036  r6 : 00000003  r5 : 000250a8  r4 : ffffffff
> r3 : 00000001  r2 : 22eea600  r1 : 40804f07  r0 : 00000003
> Flags: nZCv  IRQs on  FIQs on  Mode USER_32  ISA ARM  Segment user
> Control: 30c5383d  Table: 104b6840  DAC: ffab73de
> 
> Memory Maps:
> 00010-
> 00015
>  ubiblock
> 
> 00024-
> 00026
>  ubiblock
> 
> 00026-
> 00047
> 
> 4b660-
> 4b67f
>  ld-2
> 
> 4b68e-
> 4b690
>  ld-2
> 
> 4b6a0-
> 4b7da
>  libc-2
> 
> 4b7da-
> 4b7dc
> 
> b6bad-
> b6baf
> 
> be71f-
> be740
> 
> beb84-
> ---------[ end user debug ]---------
> Modules linked in:
> CPU: 1 PID: 179 Comm: ubiblock Tainted: P        W  O   
> 4.11.12-yocto-standard-414e5550071e0ca8639b0d8fb84fed31 #1 Hardware name:
> (Device Tree)
> task: c185d780 task.stack: d053a000
> PC is at internal_create_group+0x3c/0x2a0
> LR is at sysfs_create_group+0x20/0x24
> pc : [<c01e26cc>]    lr : [<c01e2950>]    psr: 60000013
> sp : d053bd38  ip : d053bd70  fp : d053bd6c
> r10: c095fddc  r9 : 00000000  r8 : c1b59c00
> r7 : c1b59870  r6 : c090f488  r5 : c09276f8  r4 : 00000000
> r3 : 00000000  r2 : c09276f8  r1 : 00000000  r0 : c1b59870
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
> Control: 30c5383d  Table: 104b6840  DAC: ffab73de
> Process ubiblock (pid: 179, stack limit = 0xd053a210)
> Stack: (0xd053bd38 to 0xd053c000)
> bd20:                                                       d053bd5c
> d053bd48 bd40: c00731c8 d0bd9e00 c1b59800 c090f488 c1b59868 c1b59c00
> c1b5980c c095fddc bd60: d053bd7c d053bd70 c01e2950 c01e269c d053bd8c
> d053bd80 c00e3d38 c01e293c bd80: d053bdbc d053bd90 c02bdfbc c00e3d2c
> 00040b0c c1b59800 c1b59868 c090f488 bda0: c1b59870 c1b59c00 c1b5980c
> c095fddc d053be14 d053bdc0 c02cec84 c02bdef0 bdc0: c02ce6cc c1b59800
> d053bdfc d053bdd8 0fc00002 c0053478 00000000 1f518000 bde0: d053be1c
> 00040b0c 00000000 c1b11e40 00000000 c1b59800 c095fda4 d053be60 be00:
> c1b11e8c c095fddc d053be54 d053be18 c0436ec8 c02ceafc 00000000 c1b5980c
> be20: c01e06f0 c1b5980c 00000000 22eea600 d04b6100 d0b7cc00 d1c20000
> c090f488 be40: d053a000 c090f488 d053bedc d053be58 c0427bb8 c0436c50
> 00000001 00000000 be60: 00000000 0000000f 00000017 00000003 002c9000
> 00000000 00000001 00000003 be80: 00000000 00000000 00000001 0001f000
> 00000006 d0b7ce5c 0f700010 c005368c bea0: 9a877d41 00000007 c1aab015
> c0755170 00000261 00040b0c d053beec 22eea600 bec0: d0b96228 c1896300
> 00000003 22eea600 d053beec d053bee0 c0189110 c0427774 bee0: d053bf7c
> d053bef0 c01892e0 c01890ec d053bf34 c0185224 c01954e8 c05e9a14 bf00:
> c0185278 c1aab000 c090f488 c1896300 d0b96228 c1aab000 c1896308 00000020
> bf20: d053bf44 d053bf30 c0185224 c0163200 00000003 c090f488 d053bf94
> d053bf48 bf40: c0175504 c01851c4 00000000 00040b0c 00000002 00000003
> c1896300 c1896300 bf60: 40804f07 22eea600 d053a000 00000000 d053bfa4
> d053bf80 c0189a14 c018924c bf80: ffffffff 000250a8 00000003 00000036
> c00107e4 d053a000 00000000 d053bfa8 bfa0: c0010640 c01899dc ffffffff
> 000250a8 00000003 40804f07 22eea600 00000001 bfc0: ffffffff 000250a8
> 00000003 00000036 00000000 be73fdb4 00000003 00000000 bfe0: 4b767d80
> be73fc34 00010b78 4b767d8c 60000010 00000003 e675ff3a 2a3139dd [<c01e26cc>]
> (internal_create_group) from [<c01e2950>] (sysfs_create_group+0x20/0x24)
> [<c01e2950>] (sysfs_create_group) from [<c00e3d38>]
> (blk_trace_init_sysfs+0x18/0x20) [<c00e3d38>] (blk_trace_init_sysfs) from
> [<c02bdfbc>] (blk_register_queue+0xd8/0x154) [<c02bdfbc>]
> (blk_register_queue) from [<c02cec84>] (device_add_disk+0x194/0x44c)
> [<c02cec84>] (device_add_disk) from [<c0436ec8>]
> (ubiblock_create+0x284/0x2e0) [<c0436ec8>] (ubiblock_create) from
> [<c0427bb8>] (vol_cdev_ioctl+0x450/0x554) [<c0427bb8>] (vol_cdev_ioctl)
> from [<c0189110>] (vfs_ioctl+0x30/0x44) [<c0189110>] (vfs_ioctl) from
> [<c01892e0>] (do_vfs_ioctl+0xa0/0x790) [<c01892e0>] (do_vfs_ioctl) from
> [<c0189a14>] (SyS_ioctl+0x44/0x68) [<c0189a14>] (SyS_ioctl) from
> [<c0010640>] (ret_fast_syscall+0x0/0x34) Code: e89da8f0 e1a0c00d e92ddff0
> e24cb004 e24dd00c e52de004 e8bd4000 e2507000 e1a09001 e1a05002 0a000004
> e3510000 e59 74018 1a000002 e3540000 1a000002 (e7f001f2) e3540000 0a00000f
> e595300c e5951000 e3530000 1a00000d e5953010 e3530000 1 a00000a e59f2220
> e3510000 e5973000 e59f0218 01a01002 e59f2214
> ---[ end trace e541910253daa33a ]---
> 
> I was able to reproduce the problem with the following script with the
> underlying volumes already created:
> 
> while true; do
>     for part in 2 3 4 15 24 90 91; do
>         ubiblock -c /dev/ubi0_$part &
>     done
>     sleep 2
> 
>     for part in 2 3 4 15 24 90 91; do
>         ubiblock -r /dev/ubi0_$part &
>     done
>     sleep 2
> done
> 
> There is a race with idr_alloc where gd->first_minor could be set to the
> same value for two different calls to ubiblock_create.  Each instance
> calls device_add_disk with the same first_minor.  device_add_disk calls
> bdi_register_owner.  The bdi_register_owner call path produces the
> initial WARNINGS about registering the same device.  However,
> device_add_disk does not error out when bdi_register_owner returns an
> error.  The control continues until it reaches blk_register_queue which
> eventually BUGs.
> 
> >> Missing Fixes and Cc-stable tags.
> >> 
> >>> Signed-off-by: Bradley Bolen <bradleybolen@gmail.com>
> >> 
> >> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> >> 
> >> BTW, just had a quick look at the code, and I think the locking can be
> >> simplified a bit by keeping the devices_lock for the whole
> >> ubiblock_create() operation instead of acquiring/releasing it several
> >> times in the function (see [1]). It makes sense to do fine grained
> >> locking when operations protected by the lock are time sensitive, but I
> >> don't think this is the case here.
> > 
> > Agreed. Something like this perhaps http://ix.io/E8G ?
> > Notice that ubiblock_remove_all seemed to require locking as well.
> 
> I tried out Ezequiel's patch and it fixes this issue as well.  Note,
> that ret needs to be defined in ubiblock_remove.

Can you please have a proper patch such that I can take it? :-)

Thanks,
//richard

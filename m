Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fObd4-00085U-Nq
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2018 04:25:33 +0000
Received: by mail-wr0-x234.google.com with SMTP id d8-v6so3743783wro.4
 for <linux-mtd@lists.infradead.org>; Thu, 31 May 2018 21:25:20 -0700 (PDT)
MIME-Version: 1.0
From: "Sourabh Jain (R&D - Telecom)" <sourabh.jain@matrixcomsec.com>
Date: Fri, 1 Jun 2018 09:55:18 +0530
Message-ID: <CAAR3sxP_JEXoA6JMN6FgDp8p1PsmDG9JONJXEbz-APZoOjrKBA@mail.gmail.com>
Subject: UBIFS node corruption issue
To: linux-mtd@lists.infradead.org
Cc: "Shailesh Panchal (Software Development - Telecom)"
 <shailesh.panchal@matrixcomsec.com>,
 "Rajdeep Vaghasia (Software Development - Telecom)"
 <rajdeep.vaghasia@matrixcomsec.com>,
 "Vamsi S (R&D - Telecom)" <vamsi.s@matrixcomsec.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,


We are using 3.2.54 Linux kernel. In this, we are facing one issue
related to ubifs node  corruption. Below is the core dump captured in
dmesg output. Due to this node corruption, the application having pid
1374 is not able to run.


This is not resolved even after reboot. It is generated every time the
system starts.


What can be the problem?

How we can resolve this issue?

Please suggest us necessary action to be taken. Also, please inform us
if any further input is required from us.



[   75.379644] UBIFS error (pid 1374): ubifs_read_node: bad node type
(255 but expected 0)
[   75.387718] UBIFS error (pid 1374): ubifs_read_node: bad node at
LEB 328:75776, LEB mapping status 0
[   75.396890] Not a node, first 24 bytes:
[   75.396903] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff
........................
[   75.396917] Backtrace:
[   75.396955] [<84011d0c>] (dump_backtrace+0x0/0x10c) from
[<844b51f8>] (dump_stack+0x18/0x1c)
[   75.396966]  r6:00012800 r5:e66ee000 r4:e6c01000 r3:00000018
[   75.397004] [<844b51e0>] (dump_stack+0x0/0x1c) from [<8421a9a8>]
(ubifs_read_node+0x268/0x28c)
[   75.397033] [<8421a740>] (ubifs_read_node+0x0/0x28c) from
[<84236ac0>] (ubifs_tnc_read_node+0x6c/0x118)
[   75.397055] [<84236a54>] (ubifs_tnc_read_node+0x0/0x118) from
[<8421daf4>] (ubifs_tnc_locate+0xc8/0x1a0)
[   75.397066]  r7:e66ee000 r6:e6771d28 r5:00000001 r4:e6c01000
[   75.397091] [<8421da2c>] (ubifs_tnc_locate+0x0/0x1a0) from
[<84214e18>] (ubifs_iget+0x70/0x76c)
[   75.397110] [<84214da8>] (ubifs_iget+0x0/0x76c) from [<84212a04>]
(ubifs_lookup+0x13c/0x1dc)
[   75.397131] [<842128c8>] (ubifs_lookup+0x0/0x1dc) from [<840df220>]
(d_alloc_and_lookup+0x4c/0x68)
[   75.397149] [<840df1d4>] (d_alloc_and_lookup+0x0/0x68) from
[<840e0ea4>] (do_lookup+0x1fc/0x320)
[   75.397160]  r6:00000001 r5:e6771e70 r4:00000000 r3:0000031c
[   75.397183] [<840e0ca8>] (do_lookup+0x0/0x320) from [<840e1948>]
(path_lookupat+0x100/0x6bc)
[   75.397201] [<840e1848>] (path_lookupat+0x0/0x6bc) from
[<840e1f28>] (do_path_lookup+0x24/0x60)
[   75.397219] [<840e1f04>] (do_path_lookup+0x0/0x60) from
[<840e2f74>] (user_path_at_empty+0x60/0x90)
[   75.397229]  r7:ffffff9c r6:e6771e70 r5:00000001 r4:e6d05000
[   75.397252] [<840e2f14>] (user_path_at_empty+0x0/0x90) from
[<840e2fc0>] (user_path_at+0x1c/0x24)
[   75.397263]  r8:8400df28 r7:000000c3 r6:00000001 r5:e6771f40 r4:7e8e5660
[   75.397295] [<840e2fa4>] (user_path_at+0x0/0x24) from [<840d9680>]
(vfs_fstatat+0x3c/0x6c)
[   75.397313] [<840d9644>] (vfs_fstatat+0x0/0x6c) from [<840d96fc>]
(vfs_stat+0x24/0x28)
[   75.397339]  r5:000ae25c r4:7e8e5660
[   75.397360] [<840d96d8>] (vfs_stat+0x0/0x28) from [<840d98f0>]
(sys_stat64+0x1c/0x38)
[   75.397381] [<840d98d4>] (sys_stat64+0x0/0x38) from [<8400dd80>]
(ret_fast_syscall+0x0/0x30)
[   75.397391]  r4:7e8e5710
[   75.397406] UBIFS error (pid 1374): ubifs_iget: failed to read
inode 8372, error -22
[   75.405189] UBIFS error (pid 1374): ubifs_lookup: dead directory
entry 'dnsmasq', error -22
[   75.413584] UBIFS warning (pid 1374): ubifs_ro_mode: switched to
read-only mode, error -22
[   75.421888] Backtrace:
[   75.421912] [<84011d0c>] (dump_backtrace+0x0/0x10c) from
[<844b51f8>] (dump_stack+0x18/0x1c)
[   75.421923]  r6:e6698600 r5:e757c3d8 r4:ffffffea r3:846974ec
[   75.421952] [<844b51e0>] (dump_stack+0x0/0x1c) from [<84218b98>]
(ubifs_ro_mode+0x6c/0x78)
[   75.421970] [<84218b2c>] (ubifs_ro_mode+0x0/0x78) from [<84212a48>]
(ubifs_lookup+0x180/0x1dc)
[   75.421988] [<842128c8>] (ubifs_lookup+0x0/0x1dc) from [<840df220>]
(d_alloc_and_lookup+0x4c/0x68)
[   75.422006] [<840df1d4>] (d_alloc_and_lookup+0x0/0x68) from
[<840e0ea4>] (do_lookup+0x1fc/0x320)
[   75.422016]  r6:00000001 r5:e6771e70 r4:00000000 r3:0000031c
[   75.422039] [<840e0ca8>] (do_lookup+0x0/0x320) from [<840e1948>]
(path_lookupat+0x100/0x6bc)
[   75.422056] [<840e1848>] (path_lookupat+0x0/0x6bc) from
[<840e1f28>] (do_path_lookup+0x24/0x60)
[   75.422074] [<840e1f04>] (do_path_lookup+0x0/0x60) from
[<840e2f74>] (user_path_at_empty+0x60/0x90)
[   75.422084]  r7:ffffff9c r6:e6771e70 r5:00000001 r4:e6d05000
[   75.422107] [<840e2f14>] (user_path_at_empty+0x0/0x90) from
[<840e2fc0>] (user_path_at+0x1c/0x24)
[   75.422118]  r8:8400df28 r7:000000c3 r6:00000001 r5:e6771f40 r4:7e8e5660
[   75.422146] [<840e2fa4>] (user_path_at+0x0/0x24) from [<840d9680>]
(vfs_fstatat+0x3c/0x6c)
[   75.422164] [<840d9644>] (vfs_fstatat+0x0/0x6c) from [<840d96fc>]
(vfs_stat+0x24/0x28)
[   75.422174]  r5:000ae25c r4:7e8e5660
[   75.422192] [<840d96d8>] (vfs_stat+0x0/0x28) from [<840d98f0>]
(sys_stat64+0x1c/0x38)
[   75.422209] [<840d98d4>] (sys_stat64+0x0/0x38) from [<8400dd80>]
(ret_fast_syscall+0x0/0x30)
[   75.422219]  r4:7e8e5710


Best Regards,
Sourabh Jain

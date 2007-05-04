Received: from mail.windriver.com ([147.11.1.11] helo=mail.wrs.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjoBS-00083L-4z
	for linux-mtd@lists.infradead.org; Thu, 03 May 2007 23:10:16 -0400
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.wrs.com (8.13.6/8.13.6) with ESMTP id l443ABRU009096
	for <linux-mtd@lists.infradead.org>;
	Thu, 3 May 2007 20:10:11 -0700 (PDT)
Subject: cmdline partitioning 2.6.20 ARM Versatile 926ejs
From: Richard Griffiths <richard.griffiths@windriver.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 03 May 2007 20:10:11 -0700
Message-Id: <1178248211.6414.83.camel@localhost.localdomain>
Mime-Version: 1.0
Reply-To: richard.griffiths@windriver.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm in the process of upgrading to the 2.6.20.rc6 kernel from 2.6.14 and
am having problems with cmdline partition. Using the following kernel
command line for both kernel versions:

Kernel command line: console=ttyAMA0,38400 mem=128M ip=dhcp
root=/dev/mtdblock1 rootfstype=jffs2
mtdparts=phys_mapped_flash:128K(u-boot),16M@0x2000000(jffs2),1M@0x1980000(cramfs)

2.6.14 does the right thing and boots the jffs2 partition.

physmap flash device: 4000000 at 34000000
phys_mapped_flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
phys_mapped_flash: CFI does not contain boot bank location. Assuming
top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
3 cmdlinepart partitions found on MTD device phys_mapped_flash
Creating 3 MTD partitions on "phys_mapped_flash":
0x00000000-0x00020000 : "u-boot"
0x02000000-0x03000000 : "jffs2"
0x01980000-0x01a80000 : "cramfs"

While the new kernel fails with and panics when it fails to find the
partition. Stranger still it's looking for a linear cramfs which isn't
even enabled in the kernel.

physmap platform flash device: 04000000 at 34000000
physmap-flash.0: Found 2 x16 devices at 0x0 in 32-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
physmap-flash.0: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
cmdlinepart partition parsing not available
.
physmap platform flash device: 04000000 at 34000000
physmap-flash.0: Found 2 x16 devices at 0x0 in 32-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
physmap-flash.0: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
cmdlinepart partition parsing not available

cramfs: unknown physical address for linear cramfs image
Unable to handle kernel NULL pointer dereference at virtual address
00000054
pgd = c0004000
[00000054] *pgd=00000000
Internal error: Oops: 5 [#1]
Modules linked in:
CPU: 0
PC is at bdev_uevent+0x10/0x40
LR is at kill_block_super+0x20/0x3c
pc : [<c008f734>]    lr : [<c00902a4>]    Not tainted
sp : c0461ca8  ip : c0461cb8  fp : c0461cb4
r10: 00008000  r9 : 00000000  r8 : 00000000
r7 : c00d914c  r6 : 00008000  r5 : c073d000  r4 : 00000000
r3 : 00000000  r2 : 00000084  r1 : 00000005  r0 : 00000000
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 5317F
Table: 00004000  DAC: 00000017
Process swapper (pid: 1, stack limit = 0xc0460258)
Stack: (0xc0461ca8 to 0xc0462000)
1ca0:                   c0461ccc c0461cb8 c00902a4 c008f734 c073d000
c0300040 
1cc0: c0461ce4 c0461cd0 c00903ac c0090294 c073d000 ffffffea c0461d04
c0461ce8 
1ce0: c0090dec c0090358 00000000 c0454ea0 c0300040 c04b4000 c0461d1c
c0461d08 
1d00: c00d905c c0090d74 c0454ea0 00000000 c0461d5c c0461d20 c0090490
c00d9048 
1d20: c0454ea0 c0483000 c04b4000 00000000 c0461d5c c0300040 ffffffed
00000000 
1d40: c0483000 00000000 00008000 00000000 c0461d7c c0461d60 c009056c
c00903dc 
1d60: c0461d7c 00000000 00000000 c04b4000 c0461efc c0461d80 c00a90a8
c0090540 
1d80: 00000000 c0461df0 c0461dcc c0450718 c0461db4 c0461da0 c0159b38
c0267a50 
1da0: c00a2790 c0450718 c0461dcc c0461db8 c00a2790 c0159ae0 c047d005
c04e6638 
1dc0: c0461e24 c0461dd0 c00986d8 000000d0 c0457da0 60000013 c0461e04
c0461de8 
1de0: c0089ed4 c01608cc c0159b38 c0712498 c04e6638 c0453c00 c0461e24
00000000 
1e00: c0447bc0 c0335680 c0461e74 c0461e18 c006db48 c0267a50 00000044
c0461e28 
1e20: 00000001 00000001 00000000 00000044 00000000 000200d0 c02feef8
00000000 
1e40: 00000000 00000001 c0461e74 00000000 c0447bc0 000000d0 00000000
c02feef4 
1e60: c0460000 c001fb94 c0461ebc c0461e78 c006e0fc c006d754 c04e7e38
c04547a0 
1e80: 00000010 c0335680 c0461eb4 00000001 00000001 00000000 c0461f0c
c02bb528 
1ea0: 00008000 c0020044 c0020044 c001fb94 c0461edc c0461ec0 c006e384
c006e0ac 
1ec0: c0461f44 c02bb528 c0461f0c c02bb528 c0461efc 00000000 c047d000
c02bb528 
1ee0: 00008000 c0020044 c0020044 c001fb94 c0461f34 c0461f00 c00a9588
c00a8e54 
1f00: 00000000 00000080 c0099f04 c04b4000 c0483000 00000000 00000000
c00204f4 
1f20: c030d228 c02fabcc c0461f54 c0461f38 c0008d30 c00a9508 00000000
c0461f48 
1f40: c009a1f0 00000000 c0461f74 c0461f58 c00091f0 c0008d18 00000000
c00204f4 
1f60: c030d228 00000001 c0461f9c c0461f78 c00092e8 c00090f0 c0020044
c001fb94 
1f80: c0461f9c c030d218 00000000 c0460000 c0461ff4 c0461fa0 c0008858
c000923c 
1fa0: 00000000 c0461fb0 c0023d68 c00264a8 00000000 00000000 c0008724
c003eff4 
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 
1fe0: 00000000 00000000 00000000 c0461ff8 c003eff4 c0008734 6425202c
69727720 
Backtrace: 
[<c008f724>] (bdev_uevent+0x0/0x40) from [<c00902a4>] (kill_block_super
+0x20/0x3c)
[<c0090284>] (kill_block_super+0x0/0x3c) from [<c00903ac>]
(deactivate_super+0x64/0x84)
 r5 = C0300040  r4 = C073D000 
[<c0090348>] (deactivate_super+0x0/0x84) from [<c0090dec>] (get_sb_nodev
+0x88/0x94)
 r5 = FFFFFFEA  r4 = C073D000 
[<c0090d64>] (get_sb_nodev+0x0/0x94) from [<c00d905c>] (cramfs_get_sb
+0x24/0x30)
 r7 = C04B4000  r6 = C0300040  r5 = C0454EA0  r4 = 00000000
[<c00d9038>] (cramfs_get_sb+0x0/0x30) from [<c0090490>] (vfs_kern_mount
+0xc4/0x144)
[<c00903cc>] (vfs_kern_mount+0x0/0x144) from [<c009056c>] (do_kern_mount
+0x3c/0x50)
[<c0090530>] (do_kern_mount+0x0/0x50) from [<c00a90a8>] (do_mount
+0x264/0x6b4)
 r6 = C04B4000  r5 = 00000000  r4 = 00000000 
[<c00a8e44>] (do_mount+0x0/0x6b4) from [<c00a9588>] (sys_mount
+0x90/0xdc)
[<c00a94f8>] (sys_mount+0x0/0xdc) from [<c0008d30>] (do_mount_root
+0x28/0xb4)
 r7 = C02FABCC  r6 = C030D228  r5 = C00204F4  r4 = 00000000
[<c0008d08>] (do_mount_root+0x0/0xb4) from [<c00091f0>] (mount_root
+0x110/0x14c)
 r4 = 00000000 
[<c00090e0>] (mount_root+0x0/0x14c) from [<c00092e8>] (prepare_namespace
+0xbc/0x188)
 r7 = 00000001  r6 = C030D228  r5 = C00204F4  r4 = 00000000
[<c000922c>] (prepare_namespace+0x0/0x188) from [<c0008858>] (init
+0x134/0x1dc)
 r6 = C0460000  r5 = 00000000  r4 = C030D218 
[<c0008724>] (init+0x0/0x1dc) from [<c003eff4>] (do_exit+0x0/0x99c)
Code: e1a0c00d e92dd800 e24cb004 e1a03000 (e5900054) 
Kernel panic - not syncing: Attempted to kill init!


.

Both kernels have the same MTD configs set.  Any ideas why this no
longer works and any way to fix it?

Thanks,
Richard

Received: from ip67-153-123-160.z123-153-67.customer.algx.net
	([67.153.123.160] helo=calypsoo.voxware.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D4nCf-0000Wh-0k
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2005 16:40:54 -0500
Message-ID: <421F9B58.60109@voxware.com>
Date: Fri, 25 Feb 2005 16:40:40 -0500
From: "Craig A. Vanderborgh" <craigv@voxware.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 Kernel Panic w/Xscale (PXA255) & 2.6.10
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All:

This problem was recently reported in the mtd mailing list thread "Oops 
vanilla 2.6.10" by Konstantin Kletschke.  However, there was no 
resolution that I could see, so I am reporting it again in hopes that 
some mtd guru might take pity on us.

Our platform is a PXA-255 based SBC.  It is running kernel 2.6.10 
*extremely* well, with one exception - when accessing a VIRGIN jffs2 
filesystem, we get a kernel panic.  We cannot get past this unless we 
reload our 2.4.27 kernel and let it do the initial JFFS2 setup stuff.  
After reloading kernel 2.6.10, everything is then okay.  Just the 
uninitialized JFFS2 is a problem.  The JFFS2 error(s) and the KP should 
look familiar:

.
.
.
mice: PS/2 mouse device common for all mice
PXA Multimedia Card Interface Driver
NET: Registered protocol family 2
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET: Registered protocol family 1
mmcblk0: mmc0:0001 IFX032 31360KiB
 mmcblk0:<7>bound device 'mmc0:0001' to driver 'mmcblk'
EEEEEK. jffs2_mark_node_obsolete called with NULL node
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
[00000000] *pgd=00000000
Internal error: Oops: f5 [#1]
Modules linked in:
CPU: 0
PC is at jffs2_build_remove_unlinked_inode+0x30/0xec
LR is at 0x1
pc : [<c00ccbd0>]    lr : [<00000001>]    Not tainted
sp : c0391d1c  ip : 60000093  fp : c0391d3c
r10: c7d9e8ac  r9 : c7d9e8c4  r8 : 00000000
r7 : c7d9e800  r6 : c0391d40  r5 : c7ded814  r4 : 00000000
r3 : c01dbd8c  r2 : 00000000  r1 : 0000d3a8  r0 : 0000003a
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 397F  Table: A0004000  DAC: 0000001D
Process swapper (pid: 1, stack limit = 0xc0390190)
Stack: (0xc0391d1c to 0xc0392000)
1d00:                                                                
c7ded814
1d20: 00000000 c7d9e800 c0391d44 00000000 c0391d68 c0391d40 c00cc9f8 
c00ccbac
1d40: 00000000 00000000 c7d9e894 c7d9e89c c7d9e8a4 c7d9e8b4 c7d9e8bc 
c0391db0
1d60: c0391d6c c00ccf38 c00cc820 c7d9e8f8 c7d9e800 c7d9e8dc c7d9e8d4 
c7d9e8cc
1d80: c7d9e8ec c00dbf6c 00040000 c7d9e800 00000000 c7d9e600 c7d49600 
00000000
1da0: 00000000 c0391dd4 c0391db4 c00cec58 c00ccd18 c7d9e600 c7d9e800 
00008000
1dc0: 00000000 c7d49600 c0391df8 c0391dd8 c00cf2ac c00ceb34 ffffffea 
00000002
1de0: c7db4000 00008000 c01e2b78 c0391e68 c0391dfc c00cf500 c00cf220 
c7d49600
1e00: c0372554 c7d42c3c c0375600 c0391e5c c0391e64 c0375600 00000001 
00000001
1e20: 00000000 0000000a c03752a0 c7da05e0 c7db4000 00008000 00000000 
c0391e68
1e40: c0391e4c c03752a0 c7db4000 fffffff4 c01e2b78 00008000 00000000 
c0391e90
1e60: c0391e6c c006fd54 c00cf374 ffffffff c7db4000 00000000 00008000 
c0391ec8
1e80: 00000000 c0391eb8 c0391e94 c00851c0 c006fd00 00008000 00000000 
c7db3000
1ea0: 00000000 c7db4000 c0391ec8 c0391f30 c0391ebc c0085860 c0085148 
c7db4000
1ec0: 00000000 c7db2000 c0372554 c0375600 c0053760 00000000 c01ac62c 
00000001
1ee0: 00000001 00000000 00000000 00000000 c0391f0c c0391f00 c004ec30 
00001000
1f00: c0391f30 c0391f10 00000000 00000000 c01ac62c c7db3000 00008000 
00000000
1f20: 00000000 c0391f64 c0391f34 c0085c88 c008571c 00000000 00000000 
c7db4000
1f40: c7db2000 c0382000 c0382000 00008000 c01ac62c c0223e08 c0391f7c 
c0391f68
1f60: c000900c c0085bf0 00000000 c0382000 c0391fc0 c0391f80 c00090f0 
c0008fe8
1f80: c0044530 6264746d 01f00002 c001cae0 c0218b3c 00000000 00000000 
00000000
1fa0: 00000000 c001cae0 c0218b3c 00000000 00000000 c0391fe0 c0391fc4 
c000948c
1fc0: c00090a4 00000000 c01ac450 00000000 00000000 c0391ff4 c0391fe4 
c001f250
1fe0: c00093f4 00000000 00000000 c0391ff8 c0032644 c001f20c 00000000 
00000000
Backtrace:
[<c00ccba0>] (jffs2_build_remove_unlinked_inode+0x0/0xec) from 
[<c00cc9f8>] (jff
s2_build_filesystem+0x1e4/0x38c)
 r8 = 00000000  r7 = C0391D44  r6 = C7D9E800  r5 = 00000000
 r4 = C7DED814
[<c00cc814>] (jffs2_build_filesystem+0x0/0x38c) from [<c00ccf38>] 
(jffs2_do_moun
t_fs+0x22c/0x274)
 r8 = C7D9E8BC  r7 = C7D9E8B4  r6 = C7D9E8A4  r5 = C7D9E89C
 r4 = C7D9E894
[<c00ccd0c>] (jffs2_do_mount_fs+0x0/0x274) from [<c00cec58>] 
(jffs2_do_fill_supe
r+0x130/0x238)
[<c00ceb28>] (jffs2_do_fill_super+0x0/0x238) from [<c00cf2ac>] 
(jffs2_get_sb_mtd
+0x98/0xf8)
 r8 = C7D49600  r7 = 00000000  r6 = 00008000  r5 = C7D9E800
 r4 = C7D9E600
[<c00cf214>] (jffs2_get_sb_mtd+0x0/0xf8) from [<c00cf500>] 
(jffs2_get_sb+0x198/0
x1d4)
 r8 = C01E2B78  r7 = 00008000  r6 = C7DB4000  r5 = 00000002
 r4 = FFFFFFEA
[<c00cf368>] (jffs2_get_sb+0x0/0x1d4) from [<c006fd54>] 
(do_kern_mount+0x60/0x10
8)
[<c006fcf4>] (do_kern_mount+0x0/0x108) from [<c00851c0>] 
(do_new_mount+0x84/0xb8
)
[<c008513c>] (do_new_mount+0x0/0xb8) from [<c0085860>] 
(do_mount+0x150/0x16c)
[<c0085710>] (do_mount+0x0/0x16c) from [<c0085c88>] (sys_mount+0xa4/0xe8)
[<c0085be4>] (sys_mount+0x0/0xe8) from [<c000900c>] 
(do_mount_root+0x30/0xbc)
 r8 = C0223E08  r7 = C01AC62C  r6 = 00008000  r5 = C0382000
 r4 = C0382000
[<c0008fdc>] (do_mount_root+0x0/0xbc) from [<c00090f0>] 
(mount_block_root+0x58/0
x124)
 r4 = C0382000
[<c0009098>] (mount_block_root+0x0/0x124) from [<c000948c>] 
(prepare_namespace+0
xa4/0xe8)
 r8 = 00000000  r7 = 00000000  r6 = C0218B3C  r5 = C001CAE0
 r4 = 00000000
[<c00093e8>] (prepare_namespace+0x0/0xe8) from [<c001f250>] (init+0x50/0xf0)
 r6 = 00000000  r5 = 00000000  r4 = C01AC450
[<c001f200>] (init+0x0/0xf0) from [<c0032644>] (do_exit+0x0/0x40c)
 r4 = 00000000
Code: 0a000005 e1a01004 e1a00007 ebffe40e (e5944000)
 <0>Kernel panic - not syncing: Attempted to kill init!

Is there in fact a fix for this problem?  Please advise.

Thanks in advance
craig vanderborgh
voxware incorporated

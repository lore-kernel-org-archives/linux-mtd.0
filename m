Received: from mail168.messagelabs.com ([216.82.253.195])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LRank-00008p-3K
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2009 23:23:34 +0000
Received: from [192.168.65.100] (arasv [192.168.65.100])
	by mail.magtech.com.au (Postfix) with ESMTP id 98395FAD8E
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jan 2009 10:23:24 +1100 (EST)
Message-ID: <497E45F1.3070807@magtech.com.au>
Date: Tue, 27 Jan 2009 10:23:29 +1100
From: Aras Vaichas <arasv@magtech.com.au>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: JFFS2 oops on 2.6.26.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is on a 2.6.26.3 system booted with an NFS root, trying to mount a 
32MB NAND sometimes causes oops.

/root # mtd_debug info /dev/mtd5
mtd.type = MTD_NANDFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 33554432 (32M)
mtd.erasesize = 16384 (16K)
mtd.writesize = 512
mtd.oobsize = 16
regions = 0

/root # mount -t jffs2 /dev/mtdblock5 /mnt/
Empty flash at 0x0018bb10 ends at 0x0018bc00
... SNIP ...
Empty flash at 0x0168a85c ends at 0x0168aa00
/root # JFFS2 notice: (464) check_node_data: wrong data CRC in data node 
at 0x00ec2b08: read 0x629539c7, calculated 0x9afe63be.
cJFFS2 notice: (464) check_node_data: wrong data CRC in data node at 
0x015e2dc0: read 0x218f9382, calculated 0x79bab27f.
d JFFS2 notice: (464) check_node_data: wrong data CRC in data node at 
0x00839d80: read 0x4edb4c9e, calculated 0xa671d2b2.
Unable to handle kernel NULL pointer dereference at virtual address 0000001e
pgd = c0004000
[0000001e] *pgd=00000000
Internal error: Oops: 17 [#1] PREEMPT
Modules linked in: g_ether vfat fat nls_base
CPU: 0    Not tainted  (2.6.26.3-magarm #98)
PC is at jffs2_get_inode_nodes+0x8ec/0xdf0
LR is at jffs2_get_inode_nodes+0x900/0xdf0
pc : [<c00fb26c>]    lr : [<c00fb280>]    psr: 60000013
sp : c1de1dc8  ip : c1de1dc8  fp : c1de1e24
r10: c1f92000  r9 : 00000042  r8 : c1ed3d18
r7 : c1d4ba80  r6 : 00000042  r5 : 00000042  r4 : 00000000
r3 : 00000001  r2 : 00000000  r1 : 00000000  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: c000317f  Table: 21e70000  DAC: 00000015
Process jffs2_gcd_mtd5 (pid: 464, stack limit = 0xc1de0260)
Stack: (0xc1de1dc8 to 0xc1de2000)
1dc0:                   c1de1df0 c1f92000 c0105170 c0053bd4 c1ed3d10 
c1de1e40
1de0: c1e8dc00 c1de3200 000001e4 00000000 000001e4 c1de1e24 c1de1e04 
c1e8dc00
1e00: c1e8dc00 c1de1e88 00000001 c1de3200 00000000 c1de322c c1de1e84 
c1de1e28
1e20: c00fb8a8 c00fa990 c10d20c0 00000000 c1de1e4c c1de1e40 c00f912c 
00000000
1e40: c1d4be80 c1d4bfa0 0000021f 00000000 00000000 00000000 00000000 
c1e8dc00
1e60: c10e5078 c1de3200 00000001 00000000 00000000 c1de322c c1de1ee4 
c1de1e88
1e80: c00fc0a0 c00fb880 e0021985 c10c7a08 c0284128 c0284128 c10c7a10 
c1de1ecc
1ea0: c1de1eac c0034298 c011e384 c10c7a08 c0284128 c10c79e0 00000000 
c10c7b38
1ec0: c1de1eec c1de1ed0 c0034570 c1de0000 c10e5078 c1de3200 c1de1f54 
c1de1ee8
1ee0: c0100240 c00fc058 c0034a00 c0034560 c1de0000 c02840f0 c1de1f30 
c1de1f08
1f00: c01efb00 c00349a4 c1de0000 c1de0000 c1de3200 00000000 00000000 
00000000
1f20: c1de1f40 c1de1f30 c0044ca4 c1de0000 c1de0000 c1de3200 00000000 
00000000
1f40: 00000000 00000000 c1de1ff4 c1de1f58 c0101f8c c0100004 c1de1f80 
c1de1f68
1f60: c003cf44 c01ef9a0 00000001 c1de1f6c c1de1f6c c1de1f94 c1de1f84 
c003d088
1f80: c003c924 00000000 00000000 c1de1fac c1de1f9c c0035fd0 c0035254 
00000000
1fa0: 00000000 c1de1fb0 c0023b84 c0035fc8 00000000 c1de3200 c0101e28 
c003c914
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
1fe0: 00000000 00000000 00000000 c1de1ff8 c003c914 c0101e38 fbf7fbbf 
fffcfe7f
Backtrace:
[<c00fa980>] (jffs2_get_inode_nodes+0x0/0xdf0) from [<c00fb8a8>] 
(jffs2_do_read_inode_internal+0x38/0x7d8)
[<c00fb870>] (jffs2_do_read_inode_internal+0x0/0x7d8) from [<c00fc0a0>] 
(jffs2_do_crccheck_inode+0x58/0x9c)
[<c00fc048>] (jffs2_do_crccheck_inode+0x0/0x9c) from [<c0100240>] 
(jffs2_garbage_collect_pass+0x24c/0x8fc)
 r6:c1de3200 r5:c10e5078 r4:c1de0000
[<c00ffff4>] (jffs2_garbage_collect_pass+0x0/0x8fc) from [<c0101f8c>] 
(jffs2_garbage_collect_thread+0x164/0x1bc)
[<c0101e28>] (jffs2_garbage_collect_thread+0x0/0x1bc) from [<c003c914>] 
(do_exit+0x0/0x65c)
 r7:00000000 r6:00000000 r5:00000000 r4:00000000
Code: e3530000 eafffff6 e2524000 0a000063 (e1d431be)
---[ end trace a6f28286e2878d4d ]---


Aras

______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________

Received: from tim.rpsys.net ([194.106.48.114])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G1ia6-0003xn-Ns
	for linux-mtd@lists.infradead.org; Sat, 15 Jul 2006 07:45:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k6FBj4if029336
	for <linux-mtd@lists.infradead.org>; Sat, 15 Jul 2006 12:45:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29243-02 for <linux-mtd@lists.infradead.org>;
	Sat, 15 Jul 2006 12:45:02 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k6FBixKa029327
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-mtd@lists.infradead.org>; Sat, 15 Jul 2006 12:44:59 +0100
Subject: JFFS2 oops from latest mainline git kernel
From: Richard Purdie <rpurdie@rpsys.net>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Sat, 15 Jul 2006 12:44:58 +0100
Message-Id: <1152963899.5546.59.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I just saw this from a latest mainline git kernel on a Sharp Zaurus
SL-C760 using the sharpsl NAND driver (I was fixing up the sharpsl
driver breakage although I don't think is related).

JFFS2 error: (1464) check_node_data: short read at 0x0efa00: 65 instead of 228.
JFFS2 error: (1464) check_node: check_node_data() returned error: -5.
kernel BUG at fs/jffs2/readinode.c:700!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
[00000000] *pgd=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at __bug+0x40/0x54
LR is at 0x1
pc : [<c003df14>]    lr : [<00000001>]    Not tainted
sp : c39e7dec  ip : 60000093  fp : c39e7dfc
r10: c3dc8740  r9 : c3ca5ac0  r8 : c3f8f598
r7 : c3dc8720  r6 : c3dc8720  r5 : fffffffb  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : c39e6000  r0 : 00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 397F  Table: A3994000  DAC: 00000015
Process jffs2_gcd_mtd2 (pid: 1464, stack limit = 0xc39e6250)
Stack: (0xc39e7dec to 0xc39e8000)
7de0:                            00000000 c39e7e88 c39e7e00 c00f1e08 c003dee0
7e00: c03a3400 c03a3558 c03cc000 c34c2938 00000280 c03a3400 00000000 c3813c10
7e20: c3f8f538 c39e7e8c c3813c00 c03a1600 00000044 c3dc86e0 000000a8 000001cc
7e40: 00000000 000000a8 00000000 c03a1600 00000000 c3dc86e0 c00ef9b0 c0098324
7e60: c3813c00 c3ca29f8 c03a1600 00000001 00000000 00000000 c03a162c c39e7ee8
7e80: c39e7e8c c00f2494 c00f10c0 e0021985 c39e6000 60000013 c03a1600 00000001
7ea0: 00000000 00000000 c03a162c c39e7ed4 c39e7ebc c0050174 c00500c8 00000000
7ec0: c39e6000 c39e6000 c39e7ee8 c39e7ed8 c3ca29f8 c39e6000 c03a1600 c39e7f54
7ee0: c39e7eec c00f6758 c00f243c 0de45f80 00989645 c39e6000 c037a8c0 c0278d34
7f00: c0278888 00000000 00000000 00000000 c39e7f30 c39e7f20 c01f09ac c01f028c
7f20: 0000000a c39e7f40 c39e7f34 c39e6000 c39e6000 c03a1600 00000000 00000000
7f40: 00000000 00000000 c39e7ff4 c39e7f58 c00f8338 c00f64dc c39e7f64 c0057874
7f60: c01f028c c037a978 c39e7f68 c39e7f68 c39e7f94 c39e7f80 c00579a8 c0056f50
7f80: 401eaa78 00000000 c39e7fa4 c39e7f98 c00579c8 c0057904 00000000 00000000
7fa0: 00000000 c39e7fb0 c0039e84 c004ff28 00000000 c03a1600 c00f81f4 c0056f44
7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
7fe0: 00000000 00000000 00000000 c39e7ff8 c0056f44 c00f8200 00000000 00000000
Backtrace:
[<c003ded4>] (__bug+0x0/0x54) from [<c00f1e08>] (jffs2_do_read_inode_internal+0xd54/0x137c)
 r4 = 00000000
[<c00f10b4>] (jffs2_do_read_inode_internal+0x0/0x137c) from [<c00f2494>] (jffs2_do_crccheck_inode+0x64/0xb8)
[<c00f2430>] (jffs2_do_crccheck_inode+0x0/0xb8) from [<c00f6758>] (jffs2_garbage_collect_pass+0x288/0x998) r6 = C03A1600  r5 = C39E6000  r4 = C3CA29F8
[<c00f64d0>] (jffs2_garbage_collect_pass+0x0/0x998) from [<c00f8338>] (jffs2_garbage_collect_thread+0x144/0x194)
[<c00f81f4>] (jffs2_garbage_collect_thread+0x0/0x194) from [<c0056f44>] (do_exit+0x0/0x97c)
 r7 = 00000000  r6 = 00000000  r5 = 00000000  r4 = 00000000
Code: 1b005d12 e59f0014 eb005d10 e3a03000 (e5833000)
 <5>jffs2_scan_dirent_node(): Node CRC failed on node at 0x03d02bf0: Read 0xffffffff, calculated 0xbe6ae017
Empty flash at 0x03d02c24 ends at 0x03d02e00
Empty flash at 0x0414e948 ends at 0x0414ea00
jffs2_scan_inode_node(): CRC failed on node at 0x041829e0: Read 0xffffffff, calculated 0x19a37ebe
Empty flash at 0x04182a24 ends at 0x04182c00
Empty flash at 0x04182fb8 ends at 0x04183000
Empty flash at 0x0418ac3c ends at 0x0418ae00
jffs2_scan_eraseblock(): Node at 0x04206dfc {0x1985, 0xe001, 0xe0021985) has invalid CRC 0x00000edd (calculated 0x515918d5)
Empty flash at 0x04248a20 ends at 0x04248c00
Empty flash at 0x04249118 ends at 0x04249200
JFFS2 error: (1518) jffs2_get_inode_nodes: short read at 0x21253a4: 68 instead of 92.
JFFS2 error: (1518) jffs2_do_read_inode_internal: cannot read nodes for ino 9250, returned error is -5
Returned error for crccheck of ino #9250. Expect badness...
JFFS2 error: (1518) check_node_data: short read at 0x24e8c00: 1069 instead of 1345.
JFFS2 error: (1518) check_node: check_node_data() returned error: -5.
kernel BUG at fs/jffs2/readinode.c:700!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
[00000000] *pgd=00000000
Internal error: Oops: 817 [#2]
Modules linked in:
CPU: 0
PC is at __bug+0x40/0x54
LR is at 0x1
pc : [<c003df14>]    lr : [<00000001>]    Not tainted
sp : c36d1dec  ip : 60000093  fp : c36d1dfc
r10: c3dc87a0  r9 : c34a46cc  r8 : c370e688
r7 : c3dc8820  r6 : c3dc8820  r5 : fffffffb  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : c36d0000  r0 : 00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 397F  Table: A39A8000  DAC: 00000015
Process jffs2_gcd_mtd3 (pid: 1518, stack limit = 0xc36d0250)
Stack: (0xc36d1dec to 0xc36d2000)
1de0:                            00000000 c36d1e88 c36d1e00 c00f1e08 c003dee0
1e00: c03a3400 c03a3544 c36d1e14 c00399d8 00000411 c03a3400 00000000 c3813e10
1e20: c3f8f358 c36d1e8c c3813e00 c3813a00 00000000 c3dc88c0 000000bc c00efc0c
1e40: 00000000 000000bc 00000000 c00eeb18 00000000 c3dc88c0 c3813e00 c3813a00
1e60: c3813e00 c3db5f20 c3813a00 00000001 00000000 00000000 c3813a2c c36d1ee8
1e80: c36d1e8c c00f2494 c00f10c0 e0021985 c36d0000 60000013 c3813a00 00000001
1ea0: 00000000 00000000 c3813a2c c36d1ed4 c36d1ebc c0050174 c00500c8 00000000
1ec0: c36d0000 c36d0000 c36d1ee8 c36d1ed8 c3db5f20 c36d0000 c3813a00 c36d1f54
1ee0: c36d1eec c00f6758 c00f243c 936a0e80 00989649 c36d0000 c037b680 c0278d34
1f00: c0278888 00000000 00000000 00000000 c36d1f30 c36d1f20 c01f09ac c01f028c
1f20: 0000000a c36d1f40 c36d1f34 c36d0000 c36d0000 c3813a00 00000000 00000000
1f40: 00000000 00000000 c36d1ff4 c36d1f58 c00f8338 c00f64dc c36d0000 00400100
1f60: 00000000 00000000 00000000 00000000 00000000 c36d1f94 c36d1f84 c01f09ac
1f80: c01f028c c36d0000 c36d1fac c36d1f98 c004ffbc c01f097c 00000000 00000000
1fa0: 00000000 c36d1fb0 c0039e84 c004ff28 00000000 c3813a00 c00f81f4 c0056f44
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1fe0: 00000000 00000000 00000000 c36d1ff8 c0056f44 c00f8200 00000000 00000000
Backtrace:
[<c003ded4>] (__bug+0x0/0x54) from [<c00f1e08>] (jffs2_do_read_inode_internal+0xd54/0x137c)
 r4 = 00000000
[<c00f10b4>] (jffs2_do_read_inode_internal+0x0/0x137c) from [<c00f2494>] (jffs2_do_crccheck_inode+0x64/0xb8)
[<c00f2430>] (jffs2_do_crccheck_inode+0x0/0xb8) from [<c00f6758>] (jffs2_garbage_collect_pass+0x288/0x998) r6 = C3813A00  r5 = C36D0000  r4 = C3DB5F20
[<c00f64d0>] (jffs2_garbage_collect_pass+0x0/0x998) from [<c00f8338>] (jffs2_garbage_collect_thread+0x144/0x194)
[<c00f81f4>] (jffs2_garbage_collect_thread+0x0/0x194) from [<c0056f44>] (do_exit+0x0/0x97c)
 r7 = 00000000  r6 = 00000000  r5 = 00000000  r4 = 00000000
Code: 1b005d12 e59f0014 eb005d10 e3a03000 (e5833000)

Richard

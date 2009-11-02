Received: from web43136.mail.sp1.yahoo.com ([216.252.121.66])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N4qGk-0006vH-0a
	for linux-mtd@lists.infradead.org; Mon, 02 Nov 2009 06:20:02 +0000
Message-ID: <904737.29049.qm@web43136.mail.sp1.yahoo.com>
Date: Sun, 1 Nov 2009 22:19:55 -0800 (PST)
From: jessonel <jessonel@yahoo.com>
Subject: JFFS2 Crash
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, 

I'm working with at91sam9rl64 & samsung nand flash.
The following is kernel dump when the system is starting up.
Any help?

=======================================================
JFFS2 notice: (325) check_node_data: wrong data CRC in data node at 0x00e1df64: read 0x2289e0b4, calculated 0xe1744b6d.
Unable to handle kernel NULL pointer dereference at virtual address 0000001e
pgd = c0004000
[0000001e] *pgd=00000000
Internal error: Oops: 17 [#1]
Modules linked in:
CPU: 0    Not tainted  (2.6.27 #964)
PC is at jffs2_get_inode_nodes+0xb50/0x1090
LR is at jffs2_get_inode_nodes+0xb4c/0x1090
pc : [<c010b100>]    lr : [<c010b0fc>]    psr: 60000013
sp : c3a21db0  ip : c3a21db0  fp : c3a21e14
r10: 0000053c  r9 : c392a200  r8 : 00000451
r7 : 00000000  r6 : c3a29de0  r5 : c3920000  r4 : 00000000
r3 : 00000001  r2 : c3a29e40  r1 : 00000000  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 0005317f  Table: 23a80000  DAC: 00000017
Process jffs2_gcd_mtd1 (pid: 325, stack limit = 0xc3a20268)
Stack: (0xc3a21db0 to 0xc3a22000)
1da0:                                     0000053c c3a21de4 c3920000 c3a21dc8
1dc0: c0108bb4 c3a0fc90 00000000 c3a21e3c c3995200 00000000 c3a20000 c3a0fc88
1de0: 00000800 0000053c c0108a60 c3a21e3c c3a0cec0 c3a21e94 c3995200 00000084
1e00: 00000000 c392a200 c3a21e8c c3a21e18 c010b67c c010a5c0 00000044 c3a21e5c
1e20: c3a21e94 c3a70b00 00000000 00000000 c3a21e4c c3a21e40 c0108bb4 c3a29e40
1e40: c3a29d40 0000037c 00000000 00000000 00000000 00000000 c392a200 c392a200
1e60: c3a21e8c c3995200 c3a0cec0 c392a200 c392a200 00000084 00000000 c392a22c
1e80: c3a21ef4 c3a21e90 c010bfe4 c010b650 c003a058 c3849670 c030f990 c3849670
1ea0: 0098963d 66176380 c3a21ecc c3a21eb8 c004bbd4 c004bb2c c030f960 c3849678
1ec0: c3a21efc c3a21ed0 c004bcb4 c004bbc0 00000001 40000013 c3849640 c3a0cec0
1ee0: 00000001 c392a200 c3a21f4c c3a21ef8 c0110610 c010bf98 c0259bec c004bc28
1f00: c3a21f2c 40000013 c3a20000 c392a200 00000001 00000084 c3a21f3c c3a21f28
1f20: c005b74c 40000013 c3a20000 c392a200 00000001 00000084 00000000 c3a21f50
1f40: c3a21ff4 c3a21f50 c0111d68 c01104c8 00000001 00000000 00000080 00000000
1f60: 00000000 00000001 c02fc554 00000000 c3a21fac c3a21f80 c0259bec c004bc28
1f80: c3a20000 00000000 00000000 00000000 00000000 00000001 c3a20000 00000000
1fa0: 00000000 c3a21fb0 c003ac14 c0259ad0 00000000 c392a200 c0111c3c c0052b7c
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1fe0: 00000000 00000000 00000000 c3a21ff8 c0052b7c c0111c4c 00000000 00000000
Backtrace:
[<c010a5b0>] (jffs2_get_inode_nodes+0x0/0x1090) from [<c010b67c>] (jffs2_do_read_inode_internal+0x3c/0x948)
[<c010b640>] (jffs2_do_read_inode_internal+0x0/0x948) from [<c010bfe4>] (jffs2_do_crccheck_inode+0x5c/0x9c)
[<c010bf88>] (jffs2_do_crccheck_inode+0x0/0x9c) from [<c0110610>] (jffs2_garbage_collect_pass+0x158/0x680)
 r6:c392a200 r5:00000001 r4:c3a0cec0
[<c01104b8>] (jffs2_garbage_collect_pass+0x0/0x680) from [<c0111d68>] (jffs2_garbage_collect_thread+0x12c/0x154)
[<c0111c3c>] (jffs2_garbage_collect_thread+0x0/0x154) from [<c0052b7c>] (do_exit+0x0/0x6e4)
Code: ea00005e e1a00004 eb00acfa e1a04000 (e1d431be)
---[ end trace ac21f309ef0a7a48 ]---
=======================================================

Thanks in advance.
Jess.


      

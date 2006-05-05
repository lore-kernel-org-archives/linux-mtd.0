Received: from bay110-f8.bay110.hotmail.com ([65.54.229.18] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fbxi4-0006lz-Jt
	for linux-mtd@lists.infradead.org; Fri, 05 May 2006 06:39:00 -0400
Message-ID: <BAY110-F8DCAD5664D0B5305FD6BDBCB50@phx.gbl>
From: "Han Chang" <posaune@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 05 May 2006 03:19:14 -0700
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Subject: Linux 2.6.14 NAND driver crash.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm moving from linux from 2.6.12 to 2.6.14. The NAND driver was working OK 
on 2.6.12. But on 2.6.14, when I tried to dd a file to the NAND device, 
sometime it crashed without dumping out anything, but sometime it dumped out 
following message. Any suggestion? Thanks!

=================================
# dd if=/sbin/mkdosfs of=/dev/mtdblock2 bs=25000 count=1
slab: Internal list corruption detected in cache 'blkdev_ioc'(92), slabp 
c029100
0(-1071021006). Hexdump:

000: 00 01 10 00 00 02 20 00 2a 84 29 c0 2e 84 29 c0
010: 32 84 29 c0 36 84 29 c0 3a 84 29 c0 3e 84 29 c0
020: 42 84 29 c0 46 84 29 c0 4a 84 29 c0 4e 84 29 c0
030: 52 84 29 c0 56 84 29 c0 5a 84 29 c0 5e 84 29 c0
040: 62 84 29 c0 66 84 29 c0 6a 84 29 c0 6e 84 29 c0
050: 72 84 29 c0 76 84 29 c0 7a 84 29 c0 7e 84 29 c0
060: 82 84 29 c0 86 84 29 c0 8a 84 29 c0 8e 84 29 c0
070: 92 84 29 c0 96 84 29 c0 9a 84 29 c0 9e 84 29 c0
080: a2 84 29 c0 a6 84 29 c0 aa 84 29 c0 ae 84 29 c0
090: b2 84 29 c0 b6 84 29 c0 ba 84 29 c0 be 84 29 c0
0a0: c2 84 29 c0 c6 84 29 c0 ca 84 29 c0 ce 84 29 c0
0b0: d2 84 29 c0 d6 84 29 c0 da 84 29 c0 de 84 29 c0
0c0: e2 84 29 c0 e6 84 29 c0 ea 84 29 c0 ee 84 29 c0
0d0: f2 84 29 c0 f6 84 29 c0 fa 84 29 c0 fe 84 29 c0
0e0: 02 85 29 c0 06 85 29 c0 0a 85 29 c0 0e 85 29 c0
0f0: 12 85 29 c0 16 85 29 c0 1a 85 29 c0 1e 85 29 c0
100: 22 85 29 c0 26 85 29 c0 2a 85 29 c0 2e 85 29 c0
110: 32 85 29 c0 36 85 29 c0 3a 85 29 c0 3e 85 29 c0
120: 42 85 29 c0 46 85 29 c0 4a 85 29 c0 4e 85 29 c0
130: 52 85 29 c0 56 85 29 c0 5a 85 29 c0 5e 85 29 c0
140: 62 85 29 c0 66 85 29 c0 6a 85 29 c0 6e 85 29 c0
150: 72 85 29 c0 76 85 29 c0 7a 85 29 c0 7e 85 29 c0
160: 82 85 29 c0 86 85 29 c0 8a 85 29 c0 8e 85 29 c0
170: 92 85 29 c0
kernel BUG at mm/slab.c:2348!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
[00000000] *pgd=c0003021, *pte=c00010c3, *ppte=c0001212
Internal error: Oops: 81f [#1]
Modules linked in:
CPU: 0
PC is at __bug+0x44/0x58
LR is at 0x1
pc : [<c002482c>]    lr : [<00000001>]    Not tainted
sp : c01dfebc  ip : 00000000  fp : c01dfec8
r10: 00000000  r9 : 00000007  r8 : c0291394
r7 : c01c42a0  r6 : c0291000  r5 : c01c42a0  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000001
Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  Segment kernel
Control: E5187B  Table: C08B4000  DAC: 00000017
Process events/0 (pid: 4, stack limit = 0xc01de194)
Stack: (0xc01dfebc to 0xc01e0000)
fea0:                                                                
c01dfee8
fec0: c01dfecc c005938c c00247f4 c0298432 c0291000 c01bb744 06666395 
c01dff1c
fee0: c01dfeec c005a1c0 c00592b4 00000000 c01f4254 00000007 c01f4244 
0000000f
ff00: c01f4254 c01c42a0 00000000 00000000 c01dff44 c01dff20 c005a350 
c005a134
ff20: c01bb744 c01c42a0 00000000 c01c42ec c017bc00 c017bc10 c01dff70 
c01dff48
ff40: c005b404 c005a2cc c01c6eac 80000013 c01c6ea4 c005b36c 00000001 
c01dff8c
ff60: c01c6e9c c01dffc8 c01dff74 c0044cd0 c005b378 ffffffff ffffffff 
00000001
ff80: 00000000 c00320f0 00010000 00000000 00000000 c01c8540 c00320f0 
00100100
ffa0: 00200200 c01c6e9c c01de000 c0044b0c c01cdf2c fffffffc 00000000 
c01dfff4
ffc0: c01dffcc c0049054 c0044b18 ffffffff ffffffff 00000000 00000000 
00000000
ffe0: 00000000 00000000 00000000 c01dfff8 c0037088 c0048f90 00000000 
00000000
Backtrace:
[<c00247e8>] (__bug+0x0/0x58) from [<c005938c>] (check_slabp+0xe4/0xfc)
[<c00592a8>] (check_slabp+0x0/0xfc) from [<c005a1c0>] 
(free_block+0x98/0x198)
r6 = 06666395  r5 = C01BB744  r4 = C0291000
[<c005a128>] (free_block+0x0/0x198) from [<c005a350>] 
(drain_array_locked+0x90/0
xb4)
[<c005a2c0>] (drain_array_locked+0x0/0xb4) from [<c005b404>] 
(cache_reap+0x98/0x
1f0)
[<c005b36c>] (cache_reap+0x0/0x1f0) from [<c0044cd0>] 
(worker_thread+0x1c4/0x254
)
[<c0044b0c>] (worker_thread+0x0/0x254) from [<c0049054>] 
(kthread+0xd0/0x104)
[<c0048f84>] (kthread+0x0/0x104) from [<c0037088>] (do_exit+0x0/0xb24)
r8 = 00000000  r7 = 00000000  r6 = 00000000  r5 = 00000000
r4 = 00000000
Code: eb0044d7 e59f0014 eb0044d5 e3a03000 (e5833000)
==========================================================

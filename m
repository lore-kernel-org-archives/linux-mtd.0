Received: from mail2.lanck.net ([62.152.87.202] helo=mail.protei.ru)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fq63M-000054-RT
	for linux-mtd@lists.infradead.org; Tue, 13 Jun 2006 06:23:31 -0400
Received: from lab111.protei (lab111 [10.0.0.2])
	by mail.protei.ru (Postfix) with ESMTP id CF4A2706DAC
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Jun 2006 14:23:13 +0400 (MSD)
Received: from [192.168.100.182] (nickolay.protei [192.168.100.182])
	by lab111.protei (Postfix) with ESMTP id 474CC9C03642
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Jun 2006 14:23:13 +0400 (MSD)
Message-ID: <448E920B.3050008@protei.ru>
Date: Tue, 13 Jun 2006 14:23:07 +0400
From: Nickolay <nickolay@protei.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: stable oops
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.
This is bad oops, which appeared every boot of my system.
Kernel: 2.6.16.1(stock kernel, w/o any patches).

[42949425.260000] kernel BUG at fs/jffs2/readinode.c:353!
[42949425.260000] Unable to handle kernel NULL pointer dereference at 
virtual address 00000000
[42949425.270000] pgd = c0004000
[42949425.270000] [00000000] *pgd=00000000
[42949425.280000] Internal error: Oops: 817 [#1]
[42949425.280000] Modules linked in: sdslc lincore_nand lincore_rtc 
ixp400_eth ixp400
[42949425.280000] CPU: 0
[42949425.280000] PC is at __bug+0x44/0x58
[42949425.280000] LR is at 0x1
[42949425.280000] pc : [<c01d5658>]    lr : [<00000001>]    Tainted: P
[42949425.280000] sp : c3127db4  ip : 60000093  fp : c3127dc4
[42949425.280000] r10: c0055a00  r9 : c3291c68  r8 : c3291c58
[42949425.280000] r7 : c3e3b1f8  r6 : c3f577dc  r5 : 00000000  r4 : 
00000000
[42949425.280000] r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 
00000001
[42949425.280000] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
[42949425.280000] Control: 39FF  Table: 033E0000  DAC: 00000015
[42949425.280000] Process jffs2_gcd_mtd7 (pid: 187, stack limit = 
0xc3126198)
[42949425.280000] Stack: (0xc3127db4 to 0xc3128000)
[42949425.280000] 7da0:                                              
00000000 c3127e2c c3127dc8
[42949425.280000] 7dc0: c02580e0 c01d5620 c3127df8 c3f577dc 00000001 
00000073 000007dc c3f57000
[42949425.280000] 7de0: c3127e50 c3127e54 c3e4a7e0 00000824 c3e81010 
00000000 00000824 c02173cc
[42949425.280000] 7e00: c3e81000 c3127e54 00000000 c31075d8 c0055a00 
c0055a00 00000000 c33f1c00
[42949425.280000] 7e20: c3127e88 c3127e30 c0258a28 c0257df4 c33f1c10 
c3127e4c c3127e48 c3127e90
[42949425.280000] 7e40: c0055a00 00000000 00000000 f5287980 c3127e64 
bf0ffce0 c3127e88 c3127e68
[42949425.280000] 7e60: c33f1c00 00000000 c31075d8 c0055a00 c0055a00 
00000000 c0055ae8 c3127ef0
[42949425.280000] 7e80: c3127e8c c025967c c02589f0 c3127ebc 0000001f 
00040000 c3127eb8 c3127ea8
[42949425.280000] 7ea0: c01d0d8c c01e6310 ffffffff c3127f44 c3127ebc 
c01cf924 c01d0d34 c3127ee0
[42949425.280000] 7ec0: c3127ecc c01eb190 c3f1e988 c3127f5c 00000000 
c31075d8 c0055a2c 00000000
[42949425.280000] 7ee0: 00000000 c3127f58 c3127ef4 c025cfd8 c025961c 
c01eb6a0 00000001 c3127f18
[42949425.280000] 7f00: c3127f0c c01eb568 c01eb4b0 c3127f38 c3127f1c 
c01ebcc4 c01eb558 20000013
[42949425.280000] 7f20: c3e5c040 c3e5c234 c3127f5c c3127f48 c3127f3c 
20000013 c3126000 c0055a00
[42949425.280000] 7f40: 00000000 00000000 00000000 c3127ff4 c3127f5c 
c0260130 c025cee4 00000001
[42949425.280000] 7f60: 00000000 00000080 00000000 00000000 00000000 
00000000 00000000 00000000
[42949425.280000] 7f80: 00000001 c01cfe44 c3127fa4 c3127f98 c01e3a2c 
c01e3620 00000000 00000000
[42949425.280000] 7fa0: 00000000 c3127fb0 c01cfd24 c01dca9c 00000000 
c0055a00 c026004c c01e3614
[42949425.280000] 7fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[42949425.280000] 7fe0: 00000000 00000000 00000000 c3127ff8 c01e3614 
c0260058 73680020 75736572
[42949425.280000] Backtrace:
[42949425.280000] [<c01d5614>] (__bug+0x0/0x58) from [<c02580e0>] 
(jffs2_get_inode_nodes+0x2f8/0xbfc)
[42949425.280000]  r4 = 00000000
[42949425.280000] [<c0257de8>] (jffs2_get_inode_nodes+0x0/0xbfc) from 
[<c0258a28>] (jffs2_do_read_inode_internal+0x44/0xa24)
[42949425.280000] [<c02589e4>] (jffs2_do_read_inode_internal+0x0/0xa24) 
from [<c025967c>] (jffs2_do_crccheck_inode+0x6c/0xc4)
[42949425.280000] [<c0259610>] (jffs2_do_crccheck_inode+0x0/0xc4) from 
[<c025cfd8>] (jffs2_garbage_collect_pass+0x100/0x560)
[42949425.280000]  r7 = 00000000  r6 = 00000000  r5 = C0055A2C  r4 = 
C31075D8
[42949425.280000] [<c025ced8>] (jffs2_garbage_collect_pass+0x0/0x560) 
from [<c0260130>] (jffs2_garbage_collect_thread+0xe4/0x120)
[42949425.280000] [<c026004c>] (jffs2_garbage_collect_thread+0x0/0x120) 
from [<c01e3614>] (do_exit+0x0/0x3e0)
[42949425.280000]  r6 = 00000000  r5 = 00000000  r4 = 00000000
[42949425.280000] Code: eb002f74 e59f0014 eb002f72 e3a03000 (e5833000)

-- 
Николай Виноградов
Системный администратор
ООО "НТЦ ПРОТЕЙ"
Россия, 194044, Санкт-Петербург
пр. Большой Сампсониевский д.60 лит.А
тел: (812)449-47-27(5182)

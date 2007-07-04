Received: from wa-out-1112.google.com ([209.85.146.182])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6Btd-0000JK-1a
	for linux-mtd@lists.infradead.org; Wed, 04 Jul 2007 16:56:24 -0400
Received: by wa-out-1112.google.com with SMTP id v33so2994546wah
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Jul 2007 13:56:19 -0700 (PDT)
Message-ID: <8bf247760707041356i67a6533uc6c513146a01365@mail.gmail.com>
Date: Thu, 5 Jul 2007 02:26:19 +0530
From: Ram <vshrirama@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: MTD/Nand crashing
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
  I have written a nand driver for micron nand device - MT29F1G16ABB (
A 16 bit 1Gbits nand device) - 128 MB.

I am able to store files and directories without any issues.

I have erased the JFFS2 partition. Booted Linux 2.6.19 out of NFS.
Mounted the JFFS2 partition. Creates some files, directories. unmount
it and repeating it again.

I repeat doing this 10 times. I do all of this in a test script.

At some point of time while doing this- My Linux kernel crashes.
My nand driver write is failing and it returns -5 to the upper filesystem layer
I dont know why jffs2_flush_wbuf crashes.

Does a unmount flush all the jffs2 information that is stored into RAM into
the Nand flash?.

Please Advice.

regards,
sriram


jffs2_flush_wbuf(): Write failed with -5
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
[00000000] *pgd=00000000
Internal error: Oops: 817 [#1]
Modules linked in: omap2_audio_aic31 omap2_audio omap2_audio_buf_intfc
tlv320aic31
CPU: 0
PC is at __jffs2_flush_wbuf+0x7d8/0xc24
LR is at 0xc1531800
pc : [<c012278c>]    lr : [<c1531800>]    Not tainted
sp : c03b5ca4  ip : c03b5c54  fp : c03b5d04
r10: c1978d00  r9 : 007e0000  r8 : 00000000
r7 : c1453c98  r6 : c18ed400  r5 : c1453c98  r4 : c05e65a4
r3 : 00000000  r2 : 00004d49  r1 : c1531800  r0 : 00806778
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: C5387F
Table: 80454000  DAC: 00000017
Process pdflush (pid: 42, stack limit = 0xc03b4248)
Stack: (0xc03b5ca4 to 0xc03b6000)
5ca0:          c03b5ccc c1531800 c1532424 000000d0 00806778 c1531800 c05e65a4
5cc0: c1978ccc fffffffb 00020000 00000088 00000000 c7c66fee c7c66fee c18ed400
5ce0: 0000000e c18ed51c 00000000 c18ed42c 00000000 c18ed400 c03b5d20 c03b5d08
5d00: c0122dc4 c0121fc0 00000000 0000000e 00000000 c03b5ecc c03b5d24 c011d9f8
5d20: c0122d9c c03b5d74 c1814c20 011a0779 c18ed4f4 00000030 24e2bdb9 00000006
5d40: c19dde55 c0450da4 c01a92a0 c01a8ebc c1ca6ab4 00020853 c1ca6a00 c1ca6ab4
5d60: 00020853 00000000 00000000 00000000 00000000 00000030 c1ca6a00 c1ca6ab4
5d80: c1fce080 00000040 a0000113 00000000 08000000 00000000 01980008 00000000
5da0: c03b5e34 c03b5dc8 c03b5db4 c003cfac c003cf14 00000000 c1ca6ab4 c03b5ddc
5dc0: c03b5dcc c01a3fb8 c003cf90 01980000 c03b5e10 c03b5de0 c01a640c c01a3f84
5de0: 00000000 c1ca6a00 00000000 012a0000 00000000 c1979e44 00000000 c03b5e9c
5e00: c1c6f000 c03b5e2c c03b5e14 c0198674 c01a6350 c1cb14e0 c18ed400 c1979e44
5e20: c03b5e74 c03b5e30 c012381c c01985e4 00000008 60000113 00001000 c18ed400
5e40: c1979e44 00000000 c03b5e9c c1c6f000 c03b5e74 c03b5e60 c003cfac c003cf14
5e60: 00000000 012c0000 c03b5ef0 c03b5e78 c011ff68 c022c298 c03b5e98 c1c6f000
5e80: c18ed4c0 c18ed4f4 fffffff7 00000000 c0060330 c002c2ec 00001000 012a0000
5ea0: 00000000 c18ed42c c18ed400 00000000 000001ce 00806800 00000000 fffffffc
5ec0: c03b5ef0 c03b5ed0 c0122cbc c011d734 c18ed400 00000000 c18ed848 c18ed83c
5ee0: c02881ac c03b5f08 c03b5ef4 c0120eec c0122be4 c18ed800 c03b4000 c03b5f2c
5f00: c03b5f0c c0080f28 c0120eb4 c03b5f94 c0287b5c c0286f18 c03b4000 c03b5f38
5f20: c03b5f80 c03b5f30 c0066a7c c0080e8c c03b5f3c c004cc48 00000000 00000000
5f40: c03b5f30 00000000 00000000 00000000 00000000 00000000 00000000 00000025
5f60: c03b5f94 c0287b5c c03b5f88 c03b4000 c0286f18 c03b5fc0 c03b5f84 c0067a20
5f80: c0066a30 00000001 c03ea820 c0066a24 00000000 c03b5f94 c03b5f94 0002063f
5fa0: 00000000 c03b4000 c0363f38 c0067908 00000001 c03b5ff4 c03b5fc4 c00534b0
5fc0: c0067914 00000001 ffffffff ffffffff 00000000 00000000 00000000 00000000
5fe0: 00000000 00000000 00000000 c03b5ff8 c0042ac0 c00533e0 72727563 5f746e65
Backtrace:
[<c0121fb4>] (__jffs2_flush_wbuf+0x0/0xc24) from [<c0122dc4>]
(jffs2_flush_wbuf_pad+0x34/0x60)
[<c0122d90>] (jffs2_flush_wbuf_pad+0x0/0x60) from [<c011d9f8>]
(jffs2_garbage_collect_pass+0x2d0/0x1890)
 r6 = 00000000  r5 = 0000000E  r4 = 00000000
[<c011d728>] (jffs2_garbage_collect_pass+0x0/0x1890) from [<c0122cbc>]
(jffs2_flush_wbuf_gc+0xe4/0x1b8)
[<c0122bd8>] (jffs2_flush_wbuf_gc+0x0/0x1b8) from [<c0120eec>]
(jffs2_write_super+0x44/0x48)
 r8 = C02881AC  r7 = C18ED83C  r6 = C18ED848  r5 = 00000000
 r4 = C18ED400
[<c0120ea8>] (jffs2_write_super+0x0/0x48) from [<c0080f28>]
(sync_supers+0xa8/0x100)
 r5 = C03B4000  r4 = C18ED800
[<c0080e80>] (sync_supers+0x0/0x100) from [<c0066a7c>] (wb_kupdate+0x58/0x140)
 r8 = C03B5F38  r7 = C03B4000  r6 = C0286F18  r5 = C0287B5C
 r4 = C03B5F94
[<c0066a24>] (wb_kupdate+0x0/0x140) from [<c0067a20>] (pdflush+0x118/0x1d4)
 r8 = C0286F18  r7 = C03B4000  r6 = C03B5F88  r5 = C0287B5C
 r4 = C03B5F94
[<c0067908>] (pdflush+0x0/0x1d4) from [<c00534b0>] (kthread+0xdc/0x10c)
 r8 = 00000001  r7 = C0067908  r6 = C0363F38  r5 = C03B4000
 r4 = 00000000
[<c00533d4>] (kthread+0x0/0x10c) from [<c0042ac0>] (do_exit+0x0/0x77c)
Code: e59f3430 e1520003 13520000 13a03000 (15833000)
 BUG: warning at kernel/exit.c:859/do_exit()

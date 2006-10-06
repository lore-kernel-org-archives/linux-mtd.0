Received: from web213.biz.mail.re2.yahoo.com ([68.142.225.200])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GVuue-0008QU-Jc
	for linux-mtd@lists.infradead.org; Fri, 06 Oct 2006 14:59:19 -0400
Message-ID: <20061006185228.14625.qmail@web213.biz.mail.re2.yahoo.com>
Date: Fri, 6 Oct 2006 11:52:28 -0700 (PDT)
From: z l <zql@glomationinc.com>
Subject: Jffs2 Oops
To: linux-mtd@lists.infradead.org
In-Reply-To: <20061006163319.GA15689@flint.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While testing NAND FLASH by doing heavy copying, the
following error occured,

jffs2_flush_wbuf(): Write failed with -5
kernel BUG at fs/jffs2/wbuf.c:151!
Unable to handle kernel NULL pointer dereference at
virtual address 00000000
pgd = c44e4000
[00000000] *pgd=054a4031, *pte=00000000,
*ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at __bug+0x40/0x54
LR is at _spin_unlock_irqrestore+0x14/0x1c
pc : [<c0024c18>]    lr : [<c020b7fc>]    Not tainted
sp : c5559b58  ip : 00000000  fp : c5559b68
r10: c132b0b8  r9 : 00000000  r8 : c132b0b8
r7 : 06cc0044  r6 : c136a740  r5 : c132b0b8  r4 :
00000000
r3 : 00000000  r2 : c0256f58  r1 : c0228ca8  r0 :
00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment
user
Control: C000717F  Table: 044E4000  DAC: 00000015
Process cp (pid: 238, stack limit = 0xc5558250)
Stack: (0xc5559b58 to 0xc555a000)
9b40:                                                 
     00000001 c5559b88
9b60: c5559b6c c010b00c c0024be8 c5559b88 00000001
000009d6 c136a740 c5559bf0
9b80: c5559b8c c010b310 c010af90 c5559bbc c0334124
c01249b4 c5559bd0 c136a850
9ba0: c020b570 c020b850 00000000 00000001 fffffffb
c5559bc0 06cc0000 00000000
9bc0: 000007bc c136a740 00000800 000009d6 c136a740
06cc0044 00000000 c401dd60
9be0: c16f6000 c5559c40 c5559bf4 c010c244 c010b0d8
c00778e8 c554d260 c136a8dc
9c00: 00000002 06cc0044 00000044 00000002 c5559c6c
000007bc 06cc0000 00000000
9c20: 06cc0000 c136a740 c0391590 c401dd60 c429ee04
c5559ca4 c5559c48 c0103bc8
9c40: c010c030 06cc0000 00000000 c5559c60 0000650d
00000002 00000000 c020b814
9c60: 00000000 00000000 00000000 c0391590 00000044
c16f6000 000009d6 c5559cd0
9c80: 00000006 c0391590 c429ee04 c136a740 0002a000
00000000 c5559cfc c5559ca8
9ca0: c010435c c0103a98 000009d6 00000003 00000000
00000000 c1455000 000009d6
9cc0: 00001000 c16f6000 00020000 2fe2c5a0 2fe2c5a0
c429ee04 00000000 c136a740
9ce0: c0391590 c429ee40 00000000 c02e2aa0 c5559d48
c5559d00 c00ff0f4 c0104164
9d00: 0002a000 00001000 c5559d14 c5559d18 00001000
00000000 00001710 00001710
9d20: 00001000 c02e2aa0 00000000 00001000 c02e2aa0
c02aa0a4 00000000 c5559de4
9d40: c5559d4c c005e4ac c00fefd0 00001000 bea02aa0
c429ee40 c02103d4 c429ef18
9d60: c134e938 00000001 c5559e74 00000000 00000000
c5559f1c b2559da0 00000001
9d80: 00000000 c02e2aa0 c4639cfc 00000000 00001710
01cc04ee c5559dc8 c5559dc4
9da0: c5559dac c00402f4 c004025c c429ee40 00000000
c5559dc8 c5559de8 0002a000
9dc0: 00000000 c5559e18 00000000 0002a000 00000000
c134e938 c5559e70 c5559dec
9de0: c005ede0 c005e0d4 0002a000 00000000 c5559f78
00001000 00000000 00000000
9e00: 00001000 c5559f78 c5559f1c c5559e74 00000001
00001000 0002a000 00000000
9e20: c0357b3c 00000001 c5559eb0 c5559e88 c5559e84
c5559e40 c005f440 c005cc68
9e40: c5559e4c c005d140 c5559eb4 c12c50c0 c5559e74
00000000 00000000 c5558000
9e60: 001b8658 c5559f0c c5559e74 c005ee90 c005e948
c5559f78 c5559ea4 00000000
9e80: 00000001 ffffffff c134e938 00000000 00000000
00000000 00000000 c12c50c0
9ea0: 00000000 00000000 c0053860 c12c50c0 c00500a4
c5559eb4 c5559eb4 c0053820
9ec0: 22222222 22222222 22222222 22222222 22222222
c429eec0 c429ef18 c5559f78
9ee0: c429ee40 c134e938 c5558000 c429eec0 c429ef18
c5559f78 c429ee40 c134e938
9f00: c5559f4c c5559f10 c005efd8 c005ee20 c13f6d00
c5559f30 c5559f78 bea02aa0
9f20: 00001000 c134e938 bea02aa0 c5559f78 00001000
c5558000 c5558000 001b8658
9f40: c5559f74 c5559f50 c007d3e4 c005efa0 00000000
c134e958 c134e938 c5559f78
9f60: 0002a000 00000000 c5559fa4 c5559f78 c007d568
c007d330 0002a000 00000000
9f80: 00000000 00001000 00001000 bea02aa0 00000004
c0020f64 00000000 c5559fa8
9fa0: c0020dc0 c007d52c 00001000 00001000 00000006
bea02aa0 00001000 fffd6000
9fc0: 00001000 00001000 bea02aa0 00000006 00000005
00000012 001b8658 00000000
9fe0: 00000001 bea02a70 0005a808 0007c2f8 20000010
00000006 81009200 00250045
Backtrace:
[<c0024bd8>] (__bug+0x0/0x54) from [<c010b00c>]
(jffs2_block_refile+0x8c/0x148)
 r4 = 00000001
[<c010af80>] (jffs2_block_refile+0x0/0x148) from
[<c010b310>] (__jffs2_flush_wbu
f+0x248/0xcf4)
 r6 = C136A740  r5 = 000009D6  r4 = 00000001
[<c010b0c8>] (__jffs2_flush_wbuf+0x0/0xcf4) from
[<c010c244>] (jffs2_flash_write
v+0x228/0x458)
[<c010c020>] (jffs2_flash_writev+0x4/0x458) from
[<c0103bc8>] (jffs2_write_dnode
+0x140/0x36c)
[<c0103a88>] (jffs2_write_dnode+0x0/0x36c) from
[<c010435c>] (jffs2_write_inode_
range+0x208/0x38c)
[<c0104154>] (jffs2_write_inode_range+0x0/0x38c) from
[<c00ff0f4>] (jffs2_commit
_write+0x134/0x274)
[<c00fefc0>] (jffs2_commit_write+0x0/0x274) from
[<c005e4ac>] (generic_file_buff
ered_write+0x3ec/0x5f0)
[<c005e0c4>] (generic_file_buffered_write+0x4/0x5f0)
from [<c005ede0>] (__generi
c_file_aio_write_nolock+0x4a8/0x4d8)
[<c005e938>]
(__generic_file_aio_write_nolock+0x0/0x4d8) from
[<c005ee90>] (__ge
neric_file_write_nolock+0x80/0xac)
[<c005ee10>] (__generic_file_write_nolock+0x0/0xac)
from [<c005efd8>] (generic_f
ile_write+0x48/0xc8)
 r8 = C134E938  r7 = C429EE40  r6 = C5559F78  r5 =
C429EF18
 r4 = C429EEC0
[<c005ef90>] (generic_file_write+0x0/0xc8) from
[<c007d3e4>] (vfs_write+0xc4/0x1
88)
[<c007d320>] (vfs_write+0x0/0x188) from [<c007d568>]
(sys_write+0x4c/0x74)
 r8 = 00000000  r7 = 0002A000  r6 = C5559F78  r5 =
C134E938
 r4 = C134E958
[<c007d51c>] (sys_write+0x0/0x74) from [<c0020dc0>]
(ret_fast_syscall+0x0/0x2c)
 r8 = C0020F64  r7 = 00000004  r6 = BEA02AA0  r5 =
00001000
 r4 = 00001000
Code: 1b005cba e59f0014 eb005cb8 e3a03000 (e5833000)
 Segmentation fault
~ # <0>BUG: spinlock cpu recursion on CPU#0,
pdflush/55
 lock: c136a850, .magic: dead4ead, .owner:
kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
kkkkkkkkkkkkkkkkkkkkkkkkkk¥kkkk/1802201963,
.owner_cpu: 0
[<c0024d88>] (dump_stack+0x0/0x14) from [<c01247d8>]
(spin_bug+0x90/0xa4)
[<c0124748>] (spin_bug+0x0/0xa4) from [<c0124848>]
(_raw_spin_lock+0x5c/0x168)
 r5 = C136A850  r4 = C136A850
[<c01247ec>] (_raw_spin_lock+0x0/0x168) from
[<c020b6a4>] (_spin_lock+0x10/0x14)

[<c020b694>] (_spin_lock+0x0/0x14) from [<c0108fb8>]
(jffs2_garbage_collect_trig
ger+0x1c/0x50)
[<c0108f9c>] (jffs2_garbage_collect_trigger+0x0/0x50)
from [<c0109f58>] (jffs2_w
rite_super+0x2c/0x48)
 r5 = 00000000  r4 = C136A740
[<c0109f2c>] (jffs2_write_super+0x0/0x48) from
[<c0084854>] (sync_supers+0xb4/0x
118)
 r5 = C5550000  r4 = C136A534
[<c00847a0>] (sync_supers+0x0/0x118) from [<c00621f4>]
(wb_kupdate+0x58/0x140)
 r8 = C5551F38  r7 = C5550000  r6 = C025803C  r5 =
C0259204
 r4 = C5551F94
[<c006219c>] (wb_kupdate+0x0/0x140) from [<c0062ff0>]
(pdflush+0x120/0x1ec)
 r8 = C025803C  r7 = C5550000  r6 = C5551F88  r5 =
C0259204
 r4 = C5551F94
[<c0062ed0>] (pdflush+0x0/0x1ec) from [<c004fbc4>]
(kthread+0xec/0x11c)
 r8 = 00000001  r7 = C0062ED0  r6 = C0377F18  r5 =
C5550000
 r4 = 00000000
[<c004fad8>] (kthread+0x0/0x11c) from [<c003d77c>]
(do_exit+0x0/0x83c)
BUG: spinlock lockup on CPU#0, pdflush/55, c136a850
[<c0024d88>] (dump_stack+0x0/0x14) from [<c012491c>]
(_raw_spin_lock+0x130/0x168
)
[<c01247ec>] (_raw_spin_lock+0x0/0x168) from
[<c020b6a4>] (_spin_lock+0x10/0x14)

[<c020b694>] (_spin_lock+0x0/0x14) from [<c0108fb8>]
(jffs2_garbage_collect_trig
ger+0x1c/0x50)
[<c0108f9c>] (jffs2_garbage_collect_trigger+0x0/0x50)
from [<c0109f58>] (jffs2_w
rite_super+0x2c/0x48)
 r5 = 00000000  r4 = C136A740
[<c0109f2c>] (jffs2_write_super+0x0/0x48) from
[<c0084854>] (sync_supers+0xb4/0x
118)
 r5 = C5550000  r4 = C136A534
[<c00847a0>] (sync_supers+0x0/0x118) from [<c00621f4>]
(wb_kupdate+0x58/0x140)
 r8 = C5551F38  r7 = C5550000  r6 = C025803C  r5 =
C0259204
 r4 = C5551F94
[<c006219c>] (wb_kupdate+0x0/0x140) from [<c0062ff0>]
(pdflush+0x120/0x1ec)
 r8 = C025803C  r7 = C5550000  r6 = C5551F88  r5 =
C0259204
 r4 = C5551F94
[<c0062ed0>] (pdflush+0x0/0x1ec) from [<c004fbc4>]
(kthread+0xec/0x11c)
 r8 = 00000001  r7 = C0062ED0  r6 = C0377F18  r5 =
C5550000
 r4 = 00000000
[<c004fad8>] (kthread+0x0/0x11c) from [<c003d77c>]
(do_exit+0x0/0x83c)
BUG: soft lockup detected on CPU#0!
[<c0024d88>] (dump_stack+0x0/0x14) from [<c0059cfc>]
(softlockup_tick+0xa0/0xcc)

[<c0059c5c>] (softlockup_tick+0x0/0xcc) from
[<c0044bb0>] (run_local_timers+0x18
/0x1c)
 r7 = 00000004  r6 = 00000000  r5 = 00000000  r4 =
C12AF0A0
[<c0044b98>] (run_local_timers+0x0/0x1c) from
[<c0044bf8>] (update_process_times
+0x44/0x6c)
[<c0044bb4>] (update_process_times+0x0/0x6c) from
[<c0024bbc>] (timer_tick+0xc8/
0xe4)
 r5 = C5551E58  r4 = C5551E58
[<c0024af4>] (timer_tick+0x0/0xe4) from [<c0029dc8>]
(ep93xx_timer_interrupt+0x6
8/0xa8)
 r6 = 00000000  r5 = C5551E58  r4 = C0258000
[<c0029d60>] (ep93xx_timer_interrupt+0x0/0xa8) from
[<c005a1f0>] (handle_IRQ_eve
nt+0x4c/0x88)
 r5 = 00000000  r4 = C0255F48
[<c005a1a4>] (handle_IRQ_event+0x0/0x88) from
[<c005b3f4>] (handle_level_irq+0xd
4/0x13c)
 r8 = C5551E58  r7 = C0252148  r6 = C0255F48  r5 =
00000004
 r4 = C0252120
[<c005b320>] (handle_level_irq+0x0/0x13c) from
[<c00216c8>] (asm_do_IRQ+0x40/0x5
0)
 r8 = 00000000  r7 = C5550000  r6 = 40000000  r5 =
FEFB0001
 r4 = FFFFFFFF
[<c0021688>] (asm_do_IRQ+0x0/0x50) from [<c00209a4>]
(__irq_svc+0x24/0xc0)
[<c01247ec>] (_raw_spin_lock+0x0/0x168) from
[<c020b6a4>] (_spin_lock+0x10/0x14)

[<c020b694>] (_spin_lock+0x0/0x14) from [<c0108fb8>]
(jffs2_garbage_collect_trig
ger+0x1c/0x50)
[<c0108f9c>] (jffs2_garbage_collect_trigger+0x0/0x50)
from [<c0109f58>] (jffs2_w
rite_super+0x2c/0x48)
 r5 = 00000000  r4 = C136A740
[<c0109f2c>] (jffs2_write_super+0x0/0x48) from
[<c0084854>] (sync_supers+0xb4/0x
118)
 r5 = C5550000  r4 = C136A534
[<c00847a0>] (sync_supers+0x0/0x118) from [<c00621f4>]
(wb_kupdate+0x58/0x140)
 r8 = C5551F38  r7 = C5550000  r6 = C025803C  r5 =
C0259204
 r4 = C5551F94
[<c006219c>] (wb_kupdate+0x0/0x140) from [<c0062ff0>]
(pdflush+0x120/0x1ec)
 r8 = C025803C  r7 = C5550000  r6 = C5551F88  r5 =
C0259204
 r4 = C5551F94
[<c0062ed0>] (pdflush+0x0/0x1ec) from [<c004fbc4>]
(kthread+0xec/0x11c)
 r8 = 00000001  r7 = C0062ED0  r6 = C0377F18  r5 =
C5550000
 r4 = 00000000
[<c004fad8>] (kthread+0x0/0x11c) from [<c003d77c>]
(do_exit+0x0/0x83c)


kernel version 2.6.18
processor Cirrus Logic EP9302

zl

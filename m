Received: from wa-out-1112.google.com ([209.85.146.177])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8KBy-0005cv-QR
	for linux-mtd@lists.infradead.org; Tue, 10 Jul 2007 14:12:08 -0400
Received: by wa-out-1112.google.com with SMTP id v33so1748232wah
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Jul 2007 11:12:05 -0700 (PDT)
Message-ID: <8bf247760707101112w380c216arbff1a355b584d033@mail.gmail.com>
Date: Tue, 10 Jul 2007 23:42:04 +0530
From: Ram <vshrirama@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Vague JFFS2 crashes
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
  Am trying to write a nand driver for my board. I have a large page
size micron nand flash.
  Have been experiencing some vagues issues.

  Running a simple test script. which just copies a file with certain
pattern to 100 different files. The files are then checked for data
correctness.

I run this test a number 100's of times

I do see random crashes. Howver off late i have noticed that the JFFS2
data structure is getting corrupted. Just an example.

While running the test - I login to to my target from some other
machine and do a ls -Rl.

as soon a i do this - I get a crash. I dont know if this is a SDRAM
problem or Nand Driver problem or JFFS2 problem. Am using Linux
2.6.19.

Most of the time - i get errors relating to "jffs2_flush_wbuf(): Write
failed with -5"
This means the verify function has failed.

Crash Report Attached:-

Please Advice.

Regards,
sriram



jffs2_flush_wbuf(): Write failed with -5
Recovery of wbuf failed due to a second write error
Write of 207 bytes at 0x02de776c failed. returned -5, retlen 0
Not marking the space at 0x02de776c as dirty because the flash driver
returned retlen zero
Totlen for ref at c1dbe6d4 (0x02de776c-0x02e00000) miscalculated as
0x94 instead of 18894
next c1dbe6e0 (0x02de7800-0x02e00094)
jeb->wasted_size 18894, dirty_size 0, used_size 776c, free_size 0
BUG: warning at fs/jffs2/nodelist.c:1219/__jffs2_ref_totlen()
JFFS2 error: (2836) jffs2_link_node_ref: Adding new ref c1dbe6e0 at
(0x02de7800-0x02de7800) not immediately after previous
(0x02de776c-0x02e00000)
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c17cc000
[00000000] *pgd=81a83031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in: omap_ad5232dpot cmemk(P) dsplinkk(PF) omap24xxcam
omap24xxlib sensor_vs6524 vs6524lib video_buf omap2_audio_aic31
omap2_audio omap2_audio_buf_intfc tlv320aic31
CPU: 0
PC is at jffs2_link_node_ref+0x118/0x1e8
LR is at 0x1
pc : [<c0116524>]    lr : [<00000001>]    Tainted: PF
sp : c15a5b2c  ip : 00000000  fp : c15a5b5c
r10: 00000000  r9 : 00000001  r8 : 00000000
r7 : 00000000  r6 : c0389c00  r5 : c035ca8c  r4 : c1dbe6e0
r3 : 00000000  r2 : 00000000  r1 : 00001bbc  r0 : 00000096
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C5387F
Table: 817CC000  DAC: 00000015
Process cp (pid: 2836, stack limit = 0xc15a4248)
Stack: (0xc15a5b2c to 0xc15a6000)
5b20:                            02de7800 02de7800 02de776c 02e00000 00000000
5b40: 00860000 c0389c00 00000800 c035ca8c c15a5bc0 c15a5b60 c0121908 c0116418
5b60: 00000000 c1ca1800 c02d4da0 0000213c c2803140 c2800000 00000005 00000001
5b80: 00000000 c15a5c90 c15a5bc0 00000800 00860000 c15a5bb0 00020000 00860000
5ba0: c0389c00 00860000 00000000 c1019b78 c089156c c15a5c10 c15a5bc4 c0121dc4
5bc0: c0120e74 00000000 c027b100 c0389d1c c15a5bdc 00860000 00000000 00000002
5be0: c15a5c3c c15a5c90 00860000 00000000 00860000 c0389c00 c1ac04f8 c1019b78
5c00: c089156c c15a5c74 c15a5c18 c0119d30 c0121ce4 00860000 00000000 c15a5c30
5c20: 0000a988 00000002 00000000 c01133bc c0122c00 00000000 00000000 c1ac04f8
5c40: 00000044 c101a000 0000008b c15a5ca0 00000006 c1ac04f8 c089156c c0389c00
5c60: 000ff000 00000000 c15a5ccc c15a5c78 c011a49c c0119c04 0000008b 00000003
5c80: 00000001 00000000 c1668000 0000008b 00001000 c101a000 00020000 5855172e
5ca0: 5855172e 00000000 c1ac04f8 c0891598 c0312d00 00000000 00000000 00001000
5cc0: c15a5d18 c15a5cd0 c01155a0 c011a2a4 000ff000 00001000 c15a5ce4 c0389c00
5ce0: c089156c 00000000 00000824 00000824 00001000 c02d28b8 00000000 00001000
5d00: c0312d00 00000000 00000000 c15a5db4 c15a5d1c c0062078 c011547c 00001000
5d20: beccfa78 c0891598 c021f660 c089163c c1a3fa40 00000001 c15a5eac 00000000
5d40: 00001000 c15a5ea4 765a5d54 00000002 00000000 c03180a0 c0312d00 c1a3fd40
5d60: 00000824 258d0980 c15a5d98 c15a5d94 c15a5d7c c0043d80 c0043ce4 c0891598
5d80: c15a5d98 00000000 c15a5db8 000fe000 00000000 00100000 00000000 c15a5dfc
5da0: 00000000 c15a5e00 c15a5e58 c15a5dbc c0062a84 c0061ca4 000ff000 00000000
5dc0: c15a5ef4 00001000 00001000 00100000 00000000 000fe000 00000000 00000000
5de0: 00002000 c089163c c1a3fa40 c15a5ef4 c15a5ea4 c15a5eac 00000001 00002000
5e00: 000fe000 00000000 c0056c14 22222222 22222222 22222222 22222222 22222222
5e20: c15a5eac c0891598 000fe000 00000000 c15a5eac c0891598 000fe000 00000000
5e40: c15a5ef4 c15a5ea4 c0891604 c15a5e98 c15a5e5c c0062b34 c006250c c15a5ea4
5e60: 00002000 c089163c c1a3fa40 00000001 c15a5eac c15a5ef4 c15a5f78 c1a3fa40
5e80: c15a5ea4 c15a4000 00072478 c15a5f50 c15a5ea0 c007e2fc c0062ac4 000fe000
5ea0: 00000000 beccea78 00002000 c00675d4 c15a5ebc 00000000 00000001 ffffffff
5ec0: c1a3fa40 00000000 00000000 00000000 00000000 c1ccc040 00000000 00000000
5ee0: c15a5f44 c1ccc040 c00527bc c15a5eec c15a5eec 000fe000 00000000 c15a5f08
5f00: c00283f8 c002810c 00000000 00002000 c17cc000 00000000 00000002 ffffffeb
5f20: 00000002 c1ccc040 c15a5f44 c15a5f38 beccea78 c1a3fa40 c007e23c c15a4000
5f40: c15a5f78 c15a5f74 c15a5f54 c007e40c c007e248 c1a3fa60 c1a3fa40 c15a5f78
5f60: 000fe000 00000000 c15a5fa4 c15a5f78 c007e538 c007e358 000fe000 00000000
5f80: 00000000 00002000 00002000 beccea78 00000004 c0022ee4 00000000 c15a5fa8
5fa0: c0022d40 c007e4f8 00002000 00002000 00000004 beccea78 00002000 fff02000
5fc0: 00002000 00002000 beccea78 00000004 00000003 00000000 00072478 00000000
5fe0: 00000000 beccea4c 0000265c 401af510 60000010 00000004 dfdfdfdf dfdfdfdf
Backtrace:
[<c011640c>] (jffs2_link_node_ref+0x0/0x1e8) from [<c0121908>]
(__jffs2_flush_wbuf+0xaa0/0xc24)
 r8 = C035CA8C  r7 = 00000800  r6 = C0389C00  r5 = 00860000
 r4 = 00000000
[<c0120e68>] (__jffs2_flush_wbuf+0x0/0xc24) from [<c0121dc4>]
(jffs2_flash_writev+0xf0/0x438)
[<c0121cd8>] (jffs2_flash_writev+0x4/0x438) from [<c0119d30>]
(jffs2_write_dnode+0x138/0x358)
[<c0119bf8>] (jffs2_write_dnode+0x0/0x358) from [<c011a49c>]
(jffs2_write_inode_range+0x204/0x37c)
[<c011a298>] (jffs2_write_inode_range+0x0/0x37c) from [<c01155a0>]
(jffs2_commit_write+0x130/0x254)
[<c0115470>] (jffs2_commit_write+0x0/0x254) from [<c0062078>]
(generic_file_buffered_write+0x3e4/0x5e4)
[<c0061c98>] (generic_file_buffered_write+0x4/0x5e4) from [<c0062a84>]
(__generic_file_aio_write_nolock+0x584/0x5b4)
[<c0062500>] (__generic_file_aio_write_nolock+0x0/0x5b4) from
[<c0062b34>] (generic_file_aio_write+0x80/0xf4)
[<c0062ab8>] (generic_file_aio_write+0x4/0xf4) from [<c007e2fc>]
(do_sync_write+0xc0/0x110)
[<c007e23c>] (do_sync_write+0x0/0x110) from [<c007e40c>] (vfs_write+0xc0/0x12c)
 r8 = C15A5F78  r7 = C15A4000  r6 = C007E23C  r5 = C1A3FA40
 r4 = BECCEA78
[<c007e34c>] (vfs_write+0x0/0x12c) from [<c007e538>] (sys_write+0x4c/0x74)
 r8 = 00000000  r7 = 000FE000  r6 = C15A5F78  r5 = C1A3FA40
 r4 = C1A3FA60
[<c007e4ec>] (sys_write+0x0/0x74) from [<c0022d40>] (ret_fast_syscall+0x0/0x2c)
 r8 = C0022EE4  r7 = 00000004  r6 = BECCEA78  r5 = 00002000
 r4 = 00002000
Code: e59f20d4 e58dc00c ebfca74f e3a03000 (e5833000)

Received: from lennier.cc.vt.edu ([198.82.162.213])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKE4S-0004zB-Qk
	for linux-mtd@lists.infradead.org; Tue, 06 Jan 2009 15:42:21 +0000
Received: from zidane.cc.vt.edu (IDENT:mirapoint@zidane.cc.vt.edu
	[198.82.163.227])
	by lennier.cc.vt.edu (8.13.8/8.13.8) with ESMTP id n06FfmsA023762
	for <linux-mtd@lists.infradead.org>; Tue, 6 Jan 2009 10:41:50 -0500
Received: from imp-b07.cc.vt.edu (localhost.localdomain [127.0.0.1])
	by imp-b07.cc.vt.edu (8.13.1/8.13.1) with ESMTP id n06FflGN005944
	for <linux-mtd@lists.infradead.org>; Tue, 6 Jan 2009 10:41:47 -0500
Received: (from apache@localhost)
	by imp-b07.cc.vt.edu (8.13.1/8.13.1/Submit) id n06Fflg8005943
	for linux-mtd@lists.infradead.org; Tue, 6 Jan 2009 10:41:47 -0500
Message-ID: <1231256507.49637bbb174b6@webmail.vt.edu>
Date: Tue,  6 Jan 2009 10:41:47 -0500
From: Matt Witherspoon <spoon@vt.edu>
To: linux-mtd@lists.infradead.org
Subject: BUG in jffs2 with MTD map using cached mapping
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

I appear to have hit a regression in jffs2 when using a map driver that uses a
cached mapping.

I am using a PXA270 board that is very similar to the Mainstone PXA270
board.
Previously in 2.6.16, I was using the mainstone-flash MTD map with JFFS2. I
never had any problems. Upon upgrading to the latest kernel, I'm now
using the pxa2xx-flash map. However, now simply copying a file on the JFFS2
partition results in a BUG in the jffs2 filesystem code (see end of mail for
the console dump).
I was a bit surprised to find that pxa2xx-flash was the only map driver that
used the cached mapping support. Disabling this support (commenting out the
info->map.cached and info->map.inval_cache declarations in
pxa2xx_flash_probe()) eliminated the problem but significantly slowed down the
device.

I performed a bisection and the offending commit is
205c109a7a96d9a3d8ffe64c4068b70811fef5e8. Before this commit, neither the BUG
nor the node CRC failure occured.

One notable difference between my board and Mainstone is that my flash chip is
using the 0002 command set.

I'm stumped at this point... Any suggestions on where to dig further?

Thanks -Matt

CFI features:
Probing mainboard-flash at physical address 0x00000000 (16-bit bankwidth)
mainboard-flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
  Silicon revision: 10
  Address sensitive unlock: Required
  Erase Suspend: Read/write
  Block protection: 1 sectors per group
  Temporary block unprotect: Not supported
  Block protect/unprotect scheme: 8
  Number of simultaneous operations: 0
  Burst mode: Not supported
  Page mode: 8 word page
  Vpp Supply Minimum Program/Erase Voltage: 11.5 V
  Vpp Supply Maximum Program/Erase Voltage: 12.5 V
  Top/Bottom Boot Block: Uniform, Top WP
mainboard-flash: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.

BUG:
[root@ace mew]$cp /lib/libc-2.7.so .
Node CRC d119bd88 != calculated CRC db1e2131 for node at 037184d8
kernel BUG at fs/jffs2/file.c:251!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c3ae4000
[00000000] *pgd=a3b04031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0    Not tainted  (2.6.28 #2)
PC is at __bug+0x20/0x2c
LR is at release_console_sem+0x1a8/0x228
pc : [<c0028c74>]    lr : [<c003d10c>]    psr: 60000013
sp : c3af3cd8  ip : c3af3c10  fp : c3af3ce4
r10: 00000000  r9 : 00001000  r8 : c041f020
r7 : 00000000  r6 : c342d9c0  r5 : 00001000  r4 : 00001000
r3 : 00000000  r2 : 60000013  r1 : 00000008  r0 : 00000026
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0000397f  Table: a3ae4000  DAC: 00000015
Process cp (pid: 923, stack limit = 0xc3af2270)
Stack: (0xc3af3cd8 to 0xc3af4000)
3cc0:                                                       c3af3d3c c3af3ce8
3ce0: c0103d08 c0028c60 0011c000 00000000 c3af3d0c 00001000 0011d000 00000000
3d00: c3af2000 c39ef000 00001000 00000000 00000001 00001000 00001000 0011d000
3d20: 00000000 c3af2000 00001000 00000000 c3af3dbc c3af3d40 c0069bc0 c0103af8
3d40: 00001000 00001000 c041f020 c3af3dbc c3af3d94 c3af3e90 c387ed40 c342da58
3d60: c02d3d2c c342d9c0 00001000 00000000 c02d3d2c c342da58 c3af3f20 00000001
3d80: 00001000 00001000 c3af3dbc c041f020 c009d58c 00002000 c342d9c0 0011c000
3da0: 00000000 00000000 c342da58 c387ed40 c3af3e44 c3af3dc0 c006a190 c0069a3c
3dc0: 0011c000 00000000 c3af3ee0 00002000 00000000 c00a2140 c3408248 c3af3ee0
3de0: c3af3f20 c3af3e90 c3af3e84 c3af3df8 c006a78c c009d5cc 00002000 00000001
3e00: 00002000 00000000 c3880c80 00080001 c3af3f20 00002000 c3af3ee0 c342da2c
3e20: c3af3e90 00000001 c342d9c0 c3af3f20 c342da58 c387ed40 c3af3e84 c3af3e48
3e40: c006ae1c c0069fb8 00000000 befbc998 00000000 0011c000 c0079124 c3af3e90
3e60: c3af3f20 fffffdee c387ed40 c3af3f70 c3af2000 00000000 c3af3f4c c3af3e88
3e80: c008bd9c c006ada4 0011c000 00000000 c3af63e8 c3880c80 00000000 00000001
3ea0: ffffffff c387ed40 00000000 00000000 00000000 00000000 c3880c80 00000000
3ec0: 00000000 00000000 c3af3fb0 c3880c80 c0051f8c c3af3ed4 c3af3ed4 00000817
3ee0: 0011c000 00000000 befba998 befba984 c3af3fac c3af3f00 00002000 c002b6d8
3f00: c3b04978 c0096cdc 0000048e c39db660 c3af6440 c3880c80 c3af3f34 c3af3f28
3f20: befba998 00002000 c3af3f7c 00002000 c387ed40 befba998 c3af3f70 befba998
3f40: c3af3f6c c3af3f50 c008c6f4 c008bce4 0011c000 00000000 c387ed40 00002000
3f60: c3af3fa4 c3af3f70 c008c81c c008c650 0011c000 00000000 c002b9f4 00000000
3f80: ffffffff 00002000 00002000 befba998 00000004 c00250c8 00000000 c3af3fa8
3fa0: c0024f20 c008c7e4 00002000 00002000 00000004 befba998 00002000 00000001
3fc0: 00002000 00002000 befba998 00000004 00000004 befba998 00000003 00000002
3fe0: 00000004 befba968 0005ed88 401cefac 60000010 00000004 00000000 00000000
Backtrace:
[<c0028c54>] (__bug+0x0/0x2c) from [<c0103d08>] (jffs2_write_end+0x21c/0x2f4)
[<c0103aec>] (jffs2_write_end+0x0/0x2f4) from [<c0069bc0>] (generic_file_buffere
d_write+0x190/0x310)
[<c0069a30>] (generic_file_buffered_write+0x0/0x310) from [<c006a190>] (__generi
c_file_aio_write_nolock+0x1e4/0x4a4)
[<c0069fac>] (__generic_file_aio_write_nolock+0x0/0x4a4) from [<c006ae1c>] (gene
ric_file_aio_write+0x84/0xf8)
[<c006ad98>] (generic_file_aio_write+0x0/0xf8) from [<c008bd9c>] (do_sync_write+
0xc4/0x108)
[<c008bcd8>] (do_sync_write+0x0/0x108) from [<c008c6f4>] (vfs_write+0xb0/0xfc)
 r8:befba998 r7:c3af3f70 r6:befba998 r5:c387ed40 r4:00002000
[<c008c644>] (vfs_write+0x0/0xfc) from [<c008c81c>] (sys_write+0x44/0x74)
 r7:00002000 r6:c387ed40 r5:00000000 r4:0011c000
[<c008c7d8>] (sys_write+0x0/0x74) from [<c0024f20>] (ret_fast_syscall+0x0/0x2c)
 r8:c00250c8 r7:00000004 r6:befba998 r5:00002000 r4:00002000
Code: e1a01000 e59f000c eb0a126d e3a03000 (e5833000)
---[ end trace 44d1b5b99b5658ab ]---
Segmentation fault
[root@ace mew]$

Received: from pat.uio.no ([129.240.10.6])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FdnrL-00071w-Sl
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 08:32:15 -0400
Received: from mail-mx5.uio.no ([129.240.10.46])
	by pat.uio.no with esmtp (Exim 4.43) id 1FdnrI-0004we-SF
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 14:32:05 +0200
Received: from grid.uio.no ([129.240.86.18] helo=AAAA)
	by mail-mx5.uio.no with smtp (Exim 4.43) id 1FdnrG-0003zB-E1
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 14:32:02 +0200
Message-ID: <018301c6742d$c17ad200$0100a8c0@AAAA>
From: "Aleksandr Konstantinov" <aleksandr.konstantinov@fys.uio.no>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 10 May 2006 15:32:08 +0300
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="windows-1257";
	reply-type=original
Content-Transfer-Encoding: 7bit
Subject: Hanging rm
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  Hello,

 I have AT91RM9200 CPU on custom board with JFFS2 root filesystem and kernel 
2.6.12.3 with JFFS debugging enabled.
If I try to remove file 'rm' hangs with 0 CPU usage. There are no messages 
from JFFS2 printed.
If I press Ctrl-C message below is printed. Could You please help me?


A.K.



Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0f5c000
[00000000] *pgd=20f4e031, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#1]
CPU: 0
PC is at __wake_up_common+0x20/0x7c
LR is at __init_begin+0x3fff8000/0x2c
pc : [<c002d014>]    lr : [<00000000>]    Not tainted
sp : c0d71d70  ip : c0d71d9c  fp : c0d71d98
r10: 00000003  r9 : 00000000  r8 : c02f9e3c
r7 : c02f9e3c  r6 : c0d70000  r5 : 00000001  r4 : 20000013
r3 : 00000000  r2 : 00000001  r1 : 00000003  r0 : c02f9e3c
Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  Segment user
Control: C000717F  Table: 20F5C000  DAC: 00000015
Process rm (pid: 40, stack limit = 0xc0d70194)
Stack: (0xc0d71d70 to 0xc0d72000)
1d60:                                     20000013 c02f9e34 c0d70000 
c0c63040
1d80: c02f9e3c fffffffc c0d71db4 c0d71db0 c0d71d9c c002d098 c002d004 
00000000
1da0: 00000000 c0d71df0 c0d71db4 c01b678c c002d080 00000001 c0c63040 
c002cfdc
1dc0: 00100100 00200200 003d0104 00003798 c02f9e00 c02f9e00 c02f9e34 
c0d71ed4
1de0: 00000000 c0d71e70 c0d71df4 c01b67cc c01b665c c02f9e00 01adbe38 
00000000
1e00: c01e5aa8 c00f7c14 c0d71f3c c0d71e5c c0d71e64 c0dd5da8 c0d71e54 
c0d71e28
1e20: c0080738 c010c48c 003d0104 00003798 c02f9e00 c02f9e38 0000001f 
c0d71ed4
1e40: 00000034 c0d71e60 c0d71e54 003d0104 00003798 c02f9e00 c02f9e38 
0000001f
1e60: 00000034 c0d71ebc c0d71e74 c00eeab0 c00f7be0 00013204 00003798 
003d0104
1e80: 00000000 00000000 00429138 00717000 c0d71ed8 c0f131e4 00000031 
c0d84408
1ea0: c0d6bca4 c0d71f44 00000009 c0f131e4 c0d71f08 c0d71ec0 c00f4edc 
c00ee930
1ec0: 00000001 00000000 c0d71f4c c0dd5e10 c02f9e00 00000000 c0d70000 
00008194
1ee0: c0f131e4 c0dd5da8 c0d6bcd0 c0dd5da8 c0d71f44 c0d70000 00008194 
c0d71f24
1f00: c0d71f0c c00ea704 c00f4e98 c0f131e4 fffffff0 c0dd5da8 c0d71f40 
c0d71f28
1f20: c0078034 c00ea6d8 c0dd5da8 c0273000 c0f13210 c0d71fa4 c0d71f44 
c0078170
1f40: c0077eb4 c0c007a4 c0256300 ed5c7610 00000009 c027300b 00000010 
00000000
1f60: 00000000 00000000 0000046c 00000000 00011b0f 00000000 00011b0f 
beb66f49
1f80: 00000000 beb66f49 00000000 00000000 0000000a c001bc24 00000000 
c0d71fa8
1fa0: c001baa0 c0078098 beb66f49 c00227a0 beb66f49 00000002 00000000 
00008000
1fc0: beb66f49 00000000 00000000 00000002 0009dcfc 00000000 00008194 
beb66e88
1fe0: beb66dcc beb66dcc 00046dc0 00074b54 60000010 beb66f49 00000000 
00000000
Backtrace:
[<c002cff4>] (__wake_up_common+0x0/0x7c) from [<c002d098>] 
(__wake_up+0x28/0x30)
[<c002d070>] (__wake_up+0x0/0x30) from [<c01b678c>] 
(__down_interruptible+0x140/0x154)
 r4 = 00000000
[<c01b664c>] (__down_interruptible+0x0/0x154) from [<c01b67cc>] 
(__down_interruptible_failed+0xc/0x20)
[<c00f7bd0>] (jffs2_garbage_collect_pass+0x0/0x67c) from [<c00eeab0>] 
(jffs2_reserve_space+0x190/0x2d4)
[<c00ee920>] (jffs2_reserve_space+0x0/0x2d4) from [<c00f4edc>] 
(jffs2_do_unlink+0x54/0x3f0)
[<c00f4e88>] (jffs2_do_unlink+0x0/0x3f0) from [<c00ea704>] 
(jffs2_unlink+0x3c/0x58)
[<c00ea6c8>] (jffs2_unlink+0x0/0x58) from [<c0078034>] 
(vfs_unlink+0x190/0x1e4)
 r5 = C0DD5DA8  r4 = FFFFFFF0
[<c0077ea4>] (vfs_unlink+0x0/0x1e4) from [<c0078170>] 
(sys_unlink+0xe8/0x184)
 r6 = C0F13210  r5 = C0273000  r4 = C0DD5DA8
[<c0078088>] (sys_unlink+0x0/0x184) from [<c001baa0>] 
(ret_fast_syscall+0x0/0x2c)
 r8 = C001BC24  r7 = 0000000A  r6 = 00000000  r5 = 00000000
 r4 = BEB66F49
Code: e597e004 e1a05002 e59b9004 e1a0a001 (e59e6000)

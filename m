Received: from yx-out-1718.google.com ([74.125.44.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M7GJI-0008Ao-5R
	for linux-mtd@lists.infradead.org; Thu, 21 May 2009 22:00:27 +0000
Received: by yx-out-1718.google.com with SMTP id 6so816435yxn.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 May 2009 15:00:18 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 21 May 2009 15:00:18 -0700
Message-ID: <1c3f4270905211500k273a4e5ak45813b4ec782ee77@mail.gmail.com>
Subject: kernel BUG on file creation in JFFS2
From: Manoj <manoj23@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am using kernel ver2.6.27.18 and when I try to create a 2MB file in
JFFS2 file system, I see a kernel OOPS.

Here is the log:
--------------------------------------------------
/var/tmp/jff # dd if=/dev/urandom of=rand2 bs=1M count=2
[  963.590000] kernel BUG at
/projects/extracted-kernel/linux-2.6.27.18/fs/jffs2/file.c:252!
[  963.610000] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[  963.610000] pgd = c5b64000
[  963.630000] [00000000] *pgd=45b3a031, *pte=00000000, *ppte=00000000
[  963.630000] Internal error: Oops: 817 [#3] PREEMPT
[  963.630000] Modules linked in: sunrpc lockd nfs
[  963.630000] CPU: 0    Tainted: G      D    (2.6.27.18 #19)
[  963.630000] PC is at __bug+0x20/0x2c
[  963.630000] LR is at preempt_schedule+0x48/0x64
[  963.630000] pc : [<c067eea0>]    lr : [<c082699c>]    psr: 60000113
[  963.630000] sp : c5a9bcb0  ip : c5a9bbd0  fp : c5a9bcbc
[  963.630000] r10: c093ff00  r9 : 00000000  r8 : c648ca28
[  963.630000] r7 : c689dd50  r6 : 00001000  r5 : 00000000  r4 : 00000000
[  963.630000] r3 : 00000000  r2 : c5a9a000  r1 : c5a593a8  r0 : 000000a4
[  963.630000] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
[  963.630000] Control: 00c5387d  Table: 45b64008  DAC: 00000015
[  963.630000] Process dd (pid: 138, stack limit = 0xc5a9a260)
[  963.630000] Stack: (0xc5a9bcb0 to 0xc5a9c000)
[  963.630000] bca0:                                     c5a9bd1c
c5a9bcc0 c072b364 c067ee8c
[  963.630000] bcc0: 00001000 00000203 c5a9bcec 00000001 00043000
00000000 00044000 00000000
[  963.630000] bce0: 00000000 00001000 00001000 00000000 c5a9bd1c
00001000 00000000 00044000
[  963.630000] bd00: 00000000 00001000 00001000 c5a9bd68 c5a9bdac
c5a9bd20 c06b543c c072b050
[  963.630000] bd20: 00001000 00001000 c093ff00 c06ece28 c5a9a000
c648cafc c5a9be88 c6386bd8
[  963.630000] bd40: c648cafc c0831718 c648ca28 00044000 00000000
c0831718 c06efd08 c0685e68
[  963.630000] bd60: 00000000 c648ca28 c5a9bf18 00000001 00044000
000bc000 c06ece28 c093ff00
[  963.630000] bd80: 000004db 00100000 00000000 00000000 00000000
c648ca28 00000000 00100000
[  963.630000] bda0: c5a9be34 c5a9bdb0 c06b6060 c06b52a0 00000000
00000000 c5a9bed8 00100000
[  963.630000] bdc0: 00000000 c5a9bddc c5a9be1c c5a9bed8 c5a9bf18
c5a9be88 00000000 22222222
[  963.630000] bde0: c6386bd8 c648cafc 00000000 00000001 00000000
c648caa4 00000000 c5a9be88
[  963.630000] be00: c648ca28 00100000 00000000 c648caa4 00000000
c5a9be88 c648ca28 00000000
[  963.630000] be20: 00000000 00000001 c5a9be7c c5a9be38 c06b6388
c06b5be4 00000000 00000000
[  963.630000] be40: 00000000 c5a9bf18 c6386bd8 c648cafc 00000000
00000000 00000000 c5b2fa40
[  963.630000] be60: c6386bd8 c5a9bf70 c5a9bf18 c5a9be88 c5a9bf4c
c5a9be80 c06d7978 c06b6320
[  963.630000] be80: 00000000 00000000 00000000 00000000 00000000
00000001 ffffffff c6386bd8
[  963.630000] bea0: 00000000 00000000 00000000 00000000 c5b2fa40
00000000 00000000 00000000
[  963.630000] bec0: 00000000 c5b2fa40 c069fd94 c5a9becc c5a9becc
00000000 00000000 00000000
[  963.630000] bee0: c5a9a000 00000000 00100000 40329002 00100000
00000000 00000006 c076729c
[  963.630000] bf00: c06d3368 00002edc 00000000 00000000 c6815e14
c6386978 40229008 00100000
[  963.630000] bf20: 00100000 c6386bd8 40229008 c5a9bf70 00100000
40229008 c5a9a000 00100000
[  963.630000] bf40: c5a9bf6c c5a9bf50 c06d8190 c06d78cc c6386bd8
00000000 00000000 c6386bd8
[  963.630000] bf60: c5a9bfa4 c5a9bf70 c06d8638 c06d80e8 00000000
00000000 c5a9bfa4 00000000
[  963.630000] bf80: c06d70e0 00100000 40229008 00000001 00000004
c067ae60 00000000 c5a9bfa8
[  963.630000] bfa0: c067ace0 c06d8600 00100000 40229008 00000001
40229008 00100000 00100000
[  963.630000] bfc0: 00100000 40229008 00000001 00000004 40229008
00100000 00100000 40229008
[  963.630000] bfe0: 000a56e8 befd2bb0 0000eddc 401b8f7c 60000010
00000001 6b6b6b6b a56b6b6b
[  963.630000] Backtrace:
[  963.630000] [<c067ee80>] (__bug+0x0/0x2c) from [<c072b364>]
(jffs2_write_end+0x320/0x34c)
[  963.630000] [<c072b044>] (jffs2_write_end+0x0/0x34c) from
[<c06b543c>] (generic_file_buffered_write+0
x1a8/0x6c8)
[  963.630000] [<c06b5294>] (generic_file_buffered_write+0x0/0x6c8)
from [<c06b6060>] (__generic_file_ai
o_write_nolock+0x488/0x4d8)
[  963.630000] [<c06b5bd8>]
(__generic_file_aio_write_nolock+0x0/0x4d8) from [<c06b6388>]
(generic_file_
aio_write+0x74/0xf0)
[  963.630000] [<c06b6314>] (generic_file_aio_write+0x0/0xf0) from
[<c06d7978>] (do_sync_write+0xb8/0x10
c)
[  963.630000] [<c06d78c0>] (do_sync_write+0x0/0x10c) from
[<c06d8190>] (vfs_write+0xb4/0xdc)
[  963.630000] [<c06d80dc>] (vfs_write+0x0/0xdc) from [<c06d8638>]
(sys_write+0x44/0x70)
[  963.630000]  r6:c6386bd8 r5:00000000 r4:00000000
[  963.630000] [<c06d85f4>] (sys_write+0x0/0x70) from [<c067ace0>]
(ret_fast_syscall+0x0/0x2c)
[  963.630000]  r8:c067ae60 r7:00000004 r6:00000001 r5:40229008 r4:00100000
[  963.630000] Code: e1a01000 e59f000c eb00352c e3a03000 (e5833000)
[  963.650000] ---[ end trace 56e0ddd823f7deaa ]---
Segmentation fault
--------------------------------------

I have captured kernel messages after setting CONFIG_JFFS2_FS_DEBUG=1.
It is a 200K log file. I can send it if anybody is interested.

I see that other people have seen this issue, but is there a fix?

Thanks.

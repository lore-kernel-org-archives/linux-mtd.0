Received: from [210.94.41.89] (helo=july7)
	by pentafluge.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1HgvCb-00075s-GE
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 05:03:30 +0100
From: "Kyungmin Park" <kmpark@infradead.org>
To: <linux-mtd@lists.infradead.org>
Subject: [JFFS2] kernel BUG at fs/jffs2/gc.c:516!
Date: Thu, 26 Apr 2007 13:03:23 +0900
Message-ID: <000e01c787b7$d96f1850$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

When the JFFS2 is tested with fsstress, I delete the several open files forcely.
The goal of this test is that it is robust and handles it well when disk is
full.
But JFFS2 doesn't, it is died rarely with below message.

In POSIX Spec., it is possible to delete the open file, but I think JFFS2 don't
handle this one well.
This problem is occured at every kernel version.

My queustion is that Is it the expected behavior of JFFS2 or we missed the
handling of this case?
please give some clues.

current test environment
kernel: 2.6.21-rc3 (latest mtd-tree)
JFFS2: default (with compression)
compiler: gcc-3.4.4

Thank you,
Kyungmin Park

--

Raw node at 0x00540000 wasn't in node lists for ino #25952
[JFFS2 DBG] dump node at offset 0x540000.
magic:  0x1985
nodetype:       0xe002
totlen: 0x000046
hdr_crc:        0x32fe3396
the node is inode node
ino:    0x006560
version:        0x000001
mode:   0x002124
uid:    0x00
gid:    0x00
isize:  0x000000
atime:  0x46309537
mtime:  0x46309537
ctime:  0x46309537
offset: 0x000000
csize:  0x000002
dsize:  0x000002
compr:  0x0
usercompr:      0x0
flags:  0x00
data_crc:       0x000000
node_crc:       0x1d592b8c
kernel BUG at fs/jffs2/gc.c:516!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c52e8000
[00000000] *pgd=83740031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at __bug+0x20/0x2c
LR is at 0xc02b6234
pc : [<c0023bd4>]    lr : [<c02b6234>]    Not tainted
sp : c3893bf0  ip : c02b6234  fp : c3893bfc
r10: c2056ba4  r9 : c001c600  r8 : 00000000
r7 : 00000000  r6 : 00000000  r5 : c11b1078  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : 60000013  r0 : 00000024
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C5387F
Table: 852E8000  DAC: 00000015
Process fsstress (pid: 244, stack limit = 0xc3892248)
Stack: (0xc3893bf0 to 0xc3894000)
3be0:                                     c3893d78 c3893c00 c011a374 c0023bc0
3c00: 00000000 00000002 c011ffc0 c001c6f4 00000030 4e0b9329 00000005 c29e3cf5
3c20: c585eda4 00000800 00000154 c3893c54 c3893c3c c2056bb8 00000000 00000000
3c40: 00000000 c71e4ba8 00000000 00000000 c7e58444 c0035f94 00000054 c3893cbc
3c60: c3893c6c c018dc3c c018d8a8 c0793a40 c3893cac 0000ac10 00000000 c001c600
3c80: 00000000 c06f9554 004f0a44 00000000 c3893cac c3893ca0 c0053fa4 c0144d24
3ca0: c3893cfc c3893cb0 c01206d8 c0053fa0 c3892000 c72637a8 c7e583dc 00000054
3cc0: 00000054 c7e9b4a0 c3892000 c001c800 c3892000 c3893cf8 c3893ce4 c009a490
3ce0: c0099c08 00006560 c001c800 c3893d28 c3893cfc c009a574 c009a468 c0699da0
3d00: 00006560 c001c800 c001c600 c001c600 00006560 00000000 00000001 c3893d78
3d20: c3893d2c c011d3d8 c009bd00 c11b169c c3893d78 c3893d40 c0113888 c011dedc
3d40: 00000000 00000000 c3893d68 c3893d58 c2056ba4 00000001 c001c600 c11b1078
3d60: c7e58444 00000000 c001c62c c3893de4 c3893d7c c011ad00 c0119280 00000000
3d80: c001c62c 00000000 c3893dcc c3893d98 c021fd84 c0035f94 00000001 c07e45a0
3da0: c0035ef4 00100100 00200200 00000000 c001c600 c22bf7bc 0000002d 00000000
3dc0: c001c600 c3892000 00000001 c001c62c 00000000 00000005 c3893e18 c3893de8
3de0: c01140b0 c011a430 c3893e2c 00000030 00000000 c41d8b14 c22bf7bc 0000002d
3e00: c28a3420 00000005 c001c600 c3893e60 c3893e1c c01175a8 c0113f18 0000001d
3e20: c3893e2c 00000004 00003796 c0098aa0 c0098a28 c3893e54 00000000 c3040ac4
3e40: c3ba4f40 c22bf7e8 c28a3420 46309580 c3040ac4 c3893e9c c3893e64 c011119c
3e60: c011755c c3040b1c 00000005 46309580 c001c600 00000000 c3040ac4 00000000
3e80: c28a3420 c22bf7e8 00000000 c3ba4f40 c3893ec4 c3893ea0 c0090484 c01110c0
3ea0: ffffffd9 c3040ac4 c3ba4f40 c4564898 c170d2c8 c5e9f000 c3893f94 c3893ec8
3ec0: c009079c c009033c c1ab2000 c4564898 c06b4f20 10eba3fd 00000005 c1ab2041
3ee0: 00000010 00000000 00000000 c3893ef8 c0082cb0 c008c808 000072b6 00001000
3f00: 00002000 00000058 00000058 00000000 00000000 00000000 00000000 c170d2c8
3f20: c06b4f20 1054eef3 00000005 c5e9f034 00000010 00000000 00000000 c06b4f20
3f40: 00000010 00000000 00000000 00000001 00000001 00000000 00000001 ffffffe8
3f60: 00000000 c3893f94 c3893f74 000197fc 4101df40 000105c0 00000026 c001fe24
3f80: c3892000 41154afc c3893fa4 c3893f98 c0090824 c009062c 00000000 c3893fa8
3fa0: c001fc80 c009080c 000197fc 4101df40 4036c070 4036c158 be9c3bd4 be9c3be8
3fc0: 000197fc 4101df40 000105c0 0000000c 411571d0 00009250 41154afc be9c3bb4
3fe0: 00019918 be9c3384 0000b84c 4108e294 20000010 4036c070 1014e599 0010e593
Backtrace:
[<c0023bb4>] (__bug+0x0/0x2c) from [<c011a374>] (jffs2_garbage_collect_live+0x1)
[<c0119274>] (jffs2_garbage_collect_live+0x0/0x11b0) from [<c011ad00>] (jffs2_g)
[<c011a424>] (jffs2_garbage_collect_pass+0x0/0x9d0) from [<c01140b0>] (jffs2_re)
[<c0113f0c>] (jffs2_reserve_space+0x0/0x294) from [<c01175a8>] (jffs2_do_link+0)
[<c0117550>] (jffs2_do_link+0x0/0x228) from [<c011119c>] (jffs2_rename+0xe8/0x2)
[<c01110b4>] (jffs2_rename+0x0/0x2f8) from [<c0090484>] (vfs_rename+0x154/0x2f0)
[<c0090330>] (vfs_rename+0x0/0x2f0) from [<c009079c>] (sys_renameat+0x17c/0x1e0)
[<c0090620>] (sys_renameat+0x0/0x1e0) from [<c0090824>] (sys_rename+0x24/0x28)
[<c0090800>] (sys_rename+0x0/0x28) from [<c001fc80>] (ret_fast_syscall+0x0/0x2c)
Code: e1a01000 e59f000c eb005c63 e3a03000 (e5833000)

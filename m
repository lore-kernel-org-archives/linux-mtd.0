Received: from wproxy.gmail.com ([64.233.184.192])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ea5MX-0001BM-V8
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2005 00:52:49 -0500
Received: by wproxy.gmail.com with SMTP id 58so500955wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Nov 2005 21:52:38 -0800 (PST)
From: "Li Weichen" <iaadoa@gmail.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 10 Nov 2005 13:52:24 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Message-ID: <4372e026.03e0031e.11a6.4cf6@mx.gmail.com>
Subject: Help on erase block errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everyone,

I have met a trouble in jffs2 file system.  I am using the TI OMAP 5912 OSK
as my developing board.  I used the latest linux omap 2.6 git tree that
updated just now.  I made my file system followed the OSK5912 Newbie Guide
with this commad,

#mkfs.jffs2 -p -l -e 0x20000 -n -v -r /data/rootfs2.6/ -o filesys.jffs2

And the version of mkfs.jffs2 is 1.43.  Finally I got many erase block
errors about erase block which are listed below.  I found that there is a
kernel bug in the messages.  Can anyone give me some advice?  

Thank you in advance.
Best regards!

Li Weichen
2005-11-10

error messages:

Node at 0x0063cd78 with length 0x80000a0d would run over the end of the
erase block
Perhaps the file system was created with the wrong erase size?
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0063cd7c:
0x0a0d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0063cd80:
0x697c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0063cd84:
0x014c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0063cd88:
0x001b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0063cd8c:
0x81ed instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0063cd94:
0x7edc instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0063cd98:
0xf819 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0063cd9c:
0xf819 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0063cda0:
0xf819 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0063cda4:
0xa000 instead
Further such events for this erase block will not be printed
Node at 0x0063eb78 with length 0x80000a21 would run over the end of the
erase block
Perhaps the file system was created with the wrong erase size?
Calculated unchecked size 0001e978 != stored unchecked size 8001e978
kernel BUG at fs/jffs2/scan.c:133!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
[00000000] *pgd=00000000
Internal error: Oops: 805 [#1]
Modules linked in:
CPU: 0
PC is at __bug+0x40/0x54
LR is at 0x1
pc : [<c002a78c>]    lr : [<00000001>]    Not tainted
sp : c02d3cc4  ip : 60000093  fp : c02d3cd4
r10: 00000000  r9 : 00000031  r8 : 00000000
r7 : 00000250  r6 : 00000002  r5 : c02dc930  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : 0000173c  r0 : 00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 5317F  Table: 10004000  DAC: 00000017
Process swapper (pid: 1, stack limit = 0xc02d2194)
Stack: (0xc02d3cc4 to 0xc02d4000)
3cc0:          c1c55200 c02d3d18 c02d3cd8 c00e0c80 c002a75c c02d3cec
c02d3ce8
3ce0: 00000000 00000003 c22c0000 01dc0000 00000000 c1c552a8 c1c55200
c1c552c8
3d00: c1c552d0 c1c55200 c1c552d8 c02d3d44 c02d3d1c c00e42fc c00e06fc
00000000
3d20: 000000d0 c1c552b8 c1c552a8 c1c552c0 c1c552c8 c1c552d0 c02d3d70
c02d3d48
3d40: c00e4a30 c00e42e0 c1c45e00 c1c55200 00000000 c1c55000 00008400
00000000
3d60: 00000001 c02d3d94 c02d3d74 c00e6834 c00e4884 c1c55200 c1c55000
c1c552e0
3d80: c1c552e8 00008400 c02d3dc4 c02d3d98 c00e6f98 c00e6720 c1c62000
c1c62000
3da0: 00000000 c0217a28 00008000 c0217a28 00000000 00000000 c02d3de8
c02d3dc8
3dc0: c00e704c c00e6ec8 c1c45e00 ffffffea 00000003 c1c62000 00008000
c02d3e58
3de0: c02d3dec c00e71ec c00e7008 00000003 00000004 c1c48e60 c02c4600
c02d3e20
3e00: c02d3e0c c0095508 00000001 00000001 00000000 0000000a c02c4240
c1c49260
3e20: c1c62000 00008000 00000000 c02d3e58 c02d3e3c c02c4240 fffffff4
c0217a28
3e40: c1c62000 00008000 00000000 c02d3e80 c02d3e5c c00849d8 c00e7068
ffffffff
3e60: 00008000 c02d3eb0 00000000 c1c62000 c02d3eb0 c02d3ea0 c02d3e84
c009af60
3e80: c008498c 00008000 00000000 c1c61000 00000000 c02d3f18 c02d3ea4
c009b5a8
3ea0: c009aef4 c1c62000 00000000 c1c60000 c02c7558 c02c4600 00000010
c0067000
3ec0: 00000000 00000001 00000001 00000000 00008000 c01dd4a4 00000000
c02d3ef8
3ee0: c02d3eec c0062cac 00001000 c02d3f18 00000000 00000000 c01dd4a4
c1c61000
3f00: 00008000 c01dd4a4 00000000 c02d3f4c c02d3f1c c009b99c c009b468
00000000
3f20: 00000000 c1c62000 c1c60000 c02d9000 c02d9000 00008000 00000000
00000000
3f40: c02d3f64 c02d3f50 c0008bb0 c009b908 00000000 c02d9000 c02d3fb0
c02d3f68
3f60: c0008c98 c0008b90 00000000 00000000 00000000 c008dc4c 00000000
c02d3f91
3f80: c00200a0 c02d3fa0 01f00003 c025423c 00000000 00000000 00000000
00000000
3fa0: 00000000 c02d3fc4 c02d3fb4 c0008fbc c0008c4c 00000000 c02d3fe0
c02d3fc8
3fc0: c00090b0 c0008f50 00000000 c025422c 00000000 c02d3ff4 c02d3fe4
c00240cc
3fe0: c0008fe8 00000000 00000000 c02d3ff8 c0041910 c002407c a70b64d3
f2bd63da
Backtrace:
[<c002a74c>] (__bug+0x0/0x54) from [<c00e0c80>]
(jffs2_scan_medium+0x594/0x750)
 r4 = C1C55200
[<c00e06ec>] (jffs2_scan_medium+0x0/0x750) from [<c00e42fc>]
(jffs2_build_filesystem+0x2c/0x438)
[<c00e42d0>] (jffs2_build_filesystem+0x0/0x438) from [<c00e4a30>]
(jffs2_do_mount_fs+0x1bc/0x210)
 r8 = C1C552D0  r7 = C1C552C8  r6 = C1C552C0  r5 = C1C552A8
 r4 = C1C552B8
[<c00e4874>] (jffs2_do_mount_fs+0x0/0x210) from [<c00e6834>]
(jffs2_do_fill_super+0x124/0x238)
[<c00e6710>] (jffs2_do_fill_super+0x0/0x238) from [<c00e6f98>]
(jffs2_get_sb_mtd+0xe0/0x140)
 r8 = 00008400  r7 = C1C552E8  r6 = C1C552E0  r5 = C1C55000
 r4 = C1C55200
[<c00e6eb8>] (jffs2_get_sb_mtd+0x0/0x140) from [<c00e704c>]
(jffs2_get_sb_mtdnr+0x54/0x60)
[<c00e6ff8>] (jffs2_get_sb_mtdnr+0x0/0x60) from [<c00e71ec>]
(jffs2_get_sb+0x194/0x1d0)
 r7 = 00008000  r6 = C1C62000  r5 = 00000003  r4 = FFFFFFEA
[<c00e7058>] (jffs2_get_sb+0x0/0x1d0) from [<c00849d8>]
(do_kern_mount+0x5c/0xf0)
[<c008497c>] (do_kern_mount+0x0/0xf0) from [<c009af60>]
(do_new_mount+0x7c/0xac)
[<c009aee4>] (do_new_mount+0x0/0xac) from [<c009b5a8>]
(do_mount+0x150/0x16c)
 r7 = 00000000  r6 = C1C61000  r5 = 00000000  r4 = 00008000
[<c009b458>] (do_mount+0x0/0x16c) from [<c009b99c>] (sys_mount+0xa4/0xe8)
[<c009b8f8>] (sys_mount+0x0/0xe8) from [<c0008bb0>]
(do_mount_root+0x30/0xbc)
 r8 = 00000000  r7 = 00000000  r6 = 00008000  r5 = C02D9000
 r4 = C02D9000
[<c0008b80>] (do_mount_root+0x0/0xbc) from [<c0008c98>]
(mount_block_root+0x5c/0x174)
 r4 = C02D9000
[<c0008c3c>] (mount_block_root+0x0/0x174) from [<c0008fbc>]
(mount_root+0x7c/0x98)
[<c0008f40>] (mount_root+0x0/0x98) from [<c00090b0>]
(prepare_namespace+0xd8/0x124)
 r4 = 00000000
[<c0008fd8>] (prepare_namespace+0x0/0x124) from [<c00240cc>]
(init+0x60/0x138)
 r5 = 00000000  r4 = C025422C
[<c002406c>] (init+0x0/0x138) from [<c0041910>] (do_exit+0x0/0x3cc)
 r4 = 00000000
Code: 1b0053e7 e59f0014 eb0053e5 e3a03000 (e5833000)
 <0>Kernel panic - not syncing: Attempted to kill init!

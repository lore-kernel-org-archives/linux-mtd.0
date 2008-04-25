Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JpQUZ-00040u-Nn
	for linux-mtd@lists.infradead.org; Fri, 25 Apr 2008 16:09:44 +0000
Message-ID: <48120242.9020908@users.sourceforge.net>
Date: Fri, 25 Apr 2008 18:09:38 +0200
From: =?UTF-8?B?QW5kZXJzIEdyYWZzdHLDtm0=?=
 <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions	causes
	kernel panic
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>	<1208011719.2698.19.camel@pmac.infradead.org>	<Pine.LNX.4.64.0804141650100.15842@pentafluge.infradead.org>	<Pine.LNX.4.64.0804141800170.15842@pentafluge.infradead.org>	<4810F73A.5000305@users.sourceforge.net>
	<1209075315.11578.9.camel@shinybook.infradead.org>
In-Reply-To: <1209075315.11578.9.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> list *jffs2_write_end+0x54
> 
> And can you reproduce with CONFIG_JFFS2_FS_DEBUG=1? 

I think I need an mtdoops partition to catch anything useful from CONFIG_JFFS2_FS_DEBUG.
Too much output for the console. It slows it down so much that it doesn't trigger the panic.

It is triggered by an application that writes a file (about 6MB large) to the jffs2 file system.
It replaces an old file and the use percentage on the file system is high so it triggers
a lot of erases while it's writing. The panic happens before I see any failed erases.

Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock2           15616     13780      1836  88% /flash

The panic occurs at fs/jffs2/file.c:251 which is
BUG_ON(!PageUptodate(pg));


Data CRC 33c102e9 != calculated CRC 0ef77e7b for node at 005d42e4
kernel BUG at /local/git/kernel-mtd/kernel/fs/jffs2/file.c:251!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c3d0c000
[00000000] *pgd=010fa031, *pte=000010cf, *ppte=0000100e
Internal error: Oops: 3d0d81f [#1]
Modules linked in:
CPU: 0    Not tainted  (2.6.25-1 #11)
PC is at __bug+0x20/0x2c
LR is at 0xc0240544
pc : [<c002465c>]    lr : [<c0240544>]    psr: 60000013
sp : c3d33d04  ip : c0240544  fp : c3d33d10
r10: c3d32000  r9 : 00001000  r8 : c02c0e60
r7 : 00000000  r6 : 00000000  r5 : c38208e8  r4 : 00000000
r3 : 00000000  r2 : 00000001  r1 : 00000001  r0 : 00000043
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 03d0d17f  Table: 03d0d17f  DAC: 00000015
Process swap (pid: 205, stack limit = 0xc3d32260)
Stack: (0xc3d33d04 to 0xc3d34000)
3d00:          c3d33d64 c3d33d14 c00dd7ec c0024648 00001000 00000203 c3d33d38
3d20: 0043d000 00000000 0043d000 00000000 c351fe00 00000000 00000000 00001000
3d40: 0043d000 00000000 00001000 00000000 c3d33db8 c3d32000 c3d33df8 c3d33d68
3d60: c005d854 c00dd77c 00001000 00001000 c02c0e60 c3d33dfc c3820980 c3d33ebc
3d80: c3dca720 c3820980 c01c1f6c c38208e8 0001d000 00001000 00000000 c01c1f6c
3da0: c3d33dd8 c3dca720 c3d33dd4 c3d33db8 c003c824 c003c3b0 c3d33f40 00000001
3dc0: 0001d000 00003000 c3d33dfc c02c0e60 00000000 c38208e8 00420000 00000000
3de0: 00420000 00000000 00020000 c3d33e74 c3d33e00 c005e160 c005d6c8 00420000
3e00: 00000000 c3d33f04 00020000 00000000 c3d33f04 c3d33f40 c3d33ebc 0041ffff
3e20: 00000000 c3dca720 c3820980 00000000 00000001 c3d33e74 c3d33e44 c005d350
3e40: c005ceec 00000000 00020000 c3820954 c3d33ebc c3d33f40 c38208e8 00420000
3e60: 00000000 00000001 c3d33eb0 c3d33e78 c005e250 c005dd2c 00020000 00000000
3e80: c3dca720 c3820980 c3d33ebc c3dca720 c3d33f80 00000004 c0020c64 c3d32000
3ea0: 40035138 c3d33f60 c3d33eb8 c007a35c c005e1e0 00420000 00000000 c3d33ec8
3ec0: c011acb0 00000000 00000001 ffffffff c3dca720 00000000 00000000 00000000
3ee0: 00000000 c35e2380 00000000 00000000 00000000 c35e2380 c004b944 c3d33efc
3f00: c3d33efc 00420000 00000000 00000031 c3d33f60 c3d33f20 c01155c4 00020000
3f20: c35e3bc0 c0118230 c352a40c 00000031 4811f800 2474fa30 c35e3bc0 c3dca720
3f40: 40c09c08 00020000 c3dca720 40c09c08 c3d33f80 c3d33f7c c3d33f64 c007abb0
3f60: c007a2a8 c3dca720 00420000 00000000 c3d33fa4 c3d33f80 c007b0f0 c007ab08
3f80: 00420000 00000000 00000000 00020000 00420000 00020000 00000000 c3d33fa8
3fa0: c0020ac0 c007b0b0 00020000 00420000 00000005 40c09c08 00020000 00000000
3fc0: 00020000 00420000 00020000 00000005 005e84e0 407e9c08 40035138 be8900b4
3fe0: 00000000 be890080 000036c4 400e0ec0 60000010 00000005 5fd6b7be d06feaea
Backtrace:
[<c002463c>] (__bug+0x0/0x2c) from [<c00dd7ec>] (jffs2_write_end+0x7c/0x2b8)
[<c00dd770>] (jffs2_write_end+0x0/0x2b8) from [<c005d854>] (generic_file_buffered_write+0x19c/0x668)
[<c005d6bc>] (generic_file_buffered_write+0x4/0x668) from [<c005e160>] (__generic_file_aio_write_nolock+0x440/0x4b0)
[<c005dd20>] (__generic_file_aio_write_nolock+0x0/0x4b0) from [<c005e250>] (generic_file_aio_write+0x80/0xfc)
[<c005e1d4>] (generic_file_aio_write+0x4/0xfc) from [<c007a35c>] (do_sync_write+0xc0/0x114)
[<c007a29c>] (do_sync_write+0x0/0x114) from [<c007abb0>] (vfs_write+0xb4/0xdc)
  r6:c3d33f80 r5:40c09c08 r4:c3dca720
[<c007aafc>] (vfs_write+0x0/0xdc) from [<c007b0f0>] (sys_write+0x4c/0x7c)
  r6:00000000 r5:00420000 r4:c3dca720
[<c007b0a4>] (sys_write+0x0/0x7c) from [<c0020ac0>] (ret_fast_syscall+0x0/0x2c)
  r6:00020000 r5:00420000 r4:00020000
Code: e1a01000 e59f000c eb0051ba e3a03000 (e5833000)
Kernel panic - not syncing: Fatal exception

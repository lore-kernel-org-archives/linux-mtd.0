Received: from mail02.syd.optusnet.com.au ([211.29.132.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JwAdZ-00030j-Qt
	for linux-mtd@lists.infradead.org; Wed, 14 May 2008 06:38:55 +0000
Subject: Re: New thread [BUG] JFFS2 usage of write_begin and write_end
	functions causes kernel panic
From: James <jamessteward@optusnet.com.au>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1210562680.6235.55.camel@Ubuntu-Desktop>
References: <1210312276.28139.19.camel@Ubuntu-Desktop>
	<1210320731.25560.1193.camel@pmac.infradead.org>
	<1210545077.6235.10.camel@Ubuntu-Desktop>
	<1210545663.2861.1.camel@shinybook.infradead.org>
	<1210550476.6235.30.camel@Ubuntu-Desktop>
	<1210562680.6235.55.camel@Ubuntu-Desktop>
Content-Type: text/plain
Date: Wed, 14 May 2008 16:38:24 +1000
Message-Id: <1210747104.6158.41.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-05-12 at 13:24 +1000, James wrote:
> I guess there are still some bugs to squash.

Even with 2.6.20, there are still buckets of ECC and Checksum type
errors, even after a complete erase and reload of the original JFFS2
file system.

What can I do to find out what's going wrong?  Are there postmortem
tools for JFFS2 , that I can use to analyse an image retrieved from the
device?  The SAM-BA utility allows me to read the NAND flash.

I thought JFFS2 on NAND was fairly stable, so I'm a bit surprised by
these problems.  Could they be hardware related?  (This is on the
AT91SAM9263-EK board).

Below is with 2.6.20 from timesys, with JFFS2 and MTD debug turned up,
just trying to get a can4linux kernel module down to the dev board.

root@at91sam9263ek:~$ tftp -gr can.ko 192.168.70.104
jffs2_flush_wbuf(): Write failed with -5
About to refile bad block at 003e0000
Refiling block at 003e0000 to bad_used_list
Recovery of wbuf failed due to a second write error
Write of 420 bytes at 0x003eaf30 failed. returned -5, retlen 0
Not marking the space at 0x003eaf30 as dirty because the flash driver
returned retlen zero
mtd->read(0x1a4 bytes from 0xae0000) returned ECC error
JFFS2 error: (1243) __jffs2_dbg_prewrite_paranoia_check: argh, about to
write node to 0xae0000 on flash, but there are data already there. The
first corrupted byte is at 0xae01a4 offset.
kernel BUG at fs/jffs2/debug.c:151!
Unable to handle kernel NULL pointer dereference at virtual address
00000000
pgd = c3b8c000
[00000000] *pgd=239af031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at __bug+0x20/0x2c
LR is at 0x1
pc : [<c002713c>]    lr : [<00000001>]    Not tainted
sp : c3f65b80  ip : 00000000  fp : c3f65b8c
r10: c3d9fc00  r9 : c3f13528  r8 : 000001a4
r7 : 00ae0000  r6 : c3d9fc00  r5 : c3b88600  r4 : 000001a4
r3 : 00000000  r2 : c02db2d4  r1 : 01012ea2  r0 : 00000027
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 5317F
Table: 23B8C000  DAC: 00000015
Process tftp (pid: 1243, stack limit = 0xc3f64258)
Stack: (0xc3f65b80 to 0xc3f66000)
5b80: c3f65bc4 c3f65b90 c0106874 c002712c 00ae01a4 c3f65ba4 c3b88600
c0038a1c 
5ba0: c029dcbc 000001a4 4f4ad012 c3b88400 00ae0000 c3b96220 c3f65c4c
c3f65bc8 
5bc0: c00fd018 c0106784 c01093a4 c0038a1c c3f65c0c c3f65be0 c01093c0
c023cf30 
5be0: 0000015a 000001a4 c02e32e4 00000200 c3b88400 c3f65c88 c3f65c8c
c39b4f68 
5c00: 00000000 00000002 c3f13528 00000044 c3b88400 00000160 c3f64000
c3f65c94 
5c20: c0038a30 00000000 00000000 00000200 c3d9fc00 00003000 c3f13528
c3b96220 
5c40: c3f65cc4 c3f65c50 c00fdbf0 c00fcf00 00000160 00000003 00001000
00000001 
5c60: 00000200 00000200 00000060 00000000 00000000 00000030 00000006
c3467000 
5c80: 00000000 00000001 00000160 00000200 0001ffc4 c3b88400 c00f8ffc
c3f13550 
5ca0: c3f13528 00000000 c3d9fc00 c3b96250 00000000 c037bce0 c3f65d14
c3f65cc8 
5cc0: c00f65dc c00fd8d0 00003000 00000200 c3f65ce4 00000003 00000200
00000200 
5ce0: 000c4414 00000000 c3f65d14 c3f64000 00000200 00000000 00000200
c037bce0 
5d00: 000c4414 00000000 c3f65dbc c3f65d18 c005adcc c00f6428 00000001
c3f65e90 
5d20: 00000001 00000200 c3b216e0 c3b962e8 c0243654 c3b96250 c3f65f20
00000000 
5d40: c3f64000 00000000 c3f65d9c 00000001 00000000 c037bce0 c3f65d8c
c3f65d68 
5d60: c003c89c c003c2b4 000000ee 14ef3429 9c80000c c3f65d90 c3b96250
00000000 
5d80: c3f65dbc c3f65d90 c0088f90 fe03c850 000000ee 00000200 00000001
00003000 
5da0: 00000000 c3b96250 00000000 00000200 c3f65e44 c3f65dc0 c005b478
c005a998 
5dc0: 00003000 00000000 c3f65ee0 00000200 00000000 c021a250 c005d85c
c3f65ee0 
5de0: c3f65f20 c3f65e90 ffffffff 00000000 c3b216e0 c3b962e8 00000000
00000001 
5e00: c3c2f580 00000000 00000000 00000000 00000020 c3c2f580 c004c13c
c3b962bc 
5e20: c3b96250 c3f65e90 c3f65f20 000035e84 c3f65e48 
5e40: c005b540 c005afe8 00000000 c00825d8 c3b216e0 c3b962e8 00000000
c3f65e90 
5e60: c3b216e0 c3f65e90 c3f65f20 c3f65f78 c3f64000 fffffdee c3f65f4c
c3f65e88 
5e80: c0074f74 c005b4d8 00003000 00000000 bec34c9c c3f65ed4 00000000
00000001 
5ea0: ffffffff c3b216e0 00000000 00000000 00000000 00000000 c3c2f580
c3f65ed4 
5ec0: 00000000 00000000 c01d4588 c3c2f580 c004c13c c3f65ed4 c3f65ed4
00000000 
5ee0: 00003000 00000000 c3f64000 00000000 c3f65fa4 00000000 c3bffc20
00000200 
5f00: c3b8d000 00000000 00000000 00000002 c03ac800 00000000 00000000
c3b9634c 
5f20: 000c4414 00000200 c3b216e0 000c4414 c3f65f78 00000200 c0022ec8
00000000 
5f40: c3f65f74 c3f65f50 c0075900 c0074ec8 00000005 c3f65ed4 00003000
00000000 
5f60: c3b216e0 00000004 c3f65fa4 c3f65f78 c0075fa4 c0075858 00003000
00000000 
5f80: bec34c74 00000000 bec34c9c 00000019 00000200 000c4414 00000000
c3f65fa8 
5fa0: c0022d20 c0075f70 00000019 00000200 00000003 000c4414 00000200
00000019 
5fc0: 00000019 00000200 000c4414 00000004 00000003 000c4412 00000000
00000019 
5fe0: 00000000 bec34ba8 0004e73c 401715ac 60000010 00000003 401ab914
401d5ffc 
Backtrace: 
[<c002711c>] (__bug+0x0/0x2c) from [<c0106874>]
(__jffs2_dbg_prewrite_paranoia_check+0x100/0x120)
[<c0106774>] (__jffs2_dbg_prewrite_paranoia_check+0x0/0x120) from
[<c00fd018>] (jffs2_write_dnode+0x128/0x5f8)
 r7 = C3B96220  r6 = 00AE0000  r5 = C3B88400  r4 = 4F4AD012
[<c00fcef0>] (jffs2_write_dnode+0x0/0x5f8) from [<c00fdbf0>]
(jffs2_write_inode_range+0x330/0x4e0)
[<c00fd8c0>] (jffs2_write_inode_range+0x0/0x4e0) from [<c00f65dc>]
(jffs2_commit_write+0x1c4/0x348)
[<c00f6418>] (jffs2_commit_write+0x0/0x348) from [<c005adcc>]
(generic_file_buffered_write+0x444/0x650)
[<c005a988>] (generic_file_buffered_write+0x0/0x650) from [<c005b478>]
(__generic_file_aio_write_nlock+0x4a0/0x4f0)
[<c005afd8>] (__generic_file_aio_write_nolock+0x0/0x4f0) from
[<c005b540>] (generic_file_aio_write+0x78/0xf4)
[<c005b4c8>] (generic_file_aio_write+0x0/0xf4) from [<c0074f74>]
(do_sync_write+0xbc/0x10c)
[<c0074eb8>] (do_sync_write+0x0/0x10c) from [<c0075900>] (vfs_write
+0xb8/0x190)
[<c0075848>] (vfs_write+0x0/0x190) from [<c0075fa4>] (sys_write
+0x44/0x70)
 r7 = 00000004  r6 = C3B216E0  r5 = 00000000  r4 = 00003000
[<c0075f60>] (sys_write+0x0/0x70) from [<c0022d20>] (ret_fast_syscall
+0x0/0x2c)
 r6 = 000C4414  r5 = 00000200  r4 = 00000019 
Code: e1a01000 e59f000c eb004633 e3a03000 (e5833000) 
 Segmentation faul<7>jffs2_follow_link(): target path is 'volatile/log'
t
root@at91sam926jffs2_follow_link(): target path is 'volatile/log'
3ek:~$ jffs2_follow_link(): target path is 'volatile/log'
jffs2_follow_link(): target path is 'volatile/log'
jffs2_follow_link(): target path is 'volatile/log'
jffs2_follow_link(): target path is 'volatile/log'
jffs2_follow_link(): target path is 'volatile/log'


Below is from 2.6.24 with patches from linnux4sam.org and JFFS2 and MTD
debug turned up.  Although this isn't a crash, it doesn't look good to
me.

root@at91sam9263ek:~$ tftp -gr can.ko 192.168.70.104
jffs2_flush_wbuf(): Write failed with -5
About to refile bad block at 003e0000
Refiling block at 003e0000 to bad_used_list
Write of 1499 bytes at 0x003ecec4 failed. returned -5, retlen 0
Not marking the space at 0x003ecec4 as dirty because the flash driver
returned retlen zero
jffs2_flush_wbuf(): Write failed with -5
About to refile bad block at 03e60000
Refiling block at 03e60000 to bad_used_list
Write of 1499 bytes at 0x03e607cc failed. returned -5, retlen 0
Not marking the space at 0x03e607cc as dirty because the flash driver
returned retlen zero
tftp: Write Error: Input/ouc3d6864c is on list at c3dd28d8
tput error
c3d6864c is on list at c3dd28d8
c3d6864c is on list at c3dd28d8
c3d6864c is on list at c3dd28d8
c3d6864c is on list at c3dd28d8
c3d6864c is on list at c3dd28d8
c3d6864c is on list at c3dd28d8
root@at91sam9263ek:~$ nand_isbad_bbt(): bbt info for offs 0x03f60000:
(block 507) 0x00
jffs2_flush_wbuf(): Write failed with -5
About to refile bad block at 03e40000
Refiling block at 03e40000 to bad_used_list
Write of 120 bytes at 0x03e407fc failed. returned -5, retlen 0
Not marking the space at 0x03e407fc as dirty because the flash driver
returned retlen zero

I am not a kernel hacking guru, or file system debugging wizard, but if
someone is willing to take a look, I'm happy to test things and report
back.

Regards,
James.

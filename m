Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GjSRA-0001Fo-1u
	for linux-mtd@lists.infradead.org; Sun, 12 Nov 2006 22:24:52 -0500
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 435FA467D2
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Nov 2006 16:24:34 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id 2FA83467D1
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Nov 2006 16:24:34 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0J8N00601DYE7500@sunstrike.tait.co.nz>
	(original mail from robin.gilks@tait.co.nz) for
	linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2006 16:24:33 +1300 (NZDT)
Received: from [172.25.140.15] by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	with ESMTP id <0J8N000QPG4X8650@sunstrike.tait.co.nz> for
	linux-mtd@lists.infradead.org; Mon, 13 Nov 2006 16:24:33 +1300 (NZDT)
Date: Mon, 13 Nov 2006 16:24:31 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
Subject: Re: Kernel oops in jffs2 mount - any ideas?
In-reply-to: <1163146170.3925.7.camel@sauron>
To: MTD mail list <linux-mtd@lists.infradead.org>
Message-id: <4557E56F.8070100@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=UTF-8
Content-transfer-encoding: 7BIT
References: <4553C6CB.2040207@tait.co.nz> <1163146170.3925.7.camel@sauron>
Reply-To: robin.gilks@tait.co.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> Enabling debugging messages and providing flash type and how to
> reproduce information would be helpful.
> 

Chip is ST28W320CB, reproducibility is just trying to boot with the 
following command line

[    0.000000] Kernel command line: root=/dev/mtdblock1 rootfstype=jffs2 
rw ip=172.25.206.113:172.25.140.15::255.255.0.0:unset:eth0:off panic=1 
console=ttyCPM0 
mtdparts=asif.0:64K(param),3008K(jffs),256K(u-boot),-(kernel)

It boots fine with a 2.4.22 kernel.

With mtd and jffs2 debug messages full on I get the following (different 
symptoms now although I do occasionally get the original panic).

[   13.488115] jffs2_scan_eraseblock(): Node at 0x0004aff8 {0x1985, 
0xe001, 0x0000002d) has invalid CRC 0xd7218112 (calculated 0x05000000)
[   13.514180] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x0004b000: 0xd721 instead
[   13.534948] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x0004b010: 0x4553 instead
[   13.552949] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x0004b014: 0x0502 instead
[   13.570946] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x0004b018: 0xf31d instead
[   13.589307] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x0004b01c: 0x584a instead
[   13.607408] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x0004b020: 0x7474 instead
[   13.625730] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x0004b024: 0x31ff instead
[   14.696815] jffs2_scan_eraseblock(): Node at 0x00115ff8 {0x1985, 
0xe002, 0x00000065) has invalid CRC 0xe8863260 (calculated 0x05000000)
[   14.722213] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x00116000: 0xe886 instead
[   14.748120] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x00116034: 0xf5b8 instead
[   14.766139] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x00116038: 0x4260 instead
[   14.784018] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x0011603c: 0x4465 instead
[   14.802051] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x00116040: 0x3331 instead
[   14.820047] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x00116044: 0x373a instead
[   14.838014] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x00116048: 0x3a30 instead
[   14.855985] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x0011604c: 0x7563 instead
[   14.874020] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x00116050: 0x6263 instead
[   14.891308] Further such events for this erase block will not be printed
[   21.431374] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found 
at 0x0029ba44: 0x0020 instead
[   23.751790] JFFS2: Erase block at 0x00290000 is not formatted. It 
will be erased
[   24.009046] Oops: kernel access of bad area, sig: 11 [#1]
[   24.019240] NIP: C01136A0 LR: C0114294 CTR: C01136A0
[   24.029096] REGS: c3cabcd0 TRAP: 0300   Not tainted  (2.6.18-buildroot)
[   24.042200] MSR: 00009032 <EE,ME,IR,DR>  CR: 22008028  XER: 0000005F
[   24.054824] DAR: FF80101B, DSISR: C0000000
[   24.062957] TASK = c036a7c0[280] 'jffs2_gcd_mtd1' THREAD: c3caa000
[   24.074859] GPR00: 00000000 C3CABD80 C036A7C0 FF800FFF C3C26678 
00000000 C034CA44 F82DD7B0
[   24.091445] GPR08: 0005CEE4 C01AD99C FF800FFF C01136A0 22008024 
00000000 C3CABE38 00000000
[   24.108034] GPR16: C3CABE24 C01C0000 C3CABDA8 00000000 C3CABE28 
C3C26640 C034CA20 00000000
[   24.124624] GPR24: 0005CEE4 C3C26640 00000028 00000000 0005CEE4 
C3C26678 C03F6C14 C3C26678
[   24.141559] NIP [C01136A0] put_chip+0xa0/0x2e8
[   24.150374] LR [C0114294] cfi_intelext_read+0x1a0/0x240
[   24.160735] Call Trace:
[   24.165590] [C3CABD80] [C3C26640] 0xc3c26640 (unreliable)
[   24.176302] [C3CABDA0] [C0114294] cfi_intelext_read+0x1a0/0x240
[   24.188052] [C3CABDF0] [C010CA1C] part_read+0x84/0xe0
[   24.198075] [C3CABE10] [C00B6AF0] 
jffs2_do_read_inode_internal+0x12c/0x11b4
[   24.211899] [C3CABE90] [C00B7BDC] jffs2_do_crccheck_inode+0x64/0xc0
[   24.224340] [C3CABF00] [C00BC0EC] jffs2_garbage_collect_pass+0x194/0x8a4
[   24.237646] [C3CABF50] [C00BDF54] jffs2_garbage_collect_thread+0xa8/0x178
[   24.251124] [C3CABFF0] [C000514C] kernel_thread+0x44/0x60
[   24.261823] Instruction dump:
[   24.267703] 38636ccc 4beffc79 387f001c 38800003 38a00001 38c00000 
4befb459 80010024
[   24.283080] 83e1001c 38210020 7c0803a6 4e800020 <800a001c> 2f800000 
419effd0 7d435378
[   24.300091] VFS: Mounted root (jffs2 filesystem).
[   24.309717] Freeing unused kernel memory: 92k init
[   24.318739] jffs2_lookup()
[   24.324146] jffs2_read_inode(): inode->i_ino == 3
[   24.333388] [JFFS2 DBG] (1) jffs2_do_read_inode: read inode #3
[   24.345076] [JFFS2 DBG] (1) jffs2_do_read_inode_internal: ino #3 
nlink is 1
[   24.358850] [JFFS2 DBG] (1) jffs2_get_inode_nodes: ino #3
[   24.369592] jffs2_write_super()
[   24.375795] jffs2_thread_should_wake(): unchecked_size 1131332, 
checked_ino #5
[   24.390188] Starting erase of pending block 0x00280000
[   24.400330] Freeing all node refs for eraseblock offset 0x00280000
[   24.412607] jffs2_erase_block(): erase block 0x280000 (range 
0x280000-0x290000)
[   24.427223] [JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 
0x04b868(2).
[   24.442031] [JFFS2 DBG] (1) jffs2_alloc_full_dirent: c3c9ae20
[   24.453251] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "zero", 
ino #166
[   24.467737] [JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 
0x04b7f0(2).
[   24.482114] [JFFS2 DBG] (1) jffs2_alloc_full_dirent: c3c9aba0
[   24.493529] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent 
"urandom", ino #165
[   24.508215] [JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 
0x04b778(2).
[   24.523034] [JFFS2 DBG] (1) jffs2_alloc_full_dirent: c3ca05a0
[   24.534342] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ttyp9", 
ino #164
[   24.548625] [JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 
0x04b700(2).
[   24.563329] [JFFS2 DBG] (1) jffs2_alloc_full_dirent: c3ca04e0
[   24.574892] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ttyp8", 
ino #163
[   24.589064] [JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 
0x04b688(2).
[   24.603875] [JFFS2 DBG] (1) jffs2_alloc_full_dirent: c3ca03e0
[   24.615207] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ttyp7", 
ino #162
[   24.629501] [JFFS2 DBG] (1) jffs2_get_inode_nodes: read 40 bytes at 
0x04b610(2).
[   24.644423] [JFFS2 DBG] (1) jffs2_alloc_full_dirent: c3ca0ee0
[   24.655598] [JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ttyp6", 
ino #161



This continues on through the filesystem (as far as I can see) and ends 
up with it hung although the kernel still responds pings (so not 
everything is dead!).

-- 
Robin



=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================

Received: from [62.98.226.203] (helo=lisa.rhpk.springfield.inwind.it ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oYIh-0002iD-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2001 23:46:07 +0100
Date: Wed, 3 Oct 2001 00:49:29 +0200 (CEST)
From: Cristiano Paris <c.paris@libero.it>
To: David Woodhouse <dwmw2@infradead.org>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: MTD newbie 
In-Reply-To: <13487.1002032051@redhat.com>
Message-ID: <Pine.LNX.4.33.0110030044530.481-100000@lisa.rhpk.springfield.inwind.it>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Finally I got the debug message through the use of the netconsole kernel
module.

I must say that using erase_size=256 (same as my iPAQ's) works fine with
linux-2.4.10-ac3 : I can touch and modify any file in my jffs2 volume. The
following output comes after using erase_size=8, just before the command :

touch /mnt/pippo

is issued. Happy debugging :-)

Thanks David.

Cristiano

-------

netconsole: network logging started up successfully!
jffs2_lookup()
jffs2_create()
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xfffffffc bytes at 0x206004
jffs2_create(): reserved 0xfffffffc bytes
jffs2_new_inode(): dir_i 1, mode 0x81a4
Allocated inocache at c0031ae0
jffs2_new_inode(): Assigned ino# 781
jffs2_add_ino_cache: Add c0031ae0 (ino #781)
ram_read(pos:2121732, len:16)
ARGH. About to write node to 0x00206004 on flash, but there's data already there:
0x00206004: 85 19 01 e0 33 00 00 00 96 11 8b e8 6b 02 00 00
ram_write(pos:2121732, len:68)
ram_write(pos:2121800, len:0)
jffs2_add_physical_node_ref(): Node at 0x206004, size 0x44
argh. node added in wrong place
jffs2_write_dnode wrote node at 0x00206004 with dsize 0x0, csize 0x0, node_crc 0xa20c9ed5, data_crc 0x00000000, totlen 0x00000044
jffs2_create created file with mode 0x81a4
jffs2_write_dirent(ino #1, name at *0xc24e779c "pippo"->ino #781, name_crc 0x193f3529)
ram_read(pos:2121800, len:16)
ARGH. About to write node to 0x00206048 on flash, but there's data already there:
0x00206048: 78 5e 94 53 3d 4b c4 40 10 1d 3f f1 03 f4 fc 16
ram_write(pos:2121800, len:40)
ram_write(pos:2121840, len:5)
jffs2_add_physical_node_ref(): Node at 0x206048, size 0x30
argh. node added in wrong place
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 1399, nr_erasing_blocks 0, dirty_size 0xa2e50
jffs2_add_fd_to_list( c1497bc0, c366f188 (->c4f7dfc0))
Dirent "bin" (hash 0x0023605a, ino #211
Dirent "dev" (hash 0x0023ee05, ino #257
Dirent "etc" (hash 0x0024a603, ino #442
Dirent "lib" (hash 0x002697fa, ino #619
Dirent "mnt" (hash 0x00271d65, ino #612
Dirent "tmp" (hash 0x00295e98, ino #618
Dirent "var" (hash 0x0029ab98, ino #617
Dirent "usr" (hash 0x0029e101, ino #2
Dirent "home" (hash 0x019cc780, ino #609
Dirent "proc" (hash 0x01baa5b4, ino #610
Dirent "sbin" (hash 0x01c000e1, ino #399
Dirent "root" (hash 0x01c0d8cc, ino #615
Dirent "pippo" (hash 0x12e5c1b9, ino #781
Dirent "linuxrc" (hash 0xa2e02467, ino #611
Dirent ".ramfs.tar.gz" (hash 0xee261af5, ino #616
jffs2_create: Created ino #781 with mode 100644, nlink 1(1). nrpages 0
jffs2_setattr(): ino #781
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xfffffffc bytes at 0x206004
ram_read(pos:2121732, len:16)
ARGH. About to write node to 0x00206004 on flash, but there's data already there:
0x00206004: 85 19 02 e0 44 00 00 00 1d fb f7 98 0d 03 00 00
ram_write(pos:2121732, len:68)
ram_write(pos:2121800, len:0)
jffs2_add_physical_node_ref(): Node at 0x206004, size 0x44
argh. node added in wrong place
jffs2_write_dnode wrote node at 0x00206004 with dsize 0x0, csize 0x0, node_crc 0xdc74d673, data_crc 0x00000000, totlen 0x00000044
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 1399, nr_erasing_blocks 0, dirty_size 0xa2e50
Calculated used size 0000212c != stored used size 000020e8
invalid operand: 0000
CPU:    0
EIP:    0010:[<c693f2f0>]    Not tainted
EFLAGS: 00010286
eax: 0000003e   ebx: c12c2878   ecx: 00000001   edx: 00000001
esi: c30804e8   edi: c02d4ce8   ebp: c393b580   esp: c38b7edc
ds: 0018   es: 0018   ss: 0018
Process touch (pid: 251, stackpage=c38b7000)
Stack: c6947560 0000212c 000020e8 c0378100 c0022790 c35383c0 c0022780 c02d4ce8
       c30804e8 c693f175 c30804e8 c69475a0 c693d0a0 c30804e8 c393b580 c38b7fa4
       c35383c0 c38b7f7c 00000070 00000044 00000000 00000000 c30804e8 c35384e8
Call Trace: [<c6947560>] [<c693f175>] [<c69475a0>] [<c693d0a0>] [<c013e2a0>]
   [<c012af13>] [<c012baac>] [<c012baf7>] [<c0106d83>]

Code: 0f 0b 83 c4 3b 5e 78 75 8b 43 0c 50 68 40 77 94 c6 eb
 <0>Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing

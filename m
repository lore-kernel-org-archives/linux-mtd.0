Received: from sphere.barak.net.il ([212.150.48.98])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AVvBa-0007Yh-0W
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2003 16:03:06 +0000
Received: from pc166 ([82.166.70.240]) by sphere.barak.net.il
	b2629777bce4038e9f419f7b71122558)
	with SMTP id <20031215141051.KBOC4652.sphere@pc166>
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Dec 2003 16:10:51 +0200
Message-ID: <009901c3c314$d86adc70$a600a8c0@pc166>
From: "Isak Levi" <isak@barak.net.il>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 15 Dec 2003 16:07:59 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1255"
Content-Transfer-Encoding: 7bit
Subject: problem using jffs2 with nand flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi again,
I am using samsung 2k pages NAND flash and I am trying to use JFFS2 with the
flash.
I did the following steps before copying a file:

1. eraseall /devfs/mtd/6
2. mount -t jffs2 /devfs/mtdblock/6 /mnt

while /mnt is empty, I am trying to copy ~11k file on it and encounter the
following error:
Only one page(2k) is actually being written to the flash (why is that?) and
after rebooting & remounting the file system system the file is only 4096
bytes long.
I get 'Unable to handle kernel request at virtual address ... ' within the
kupdated process. this is the full log I recieved including the Oops:

# cp /tmp/triton.c triton.c
jffs2_lookup()
jffs2_lookup()
jffs2_lookup()
jffs2_lookup()
jffs2_lookup()
jffs2_read_inode(): inode->i_ino == 95
jffs2_do_read_inode_internal(): ino #95 nlink is 1
jffs2_get_inode_nodes(): ino #95
Node at 0003167c (2) is a data node
version 1, highest_version now 1
dnode @0003167c: ver 1, offset 0000, dsize 0007
jffs2_add_full_dnode_to_inode(ino #95, f c3aec1e0, fn c3d72bc0)
jffs2_read_inode() returning
jffs2_create()
jffs2_new_inode(): dir_i 1, mode 0x81a4
jffs2_do_new_inode(): Assigned ino# 2
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x20000 bytes at 0x37e0000
jffs2_do_create(): reserved 0x20000 bytes
jffs2_add_physical_node_ref(): Node at 0x37e0000(2), size 0x44
jffs2_write_dnode wrote node at 0x037e0000(2) with dsize 0x0, csize 0x0,
node_cr
c 0x535a2fc1, data_crc 0x00000000, totlen 0x00000044
jffs2_do_create created file with mode 0x81a4
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 2038, nr_erasing_blocks 0,
dirty_size
 0x0: no
jffs2_reserve_space(): Requested 0x30 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1ffbc bytes at 0x37e0044
jffs2_write_dirent(ino #1, name at *0xc3b6f91c "triton.c"->ino #2, name_crc
0x8e
f47e44)
jffs2_add_physical_node_ref(): Node at 0x37e0044(2), size 0x30
jffs2_add_fd_to_list( c3ffd9e0, c3aec800 (->00000000))
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 2038, nr_erasing_blocks 0,
dirty_size
 0x0: no
jffs2_create: Created ino #2 with mode 100644, nlink 1(1). nrpages 0
jffs2_prepare_write()
end prepare_write(). pg->flags 41
jffs2_commit_write(): ino #2, page at 0x0, range 0-4096, flags 2041
jffs2_write_inode_range(): Ino #2, ofs 0x0, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1ff8c bytes at 0x37e0074
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 2923, total_in 4084, total_out
1161
calling deflate with avail_in 12, avail_out 2923
deflate returned with avail_in 0, avail_out 2918, total_in 4096, total_out
1166
zlib compressed 4096 bytes into 1172
jffs2_add_physical_node_ref(): Node at 0x37e0074(2), size 0x4d8
jffs2_write_dnode wrote node at 0x037e0074(2) with dsize 0x1000, csize
0x494, no
de_crc 0x4c37861f, data_crc 0xf7370993, totlen 0x000004d8
jffs2_add_full_dnode_to_inode(ino #2, f c3aec9e0, fn c3d72be0)
Obsoleting node at 0x037e0000 of len 44: Wasting
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 2038, nr_erasing_blocks 0,
dirty_size
 0x0: no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
end prepare_write(). pg->flags 41
jffs2_commit_write(): ino #2, page at 0x1000, range 0-4096, flags 2041
jffs2_write_inode_range(): Ino #2, ofs 0x1000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1fab4 bytes at 0x37e054c
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 2807, total_in 4084, total_out
1277
calling deflate with avail_in 12, avail_out 2807
deflate returned with avail_in 0, avail_out 2795, total_in 4096, total_out
1289
zlib compressed 4096 bytes into 1295
nand_write_ecc: to = 0x037e0000, len = 2048
jffs2_add_physical_node_ref(): Node at 0x37e054c(2), size 0x554
jffs2_write_dnode wrote node at 0x037e054c(2) with dsize 0x1000, csize
0x50f, no
de_crc 0x174c4991, data_crc 0xa31fa628, totlen 0x00000553
jffs2_add_full_dnode_to_inode(ino #2, f c3aec9e0, fn c3d72bd0)
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 2038, nr_erasing_blocks 0,
dirty_size
 0x0: no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_read_inode_range: ino #2, range 0x00002000-0x00003000
Reading 8192-8192 from node at 0x037e054c (2)
Filling non-frag hole from 8192-12288
end prepare_write(). pg->flags 2049
jffs2_commit_write(): ino #2, page at 0x2000, range 0-2965, flags 2049
jffs2_write_inode_range(): Ino #2, ofs 0x2000, len 0xb95
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1f560 bytes at 0x37e0aa0
calling deflate with avail_in 2953, avail_out 2953
deflate returned with avail_in 0, avail_out 1966, total_in 2953, total_out
987
calling deflate with avail_in 12, avail_out 1966
deflate returned with avail_in 0, avail_out 1956, total_in 2965, total_out
997
zlib compressed 2965 bytes into 1003
jffs2_add_physical_node_ref(): Node at 0x37e0aa0(2), size 0x430
jffs2_write_dnode wrote node at 0x037e0aa0(2) with dsize 0xb95, csize 0x3eb,
nod
e_crc 0xbf79b8c1, data_crc 0x86b83b08, totlen 0x0000042f
jffs2_add_full_dnode_to_inode(ino #2, f c3aec9e0, fn c3d72bf0)
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 2038, nr_erasing_blocks 0,
dirty_size
 0x0: no
increasing writtenlen by 2965
jffs2_commit_write() returning 2965
# Unable to handle kernel paging request at virtual address 7dc3aecd
pgd = c0104000
*pgd = 00000000, *pmd = 00000000
Internal error: Oops: ffffffff
CPU: 0
pc : [<c0135e4c>]    lr : [<c01597b4>]    Not tainted
sp : c003bf7c  ip : c003bf9c  fp : c003bf98
r10: a0115fc0  r9 : 69052903  r8 : c0298a94
r7 : c3aec980  r6 : 00000000  r5 : c3aec970  r4 : c3aec97d
r3 : 7dc3aec9  r2 : 87c3aec9  r1 : c3aec8c8  r0 : c3aec970
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 397F  Table: A3EDC000  DAC: 0000001D
Process kupdated (pid: 6, stackpage=c003b000)
Stack: (0xc003bf6c to 0xc003c000)
bf60:                            c01597b4 c0135e4c 80000013 ffffffff
00000001
bf80: c3aec8c0 c3ecec00 c3ecec60 c003bfbc c003bf9c c01597b4 c0135e28
c0116928
bfa0: c003a000 c003a334 c003a344 c0296c48 c003bfd4 c003bfc0 c0149270
c01596e0
bfc0: c0116928 c003a000 c003bff4 c003bfd8 c01495d4 c014926c 00000000
00010e00
bfe0: c02a6cfc c02a6cf0 00000000 c003bff8 c0119ca4 c01494a8 08d8418e
b6d9d641
Backtrace:
Function entered at [<c0135e1c>] from [<c01597b4>]
 r7 = C3ECEC60  r6 = C3ECEC00  r5 = C3AEC8C0  r4 = 00000001
Function entered at [<c01596d4>] from [<c0149270>]
 r8 = C0296C48  r7 = C003A344  r6 = C003A334  r5 = C003A000
 r4 = C0116928
Function entered at [<c0149260>] from [<c01495d4>]
 r5 = C003A000  r4 = C0116928
Function entered at [<c014949c>] from [<c0119ca4>]
 r7 = C02A6CF0  r6 = C02A6CFC  r5 = 00010E00  r4 = 00000000
Code: 0a00001d e5954010 e5942004 e5943000 (e5832004)


Trace c014949c :     kupdate
Trace c0149260 :    sync_old_buffers
Trace c01596d4 :     sync_unlocked_inodes
Trace c0135e1c :     filemap_fdatawait

Code:
e5832004 :      str r2, [r3,#4]
e5943000 :      ldr r3,[r4]
e5942004 :      ldr r2, [r4,#4]
e5954010 :      ldr r4, [r5,#16]
0a00001d :      beq c0135eb8 <filemap_fdatawait + 0x9c>




Another question: What is inode 95 doing there if the flash is empty?

Thanks.

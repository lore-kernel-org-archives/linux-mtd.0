Received: from mail.windriver.com ([147.11.1.11] helo=mail.wrs.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LukCW-0004m5-Fd
	for linux-mtd@lists.infradead.org; Fri, 17 Apr 2009 09:17:43 +0000
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.wrs.com (8.13.6/8.13.6) with ESMTP id n3H9HZeo001384
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Apr 2009 02:17:35 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [jffs2] jffs2 panic in function
	(__jffs2_dbg_prewrite_paranoia_check() after set
	CONFIG_JFFS2_FS_DEBUG=1
Date: Fri, 17 Apr 2009 11:17:26 +0200
Message-ID: <52CF90264091A14888078A031D780F43D26272@ism-mail03.corp.ad.wrs.com>
From: "Wang, Pengzhuo" <Pengzhuo.Wang@windriver.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
    i'am debugging jffs2 on  developement board based on samsung
smdk2416 cpu.
i'm using 4G(4k-page,5 cycle --> 4096+128) sansung nandflash.
i run the command to create my jffs2 filesytem image :
         mkfs.jffs2 -o test.jffs2 -d <my test directroy > -s 0x1000 -e
0x80000 -n=20
after bootup, run
  mount  -t jffs2 /dev/mtdblock4 /mnt
it works good. and "ls" command can show all file/directory in jffs2
partition
=20
but when i run "cp" command. panic happened.=20
=20
it seem there are some data when jffs2 is trying to write the page
0x24c0000.
=20
anybody can help me ? thanks in advance.
=20
the following is my log:=20
# cp bin/busybox  etc/
jffs2_lookup()
jffs2_create()
jffs2_new_inode(): dir_i 5, mode 0x81ed
[JFFS2 DBG] (822) jffs2_add_ino_cache: add c3e33260 (ino #480)
jffs2_do_new_inode(): Assigned ino# 480
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x39000 bytes at 0x247000
jffs2_do_create(): reserved 0x39000 bytes
jffs2_add_physical_node_ref(): Node at 0x247000(2), size 0x44
[JFFS2 DBG] (822) jffs2_link_node_ref: Last node at c3e303fc is
(00246dc5,00000000)
[JFFS2 DBG] (822) jffs2_link_node_ref: New ref is c3e30408 (fffffffe
becomes 00247002,00000000) len 0x44
jffs2_write_dnode wrote node at 0x00247000(2) with dsize 0x0, csize 0x0,
node_crc 0x27793cc5, data_crc 0x00000000, totlen 0x00000044
jffs2_do_create created file with mode 0x81ed
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
jffs2_reserve_space(): Requested 0x30 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x38fbc bytes at 0x247044
jffs2_write_dirent(ino #5, name at *0xc3e07570 "busybox"->ino #480,
name_crc 0x186b259f)
jffs2_add_physical_node_ref(): Node at 0x247044(2), size 0x30
[JFFS2 DBG] (822) jffs2_link_node_ref: Last node at c3e30408 is
(00247002,c3e33260)
[JFFS2 DBG] (822) jffs2_link_node_ref: New ref is c3e30414 (fffffffe
becomes 00247046,00000000) len 0x30
[JFFS2 DBG] (822) jffs2_add_fd_to_list: add dirent "busybox", ino #480
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
jffs2_create: Created ino #480 with mode 100755, nlink 1(1). nrpages 0
jffs2_read_inode_range: ino #22, range 0x00000000-0x00001000
Reading 0-4096 from node at 0x00000910 (2)
Node read from 00000910: node_crc 19b39e24, calculated CRC 19b39e24.
dsize 1000, csize 667, offset 0, buf c3e51000
jffs2_read_inode_range: ino #22, range 0x00001000-0x00002000
Reading 4096-8192 from node at 0x00000fbc (2)
Node read from 00000fbc: node_crc c99ea1ac, calculated CRC c99ea1ac.
dsize 1000, csize 66d, offset 1000, buf c3e52000
jffs2_read_inode_range: ino #22, range 0x00002000-0x00003000
Reading 8192-12288 from node at 0x00001670 (2)
Node read from 00001670: node_crc bc0aa5ca, calculated CRC bc0aa5ca.
dsize 1000, csize 41b, offset 2000, buf c3e53000
jffs2_read_inode_range: ino #22, range 0x00003000-0x00004000
Reading 12288-16384 from node at 0x00001ad0 (2)
Node read from 00001ad0: node_crc 059274b7, calculated CRC 059274b7.
dsize 1000, csize 4c8, offset 3000, buf c3e54000
jffs2_prepare_write()
end prepare_write(). pg->flags 1
jffs2_commit_write(): ino #480, page at 0x0, range 0-4096, flags 201
jffs2_write_inode_range(): Ino #480, ofs 0x0, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x38f8c bytes at 0x247074
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 2463, total_in 4084,
total_out 1621
calling deflate with avail_in 12, avail_out 2463
deflate returned with avail_in 0, avail_out 2452, total_in 4096,
total_out 1632
zlib compressed 4096 bytes into 1639
jffs2_add_physical_node_ref(): Node at 0x247074(2), size 0x6ac
[JFFS2 DBG] (822) jffs2_link_node_ref: Last node at c3e30414 is
(00247046,c3e2aeec)
[JFFS2 DBG] (822) jffs2_link_node_ref: New ref is c3e30420 (fffffffe
becomes 00247076,00000000) len 0x6ac
jffs2_write_dnode wrote node at 0x00247074(2) with dsize 0x1000, csize
0x667, node_crc 0xa442d6d9, data_crc 0x293101bb, totlen 0x000006ab
[JFFS2 DBG] (822) jffs2_add_full_dnode_to_inode: adding node 0x00-0x1000
@0x00247074 on flash, newfrag *c3dc3d28
Obsoleting node at 0x00247000 of len 0x44: Wasting
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
increasing writtenlen by 4096
jffs2_commit_write() returning 0
jffs2_prepare_write()
end prepare_write(). pg->flags 1
jffs2_commit_write(): ino #480, page at 0x1000, range 0-4096, flags 201
jffs2_write_inode_range(): Ino #480, ofs 0x1000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x388e0 bytes at 0x247720
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 2450, total_in 4084,
total_out 1634
calling deflate with avail_in 12, avail_out 2450
deflate returned with avail_in 0, avail_out 2445, total_in 4096,
total_out 1639
zlib compressed 4096 bytes into 1645
jffs2_add_physical_node_ref(): Node at 0x247720(2), size 0x6b4
[JFFS2 DBG] (822) jffs2_link_node_ref: Last node at c3e30420 is
(00247076,c3e30408)
[JFFS2 DBG] (822) jffs2_link_node_ref: New ref is c3e3042c (fffffffe
becomes 00247722,00000000) len 0x6b4
jffs2_write_dnode wrote node at 0x00247720(2) with dsize 0x1000, csize
0x66d, node_crc 0xc9cd08e4, data_crc 0x87073260, totlen 0x000006b1
[JFFS2 DBG] (822) jffs2_add_full_dnode_to_inode: adding node
0x1000-0x2000 @0x00247720 on flash, newfrag *c3dc3d40
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
increasing writtenlen by 4096
jffs2_commit_write() returning 0
jffs2_read_inode_range: ino #22, range 0x00004000-0x00005000
Reading 16384-20480 from node at 0x00001fdc (2)
Node read from 00001fdc: node_crc 7219cdbf, calculated CRC 7219cdbf.
dsize 1000, csize b0d, offset 4000, buf c3e5b000
jffs2_read_inode_range: ino #22, range 0x00005000-0x00006000
Reading 20480-24576 from node at 0x00002b30 (2)
Node read from 00002b30: node_crc fb6fea8c, calculated CRC fb6fea8c.
dsize 1000, csize ab5, offset 5000, buf c3e5c000
jffs2_read_inode_range: ino #22, range 0x00006000-0x00007000
Reading 24576-28672 from node at 0x0000362c (2)
Node read from 0000362c: node_crc 785be135, calculated CRC 785be135.
dsize 1000, csize a8e, offset 6000, buf c3e5d000
jffs2_read_inode_range: ino #22, range 0x00007000-0x00008000
Reading 28672-32768 from node at 0x00004100 (2)
Node read from 00004100: node_crc 12458d74, calculated CRC 12458d74.
dsize 1000, csize a81, offset 7000, buf c3e5e000
jffs2_read_inode_range: ino #22, range 0x00008000-0x00009000
Reading 32768-36864 from node at 0x00004bc8 (2)
Node read from 00004bc8: node_crc 76213942, calculated CRC 76213942.
dsize 1000, csize b50, offset 8000, buf c3e5f000
jffs2_read_inode_range: ino #22, range 0x00009000-0x0000a000
Reading 36864-40960 from node at 0x0000575c (2)
Node read from 0000575c: node_crc 999c076f, calculated CRC 999c076f.
dsize 1000, csize a60, offset 9000, buf c3e60000
jffs2_read_inode_range: ino #22, range 0x0000a000-0x0000b000
Reading 40960-45056 from node at 0x00006200 (2)
Node read from 00006200: node_crc c6f025b9, calculated CRC c6f025b9.
dsize 1000, csize a19, offset a000, buf c3e61000
jffs2_read_inode_range: ino #22, range 0x0000b000-0x0000c000
Reading 45056-49152 from node at 0x00006c60 (2)
Node read from 00006c60: node_crc 5136ee32, calculated CRC 5136ee32.
dsize 1000, csize aa2, offset b000, buf c3e62000
jffs2_prepare_write()
end prepare_write(). pg->flags 1
jffs2_commit_write(): ino #480, page at 0x2000, range 0-4096, flags 201
jffs2_write_inode_range(): Ino #480, ofs 0x2000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x3822c bytes at 0x247dd4
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 3050, total_in 4084,
total_out 1034
calling deflate with avail_in 12, avail_out 3050
deflate returned with avail_in 0, avail_out 3039, total_in 4096,
total_out 1045
zlib compressed 4096 bytes into 1051
jffs2_add_physical_node_ref(): Node at 0x247dd4(2), size 0x460
[JFFS2 DBG] (822) jffs2_link_node_ref: Last node at c3e3042c is
(00247722,c3e30420)
[JFFS2 DBG] (822) jffs2_link_node_ref: New ref is c3e30438 (fffffffe
becomes 00247dd6,00000000) len 0x460
jffs2_write_dnode wrote node at 0x00247dd4(2) with dsize 0x1000, csize
0x41b, node_crc 0xaed710de, data_crc 0xb4699b9e, totlen 0x0000045f
[JFFS2 DBG] (822) jffs2_add_full_dnode_to_inode: adding node
0x2000-0x3000 @0x00247dd4 on flash, newfrag *c3dc3d58
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
increasing writtenlen by 4096
jffs2_commit_write() returning 0
jffs2_prepare_write()
end prepare_write(). pg->flags 1
jffs2_commit_write(): ino #480, page at 0x3000, range 0-4096, flags 201
jffs2_write_inode_range(): Ino #480, ofs 0x3000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x37dcc bytes at 0x248234
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 2878, total_in 4084,
total_out 1206
calling deflate with avail_in 12, avail_out 2878
deflate returned with avail_in 0, avail_out 2866, total_in 4096,
total_out 1218
zlib compressed 4096 bytes into 1224
jffs2_add_physical_node_ref(): Node at 0x248234(2), size 0x50c
[JFFS2 DBG] (822) jffs2_link_node_ref: Last node at c3e30438 is
(00247dd6,c3e3042c)
[JFFS2 DBG] (822) jffs2_link_node_ref: New ref is c3e30444 (fffffffe
becomes 00248236,00000000) len 0x50c
jffs2_write_dnode wrote node at 0x00248234(2) with dsize 0x1000, csize
0x4c8, node_crc 0x0d55f95c, data_crc 0xca26a925, totlen 0x0000050c
[JFFS2 DBG] (822) jffs2_add_full_dnode_to_inode: adding node
0x3000-0x4000 @0x00248234 on flash, newfrag *c3dc3d70
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
increasing writtenlen by 4096
jffs2_commit_write() returning 0
jffs2_read_inode_range: ino #22, range 0x0000c000-0x0000d000
Reading 49152-53248 from node at 0x00007748 (2)
Node read from 00007748: node_crc ea891d04, calculated CRC ea891d04.
dsize 1000, csize a04, offset c000, buf c3e66000
jffs2_read_inode_range: ino #22, range 0x0000d000-0x0000e000
Reading 53248-57344 from node at 0x00008190 (2)
Node read from 00008190: node_crc 58246702, calculated CRC 58246702.
dsize 1000, csize 98f, offset d000, buf c3e67000
jffs2_read_inode_range: ino #22, range 0x0000e000-0x0000f000
Reading 57344-61440 from node at 0x00008b64 (2)
Node read from 00008b64: node_crc 2b51754c, calculated CRC 2b51754c.
dsize 1000, csize a9f, offset e000, buf c3e68000
jffs2_read_inode_range: ino #22, range 0x0000f000-0x00010000
Reading 61440-65536 from node at 0x00009648 (2)
Node read from 00009648: node_crc a8523e74, calculated CRC a8523e74.
dsize 1000, csize 9e1, offset f000, buf c3e69000
jffs2_read_inode_range: ino #22, range 0x00010000-0x00011000
Reading 65536-69632 from node at 0x0000a070 (2)
Node read from 0000a070: node_crc e06401eb, calculated CRC e06401eb.
dsize 1000, csize a3e, offset 10000, buf c3e6a000
jffs2_read_inode_range: ino #22, range 0x00011000-0x00012000
Reading 69632-73728 from node at 0x0000aaf4 (2)
Node read from 0000aaf4: node_crc eb2ac088, calculated CRC eb2ac088.
dsize 1000, csize 9cc, offset 11000, buf c3e6b000
jffs2_read_inode_range: ino #22, range 0x00012000-0x00013000
Reading 73728-77824 from node at 0x0000b504 (2)
Node read from 0000b504: node_crc dfa2b7c6, calculated CRC dfa2b7c6.
dsize 1000, csize a9f, offset 12000, buf c3e6c000
jffs2_read_inode_range: ino #22, range 0x00013000-0x00014000
Reading 77824-81920 from node at 0x0000bfe8 (2)
Node read from 0000bfe8: node_crc d3b78049, calculated CRC d3b78049.
dsize 1000, csize a92, offset 13000, buf c3e6d000
jffs2_read_inode_range: ino #22, range 0x00014000-0x00015000
Reading 81920-86016 from node at 0x0000cac0 (2)
Node read from 0000cac0: node_crc 0bc927e0, calculated CRC 0bc927e0.
dsize 1000, csize ab0, offset 14000, buf c3e6e000
jffs2_read_inode_range: ino #22, range 0x00015000-0x00016000
Reading 86016-90112 from node at 0x0000d5b4 (2)
Node read from 0000d5b4: node_crc 7871529b, calculated CRC 7871529b.
dsize 1000, csize 9e2, offset 15000, buf c3e6f000
jffs2_read_inode_range: ino #22, range 0x00016000-0x00017000
Reading 90112-94208 from node at 0x0000dfdc (2)
Node read from 0000dfdc: node_crc 0874cbc1, calculated CRC 0874cbc1.
dsize 1000, csize a41, offset 16000, buf c3e70000
jffs2_read_inode_range: ino #22, range 0x00017000-0x00018000
Reading 94208-98304 from node at 0x0000ea64 (2)
Node read from 0000ea64: node_crc aa1bb8eb, calculated CRC aa1bb8eb.
dsize 1000, csize a3c, offset 17000, buf c3e71000
jffs2_read_inode_range: ino #22, range 0x00018000-0x00019000
Reading 98304-102400 from node at 0x0000f4e4 (2)
Node read from 0000f4e4: node_crc c8e8aa9e, calculated CRC c8e8aa9e.
dsize 1000, csize a3c, offset 18000, buf c3e72000
jffs2_read_inode_range: ino #22, range 0x00019000-0x0001a000
Reading 102400-106496 from node at 0x0000ff64 (2)
Node read from 0000ff64: node_crc db97b005, calculated CRC db97b005.
dsize 1000, csize 9ee, offset 19000, buf c3e73000
jffs2_read_inode_range: ino #22, range 0x0001a000-0x0001b000
Reading 106496-110592 from node at 0x00010998 (2)
Node read from 00010998: node_crc 77ca0030, calculated CRC 77ca0030.
dsize 1000, csize a0f, offset 1a000, buf c3e74000
jffs2_read_inode_range: ino #22, range 0x0001b000-0x0001c000
Reading 110592-114688 from node at 0x000113ec (2)
Node read from 000113ec: node_crc b9bab3d6, calculated CRC b9bab3d6.
dsize 1000, csize a68, offset 1b000, buf c3e75000
jffs2_prepare_write()
end prepare_write(). pg->flags 1
jffs2_commit_write(): ino #480, page at 0x4000, range 0-4096, flags 201
jffs2_write_inode_range(): Ino #480, ofs 0x4000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x378c0 bytes at 0x248740
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1272, total_in 4084,
total_out 2812
calling deflate with avail_in 12, avail_out 1272
deflate returned with avail_in 0, avail_out 1261, total_in 4096,
total_out 2823
zlib compressed 4096 bytes into 2829
jffs2_add_physical_node_ref(): Node at 0x248740(2), size 0xb54
[JFFS2 DBG] (822) jffs2_link_node_ref: Last node at c3e30444 is
(00248236,c3e30438)
[JFFS2 DBG] (822) jffs2_link_node_ref: New ref is c3e30450 (fffffffe
becomes 00248742,00000000) len 0xb54
jffs2_write_dnode wrote node at 0x00248740(2) with dsize 0x1000, csize
0xb0d, node_crc 0xc0f0bd80, data_crc 0x982a3b36, totlen 0x00000b51
[JFFS2 DBG] (822) jffs2_add_full_dnode_to_inode: adding node
0x4000-0x5000 @0x00248740 on flash, newfrag *c3dc3d88
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
increasing writtenlen by 4096
jffs2_commit_write() returning 0
jffs2_prepare_write()
end prepare_write(). pg->flags 1
jffs2_commit_write(): ino #480, page at 0x5000, range 0-4096, flags 201
jffs2_write_inode_range(): Ino #480, ofs 0x5000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x36d6c bytes at 0x249294
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1360, total_in 4084,
total_out 2724
calling deflate with avail_in 12, avail_out 1360
deflate returned with avail_in 0, avail_out 1349, total_in 4096,
total_out 2735
zlib compressed 4096 bytes into 2741
jffs2_add_physical_node_ref(): Node at 0x249294(2), size 0xafc
[JFFS2 DBG] (822) jffs2_link_node_ref: Last node at c3e30450 is
(00248742,c3e30444)
[JFFS2 DBG] (822) jffs2_link_node_ref: New ref is c3e3045c (fffffffe
becomes 00249296,00000000) len 0xafc
jffs2_write_dnode wrote node at 0x00249294(2) with dsize 0x1000, csize
0xab5, node_crc 0x014d98c3, data_crc 0xe7be122c, totlen 0x00000af9
[JFFS2 DBG] (822) jffs2_add_full_dnode_to_inode: adding node
0x5000-0x6000 @0x00249294 on flash, newfrag *c3dc3da0
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
increasing writtenlen by 4096
jffs2_commit_write() returning 0
jffs2_prepare_write()
end prepare_write(). pg->flags 1
jffs2_commit_write(): ino #480, page at 0x6000, range 0-4096, flags 201
jffs2_write_inode_range(): Ino #480, ofs 0x6000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x36270 bytes at 0x249d90
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1399, total_in 4084,
total_out 2685
calling deflate with avail_in 12, avail_out 1399
deflate returned with avail_in 0, avail_out 1388, total_in 4096,
total_out 2696
zlib compressed 4096 bytes into 2702
jffs2_add_physical_node_ref(): Node at 0x249d90(2), size 0xad4
[JFFS2 DBG] (822) jffs2_link_node_ref: Last node at c3e3045c is
(00249296,c3e30450)
[JFFS2 DBG] (822) jffs2_link_node_ref: New ref is c3e30078 (fffffffe
becomes 00249d92,00000000) len 0xad4
jffs2_write_dnode wrote node at 0x00249d90(2) with dsize 0x1000, csize
0xa8e, node_crc 0x1ac74a77, data_crc 0x14ba28d7, totlen 0x00000ad2
[JFFS2 DBG] (822) jffs2_add_full_dnode_to_inode: adding node
0x6000-0x7000 @0x00249d90 on flash, newfrag *c3dc3db8
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
increasing writtenlen by 4096
jffs2_commit_write() returning 0
jffs2_prepare_write()
end prepare_write(). pg->flags 1
jffs2_commit_write(): ino #480, page at 0x7000, range 0-4096, flags 201
jffs2_write_inode_range(): Ino #480, ofs 0x7000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x3579c bytes at 0x24a864
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1412, total_in 4084,
total_out 2672
calling deflate with avail_in 12, avail_out 1412
deflate returned with avail_in 0, avail_out 1401, total_in 4096,
total_out 2683
zlib compressed 4096 bytes into 2689
jffs2_add_physical_node_ref(): Node at 0x24a864(2), size 0xac8
[JFFS2 DBG] (822) jffs2_link_node_ref: Last node at c3e30078 is
(00249d92,c3e3045c)
[JFFS2 DBG] (822) jffs2_link_node_ref: New ref is c3e30084 (fffffffe
becomes 0024a866,00000000) len 0xac8
jffs2_write_dnode wrote node at 0x0024a864(2) with dsize 0x1000, csize
0xa81, node_crc 0xfec3aa1c, data_crc 0xe8c7e940, totlen 0x00000ac5
[JFFS2 DBG] (822) jffs2_add_full_dnode_to_inode: adding node
0x7000-0x8000 @0x0024a864 on flash, newfrag *c3dc3dd0
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
increasing writtenlen by 4096
jffs2_commit_write() returning 0
jffs2_prepare_write()
end prepare_write(). pg->flags 1
jffs2_commit_write(): ino #480, page at 0x8000, range 0-4096, flags 201
jffs2_write_inode_range(): Ino #480, ofs 0x8000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x34cd4 bytes at 0x24b32c
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1207, total_in 4084,
total_out 2877
calling deflate with avail_in 12, avail_out 1207
deflate returned with avail_in 0, avail_out 1195, total_in 4096,
total_out 2889
zlib compressed 4096 bytes into 2896
jffs2_add_physical_node_ref(): Node at 0x24b32c(2), size 0xb94
[JFFS2 DBG] (822) jffs2_link_node_ref: Last node at c3e30084 is
(0024a866,c3e30078)
[JFFS2 DBG] (822) jffs2_link_node_ref: New ref is c3e30090 (fffffffe
becomes 0024b32e,00000000) len 0xb94
jffs2_write_dnode wrote node at 0x0024b32c(2) with dsize 0x1000, csize
0xb50, node_crc 0x2089e3fe, data_crc 0x648d0297, totlen 0x00000b94
[JFFS2 DBG] (822) jffs2_add_full_dnode_to_inode: adding node
0x8000-0x9000 @0x0024b32c on flash, newfrag *c3dc3de8
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
increasing writtenlen by 4096
jffs2_commit_write() returning 0
jffs2_prepare_write()
end prepare_write(). pg->flags 1
jffs2_commit_write(): ino #480, page at 0x9000, range 0-4096, flags 201
jffs2_write_inode_range(): Ino #480, ofs 0x9000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x34140 bytes at 0x24bec0
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1447, total_in 4084,
total_out 2637
calling deflate with avail_in 12, avail_out 1447
deflate returned with avail_in 0, avail_out 1434, total_in 4096,
total_out 2650
zlib compressed 4096 bytes into 2656
jffs2_add_physical_node_ref(): Node at 0x24bec0(2), size 0xaa4
[JFFS2 DBG] (822) jffs2_link_node_ref: Last node at c3e30090 is
(0024b32e,c3e30084)
[JFFS2 DBG] (822) jffs2_link_node_ref: New ref is c3e3009c (fffffffe
becomes 0024bec2,00000000) len 0xaa4
jffs2_write_dnode wrote node at 0x0024bec0(2) with dsize 0x1000, csize
0xa60, node_crc 0x72963c66, data_crc 0x58cd273b, totlen 0x00000aa4
[JFFS2 DBG] (822) jffs2_add_full_dnode_to_inode: adding node
0x9000-0xa000 @0x0024bec0 on flash, newfrag *c3dc3e00
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
increasing writtenlen by 4096
jffs2_commit_write() returning 0
jffs2_prepare_write()
end prepare_write(). pg->flags 1
jffs2_commit_write(): ino #480, page at 0xa000, range 0-4096, flags 201
jffs2_write_inode_range(): Ino #480, ofs 0xa000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x3369c bytes at 0x24c964
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1520, total_in 4084,
total_out 2564
calling deflate with avail_in 12, avail_out 1520
deflate returned with avail_in 0, avail_out 1505, total_in 4096,
total_out 2579
zlib compressed 4096 bytes into 2585
s3c-nand: ECC uncorrectable error detected
s3c-nand: ECC uncorrectable error detected
s3c-nand: 2 bit(s) error detected, corrected successfully
s3c-nand: 4 bit(s) error detected, corrected successfully
s3c-nand: 3 bit(s) error detected, corrected successfully
s3c-nand: 3 bit(s) error detected, corrected successfully
s3c-nand: 1 bit(s) error detected, corrected successfully
s3c-nand: 3 bit(s) error detected, corrected successfully
mtd->read(0xa5d bytes from 0x24c964) returned ECC error
JFFS2 error: (822) __jffs2_dbg_prewrite_paranoia_check: argh, about to
write node to 0x24c964 on flash, but there are data already there. The
first corrupted byte is at 0x24d3c1 offset.
[JFFS2 DBG] dump from offset 0x24c964 to offset 0x24d3c1 (a5d bytes).
0x24c960:             ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24c980: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24c9a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24c9c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24c9e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24ca00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24ca20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24ca40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24ca60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24ca80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24caa0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cac0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cae0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cb00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cb20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cb40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cb60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cb80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cba0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cbc0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cbe0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cc00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cc20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cc40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cc60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cc80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cca0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24ccc0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cce0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cd00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cd20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cd40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cd60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cd80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cda0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cdc0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cde0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24ce00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24ce20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24ce40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24ce60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24ce80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cea0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cec0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cee0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cf00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cf20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cf40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cf60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cf80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cfa0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cfc0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff=20
0x24cfe0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff 85 19 02 e0=20
0x24d000: 44 00 00 00 1d fb f7 98 e0 01 00 00 01 00 00 00 ed 81 00 00 00
00 00 00 00 00 00 00 80 03 00 00=20
0x24d020: 80 03 00 00 80 03 00 00 00 00 00 00 00 00 40 00 00 00 00 00 00
00 00 00 00 00 00 00 c5 3c 79 27=20
0x24d040: 85 19 01 e0 2f 00 00 00 b1 f9 44 f2 05 00 00 00 dc 00 00 00 e0
01 00 00 80 03 00 00 07 08 ff ff=20
0x24d060: d6 1e 26 de 9f 25 6b 18 62 75 73 79 62 6f 78 ff 85 19 02 e0 ab
06 00 00 c1 d6 66 12 e0 01 00 00=20
0x24d080: 02 00 00 00 ed 81 00 00 00 00 00 00 00 10 00 00 81 03 00 20 81
03 00 00 81 03 00 00 00 00 00 00=20
0x24d0a0: 67 06 00 00 00 10 00 00 06 00 00 00 bb 01 31 29 d9 d6 42 a4 78
5e c4 97 7b 7c 96 63 98 c7 ef de=20
0x24d0c0: b6 5a f5 96 0e eb 7c 5a ad c3 3a ad 64 88 c2 b0 4e 44 45 94 84
95 b0 98 8a 16 eb 40 8b 50 1a 4d=20
0x24d0e0: c2 3a 60 08 45 08 71 12 4d 9a 50 84 ca 10 8a 45 27 35 84 24 f2
fd bd bb 9e 8f db fb 59 fc e1 0f=20
0x24d100: cf e7 f3 fb 5c d7 ef fe 5d d7 75 5f cf fd 3e cf fd dc ef 94 9e
ff 7a 55 a8 50 c1 05 57 c8 25 39=20
0x24d120: b1 d2 15 ce a5 60 d7 86 62 5d c8 b9 98 14 97 e0 e2 d0 9a b8 c6
d2 c7 86 77 c4 b8 70 46 6c 04 0d=20
0x24d140: 88 13 62 0c 95 b0 ca 4d c9 29 43 a4 20 88 35 bd a2 34 78 ca d4
32 d4 81 0b ca b7 d0 b2 76 94 0b=20
0x24d160: 92 98 4b 50 be 78 a4 db 52 a2 4b 19 01 79 71 ce 4d 1b ed 9c e6
0d f4 bc 03 31 2e ef 40 a5 08 ea=20
0x24d180: 57 71 11 04 3a f7 e3 c2 e4 87 c9 15 4a 55 0e 48 57 0f 03 b7 67
8d 2c 6b e0 ef 57 a0 77 ce 1c 35=20
0x24d1a0: a2 73 e6 c8 4e 99 a3 46 8f cf 4e 1e 37 26 f9 18 e7 2a d3 54 fb
5b c6 97 2d ed 27 ec 3c f3 6b 98=20
0x24d1c0: 26 f3 3e f8 cc c6 af c6 36 33 6d 4d d4 7c 93 d6 e7 5f 3f 8d 8b
c3 1f ce d8 4b 16 77 d0 8b 7f 1a=20
0x24d1e0: bf a9 f1 5b b1 c7 9a 5f 93 9c d9 f8 2d ac ce 63 f8 af 98 96 61
f6 63 6c 35 b0 1d 24 12 f7 08 f6=20
0x24d200: 1e d3 92 b0 53 c0 8f e0 6d f0 14 60 29 5d 6a 54 af 6f c0 8f 03
d7 82 3d 40 eb d9 92 5a 95 c0 7b=20
0x24d220: f8 4f 00 7e 23 f7 60 54 de 7c 78 8e 8d 35 27 b6 2e 78 13 1e 8b
fd 1c bb 12 5c 66 fa 37 d8 4b c0=20
0x24d240: 16 e3 df 61 79 7c dc 3b 20 c9 ee 6f 28 7e 3d 6f cd 14 ba 17 5c
64 39 d7 7b f3 7f 80 ff 05 78 15=20
0x24d260: b4 b1 9c da d8 ad f0 81 5e dc 6e fc c6 8c 37 04 5f e1 df 00 ae
f3 f4 34 f3 f5 0c b4 07 9b e0 a7=20
0x24d280: 83 bb 40 82 69 ab cd 2e c1 ee 07 73 8c 4f c3 8e 03 b5 c8 ab 6f
3d ec f2 6a cb 9d 09 2e b4 b1 a3=20
0x24d2a0: 88 79 17 bf 81 77 8f 4d cc 9f 11 95 17 c3 78 02 d8 6c e3 f1 f8
15 c1 33 f0 56 d8 5b b0 cd bc 9c=20
0x24d2c0: db cd 5f ec ad 35 25 ae 1d 68 63 63 13 b0 1b 40 1d 9b f3 43 fc
2b c1 0b 5e ce 64 fc d3 8c 2f c7=20
0x24d2e0: f6 32 7f 29 76 9d 17 f7 22 fe 46 b0 0d 74 02 17 47 f5 ff 03 fc
57 1b ab ce 7c 7d f1 bf 06 ad 35=20
0x24d300: 37 18 71 da f9 66 ef c7 9e 0d 4e 06 d5 d0 1f c2 3e 6f 5a 23 78
11 fe 61 f0 80 8d 8d c7 2e 00 35=20
0x24d320: bd 79 9f f5 fc df cd 1f 86 bd 11 0c 06 55 a9 73 02 f6 7b 50 00
0e 59 cc dd 51 bd 7f 0a bf dc c6=20
0x24d340: fe 88 d2 fe 2f 1a d9 ff fe c3 d5 d6 cb 6d 67 7e 6b b3 f5 cb a9
db dc c6 f4 2d f8 a7 ab b1 89 da=20
0x24d360: 97 83 4b fb b0 ee 56 40 df 8b 2e c6 8f 2a a7 90 be 1d dd 8e 30
41 7f 1b ef 81 ad ee c5 1c fd 2f=20
0x24d380: 3d 85 d1 cf b2 18 7d db fa 45 c5 27 7a 5c df a5 21 e5 d4 6b 14
35 76 81 c7 eb 96 13 5f 95 b1 33=20
0x24d3a0: a2 c6 7b 18 8f f7 c6 db 9b 7f b3 d9 f4 23 dc 0b 9f a5 c8 75 1b
18 64 7e 65 b3 63 cd 4e=20
kernel BUG at fs/jffs2/debug.c:151!
Unable to handle kernel NULL pointer dereference at virtual address
00000000
pgd =3D c3db4000
[00000000] *pgd=3D33dfe031, *pte=3D00000000, *ppte=3D00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at __bug+0x20/0x2c
LR is at 0x60000013
pc : [<c004e294>]    lr : [<60000013>]    Not tainted
sp : c3e39b80  ip : c03849a0  fp : c3e39b8c
r10: c3e4e528  r9 : c3db2e00  r8 : 00000a5d
r7 : 0024c964  r6 : c3e65000  r5 : c3db2e00  r4 : 00000a5d
r3 : 00000000  r2 : 00000001  r1 : 00000001  r0 : 00000027
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 5317F
Table: 33DB4000  DAC: 00000015
Process sh (pid: 822, stack limit =3D 0xc3e38258)
Stack: (0xc3e39b80 to 0xc3e3a000)
9b80: c3e39bc4 c3e39b90 c01252c4 c004e284 0024d3c1 c3e39ba4 c3e65000
c3e39ba8=20
9ba0: b87166de 00000a5d b87166de c3e58000 0024c964 c3dff088 c3e39c44
c3e39bc8=20
9bc0: c011b3d8 c01251b0 c3e39c04 c3e39bd8 c0127f14 c02cfd84 00000a13
00000000=20
9be0: c0389a34 c3e58000 c03899d0 c3e39c70 c3dc8c48 c3e7b000 00000000
00000002=20
9c00: c3e4e528 00000044 c3e58000 00000a19 c3e39c7c 00001000 c00641fc
00000000=20
9c20: 00000000 00000006 00000000 000000a0 c3e4e528 c3dff088 c3e39cac
c3e39c48=20
9c40: c011be60 c011b198 00000a19 00000003 c3e39cbc 00000019 00000006
c3e7b000=20
9c60: c3db2e00 00001000 00000000 00000000 00000a19 00001000 0003369c
c3e58000=20
9c80: c00641fc c3e4e550 c3e4e528 c3dff0b8 c044af60 00000000 00001000
00000000=20
9ca0: c3e39d04 c3e39cb0 c0114dfc c011bbb4 0000a000 00001000 c3e39cd4
c044af60=20
9cc0: c3dff15c c3db2e00 c3dff15c 00000000 c3e38000 00000000 c3e39d04
c02d7320=20
9ce0: c044af60 00000000 c3dff15c 00000000 c3e38000 00001000 c3e39db4
c3e39d08=20
9d00: c008ac64 c0114c88 00000001 c3e39e90 00000001 00001000 c04e55c0
c02d7320=20
9d20: c3dff0b8 00000000 000710e8 00001000 c0067d64 c0067d20 00000382
c3e39f20=20
9d40: c03afba0 00000001 00000000 c044af60 c3e39d84 c3e39d60 c006862c
c0067d4c=20
9d60: 00000382 2d895ee0 c3e39dd8 c3e39d88 c3dff0b8 00000000 c3e39db4
c3e39d88=20
9d80: c00c0b48 e50685e0 00000382 c3dff0b8 00002000 00000000 c3e38000
c3e39ee0=20
9da0: 00000000 00002000 c3e39e44 c3e39db8 c008b254 c008a91c 0000a000
00000000=20
9dc0: c3e39ee0 00002000 00000000 00000000 c01182f8 c3e39ee0 c3e39f20
c3e39e90=20
9de0: c3e39e34 c3e39df0 c04e55c0 c3dff15c 00000010 22222222 22222222
00000001=20
9e00: 22222222 22222222 00000001 c3dff124 c3e39e90 c3e39f20 c3dff0b8
c3dff124=20
9e20: c3e39e90 c3e39f20 c3dff0b8 0000a000 00000000 00000001 c3e39e84
c3e39e48=20
9e40: c008b520 c008afd8 00002000 00000000 c04e55c0 c3dff15c c0042b78
c3e39e90=20
9e60: c04e55c0 c3e39f20 00000000 c3e39f78 c3e38000 00000000 c3e39f4c
c3e39e88=20
9e80: c00ab16c c008b4c4 0000a000 00000000 00000040 00000000 00000000
00000001=20
9ea0: ffffffff c04e55c0 00000000 00000000 00000000 00000000 c04d62e0
00000000=20
9ec0: 00000000 00000000 c3e39f34 c04d62e0 c0078ab8 c3e39ed4 c3e39ed4
ffffff9c=20
9ee0: 0000a000 00000000 00000000 c0042b78 c00451e0 c3db4000 c3dfe8b4
00002000=20
9f00: c3e07518 00000002 fe37573a c00451e0 c00451e0 00000000 00000000
c3e39f28=20
9f20: 000710e8 00002000 c3e07598 c04e55c0 000710e8 c3e39f78 00002000
c0049e68=20
9f40: c3e39f74 c3e39f50 c00abab0 c00ab0c0 00000000 ffffffff 0000a000
00000000=20
9f60: c04e55c0 00000004 c3e39fa4 c3e39f78 c00ac0ec c00aba04 0000a000
00000000=20
9f80: 00000005 00000000 00002000 00002000 00002000 000710e8 00000000
c3e39fa8=20
9fa0: c0049cc0 c00ac0b8 00002000 00002000 00000004 000710e8 00002000
00000000=20
9fc0: 00002000 00002000 000710e8 00000004 00000001 00000003 00000004
00000000=20
9fe0: 00000004 bec02818 0002d914 4f58278c 60000010 00000004 60a41d3e
69f60b37=20
Backtrace:=20
[<c004e274>] (__bug+0x0/0x2c) from [<c01252c4>]
(__jffs2_dbg_prewrite_paranoia_check+0x124/0x134)
[<c01251a0>] (__jffs2_dbg_prewrite_paranoia_check+0x0/0x134) from
[<c011b3d8>] (jffs2_write_dnode+0x250/0x640)
 r7 =3D C3DFF088  r6 =3D 0024C964  r5 =3D C3E58000  r4 =3D B87166DE
[<c011b188>] (jffs2_write_dnode+0x0/0x640) from [<c011be60>]
(jffs2_write_inode_range+0x2bc/0x4c8)
[<c011bba4>] (jffs2_write_inode_range+0x0/0x4c8) from [<c0114dfc>]
(jffs2_commit_write+0x184/0x38c)
[<c0114c78>] (jffs2_commit_write+0x0/0x38c) from [<c008ac64>]
(generic_file_buffered_write+0x358/0x6bc)
[<c008a90c>] (generic_file_buffered_write+0x0/0x6bc) from [<c008b254>]
(__generic_file_aio_write_nolock+0x28c/0x4ec)
[<c008afc8>] (__generic_file_aio_write_nolock+0x0/0x4ec) from
[<c008b520>] (generic_file_aio_write+0x6c/0xf8)
[<c008b4b4>] (generic_file_aio_write+0x0/0xf8) from [<c00ab16c>]
(do_sync_write+0xbc/0x108)
[<c00ab0b0>] (do_sync_write+0x0/0x108) from [<c00abab0>]
(vfs_write+0xbc/0x154)
 r8 =3D C0049E68  r7 =3D 00002000  r6 =3D C3E39F78  r5 =3D 000710E8
 r4 =3D C04E55C0=20
[<c00ab9f4>] (vfs_write+0x0/0x154) from [<c00ac0ec>]
(sys_write+0x44/0x74)
 r7 =3D 00000004  r6 =3D C04E55C0  r5 =3D 00000000  r4 =3D 0000A000
[<c00ac0a8>] (sys_write+0x0/0x74) from [<c0049cc0>]
(ret_fast_syscall+0x0/0x2c)
 r6 =3D 000710E8  r5 =3D 00002000  r4 =3D 00002000=20
Code: e1a01000 e59f000c eb0057d0 e3a03000 (e5833000)=20
jffs2_write_super()
jffs2_thread_should_wake(): nr_free_blocks 123, nr_erasing_blocks 0,
dirty_size 0x23c: no
jffs2_erase_pending_blocks completed
jffs2_flush_wbuf_gc() called for ino #0...
Segmentation fault
#=20
#=20
Best Regards
=20
pengzhuo wang(bobwang)
Professional Service | WindRiver P.R.China
Room3-H,New JinQiao Plaza,=20
No.585 Xizhang Rd(M),Shanghai,200003,P.R.C
Tel:86-21-63585586/87/89/90 ext.208 Fax:86-21-63585591

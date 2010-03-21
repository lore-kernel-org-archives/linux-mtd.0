Received: from mail-qy0-f194.google.com ([209.85.221.194])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NtDf2-0000sZ-Ny
	for linux-mtd@lists.infradead.org; Sun, 21 Mar 2010 05:25:21 +0000
Received: by qyk32 with SMTP id 32so2288016qyk.12
	for <linux-mtd@lists.infradead.org>;
	Sat, 20 Mar 2010 22:25:15 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 21 Mar 2010 10:55:15 +0530
Message-ID: <b64a14471003202225g79e959c9v81ddc41b08e8597c@mail.gmail.com>
Subject: Input/Output error while copying large file on JFFS2
From: hitesh hotlani <hitesh.hotlani@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am newbie in JFFS2 file system. I have NOR flash memory of size 128
MB and I am using 62 MB partition of the flash for data. Whenever I
try to copy larger file of size more than 10 MB it gives Input/output
error.
After enabling debugging I got the following messages:

ode_crc 0xbcccaa3c, data_crc 0x5c2859a9, totlen 0x00001044
[JFFS2 DBG] (453) jffs2_add_full_dnode_to_inode: adding node
0x10c9000-0x10ca000 @0x026fee78 on flash, newfrag *86cf37d0
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 324, nr_erasing_blocks 0,
dirty_size 0x148248, vdirty_blocks 8: no
increasing writtenlen by 4096
jffs2_write_end() returning 4096
jffs2_write_begin()
jffs2_read_inode_range: ino #141, range 0x010ca000-0x010cb000
Reading 17604608-17604608 from node at 0x026fee78 (2)
Node read from 026fee78: node_crc bcccaa3c, calculated CRC bcccaa3c.
dsize 1000, csize 1000, offset 10c9000, buf 8305e000
Filling non-frag hole from 17604608-17608704
end write_begin(). pg->flags 9
jffs2_write_end(): ino #141, page at 0x10ca000, range 0-4096, flags 9
jffs2_write_inode_range(): Ino #141, ofs 0x10ca000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x144 bytes at 0x26ffebc
calling deflate with avail_in 244, avail_out 244
deflate returned with avail_in 0, avail_out 0, total_in 244, total_out 244
final deflate returned 0
jffs2_add_physical_node_ref(): Node at 0x26ffebc(2), size 0x144
[JFFS2 DBG] (453) jffs2_link_node_ref: Last node at 86cb6a1c is
(026fee7a,86cb6a14)
[JFFS2 DBG] (453) jffs2_link_node_ref: New ref is 86cb6a24 (fffffffe
becomes 026ffebe,(null)) len 0x144
Adding full erase block at 0x026e0000 to clean_list (free 0x00000000,
dirty 0x00000000, used 0x0001fff4
jffs2_write_dnode wrote node at 0x026ffebc(2) with dsize 0x100, csize
0x100, node_crc 0xfa75572f, data_crc 0x7d5c0b39, totlen 0x00000144
[JFFS2 DBG] (453) jffs2_add_full_dnode_to_inode: adding node
0x10ca000-0x10ca100 @0x026ffebc on flash, newfrag *86cf37b8
jffs2_complete_reservation()
[...] jffs2_thread_should_wake(): nr_free_blocks 323,
nr_erasing_blocks 0, dirty_size 0x148248, vdirty_blocks 8: no
increasing writtenlen by 4096
jffs2_write_end() returning 4096
jffs2_write_begin()
jffs2_read_inode_range: ino #141, range 0x010d1000-0x010d2000
Reading 17633280-17633280 from node at 0x026c60a4 (2)
Node read from 026c60a4: node_crc 8f43416e, calculated CRC 8f43416e.
dsize 1000, csize 1000, offset 10d0000, buf 83065000
Filling non-frag hole from 17633280-17637376
end write_begin(). pg->flags 9
jffs2_write_end(): ino #141, page at 0x10d1000, range 0-4096, flags 9
jffs2_write_inode_range(): Ino #141, ofs 0x10d1000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x18f18 bytes at 0x26c70e8
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 0, total_in 4084, total_out 4084
final deflate returned 0
jffs2_add_physical_node_ref(): Node at 0x26c70e8(2), size 0x1044
[JFFS2 DBG] (453) jffs2_link_node_ref: Last node at 86c4694c is
(026c60a6,86c46944)
[JFFS2 DBG] (453) jffs2_link_node_ref: New ref is 86c46954 (fffffffe
becomes 026c70ea,(null)) len 0x1044
jffs2_write_dnode wrote node at 0x026c70e8(2) with dsize 0x1000, csize
0x1000, node_crc 0x08fb7732, data_crc 0xca42f1df, totlen 0x00001044
[JFFS2 DBG] (453) jffs2_add_full_dnode_to_inode: adding node
0x10d1000-0x10d2000 @0x026c70e8 on flash, newfrag *86cf36f8
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 323, nr_erasing_blocks 0,
dirty_size 0x148248, vdirty_blocks 8: no
increasing writtenlen by 4096
jffs2_write_end() returning 4096
jffs2_write_begin()
jffs2_read_inode_range: ino #141, range 0x010d2000-0x010d3000
Reading 17637376-17637376 from node at 0x026c70e8 (2)
Node read from 026c70e8: node_crc 08fb7732, calculated CRC 08fb7732.
dsize 1000, csize 1000, offset 10d1000, buf 83066000
Data CRC ca42f1df != calculated CRC b08a4494 for node at 026c70e8
jffs2_read_inode_range error -5




When the file size is less then 10 MB it copies it without any issues.

Following command used for copying on Flash:
cp file.tgz /flash/ -f


--Hitesh

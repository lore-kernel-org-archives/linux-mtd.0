Received: from cmsrelay02.mx.net ([165.212.11.111])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3euC-0000x1-Mn
	for linux-mtd@lists.infradead.org; Wed, 17 Mar 2004 17:32:36 +0000
Message-ID: <011201c40c45$d318a160$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: "David Woodhouse" <dwmw2@infradead.org>
References: <002901c406cb$3c049ec0$fd0ba8c0@briantpc>
	<1079387201.5835.344.camel@imladris.demon.co.uk>
	<405686B3.4090607@wasp.net.au>
	<1079424685.5835.404.camel@imladris.demon.co.uk>
Date: Wed, 17 Mar 2004 11:32:29 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: free_list / free_size messages
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



>
> Yes please. It should be harmless; it's just an accounting screwup. We
> seem to have placed a block on the free_list which doesn't actually have
> any significant amount of free space in it at all.
>
> -- 

I am limited to my debugging output, but here is what I caught from syslog
around the "eep".

Thanks for any help.

-Brian

Mar 17 11:34:28 klogd: <7>Node read from 0024702c: node_crc 2760a1ac,
calculated CRC 2760a1ac. dsize c, csize c, offset 0, buf c11bf9a0
Mar 17 11:34:28 klogd: <7>Node read from 0024702c: node_crc 2760a1ac,
calculated CRC 2760a1ac. dsize c, csize c, offset 0, buf c11bf9a0
Mar 17 11:34:28 klogd: <7>Node read from 0024702c: node_crc 2760a1ac,
calculated CRC 2760a1ac. dsize c, csize c, offset 0, buf c11bf9a0
Mar 17 11:34:28 klogd: <7>Node read from 0024702c: node_crc 2760a1ac,
calculated CRC 2760a1ac. dsize c, csize c, offset 0, buf c11bf9a0
Mar 17 11:34:28 klogd: <7>jffs2_prepare_write()
Mar 17 11:34:28 klogd: <7>end prepare_write(). pg->flags 41
Mar 17 11:34:28 klogd: <7>jffs2_commit_write(): ino #1051, page at 0x11000,
range 0-4096, flags 41
Mar 17 11:34:28 klogd: <7>jffs2_write_inode_range(): Ino #1051, ofs 0x11000,
len 0x1000
Mar 17 11:34:28 klogd: <7>jffs2_reserve_space(): Requested 0xc4 bytes
Mar 17 11:34:28 klogd: <7>jffs2_reserve_space(): alloc sem got
Mar 17 11:34:28 klogd: <7>jffs2_do_reserve_space(): Giving 0x494 bytes at
0x83fb6c
Mar 17 11:34:28 klogd: <7>calling deflate with avail_in 1092, avail_out 1092
Mar 17 11:34:28 klogd: <7>deflate returned with avail_in 0, avail_out 0,
total_in 1092, total_out 1092
Mar 17 11:34:28 klogd: <7>final deflate returned 0
Mar 17 11:34:28 klogd: <7>jffs2_add_physical_node_ref(): Node at
0x83fb6c(2), size 0x494
Mar 17 11:34:28 klogd: <7>Adding full erase block at 0x00820000 to
clean_list (free 0x00000000, dirty 0x00000000, used 0x0001f9f4
Mar 17 11:34:28 klogd: <7>jffs2_write_dnode wrote node at 0x0083fb6c(2) with
dsize 0x450, csize 0x450, node_crc 0x9cb7a611, data_crc 0x0600b9fb, totlen
0x00000494
Mar 17 11:34:28 klogd: <7>jffs2_add_full_dnode_to_inode(ino #1051, f
c0026780, fn c02f9520)
Mar 17 11:34:28 klogd: <7>jffs2_complete_reservation()
Mar 17 11:34:28 klogd: <7>jffs2_thread_should_wake(): nr_free_blocks 1,
nr_erasing_blocks 53, dirty_size 0x148: no
Mar 17 11:34:28 klogd: <7>increasing writtenlen by 1104
Mar 17 11:34:28 klogd: <7>jffs2_reserve_space(): Requested 0xc4 bytes
Mar 17 11:34:28 klogd: <7>jffs2_reserve_space(): alloc sem got
Mar 17 11:34:28 klogd: <4>Eep. Block 0x00120000 taken from free_list had
free_size of 0x00000034!!
Mar 17 11:34:28 klogd: <7>Adding full erase block at 0x00120000 to
clean_list (free 0x00000000, dirty 0x00000000, used 0x0001ffcc
Mar 17 11:34:28 klogd: <7>Starting erase of pending block 0x00900000
Mar 17 11:34:28 klogd: <7>Freeing all node refs for eraseblock offset
0x00900000
Mar 17 11:34:28 klogd: <7>Node read from 0024702c: node_crc 2760a1ac,
calculated CRC 2760a1ac. dsize c, csize c, offset 0, buf c11bf9a0
Mar 17 11:34:28 klogd: <7>Node read from 0024702c: node_crc 2760a1ac,
calculated CRC 2760a1ac. dsize c, csize c, offset 0, buf c11bf9a0
Mar 17 11:34:28 klogd: <7>Node read from 0024702c: node_crc 2760a1ac,
calculated CRC 2760a1ac. dsize c, csize c, offset 0, buf c11bf9a0

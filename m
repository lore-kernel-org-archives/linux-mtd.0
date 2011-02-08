Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmocZ-0002zl-Ex
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 14:32:50 +0000
Date: Tue, 8 Feb 2011 15:33:43 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
Message-ID: <20110208153343.5bf352fc@wker>
In-Reply-To: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Holger Brunck <holger.brunck@keymile.com>, Detlev Zundel <dzu@denx.de>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun,  6 Feb 2011 15:17:45 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:
...
> here is a better patch for recovery fix. Comparing to the previous
> patch-set now we make sure we keep write-buffer offset aligned to
> @c->max_write_size (64 in case of CFI NOR) as much as possible.
> 
> Also, I've merged the "Add comments" patch with the patch which adds
> the code.
> 
> You can find these patches also in the UBIFS git tree, 'cfi-nor-fix-v2'
> branch:
> git://git.infradead.org/ubifs-2.6.git cfi-nor-fix-v2
> 
> Please, test. These patches may break NAND setups as well, so anyone
> who is interested in having stable UBIFS in the next release, please,
> also test.

Here is a short summary of another issues we have seen while running
further tests with this v2 patch series. Additionally there seem to be
tree kinds of other corruptions UBIFS can't recover from.

1.
...
UBIFS DBG (pid 1390): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1390): ubifs_recover_leb: look at LEB 113:161616 (100400 bytes left)
UBIFS DBG (pid 1390): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1390): ubifs_recover_leb: look at LEB 113:165760 (96256 bytes left)
UBIFS DBG (pid 1390): scan_padding_bytes: not a node
UBIFS DBG (pid 1390): ubifs_recover_leb: look at LEB 113:165760 (96256 bytes left)
UBIFS DBG (pid 1390): scan_padding_bytes: not a node
UBIFS error (pid 1390): ubifs_recover_leb: garbage
UBIFS error (pid 1390): ubifs_scanned_corruption: corruption at LEB 113:165760
UBIFS error (pid 1390): ubifs_scanned_corruption: first 8192 bytes from LEB 113:165760
00000000: ffff1006 fffff228 ffff0300 ffff0000 ffff0000 ffff0000 ffff0000 ffff0020  .......(.......................
00000020: 47830000 02010000 00100000 00020000 33b34142 43713233 61e24331 32334142  G...............3.ABCq23a.C123AB
00000040: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000060: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000080: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
.. all ffffffff follow

Looking at corrupted data I think that this is an interrupted buffered
write. One flash chip in a bank seem to write faster than the other.
The other chip (which is saving 16-bit data at offsets 0, 4, 8 ...)
didn't finish the write operation at the point in time when the power
cut occurred. Thus, the UBIFS common header node magic is corrupted
and also the data in the data node.

2.
...
UBIFS DBG (pid 1390): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1390): ubifs_recover_leb: look at LEB 42:182336 (79680 bytes left)
UBIFS DBG (pid 1390): ubifs_scan_a_node: scanning unknown node
UBIFS DBG (pid 1390): no_more_nodes: unexpected bad common header at 42:182336
UBIFS DBG (pid 1390): ubifs_recover_leb: look at LEB 42:182336 (79680 bytes left)
UBIFS DBG (pid 1390): ubifs_scan_a_node: scanning unknown node
UBIFS error (pid 1390): ubifs_check_node: bad node type 51
UBIFS error (pid 1390): ubifs_check_node: bad node at LEB 42:182336
        magic          0x6101831
        crc            0x3c0cb370
        node_type      51 (unknown node)
        group_type     51 (unknown)
        sqnum          111611
        len            21105
node type 51 was not recognized
Call Trace:
[c5c35b80] [c0007ecc] show_stack+0x4c/0x16c (unreliable)
[c5c35bc0] [c013e588] ubifs_check_node+0x17c/0x308
[c5c35be0] [c0147e68] ubifs_scan_a_node+0x15c/0x2d8
[c5c35c10] [c015d340] ubifs_recover_leb+0x3f0/0x940
[c5c35c80] [c0148778] replay_buds+0xb4/0xb4c
[c5c35d20] [c0149924] ubifs_replay_journal+0x714/0xf5c
[c5c35da0] [c013ac30] ubifs_fill_super+0xe24/0x16ac
[c5c35e00] [c013c7bc] ubifs_get_sb+0x10c/0x344
[c5c35e80] [c007b4d0] vfs_kern_mount+0x60/0x150
[c5c35ea0] [c007b610] do_kern_mount+0x40/0x100
[c5c35ec0] [c0092210] do_mount+0x40c/0x718
[c5c35f10] [c00925ac] sys_mount+0x90/0xd8
[c5c35f40] [c0010b44] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xfe93d18
    LR = 0x1000347c
UBIFS DBG (pid 1390): no_more_nodes: unexpected bad common header at 42:182336
UBIFS error (pid 1390): ubifs_recover_leb: bad node
UBIFS error (pid 1390): ubifs_scanned_corruption: corruption at LEB 42:182336
UBIFS error (pid 1390): ubifs_scanned_corruption: first 8192 bytes from LEB 42:182336
00000000: 31181006 70b30c3c fbb30100 00000000 71520000 33330000 7b310000 f7430020  1...p..<........qR..33..{1...C.
00000020: 00000000 00000000 00100000 00000000 41424331 32334142 43313233 41424331  ................ABC123ABC123ABC1
00000040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
... all ffffffff follow here

3.
...
UBIFS DBG (pid 1390): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1390): ubifs_recover_leb: look at LEB 22:132608 (129408 bytes left)
UBIFS DBG (pid 1390): ubifs_scan_a_node: hit empty space
UBIFS error (pid 1390): ubifs_recover_leb: corrupt empty space LEB 22:132608, corruption starts at 96
UBIFS error (pid 1390): ubifs_scanned_corruption: corruption at LEB 22:96
UBIFS error (pid 1390): ubifs_scanned_corruption: first 8192 bytes from LEB 22:96
00000000: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
... all ffffffff follow


I'll continue to test with ubi->min_io_size == mtd->writebufsize patch
which has been reverted due to incompatibility with old UBIFS images.
It was more stable and I'll try to solve the remaining issues we have
seen with it when running long power cut tests on some boards.
These were:

1.
...
UBIFS DBG (pid 1400): insert_node: add LEB 141:244672, key (122, inode)
UBIFS DBG (pid 1400): insert_node: add LEB 141:244864, key (122, inode)
UBIFS DBG (pid 1400): ubifs_wbuf_seek_nolock: LEB 141:245056, jhead 1 (base)
UBIFS DBG (pid 1400): insert_ref_node: add ref LEB 141:98880
UBIFS DBG (pid 1400): replay_bud: replay bud LEB 135, head 2
UBIFS DBG (pid 1400): ubifs_recover_leb: 135:95680
UBIFS DBG (pid 1400): ubifs_start_scan: scan LEB 135:95680
UBI DBG (pid 1400): ubi_leb_read: read 166336 bytes from LEB 0:135:95680
UBIFS DBG (pid 1400): ubifs_recover_leb: look at LEB 135:95680 (166336 bytes left)
UBIFS DBG (pid 1400): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1400): no_more_nodes: unexpected data at 135:99840
UBIFS DBG (pid 1400): ubifs_recover_leb: look at LEB 135:95680 (166336 bytes left)
UBIFS DBG (pid 1400): ubifs_scan_a_node: scanning data node
UBIFS error (pid 1400): ubifs_check_node: bad CRC: calculated 0xca337351, read 0x4f8dbd8
UBIFS error (pid 1400): ubifs_check_node: bad node at LEB 135:95680
        magic          0x6101831
        crc            0x4f8dbd8
        node_type      1 (data node)
        group_type     0 (no node group)
        sqnum          2616432
        len            4144
        key            (122, data, 0)
        size           4096
        compr_typ      0
        data size      4096
        data:
        00000000: 41 42 43 31 30 32 41 42 43 31 32 33 41 02 03 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42
        ...
        00000fe0: 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31 32 33 41 42 43 31
Call Trace:
[df7ebb80] [c0007ecc] show_stack+0x4c/0x16c (unreliable)
[df7ebbc0] [c013e4c8] ubifs_check_node+0x17c/0x308
[df7ebbe0] [c0147934] ubifs_scan_a_node+0x15c/0x2d8
[df7ebc10] [c015cd08] ubifs_recover_leb+0x3f0/0x940
[df7ebc80] [c0148244] replay_buds+0xb4/0xb4c
[df7ebd20] [c01493dc] ubifs_replay_journal+0x700/0xf48
[df7ebda0] [c013aba8] ubifs_fill_super+0xd9c/0x15fc
[df7ebe00] [c013c6fc] ubifs_get_sb+0x10c/0x344
[df7ebe80] [c007b4d0] vfs_kern_mount+0x60/0x150
[df7ebea0] [c007b610] do_kern_mount+0x40/0x100
[df7ebec0] [c0092210] do_mount+0x40c/0x718
[df7ebf10] [c00925ac] sys_mount+0x90/0xd8
[df7ebf40] [c0010b44] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xfe93d18
    LR = 0x1000347c
UBIFS DBG (pid 1400): no_more_nodes: unexpected data at 135:99840
UBIFS error (pid 1400): ubifs_recover_leb: bad node
UBIFS error (pid 1400): ubifs_scanned_corruption: corruption at LEB 135:95680
UBIFS error (pid 1400): ubifs_scanned_corruption: first 8192 bytes from LEB 135:95680
00000000: 31181006 d8dbf804 70ec2700 00000000 30100000 01000000 7a000000 00000020  1.......p.'.....0.......z......
00000020: 00000000 00000000 00100000 00000000 41424331 30324142 43313233 41020331  ................ABC102ABC123A..1
00000040: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000060: 41424331 32334142 43313233 41424331 32334142 43313233 41424331 32334142  ABC123ABC123ABC123ABC123ABC123AB
...

2.
...
UBIFS DBG (pid 1416): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1416): ubifs_recover_leb: look at LEB 139:116088 (145928 bytes left)
UBIFS DBG (pid 1416): ubifs_scan_a_node: scanning unknown node
UBIFS DBG (pid 1416): no_more_nodes: unexpected bad common header at 139:116088
UBIFS DBG (pid 1416): ubifs_recover_leb: look at LEB 139:116088 (145928 bytes left)
UBIFS DBG (pid 1416): ubifs_scan_a_node: scanning unknown node
UBIFS error (pid 1416): ubifs_check_node: bad node type 255
UBIFS error (pid 1416): ubifs_check_node: bad node at LEB 139:116088
        magic          0x6101831
        crc            0x46a2df3b
        node_type      255 (unknown node)
        group_type     255 (unknown)
        sqnum          18446744073709551615
        len            4294967295
node type 255 was not recognized
Call Trace:
[df7f3b80] [c0007ecc] show_stack+0x4c/0x16c (unreliable)
[df7f3bc0] [c013e4c8] ubifs_check_node+0x17c/0x308
[df7f3be0] [c0147934] ubifs_scan_a_node+0x15c/0x2d8
[df7f3c10] [c015cd08] ubifs_recover_leb+0x3f0/0x940
[df7f3c80] [c0148244] replay_buds+0xb4/0xb4c
[df7f3d20] [c01493dc] ubifs_replay_journal+0x700/0xf48
[df7f3da0] [c013aba8] ubifs_fill_super+0xd9c/0x15fc
[df7f3e00] [c013c6fc] ubifs_get_sb+0x10c/0x344
[df7f3e80] [c007b4d0] vfs_kern_mount+0x60/0x150
[df7f3ea0] [c007b610] do_kern_mount+0x40/0x100
[df7f3ec0] [c0092210] do_mount+0x40c/0x718
[df7f3f10] [c00925ac] sys_mount+0x90/0xd8
[df7f3f40] [c0010b44] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xfe93d18
    LR = 0x1000347c
UBIFS DBG (pid 1416): no_more_nodes: unexpected bad common header at 139:116088
UBIFS error (pid 1416): ubifs_recover_leb: bad node
UBIFS error (pid 1416): ubifs_scanned_corruption: corruption at LEB 139:116088
UBIFS error (pid 1416): ubifs_scanned_corruption: first 8192 bytes from LEB 139:116088
00000000: 31181006 3bdfa246 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  1...;..F........................
00000020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
00000040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
00000060: ffffffff ffffffff 4647fdeb ee4bdded 4e4f50d1 5253f675 56577d59 5a5b7d5f  ........FG...K..NOP.RS.uVW}YZ[}_
00000080: 5e5f6061 62636465 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ^_`abcde........................
000000a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
...

3.
UBI DBG (pid 1432): ctrl_cdev_ioctl: attach MTD device
UBI: attaching mtd5 to ubi1
UBI DBG (pid 1432): io_init: min_io_size      64
UBI DBG (pid 1432): io_init: hdrs_min_io_size 1
UBI DBG (pid 1432): io_init: ec_hdr_alsize    64
UBI DBG (pid 1432): io_init: vid_hdr_alsize   64
UBI DBG (pid 1432): io_init: vid_hdr_offset   64
UBI DBG (pid 1432): io_init: vid_hdr_aloffset 64
UBI DBG (pid 1432): io_init: vid_hdr_shift    0
UBI DBG (pid 1432): io_init: leb_start        128
UBI DBG (pid 1432): io_init: max_erroneous    20
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    262016 bytes
UBI: smallest flash I/O unit:    64
UBI: sub-page size:              1
UBI: VID header offset:          64 (aligned 64)
UBI: data offset:                128
UBI DBG (pid 1432): ubi_scan: process PEB 0
...
UBI DBG (pid 1432): ubi_scan: process PEB 169
UBI error: check_corruption: PEB 169 contains corrupted VID header, and the data does not contain all 0xFF, this may be a non-UBI PEB or a severe VID header corruption which requires manual inspection
Volume identifier header dump:
        magic     55424921
        version   1
        vol_type  1
        copy_flag 0
        compat    0
        vol_id    0
        lnum      5
        data_size 0
        used_ebs  0
        data_pad  0
        sqnum     86129
        hdr_crc   ca7e9d94
Volume identifier header hexdump:
00000000: 55 42 49 21 01 01 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  UBI!............................
00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 01 50 71 00 00 00 00 00 00 00 00 00 00 00 00 ca 7e 9d 94  ..............Pq.............~..
UBI DBG (pid 1432): check_corruption: hexdump of PEB 169 offset 128, length 262016
00000000: 31 18 10 06 f5 c8 8c 23 6b 33 96 00 00 00 00 00 20 00 00 00 0a 00 00 00 be 19 00 00 00 00 00 00  1......#k3...... ...............
00000020: 31 18 10 06 69 b9 e5 3b 6c 33 96 00 00 00 00 00 40 00 00 00 08 00 00 00 b4 00 00 00 c0 97 03 00  1...i..;l3......@...............
00000040: 01 00 00 00 20 00 01 41 c6 95 2c 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 7c 20 00 01 49  .... ..A..,................| ..I
00000060: 31 18 10 06 e1 bc 3c 93 6d 33 96 00 00 00 00 00 40 00 00 00 08 00 00 00 bf 00 00 00 80 ef 03 00  1.....<.m3......@...............
00000080: 02 00 00 00 00 00 00 00 00 00 00 7c 20 00 01 59 c6 95 10 60 00 00 00 00 00 00 00 00 00 00 00 00  ...........| ..Y...`............
000000a0: 31 18 10 06 3c 5d ba 3e 00 00 00 00 00 00 00 00 1c 00 00 00 05 00 00 00 04 00 00 00 00 00 00 00  1...<].>........................
000000c0: 31 18 10 06 87 59 3f 7a db 33 96 00 00 00 00 00 40 00 00 00 08 00 00 00 14 00 00 00 00 00 00 00  1....Y?z.3......@...............
000000e0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000100: 31 18 10 06 18 59 f5 a1 58 34 96 00 00 00 00 00 40 00 00 00 08 00 00 00 b3 00 00 00 00 00 00 00  1....Y..X4......@...............
00000120: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000140: 31 18 10 06 2b f2 21 1d d5 34 96 00 00 00 00 00 40 00 00 00 08 00 00 00 b0 00 00 00 00 00 00 00  1...+.!..4......@...............
00000160: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000180: 31 18 10 06 c0 ed 31 de ef 34 96 00 00 00 00 00 40 00 00 00 08 00 00 00 ae 00 00 00 00 00 00 00  1.....1..4......@...............
000001a0: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
000001c0: 31 18 10 06 5e 86 b7 ef 53 35 96 00 00 00 00 00 40 00 00 00 08 00 00 00 0f 00 00 00 00 00 00 00  1...^...S5......@...............
000001e0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000200: 31 18 10 06 be 88 e4 03 d0 35 96 00 00 00 00 00 40 00 00 00 08 00 00 00 11 00 00 00 00 00 00 00  1........5......@...............
00000220: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000240: 31 18 10 06 c5 ca 57 23 4d 36 96 00 00 00 00 00 40 00 00 00 08 00 00 00 b2 00 00 00 00 00 00 00  1.....W#M6......@...............
00000260: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000280: 31 18 10 06 3f 9b 80 98 ca 36 96 00 00 00 00 00 40 00 00 00 08 00 00 00 b5 00 00 00 00 00 00 00  1...?....6......@...............
000002a0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
000002c0: 31 18 10 06 dd 34 a8 d4 47 37 96 00 00 00 00 00 40 00 00 00 08 00 00 00 15 00 00 00 00 00 00 00  1....4..G7......@...............
000002e0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000300: 31 18 10 06 b4 08 d3 9c c4 37 96 00 00 00 00 00 40 00 00 00 08 00 00 00 10 00 00 00 00 00 00 00  1........7......@...............
00000320: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000340: 31 18 10 06 76 0c 10 98 41 38 96 00 00 00 00 00 40 00 00 00 08 00 00 00 c0 00 00 00 00 00 00 00  1...v...A8......@...............
00000360: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000380: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................................
...
0003ff60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................................
UBI DBG (pid 1432): ubi_scan: process PEB 170
...
UBI DBG (pid 1432): ubi_scan: process PEB 207
UBI DBG (pid 1432): ubi_scan: scanning is finished
UBI error: check_what_we_have: 1 PEBs are corrupted and preserved
Corrupted PEBs are: 169
UBI: max. sequence number:       86169
UBI DBG (pid 1432): process_lvol: check layout volume
UBI error: ubi_eba_init_scan: no enough physical eraseblocks (0, need 1)
UBI error: ubi_eba_init_scan: 1 PEBs are corrupted and not used
UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -28

Anatolij

Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNlRN-0003kw-Kj
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2010 12:05:52 +0000
Date: Wed, 1 Dec 2010 13:05:34 +0100
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
Message-ID: <20101201130534.5b95ce83@wker>
In-Reply-To: <20101129195014.19224240@wker>
References: <20101129195014.19224240@wker>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Detlev Zundel <dzu@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 29 Nov 2010 19:50:14 +0100
Anatolij Gustschin <agust@denx.de> wrote:
...
> The power failure test is simulated by triggering an external reset
> of the board while a simple program is writing data into a file on
> the UBIFS partition. Each test cycle consists of the following steps:
> 
>  - booting the kernel
>  - attaching the MTD device
>  - mounting the UBIFS partition
>  - starting a program for writing the test data into a file on the
>    mounted UBIFS partition (only if mounting of this partition
>    succeeded)
>  - triggering a reset after about 15 sec.
> 
> After a number of test cycles we end up with corrupted partition
> which cannot be recovered any more and mounting the partition
> does not succeed.

So, reducing the write buffer size to 8 bytes seem to be
first quick solution for the problem observed. The problem
didn't show up so far, but after approximately 1500 test
cycles another issue appeared: it is not possible to attach
the MTD device now. The kernel log is included below (note,
the hexdump of the trailing part of the PEB #39 containing
0xff is trimmed).

UBI DBG (pid 1284): ctrl_cdev_ioctl: attach MTD device
UBI: attaching mtd5 to ubi0
UBI DBG (pid 1284): io_init: min_io_size      1
UBI DBG (pid 1284): io_init: hdrs_min_io_size 1
UBI DBG (pid 1284): io_init: ec_hdr_alsize    64
UBI DBG (pid 1284): io_init: vid_hdr_alsize   64
UBI DBG (pid 1284): io_init: vid_hdr_offset   64
UBI DBG (pid 1284): io_init: vid_hdr_aloffset 64
UBI DBG (pid 1284): io_init: vid_hdr_shift    0
UBI DBG (pid 1284): io_init: leb_start        128
UBI DBG (pid 1284): io_init: max_erroneous    20
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    262016 bytes
UBI: smallest flash I/O unit:    1
UBI: VID header offset:          64 (aligned 64)
UBI: data offset:                128
UBI DBG (pid 1284): ubi_scan: process PEB 0
UBI DBG (pid 1284): process_eb: scan PEB 0
UBI DBG (pid 1284): ubi_scan_add_used: PEB 0, LEB 0:39, EC 69, sqnum 13113, bitflips 0
UBI DBG (pid 1284): add_volume: added volume 0
UBI DBG (pid 1284): ubi_scan: process PEB 1
UBI DBG (pid 1284): process_eb: scan PEB 1
UBI DBG (pid 1284): ubi_scan_add_used: PEB 1, LEB 0:30, EC 115, sqnum 12939, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 2
UBI DBG (pid 1284): process_eb: scan PEB 2
UBI DBG (pid 1284): ubi_scan_add_used: PEB 2, LEB 0:23, EC 60, sqnum 13101, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 3
UBI DBG (pid 1284): process_eb: scan PEB 3
UBI DBG (pid 1284): ubi_scan_add_used: PEB 3, LEB 0:35, EC 105, sqnum 13096, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 4
UBI DBG (pid 1284): process_eb: scan PEB 4
UBI DBG (pid 1284): ubi_scan_add_used: PEB 4, LEB 0:20, EC 84, sqnum 12664, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 5
UBI DBG (pid 1284): process_eb: scan PEB 5
UBI DBG (pid 1284): ubi_scan_add_used: PEB 5, LEB 0:34, EC 66, sqnum 13104, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 6
UBI DBG (pid 1284): process_eb: scan PEB 6
UBI DBG (pid 1284): ubi_scan_add_used: PEB 6, LEB 0:26, EC 57, sqnum 13109, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 7
UBI DBG (pid 1284): process_eb: scan PEB 7
UBI DBG (pid 1284): ubi_scan_add_used: PEB 7, LEB 0:17, EC 61, sqnum 13102, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 8
UBI DBG (pid 1284): process_eb: scan PEB 8
UBI DBG (pid 1284): ubi_scan_add_used: PEB 8, LEB 0:15, EC 96, sqnum 13073, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 9
UBI DBG (pid 1284): process_eb: scan PEB 9
UBI DBG (pid 1284): ubi_scan_add_used: PEB 9, LEB 0:7, EC 0, sqnum 0, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 10
UBI DBG (pid 1284): process_eb: scan PEB 10
UBI DBG (pid 1284): ubi_scan_add_used: PEB 10, LEB 0:37, EC 128, sqnum 13097, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 11
UBI DBG (pid 1284): process_eb: scan PEB 11
UBI DBG (pid 1284): ubi_scan_add_used: PEB 11, LEB 0:13, EC 71, sqnum 7046, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 12
UBI DBG (pid 1284): process_eb: scan PEB 12
UBI DBG (pid 1284): ubi_scan_add_used: PEB 12, LEB 0:10, EC 0, sqnum 0, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 13
UBI DBG (pid 1284): process_eb: scan PEB 13
UBI DBG (pid 1284): ubi_scan_add_used: PEB 13, LEB 0:4, EC 58, sqnum 13108, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 14
UBI DBG (pid 1284): process_eb: scan PEB 14
UBI DBG (pid 1284): ubi_scan_add_used: PEB 14, LEB 0:12, EC 0, sqnum 0, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 15
UBI DBG (pid 1284): process_eb: scan PEB 15
UBI DBG (pid 1284): ubi_scan_add_used: PEB 15, LEB 2147479551:0, EC 1, sqnum 1, bitflips 0
UBI DBG (pid 1284): add_volume: added volume 2147479551
UBI DBG (pid 1284): ubi_scan: process PEB 16
UBI DBG (pid 1284): process_eb: scan PEB 16
UBI DBG (pid 1284): ubi_scan_add_used: PEB 16, LEB 2147479551:1, EC 1, sqnum 2, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 17
UBI DBG (pid 1284): process_eb: scan PEB 17
UBI DBG (pid 1284): ubi_scan_add_used: PEB 17, LEB 0:27, EC 97, sqnum 13075, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 18
UBI DBG (pid 1284): process_eb: scan PEB 18
UBI DBG (pid 1284): ubi_scan_add_used: PEB 18, LEB 0:31, EC 58, sqnum 13100, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 19
UBI DBG (pid 1284): process_eb: scan PEB 19
UBI DBG (pid 1284): ubi_scan_add_used: PEB 19, LEB 0:22, EC 85, sqnum 13119, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 20
UBI DBG (pid 1284): process_eb: scan PEB 20
UBI DBG (pid 1284): ubi_scan_add_used: PEB 20, LEB 0:0, EC 1, sqnum 3, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 21
UBI DBG (pid 1284): process_eb: scan PEB 21
UBI DBG (pid 1284): ubi_scan_add_used: PEB 21, LEB 0:14, EC 90, sqnum 13092, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 22
UBI DBG (pid 1284): process_eb: scan PEB 22
UBI DBG (pid 1284): ubi_scan_add_used: PEB 22, LEB 0:22, EC 83, sqnum 13095, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 19, sqnum 13119, EC 85
UBI DBG (pid 1284): compare_lebs: first PEB 22 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 22, EC 83
UBI DBG (pid 1284): ubi_scan: process PEB 23
UBI DBG (pid 1284): process_eb: scan PEB 23
UBI DBG (pid 1284): ubi_scan_add_used: PEB 23, LEB 0:39, EC 71, sqnum 13089, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 0, sqnum 13113, EC 69
UBI DBG (pid 1284): compare_lebs: first PEB 23 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 23, EC 71
UBI DBG (pid 1284): ubi_scan: process PEB 24
UBI DBG (pid 1284): process_eb: scan PEB 24
UBI DBG (pid 1284): ubi_scan_add_used: PEB 24, LEB 0:32, EC 71, sqnum 13114, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 25
UBI DBG (pid 1284): process_eb: scan PEB 25
UBI DBG (pid 1284): ubi_scan_add_used: PEB 25, LEB 0:11, EC 58, sqnum 7343, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 26
UBI DBG (pid 1284): process_eb: scan PEB 26
UBI DBG (pid 1284): ubi_scan_add_used: PEB 26, LEB 0:21, EC 71, sqnum 13090, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 27
UBI DBG (pid 1284): process_eb: scan PEB 27
UBI DBG (pid 1284): ubi_scan_add_used: PEB 27, LEB 0:41, EC 63, sqnum 13032, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 28
UBI DBG (pid 1284): process_eb: scan PEB 28
UBI DBG (pid 1284): ubi_scan_add_used: PEB 28, LEB 0:40, EC 63, sqnum 13103, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 29
UBI DBG (pid 1284): process_eb: scan PEB 29
UBI DBG (pid 1284): ubi_scan_add_used: PEB 29, LEB 0:18, EC 69, sqnum 12937, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 30
UBI DBG (pid 1284): process_eb: scan PEB 30
UBI DBG (pid 1284): ubi_scan_add_used: PEB 30, LEB 0:5, EC 78, sqnum 13074, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 31
UBI DBG (pid 1284): process_eb: scan PEB 31
UBI DBG (pid 1284): ubi_scan_add_used: PEB 31, LEB 0:25, EC 94, sqnum 13093, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 32
UBI DBG (pid 1284): process_eb: scan PEB 32
UBI DBG (pid 1284): ubi_scan_add_used: PEB 32, LEB 0:16, EC 89, sqnum 13025, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 33
UBI DBG (pid 1284): process_eb: scan PEB 33
UBI DBG (pid 1284): ubi_scan_add_used: PEB 33, LEB 0:28, EC 97, sqnum 13094, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 34
UBI DBG (pid 1284): process_eb: scan PEB 34
UBI DBG (pid 1284): ubi_scan_add_used: PEB 34, LEB 0:36, EC 71, sqnum 13106, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 35
UBI DBG (pid 1284): process_eb: scan PEB 35
UBI DBG (pid 1284): ubi_scan_add_used: PEB 35, LEB 0:33, EC 78, sqnum 13091, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 36
UBI DBG (pid 1284): process_eb: scan PEB 36
UBI DBG (pid 1284): ubi_scan_add_used: PEB 36, LEB 0:25, EC 76, sqnum 13118, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 31, sqnum 13093, EC 94
UBI DBG (pid 1284): compare_lebs: second PEB 36 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 31, EC 94
UBI DBG (pid 1284): ubi_scan: process PEB 37
UBI DBG (pid 1284): process_eb: scan PEB 37
UBI DBG (pid 1284): ubi_scan_add_used: PEB 37, LEB 0:29, EC 70, sqnum 13105, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 38
UBI DBG (pid 1284): process_eb: scan PEB 38
UBI DBG (pid 1284): ubi_scan_add_used: PEB 38, LEB 0:38, EC 63, sqnum 13107, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 39
UBI DBG (pid 1284): process_eb: scan PEB 39
UBI DBG (pid 1284): ubi_io_read_vid_hdr: bad magic number at PEB 39: 00000000 instead of 55424921
UBI error: check_corruption: PEB 39 contains corrupted VID header, and the data does not contain all 0xFF, this may be a non-UBI PEB or a severe VID header corruption which requires manual inspection
Volume identifier header dump:
	magic     00000000
	version   1
	vol_type  1
	copy_flag 0
	compat    0
	vol_id    0
	lnum      3
	data_size 0
	used_ebs  0
	data_pad  0
	sqnum     13050
	hdr_crc   26036a6e
Volume identifier header hexdump:
00000000: 00 00 00 00 01 01 00 00 00 00 00 00 00 00 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 32 fa 00 00 00 00 00 00 00 00 00 00 00 00 26 03 6a 6e  ..............2.............&.jn
UBI DBG (pid 1284): check_corruption: hexdump of PEB 39 offset 128, length 262016
00000000: 31 18 10 06 e3 e5 ed bf 73 92 16 00 00 00 00 00 20 00 00 00 0a 00 00 00 40 04 00 00 00 00 00 00  1.......s....... .......@.......
00000020: 31 18 10 06 8b 01 d7 0b 74 92 16 00 00 00 00 00 40 00 00 00 08 00 00 00 29 00 00 00 b8 91 02 00  1.......t.......@.......).......
00000040: 01 00 00 00 00 00 00 0a 00 01 0a 90 00 00 00 5b 00 00 00 01 4b a9 90 10 c7 71 0b a0 00 00 00 0a  ...............[....K....q......
00000060: 31 18 10 06 98 31 db 12 75 92 16 00 00 00 00 00 40 00 00 00 08 00 00 00 22 00 00 00 d0 fb 03 00  1....1..u.......@.......".......
00000080: 02 00 00 00 5d a8 bd 01 00 00 00 00 00 00 00 0a 00 01 06 78 00 00 00 40 00 00 00 00 00 00 00 00  ....]..............x...@........
000000a0: 31 18 10 06 cc c7 0e aa d9 92 16 00 00 00 00 00 40 00 00 00 08 00 00 00 1b 00 00 00 00 00 00 00  1...............@...............
000000c0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
000000e0: 31 18 10 06 5c fd 18 54 58 93 16 00 00 00 00 00 40 00 00 00 08 00 00 00 1f 00 00 00 00 00 00 00  1...\..TX.......@...............
00000100: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000120: 31 18 10 06 b6 40 29 83 d7 93 16 00 00 00 00 00 40 00 00 00 08 00 00 00 17 00 00 00 00 00 00 00  1....@).........@...............
00000140: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000160: 31 18 10 06 89 f2 ce 34 56 94 16 00 00 00 00 00 40 00 00 00 08 00 00 00 11 00 00 00 00 00 00 00  1......4V.......@...............
00000180: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
000001a0: 31 18 10 06 83 0e 1f 10 d5 94 16 00 00 00 00 00 40 00 00 00 08 00 00 00 28 00 00 00 00 00 00 00  1...............@.......(.......
000001c0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
000001e0: 31 18 10 06 17 a4 15 87 54 95 16 00 00 00 00 00 40 00 00 00 08 00 00 00 1d 00 00 00 00 00 00 00  1.......T.......@...............
00000200: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000220: 31 18 10 06 41 17 90 d5 d3 95 16 00 00 00 00 00 40 00 00 00 08 00 00 00 24 00 00 00 00 00 00 00  1...A...........@.......$.......
00000240: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000260: 31 18 10 06 e1 2a f8 3a 52 96 16 00 00 00 00 00 40 00 00 00 08 00 00 00 26 00 00 00 00 00 00 00  1....*.:R.......@.......&.......
00000280: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
000002a0: 31 18 10 06 bc 25 14 e4 d1 96 16 00 00 00 00 00 40 00 00 00 08 00 00 00 18 00 00 00 00 00 00 00  1....%..........@...............
000002c0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
000002e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................................
00000300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................................
*
0003ff40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................................
0003ff60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................................
UBI DBG (pid 1284): add_corrupted: add to corrupted: PEB 39, EC 103
UBI DBG (pid 1284): ubi_scan: process PEB 40
UBI DBG (pid 1284): process_eb: scan PEB 40
UBI DBG (pid 1284): ubi_scan_add_used: PEB 40, LEB 0:33, EC 71, sqnum 13116, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 35, sqnum 13091, EC 78
UBI DBG (pid 1284): compare_lebs: second PEB 40 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 35, EC 78
UBI DBG (pid 1284): ubi_scan: process PEB 41
UBI DBG (pid 1284): process_eb: scan PEB 41
UBI DBG (pid 1284): ubi_scan_add_used: PEB 41, LEB 0:21, EC 59, sqnum 13115, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 26, sqnum 13090, EC 71
UBI DBG (pid 1284): compare_lebs: second PEB 41 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 26, EC 71
UBI DBG (pid 1284): ubi_scan: process PEB 42
UBI DBG (pid 1284): process_eb: scan PEB 42
UBI DBG (pid 1284): ubi_scan_add_used: PEB 42, LEB 0:2, EC 60, sqnum 12221, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 43
UBI DBG (pid 1284): process_eb: scan PEB 43
UBI DBG (pid 1284): ubi_scan_add_used: PEB 43, LEB 0:14, EC 71, sqnum 13117, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 21, sqnum 13092, EC 90
UBI DBG (pid 1284): compare_lebs: second PEB 43 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 21, EC 90
UBI DBG (pid 1284): ubi_scan: process PEB 44
UBI DBG (pid 1284): process_eb: scan PEB 44
UBI DBG (pid 1284): ubi_io_read_vid_hdr: no VID header found at PEB 44, only 0xFF bytes
UBI DBG (pid 1284): add_to_list: add to free: PEB 44, EC 66
UBI DBG (pid 1284): ubi_scan: process PEB 45
UBI DBG (pid 1284): process_eb: scan PEB 45
UBI DBG (pid 1284): ubi_scan_add_used: PEB 45, LEB 0:3, EC 68, sqnum 13098, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 46
UBI DBG (pid 1284): process_eb: scan PEB 46
UBI DBG (pid 1284): ubi_scan_add_used: PEB 46, LEB 0:19, EC 64, sqnum 13112, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 47
UBI DBG (pid 1284): process_eb: scan PEB 47
UBI DBG (pid 1284): ubi_scan_add_used: PEB 47, LEB 0:15, EC 57, sqnum 13099, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 8, sqnum 13073, EC 96
UBI DBG (pid 1284): compare_lebs: second PEB 47 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 8, EC 96
UBI DBG (pid 1284): ubi_scan: process PEB 48
UBI DBG (pid 1284): process_eb: scan PEB 48
UBI DBG (pid 1284): ubi_scan_add_used: PEB 48, LEB 0:19, EC 58, sqnum 13084, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 46, sqnum 13112, EC 64
UBI DBG (pid 1284): compare_lebs: first PEB 48 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 48, EC 58
UBI DBG (pid 1284): ubi_scan: process PEB 49
UBI DBG (pid 1284): process_eb: scan PEB 49
UBI DBG (pid 1284): ubi_scan_add_used: PEB 49, LEB 0:6, EC 58, sqnum 13085, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 50
UBI DBG (pid 1284): process_eb: scan PEB 50
UBI DBG (pid 1284): ubi_scan_add_used: PEB 50, LEB 0:1, EC 57, sqnum 12220, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 51
UBI DBG (pid 1284): process_eb: scan PEB 51
UBI DBG (pid 1284): ubi_scan_add_used: PEB 51, LEB 0:41, EC 57, sqnum 13110, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 27, sqnum 13032, EC 63
UBI DBG (pid 1284): compare_lebs: second PEB 51 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 27, EC 63
UBI DBG (pid 1284): ubi_scan: process PEB 52
UBI DBG (pid 1284): process_eb: scan PEB 52
UBI DBG (pid 1284): ubi_scan_add_used: PEB 52, LEB 0:26, EC 57, sqnum 13086, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 6, sqnum 13109, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 52 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 52, EC 57
UBI DBG (pid 1284): ubi_scan: process PEB 53
UBI DBG (pid 1284): process_eb: scan PEB 53
UBI DBG (pid 1284): ubi_scan_add_used: PEB 53, LEB 0:24, EC 61, sqnum 13111, bitflips 0
UBI DBG (pid 1284): ubi_scan: process PEB 54
UBI DBG (pid 1284): process_eb: scan PEB 54
UBI DBG (pid 1284): ubi_scan_add_used: PEB 54, LEB 0:4, EC 58, sqnum 13061, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 13, sqnum 13108, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 54 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 54, EC 58
UBI DBG (pid 1284): ubi_scan: process PEB 55
UBI DBG (pid 1284): process_eb: scan PEB 55
UBI DBG (pid 1284): ubi_scan_add_used: PEB 55, LEB 0:24, EC 66, sqnum 13088, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 53, sqnum 13111, EC 61
UBI DBG (pid 1284): compare_lebs: first PEB 55 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 55, EC 66
UBI DBG (pid 1284): ubi_scan: process PEB 56
UBI DBG (pid 1284): process_eb: scan PEB 56
UBI DBG (pid 1284): ubi_scan_add_used: PEB 56, LEB 0:25, EC 64, sqnum 13067, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 36, sqnum 13118, EC 76
UBI DBG (pid 1284): compare_lebs: first PEB 56 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 56, EC 64
UBI DBG (pid 1284): ubi_scan: process PEB 57
UBI DBG (pid 1284): process_eb: scan PEB 57
UBI DBG (pid 1284): ubi_scan_add_used: PEB 57, LEB 0:32, EC 58, sqnum 13063, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 24, sqnum 13114, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 57 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 57, EC 58
UBI DBG (pid 1284): ubi_scan: process PEB 58
UBI DBG (pid 1284): process_eb: scan PEB 58
UBI DBG (pid 1284): ubi_scan_add_used: PEB 58, LEB 0:31, EC 57, sqnum 13076, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 18, sqnum 13100, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 58 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 58, EC 57
UBI DBG (pid 1284): ubi_scan: process PEB 59
UBI DBG (pid 1284): process_eb: scan PEB 59
UBI DBG (pid 1284): ubi_scan_add_used: PEB 59, LEB 0:41, EC 57, sqnum 13087, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 51, sqnum 13110, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 59 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 59, EC 57
UBI DBG (pid 1284): ubi_scan: process PEB 60
UBI DBG (pid 1284): process_eb: scan PEB 60
UBI DBG (pid 1284): ubi_io_read_ec_hdr: no EC header found at PEB 60, only 0xFF bytes
UBI DBG (pid 1284): add_to_list: add to erase: PEB 60, EC -1
UBI DBG (pid 1284): ubi_scan: process PEB 61
UBI DBG (pid 1284): process_eb: scan PEB 61
UBI DBG (pid 1284): ubi_scan_add_used: PEB 61, LEB 0:40, EC 55, sqnum 6127, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 28, sqnum 13103, EC 63
UBI DBG (pid 1284): compare_lebs: first PEB 61 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 61, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 62
UBI DBG (pid 1284): process_eb: scan PEB 62
UBI DBG (pid 1284): ubi_scan_add_used: PEB 62, LEB 0:14, EC 58, sqnum 5577, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 43, sqnum 13117, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 62 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 62, EC 58
UBI DBG (pid 1284): ubi_scan: process PEB 63
UBI DBG (pid 1284): process_eb: scan PEB 63
UBI DBG (pid 1284): ubi_scan_add_used: PEB 63, LEB 0:19, EC 57, sqnum 5528, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 46, sqnum 13112, EC 64
UBI DBG (pid 1284): compare_lebs: first PEB 63 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 63, EC 57
UBI DBG (pid 1284): ubi_scan: process PEB 64
UBI DBG (pid 1284): process_eb: scan PEB 64
UBI DBG (pid 1284): ubi_scan_add_used: PEB 64, LEB 0:35, EC 54, sqnum 5597, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 3, sqnum 13096, EC 105
UBI DBG (pid 1284): compare_lebs: first PEB 64 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 64, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 65
UBI DBG (pid 1284): process_eb: scan PEB 65
UBI DBG (pid 1284): ubi_scan_add_used: PEB 65, LEB 0:36, EC 54, sqnum 5578, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 34, sqnum 13106, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 65 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 65, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 66
UBI DBG (pid 1284): process_eb: scan PEB 66
UBI DBG (pid 1284): ubi_scan_add_used: PEB 66, LEB 0:39, EC 57, sqnum 5531, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 0, sqnum 13113, EC 69
UBI DBG (pid 1284): compare_lebs: first PEB 66 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 66, EC 57
UBI DBG (pid 1284): ubi_scan: process PEB 67
UBI DBG (pid 1284): process_eb: scan PEB 67
UBI DBG (pid 1284): ubi_scan_add_used: PEB 67, LEB 0:3, EC 57, sqnum 5534, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 45, sqnum 13098, EC 68
UBI DBG (pid 1284): compare_lebs: first PEB 67 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 67, EC 57
UBI DBG (pid 1284): ubi_scan: process PEB 68
UBI DBG (pid 1284): process_eb: scan PEB 68
UBI DBG (pid 1284): ubi_scan_add_used: PEB 68, LEB 0:37, EC 58, sqnum 5581, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 10, sqnum 13097, EC 128
UBI DBG (pid 1284): compare_lebs: first PEB 68 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 68, EC 58
UBI DBG (pid 1284): ubi_scan: process PEB 69
UBI DBG (pid 1284): process_eb: scan PEB 69
UBI DBG (pid 1284): ubi_io_read_ec_hdr: no EC header found at PEB 69, only 0xFF bytes
UBI DBG (pid 1284): add_to_list: add to erase: PEB 69, EC -1
UBI DBG (pid 1284): ubi_scan: process PEB 70
UBI DBG (pid 1284): process_eb: scan PEB 70
UBI DBG (pid 1284): ubi_scan_add_used: PEB 70, LEB 0:20, EC 56, sqnum 5491, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 4, sqnum 12664, EC 84
UBI DBG (pid 1284): compare_lebs: first PEB 70 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 70, EC 56
UBI DBG (pid 1284): ubi_scan: process PEB 71
UBI DBG (pid 1284): process_eb: scan PEB 71
UBI DBG (pid 1284): ubi_scan_add_used: PEB 71, LEB 0:29, EC 56, sqnum 5492, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 37, sqnum 13105, EC 70
UBI DBG (pid 1284): compare_lebs: first PEB 71 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 71, EC 56
UBI DBG (pid 1284): ubi_scan: process PEB 72
UBI DBG (pid 1284): process_eb: scan PEB 72
UBI DBG (pid 1284): ubi_scan_add_used: PEB 72, LEB 0:19, EC 55, sqnum 5555, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 46, sqnum 13112, EC 64
UBI DBG (pid 1284): compare_lebs: first PEB 72 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 72, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 73
UBI DBG (pid 1284): process_eb: scan PEB 73
UBI DBG (pid 1284): ubi_scan_add_used: PEB 73, LEB 0:5, EC 56, sqnum 5508, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 30, sqnum 13074, EC 78
UBI DBG (pid 1284): compare_lebs: first PEB 73 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 73, EC 56
UBI DBG (pid 1284): ubi_scan: process PEB 74
UBI DBG (pid 1284): process_eb: scan PEB 74
UBI DBG (pid 1284): ubi_scan_add_used: PEB 74, LEB 0:35, EC 57, sqnum 5543, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 3, sqnum 13096, EC 105
UBI DBG (pid 1284): compare_lebs: first PEB 74 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 74, EC 57
UBI DBG (pid 1284): ubi_scan: process PEB 75
UBI DBG (pid 1284): process_eb: scan PEB 75
UBI DBG (pid 1284): ubi_scan_add_used: PEB 75, LEB 0:23, EC 56, sqnum 5510, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 2, sqnum 13101, EC 60
UBI DBG (pid 1284): compare_lebs: first PEB 75 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 75, EC 56
UBI DBG (pid 1284): ubi_scan: process PEB 76
UBI DBG (pid 1284): process_eb: scan PEB 76
UBI DBG (pid 1284): ubi_scan_add_used: PEB 76, LEB 0:38, EC 55, sqnum 5461, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 38, sqnum 13107, EC 63
UBI DBG (pid 1284): compare_lebs: first PEB 76 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 76, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 77
UBI DBG (pid 1284): process_eb: scan PEB 77
UBI DBG (pid 1284): ubi_scan_add_used: PEB 77, LEB 0:28, EC 57, sqnum 5544, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 33, sqnum 13094, EC 97
UBI DBG (pid 1284): compare_lebs: first PEB 77 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 77, EC 57
UBI DBG (pid 1284): ubi_scan: process PEB 78
UBI DBG (pid 1284): process_eb: scan PEB 78
UBI DBG (pid 1284): ubi_scan_add_used: PEB 78, LEB 0:4, EC 56, sqnum 5496, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 13, sqnum 13108, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 78 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 78, EC 56
UBI DBG (pid 1284): ubi_scan: process PEB 79
UBI DBG (pid 1284): process_eb: scan PEB 79
UBI DBG (pid 1284): ubi_scan_add_used: PEB 79, LEB 0:4, EC 57, sqnum 5546, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 13, sqnum 13108, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 79 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 79, EC 57
UBI DBG (pid 1284): ubi_scan: process PEB 80
UBI DBG (pid 1284): process_eb: scan PEB 80
UBI DBG (pid 1284): ubi_scan_add_used: PEB 80, LEB 0:34, EC 54, sqnum 5547, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 5, sqnum 13104, EC 66
UBI DBG (pid 1284): compare_lebs: first PEB 80 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 80, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 81
UBI DBG (pid 1284): process_eb: scan PEB 81
UBI DBG (pid 1284): ubi_scan_add_used: PEB 81, LEB 0:17, EC 56, sqnum 5502, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 7, sqnum 13102, EC 61
UBI DBG (pid 1284): compare_lebs: first PEB 81 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 81, EC 56
UBI DBG (pid 1284): ubi_scan: process PEB 82
UBI DBG (pid 1284): process_eb: scan PEB 82
UBI DBG (pid 1284): ubi_scan_add_used: PEB 82, LEB 0:19, EC 56, sqnum 5503, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 46, sqnum 13112, EC 64
UBI DBG (pid 1284): compare_lebs: first PEB 82 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 82, EC 56
UBI DBG (pid 1284): ubi_scan: process PEB 83
UBI DBG (pid 1284): process_eb: scan PEB 83
UBI DBG (pid 1284): ubi_scan_add_used: PEB 83, LEB 0:37, EC 56, sqnum 5504, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 10, sqnum 13097, EC 128
UBI DBG (pid 1284): compare_lebs: first PEB 83 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 83, EC 56
UBI DBG (pid 1284): ubi_scan: process PEB 84
UBI DBG (pid 1284): process_eb: scan PEB 84
UBI DBG (pid 1284): ubi_scan_add_used: PEB 84, LEB 0:25, EC 54, sqnum 5521, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 36, sqnum 13118, EC 76
UBI DBG (pid 1284): compare_lebs: first PEB 84 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 84, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 85
UBI DBG (pid 1284): process_eb: scan PEB 85
UBI DBG (pid 1284): ubi_scan_add_used: PEB 85, LEB 0:39, EC 54, sqnum 5355, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 0, sqnum 13113, EC 69
UBI DBG (pid 1284): compare_lebs: first PEB 85 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 85, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 86
UBI DBG (pid 1284): process_eb: scan PEB 86
UBI DBG (pid 1284): ubi_scan_add_used: PEB 86, LEB 0:21, EC 56, sqnum 5505, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 41, sqnum 13115, EC 59
UBI DBG (pid 1284): compare_lebs: first PEB 86 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 86, EC 56
UBI DBG (pid 1284): ubi_scan: process PEB 87
UBI DBG (pid 1284): process_eb: scan PEB 87
UBI DBG (pid 1284): ubi_scan_add_used: PEB 87, LEB 0:18, EC 56, sqnum 5506, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 29, sqnum 12937, EC 69
UBI DBG (pid 1284): compare_lebs: first PEB 87 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 87, EC 56
UBI DBG (pid 1284): ubi_scan: process PEB 88
UBI DBG (pid 1284): process_eb: scan PEB 88
UBI DBG (pid 1284): ubi_scan_add_used: PEB 88, LEB 0:38, EC 56, sqnum 5511, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 38, sqnum 13107, EC 63
UBI DBG (pid 1284): compare_lebs: first PEB 88 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 88, EC 56
UBI DBG (pid 1284): ubi_scan: process PEB 89
UBI DBG (pid 1284): process_eb: scan PEB 89
UBI DBG (pid 1284): ubi_scan_add_used: PEB 89, LEB 0:4, EC 55, sqnum 5447, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 13, sqnum 13108, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 89 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 89, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 90
UBI DBG (pid 1284): process_eb: scan PEB 90
UBI DBG (pid 1284): ubi_scan_add_used: PEB 90, LEB 0:27, EC 54, sqnum 5497, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 17, sqnum 13075, EC 97
UBI DBG (pid 1284): compare_lebs: first PEB 90 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 90, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 91
UBI DBG (pid 1284): process_eb: scan PEB 91
UBI DBG (pid 1284): ubi_io_read_ec_hdr: no EC header found at PEB 91, only 0xFF bytes
UBI DBG (pid 1284): add_to_list: add to erase: PEB 91, EC -1
UBI DBG (pid 1284): ubi_scan: process PEB 92
UBI DBG (pid 1284): process_eb: scan PEB 92
UBI DBG (pid 1284): ubi_scan_add_used: PEB 92, LEB 0:26, EC 54, sqnum 5448, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 6, sqnum 13109, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 92 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 92, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 93
UBI DBG (pid 1284): process_eb: scan PEB 93
UBI DBG (pid 1284): ubi_scan_add_used: PEB 93, LEB 0:20, EC 55, sqnum 5467, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 4, sqnum 12664, EC 84
UBI DBG (pid 1284): compare_lebs: first PEB 93 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 93, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 94
UBI DBG (pid 1284): process_eb: scan PEB 94
UBI DBG (pid 1284): ubi_scan_add_used: PEB 94, LEB 0:27, EC 55, sqnum 5469, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 17, sqnum 13075, EC 97
UBI DBG (pid 1284): compare_lebs: first PEB 94 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 94, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 95
UBI DBG (pid 1284): process_eb: scan PEB 95
UBI DBG (pid 1284): ubi_io_read_ec_hdr: no EC header found at PEB 95, only 0xFF bytes
UBI DBG (pid 1284): add_to_list: add to erase: PEB 95, EC -1
UBI DBG (pid 1284): ubi_scan: process PEB 96
UBI DBG (pid 1284): process_eb: scan PEB 96
UBI DBG (pid 1284): ubi_scan_add_used: PEB 96, LEB 0:15, EC 54, sqnum 5367, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 47, sqnum 13099, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 96 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 96, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 97
UBI DBG (pid 1284): process_eb: scan PEB 97
UBI DBG (pid 1284): ubi_scan_add_used: PEB 97, LEB 0:36, EC 55, sqnum 5450, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 34, sqnum 13106, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 97 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 97, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 98
UBI DBG (pid 1284): process_eb: scan PEB 98
UBI DBG (pid 1284): ubi_scan_add_used: PEB 98, LEB 0:17, EC 55, sqnum 5451, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 7, sqnum 13102, EC 61
UBI DBG (pid 1284): compare_lebs: first PEB 98 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 98, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 99
UBI DBG (pid 1284): process_eb: scan PEB 99
UBI DBG (pid 1284): ubi_scan_add_used: PEB 99, LEB 0:6, EC 54, sqnum 5371, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 49, sqnum 13085, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 99 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 99, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 100
UBI DBG (pid 1284): process_eb: scan PEB 100
UBI DBG (pid 1284): ubi_scan_add_used: PEB 100, LEB 0:14, EC 54, sqnum 5397, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 43, sqnum 13117, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 100 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 100, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 101
UBI DBG (pid 1284): process_eb: scan PEB 101
UBI DBG (pid 1284): ubi_scan_add_used: PEB 101, LEB 0:19, EC 55, sqnum 5452, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 46, sqnum 13112, EC 64
UBI DBG (pid 1284): compare_lebs: first PEB 101 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 101, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 102
UBI DBG (pid 1284): process_eb: scan PEB 102
UBI DBG (pid 1284): ubi_scan_add_used: PEB 102, LEB 0:21, EC 55, sqnum 5454, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 41, sqnum 13115, EC 59
UBI DBG (pid 1284): compare_lebs: first PEB 102 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 102, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 103
UBI DBG (pid 1284): process_eb: scan PEB 103
UBI DBG (pid 1284): ubi_scan_add_used: PEB 103, LEB 0:18, EC 55, sqnum 5455, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 29, sqnum 12937, EC 69
UBI DBG (pid 1284): compare_lebs: first PEB 103 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 103, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 104
UBI DBG (pid 1284): process_eb: scan PEB 104
UBI DBG (pid 1284): ubi_scan_add_used: PEB 104, LEB 0:22, EC 55, sqnum 5456, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 19, sqnum 13119, EC 85
UBI DBG (pid 1284): compare_lebs: first PEB 104 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 104, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 105
UBI DBG (pid 1284): process_eb: scan PEB 105
UBI DBG (pid 1284): ubi_scan_add_used: PEB 105, LEB 0:23, EC 55, sqnum 5457, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 2, sqnum 13101, EC 60
UBI DBG (pid 1284): compare_lebs: first PEB 105 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 105, EC 55
UBI DBG (pid 1284): ubi_scan: process PEB 106
UBI DBG (pid 1284): process_eb: scan PEB 106
UBI DBG (pid 1284): ubi_scan_add_used: PEB 106, LEB 0:36, EC 54, sqnum 5424, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 34, sqnum 13106, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 106 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 106, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 107
UBI DBG (pid 1284): process_eb: scan PEB 107
UBI DBG (pid 1284): ubi_scan_add_used: PEB 107, LEB 0:31, EC 54, sqnum 5381, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 18, sqnum 13100, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 107 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 107, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 108
UBI DBG (pid 1284): process_eb: scan PEB 108
UBI DBG (pid 1284): ubi_scan_add_used: PEB 108, LEB 0:35, EC 54, sqnum 5385, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 3, sqnum 13096, EC 105
UBI DBG (pid 1284): compare_lebs: first PEB 108 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 108, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 109
UBI DBG (pid 1284): process_eb: scan PEB 109
UBI DBG (pid 1284): ubi_scan_add_used: PEB 109, LEB 0:28, EC 54, sqnum 5386, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 33, sqnum 13094, EC 97
UBI DBG (pid 1284): compare_lebs: first PEB 109 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 109, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 110
UBI DBG (pid 1284): process_eb: scan PEB 110
UBI DBG (pid 1284): ubi_scan_add_used: PEB 110, LEB 0:34, EC 54, sqnum 5387, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 5, sqnum 13104, EC 66
UBI DBG (pid 1284): compare_lebs: first PEB 110 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 110, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 111
UBI DBG (pid 1284): process_eb: scan PEB 111
UBI DBG (pid 1284): ubi_scan_add_used: PEB 111, LEB 0:17, EC 53, sqnum 5346, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 7, sqnum 13102, EC 61
UBI DBG (pid 1284): compare_lebs: first PEB 111 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 111, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 112
UBI DBG (pid 1284): process_eb: scan PEB 112
UBI DBG (pid 1284): ubi_scan_add_used: PEB 112, LEB 0:33, EC 53, sqnum 5277, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 40, sqnum 13116, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 112 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 112, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 113
UBI DBG (pid 1284): process_eb: scan PEB 113
UBI DBG (pid 1284): ubi_scan_add_used: PEB 113, LEB 0:20, EC 54, sqnum 5388, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 4, sqnum 12664, EC 84
UBI DBG (pid 1284): compare_lebs: first PEB 113 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 113, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 114
UBI DBG (pid 1284): process_eb: scan PEB 114
UBI DBG (pid 1284): ubi_scan_add_used: PEB 114, LEB 0:30, EC 53, sqnum 5279, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 1, sqnum 12939, EC 115
UBI DBG (pid 1284): compare_lebs: first PEB 114 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 114, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 115
UBI DBG (pid 1284): process_eb: scan PEB 115
UBI DBG (pid 1284): ubi_scan_add_used: PEB 115, LEB 0:25, EC 53, sqnum 5280, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 36, sqnum 13118, EC 76
UBI DBG (pid 1284): compare_lebs: first PEB 115 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 115, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 116
UBI DBG (pid 1284): process_eb: scan PEB 116
UBI DBG (pid 1284): ubi_scan_add_used: PEB 116, LEB 0:29, EC 54, sqnum 5389, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 37, sqnum 13105, EC 70
UBI DBG (pid 1284): compare_lebs: first PEB 116 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 116, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 117
UBI DBG (pid 1284): process_eb: scan PEB 117
UBI DBG (pid 1284): ubi_scan_add_used: PEB 117, LEB 0:27, EC 54, sqnum 5390, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 17, sqnum 13075, EC 97
UBI DBG (pid 1284): compare_lebs: first PEB 117 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 117, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 118
UBI DBG (pid 1284): process_eb: scan PEB 118
UBI DBG (pid 1284): ubi_scan_add_used: PEB 118, LEB 0:26, EC 54, sqnum 5391, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 6, sqnum 13109, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 118 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 118, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 119
UBI DBG (pid 1284): process_eb: scan PEB 119
UBI DBG (pid 1284): ubi_scan_add_used: PEB 119, LEB 0:24, EC 54, sqnum 5392, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 53, sqnum 13111, EC 61
UBI DBG (pid 1284): compare_lebs: first PEB 119 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 119, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 120
UBI DBG (pid 1284): process_eb: scan PEB 120
UBI DBG (pid 1284): ubi_scan_add_used: PEB 120, LEB 0:27, EC 53, sqnum 5286, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 17, sqnum 13075, EC 97
UBI DBG (pid 1284): compare_lebs: first PEB 120 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 120, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 121
UBI DBG (pid 1284): process_eb: scan PEB 121
UBI DBG (pid 1284): ubi_scan_add_used: PEB 121, LEB 0:26, EC 53, sqnum 5287, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 6, sqnum 13109, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 121 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 121, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 122
UBI DBG (pid 1284): process_eb: scan PEB 122
UBI DBG (pid 1284): ubi_scan_add_used: PEB 122, LEB 0:24, EC 53, sqnum 5288, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 53, sqnum 13111, EC 61
UBI DBG (pid 1284): compare_lebs: first PEB 122 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 122, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 123
UBI DBG (pid 1284): process_eb: scan PEB 123
UBI DBG (pid 1284): ubi_scan_add_used: PEB 123, LEB 0:15, EC 54, sqnum 5393, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 47, sqnum 13099, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 123 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 123, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 124
UBI DBG (pid 1284): process_eb: scan PEB 124
UBI DBG (pid 1284): ubi_scan_add_used: PEB 124, LEB 0:14, EC 54, sqnum 5394, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 43, sqnum 13117, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 124 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 124, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 125
UBI DBG (pid 1284): process_eb: scan PEB 125
UBI DBG (pid 1284): ubi_scan_add_used: PEB 125, LEB 0:4, EC 54, sqnum 5395, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 13, sqnum 13108, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 125 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 125, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 126
UBI DBG (pid 1284): process_eb: scan PEB 126
UBI DBG (pid 1284): ubi_scan_add_used: PEB 126, LEB 0:33, EC 54, sqnum 5396, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 40, sqnum 13116, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 126 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 126, EC 54
UBI DBG (pid 1284): ubi_scan: process PEB 127
UBI DBG (pid 1284): process_eb: scan PEB 127
UBI DBG (pid 1284): ubi_scan_add_used: PEB 127, LEB 0:18, EC 53, sqnum 5297, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 29, sqnum 12937, EC 69
UBI DBG (pid 1284): compare_lebs: first PEB 127 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 127, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 128
UBI DBG (pid 1284): process_eb: scan PEB 128
UBI DBG (pid 1284): ubi_scan_add_used: PEB 128, LEB 0:22, EC 53, sqnum 5298, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 19, sqnum 13119, EC 85
UBI DBG (pid 1284): compare_lebs: first PEB 128 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 128, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 129
UBI DBG (pid 1284): process_eb: scan PEB 129
UBI DBG (pid 1284): ubi_scan_add_used: PEB 129, LEB 0:16, EC 53, sqnum 5299, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 32, sqnum 13025, EC 89
UBI DBG (pid 1284): compare_lebs: first PEB 129 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 129, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 130
UBI DBG (pid 1284): process_eb: scan PEB 130
UBI DBG (pid 1284): ubi_scan_add_used: PEB 130, LEB 0:23, EC 53, sqnum 5300, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 2, sqnum 13101, EC 60
UBI DBG (pid 1284): compare_lebs: first PEB 130 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 130, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 131
UBI DBG (pid 1284): process_eb: scan PEB 131
UBI DBG (pid 1284): ubi_scan_add_used: PEB 131, LEB 0:31, EC 53, sqnum 5301, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 18, sqnum 13100, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 131 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 131, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 132
UBI DBG (pid 1284): process_eb: scan PEB 132
UBI DBG (pid 1284): ubi_scan_add_used: PEB 132, LEB 0:39, EC 53, sqnum 5302, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 0, sqnum 13113, EC 69
UBI DBG (pid 1284): compare_lebs: first PEB 132 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 132, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 133
UBI DBG (pid 1284): process_eb: scan PEB 133
UBI DBG (pid 1284): ubi_scan_add_used: PEB 133, LEB 0:33, EC 53, sqnum 5303, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 40, sqnum 13116, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 133 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 133, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 134
UBI DBG (pid 1284): process_eb: scan PEB 134
UBI DBG (pid 1284): ubi_scan_add_used: PEB 134, LEB 0:28, EC 53, sqnum 5304, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 33, sqnum 13094, EC 97
UBI DBG (pid 1284): compare_lebs: first PEB 134 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 134, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 135
UBI DBG (pid 1284): process_eb: scan PEB 135
UBI DBG (pid 1284): ubi_scan_add_used: PEB 135, LEB 0:30, EC 53, sqnum 5305, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 1, sqnum 12939, EC 115
UBI DBG (pid 1284): compare_lebs: first PEB 135 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 135, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 136
UBI DBG (pid 1284): process_eb: scan PEB 136
UBI DBG (pid 1284): ubi_scan_add_used: PEB 136, LEB 0:25, EC 53, sqnum 5306, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 36, sqnum 13118, EC 76
UBI DBG (pid 1284): compare_lebs: first PEB 136 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 136, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 137
UBI DBG (pid 1284): process_eb: scan PEB 137
UBI DBG (pid 1284): ubi_scan_add_used: PEB 137, LEB 0:34, EC 53, sqnum 5307, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 5, sqnum 13104, EC 66
UBI DBG (pid 1284): compare_lebs: first PEB 137 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 137, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 138
UBI DBG (pid 1284): process_eb: scan PEB 138
UBI DBG (pid 1284): ubi_scan_add_used: PEB 138, LEB 0:20, EC 52, sqnum 5175, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 4, sqnum 12664, EC 84
UBI DBG (pid 1284): compare_lebs: first PEB 138 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 138, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 139
UBI DBG (pid 1284): process_eb: scan PEB 139
UBI DBG (pid 1284): ubi_scan_add_used: PEB 139, LEB 0:5, EC 53, sqnum 5309, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 30, sqnum 13074, EC 78
UBI DBG (pid 1284): compare_lebs: first PEB 139 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 139, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 140
UBI DBG (pid 1284): process_eb: scan PEB 140
UBI DBG (pid 1284): ubi_scan_add_used: PEB 140, LEB 0:29, EC 53, sqnum 5312, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 37, sqnum 13105, EC 70
UBI DBG (pid 1284): compare_lebs: first PEB 140 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 140, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 141
UBI DBG (pid 1284): process_eb: scan PEB 141
UBI DBG (pid 1284): ubi_scan_add_used: PEB 141, LEB 0:27, EC 53, sqnum 5313, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 17, sqnum 13075, EC 97
UBI DBG (pid 1284): compare_lebs: first PEB 141 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 141, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 142
UBI DBG (pid 1284): process_eb: scan PEB 142
UBI DBG (pid 1284): ubi_scan_add_used: PEB 142, LEB 0:26, EC 53, sqnum 5314, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 6, sqnum 13109, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 142 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 142, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 143
UBI DBG (pid 1284): process_eb: scan PEB 143
UBI DBG (pid 1284): ubi_scan_add_used: PEB 143, LEB 0:24, EC 53, sqnum 5315, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 53, sqnum 13111, EC 61
UBI DBG (pid 1284): compare_lebs: first PEB 143 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 143, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 144
UBI DBG (pid 1284): process_eb: scan PEB 144
UBI DBG (pid 1284): ubi_scan_add_used: PEB 144, LEB 0:38, EC 52, sqnum 5179, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 38, sqnum 13107, EC 63
UBI DBG (pid 1284): compare_lebs: first PEB 144 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 144, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 145
UBI DBG (pid 1284): process_eb: scan PEB 145
UBI DBG (pid 1284): ubi_scan_add_used: PEB 145, LEB 0:3, EC 52, sqnum 5181, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 45, sqnum 13098, EC 68
UBI DBG (pid 1284): compare_lebs: first PEB 145 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 145, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 146
UBI DBG (pid 1284): process_eb: scan PEB 146
UBI DBG (pid 1284): ubi_scan_add_used: PEB 146, LEB 0:24, EC 52, sqnum 5182, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 53, sqnum 13111, EC 61
UBI DBG (pid 1284): compare_lebs: first PEB 146 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 146, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 147
UBI DBG (pid 1284): process_eb: scan PEB 147
UBI DBG (pid 1284): ubi_scan_add_used: PEB 147, LEB 0:29, EC 52, sqnum 5183, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 37, sqnum 13105, EC 70
UBI DBG (pid 1284): compare_lebs: first PEB 147 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 147, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 148
UBI DBG (pid 1284): process_eb: scan PEB 148
UBI DBG (pid 1284): ubi_scan_add_used: PEB 148, LEB 0:19, EC 52, sqnum 5184, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 46, sqnum 13112, EC 64
UBI DBG (pid 1284): compare_lebs: first PEB 148 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 148, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 149
UBI DBG (pid 1284): process_eb: scan PEB 149
UBI DBG (pid 1284): ubi_scan_add_used: PEB 149, LEB 0:15, EC 52, sqnum 5185, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 47, sqnum 13099, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 149 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 149, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 150
UBI DBG (pid 1284): process_eb: scan PEB 150
UBI DBG (pid 1284): ubi_scan_add_used: PEB 150, LEB 0:14, EC 52, sqnum 5186, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 43, sqnum 13117, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 150 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 150, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 151
UBI DBG (pid 1284): process_eb: scan PEB 151
UBI DBG (pid 1284): ubi_scan_add_used: PEB 151, LEB 0:3, EC 51, sqnum 5028, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 45, sqnum 13098, EC 68
UBI DBG (pid 1284): compare_lebs: first PEB 151 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 151, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 152
UBI DBG (pid 1284): process_eb: scan PEB 152
UBI DBG (pid 1284): ubi_scan_add_used: PEB 152, LEB 0:16, EC 51, sqnum 5029, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 32, sqnum 13025, EC 89
UBI DBG (pid 1284): compare_lebs: first PEB 152 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 152, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 153
UBI DBG (pid 1284): process_eb: scan PEB 153
UBI DBG (pid 1284): ubi_scan_add_used: PEB 153, LEB 0:17, EC 52, sqnum 5187, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 7, sqnum 13102, EC 61
UBI DBG (pid 1284): compare_lebs: first PEB 153 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 153, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 154
UBI DBG (pid 1284): process_eb: scan PEB 154
UBI DBG (pid 1284): ubi_scan_add_used: PEB 154, LEB 0:22, EC 52, sqnum 5188, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 19, sqnum 13119, EC 85
UBI DBG (pid 1284): compare_lebs: first PEB 154 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 154, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 155
UBI DBG (pid 1284): process_eb: scan PEB 155
UBI DBG (pid 1284): ubi_scan_add_used: PEB 155, LEB 0:37, EC 52, sqnum 5189, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 10, sqnum 13097, EC 128
UBI DBG (pid 1284): compare_lebs: first PEB 155 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 155, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 156
UBI DBG (pid 1284): process_eb: scan PEB 156
UBI DBG (pid 1284): ubi_scan_add_used: PEB 156, LEB 0:36, EC 52, sqnum 5190, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 34, sqnum 13106, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 156 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 156, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 157
UBI DBG (pid 1284): process_eb: scan PEB 157
UBI DBG (pid 1284): ubi_scan_add_used: PEB 157, LEB 0:23, EC 52, sqnum 5191, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 2, sqnum 13101, EC 60
UBI DBG (pid 1284): compare_lebs: first PEB 157 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 157, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 158
UBI DBG (pid 1284): process_eb: scan PEB 158
UBI DBG (pid 1284): ubi_scan_add_used: PEB 158, LEB 0:4, EC 52, sqnum 5193, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 13, sqnum 13108, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 158 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 158, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 159
UBI DBG (pid 1284): process_eb: scan PEB 159
UBI DBG (pid 1284): ubi_scan_add_used: PEB 159, LEB 0:31, EC 52, sqnum 5194, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 18, sqnum 13100, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 159 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 159, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 160
UBI DBG (pid 1284): process_eb: scan PEB 160
UBI DBG (pid 1284): ubi_scan_add_used: PEB 160, LEB 0:39, EC 52, sqnum 5195, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 0, sqnum 13113, EC 69
UBI DBG (pid 1284): compare_lebs: first PEB 160 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 160, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 161
UBI DBG (pid 1284): process_eb: scan PEB 161
UBI DBG (pid 1284): ubi_scan_add_used: PEB 161, LEB 0:33, EC 52, sqnum 5196, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 40, sqnum 13116, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 161 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 161, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 162
UBI DBG (pid 1284): process_eb: scan PEB 162
UBI DBG (pid 1284): ubi_scan_add_used: PEB 162, LEB 0:28, EC 52, sqnum 5197, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 33, sqnum 13094, EC 97
UBI DBG (pid 1284): compare_lebs: first PEB 162 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 162, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 163
UBI DBG (pid 1284): process_eb: scan PEB 163
UBI DBG (pid 1284): ubi_scan_add_used: PEB 163, LEB 0:30, EC 52, sqnum 5198, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 1, sqnum 12939, EC 115
UBI DBG (pid 1284): compare_lebs: first PEB 163 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 163, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 164
UBI DBG (pid 1284): process_eb: scan PEB 164
UBI DBG (pid 1284): ubi_scan_add_used: PEB 164, LEB 0:25, EC 52, sqnum 5199, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 36, sqnum 13118, EC 76
UBI DBG (pid 1284): compare_lebs: first PEB 164 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 164, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 165
UBI DBG (pid 1284): process_eb: scan PEB 165
UBI DBG (pid 1284): ubi_scan_add_used: PEB 165, LEB 0:35, EC 52, sqnum 5200, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 3, sqnum 13096, EC 105
UBI DBG (pid 1284): compare_lebs: first PEB 165 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 165, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 166
UBI DBG (pid 1284): process_eb: scan PEB 166
UBI DBG (pid 1284): ubi_scan_add_used: PEB 166, LEB 0:27, EC 52, sqnum 5201, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 17, sqnum 13075, EC 97
UBI DBG (pid 1284): compare_lebs: first PEB 166 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 166, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 167
UBI DBG (pid 1284): process_eb: scan PEB 167
UBI DBG (pid 1284): ubi_scan_add_used: PEB 167, LEB 0:20, EC 52, sqnum 5202, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 4, sqnum 12664, EC 84
UBI DBG (pid 1284): compare_lebs: first PEB 167 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 167, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 168
UBI DBG (pid 1284): process_eb: scan PEB 168
UBI DBG (pid 1284): ubi_scan_add_used: PEB 168, LEB 0:26, EC 52, sqnum 5203, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 6, sqnum 13109, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 168 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 168, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 169
UBI DBG (pid 1284): process_eb: scan PEB 169
UBI DBG (pid 1284): ubi_scan_add_used: PEB 169, LEB 0:5, EC 52, sqnum 5205, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 30, sqnum 13074, EC 78
UBI DBG (pid 1284): compare_lebs: first PEB 169 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 169, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 170
UBI DBG (pid 1284): process_eb: scan PEB 170
UBI DBG (pid 1284): ubi_scan_add_used: PEB 170, LEB 0:38, EC 52, sqnum 5206, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 38, sqnum 13107, EC 63
UBI DBG (pid 1284): compare_lebs: first PEB 170 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 170, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 171
UBI DBG (pid 1284): process_eb: scan PEB 171
UBI DBG (pid 1284): ubi_scan_add_used: PEB 171, LEB 0:24, EC 52, sqnum 5207, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 53, sqnum 13111, EC 61
UBI DBG (pid 1284): compare_lebs: first PEB 171 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 171, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 172
UBI DBG (pid 1284): process_eb: scan PEB 172
UBI DBG (pid 1284): ubi_scan_add_used: PEB 172, LEB 0:29, EC 52, sqnum 5208, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 37, sqnum 13105, EC 70
UBI DBG (pid 1284): compare_lebs: first PEB 172 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 172, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 173
UBI DBG (pid 1284): process_eb: scan PEB 173
UBI DBG (pid 1284): ubi_scan_add_used: PEB 173, LEB 0:19, EC 52, sqnum 5209, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 46, sqnum 13112, EC 64
UBI DBG (pid 1284): compare_lebs: first PEB 173 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 173, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 174
UBI DBG (pid 1284): process_eb: scan PEB 174
UBI DBG (pid 1284): ubi_scan_add_used: PEB 174, LEB 0:29, EC 51, sqnum 5052, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 37, sqnum 13105, EC 70
UBI DBG (pid 1284): compare_lebs: first PEB 174 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 174, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 175
UBI DBG (pid 1284): process_eb: scan PEB 175
UBI DBG (pid 1284): ubi_scan_add_used: PEB 175, LEB 0:15, EC 52, sqnum 5210, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 47, sqnum 13099, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 175 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 175, EC 52
UBI DBG (pid 1284): ubi_scan: process PEB 176
UBI DBG (pid 1284): process_eb: scan PEB 176
UBI DBG (pid 1284): ubi_scan_add_used: PEB 176, LEB 0:19, EC 53, sqnum 5316, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 46, sqnum 13112, EC 64
UBI DBG (pid 1284): compare_lebs: first PEB 176 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 176, EC 53
UBI DBG (pid 1284): ubi_scan: process PEB 177
UBI DBG (pid 1284): process_eb: scan PEB 177
UBI DBG (pid 1284): ubi_scan_add_used: PEB 177, LEB 0:36, EC 51, sqnum 5058, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 34, sqnum 13106, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 177 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 177, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 178
UBI DBG (pid 1284): process_eb: scan PEB 178
UBI DBG (pid 1284): ubi_scan_add_used: PEB 178, LEB 0:23, EC 51, sqnum 5059, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 2, sqnum 13101, EC 60
UBI DBG (pid 1284): compare_lebs: first PEB 178 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 178, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 179
UBI DBG (pid 1284): process_eb: scan PEB 179
UBI DBG (pid 1284): ubi_scan_add_used: PEB 179, LEB 0:41, EC 51, sqnum 5060, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 51, sqnum 13110, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 179 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 179, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 180
UBI DBG (pid 1284): process_eb: scan PEB 180
UBI DBG (pid 1284): ubi_scan_add_used: PEB 180, LEB 0:39, EC 51, sqnum 5061, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 0, sqnum 13113, EC 69
UBI DBG (pid 1284): compare_lebs: first PEB 180 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 180, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 181
UBI DBG (pid 1284): process_eb: scan PEB 181
UBI DBG (pid 1284): ubi_scan_add_used: PEB 181, LEB 0:33, EC 51, sqnum 5062, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 40, sqnum 13116, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 181 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 181, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 182
UBI DBG (pid 1284): process_eb: scan PEB 182
UBI DBG (pid 1284): ubi_scan_add_used: PEB 182, LEB 0:38, EC 51, sqnum 5063, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 38, sqnum 13107, EC 63
UBI DBG (pid 1284): compare_lebs: first PEB 182 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 182, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 183
UBI DBG (pid 1284): process_eb: scan PEB 183
UBI DBG (pid 1284): ubi_scan_add_used: PEB 183, LEB 0:31, EC 51, sqnum 5064, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 18, sqnum 13100, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 183 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 183, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 184
UBI DBG (pid 1284): process_eb: scan PEB 184
UBI DBG (pid 1284): ubi_scan_add_used: PEB 184, LEB 0:30, EC 51, sqnum 5065, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 1, sqnum 12939, EC 115
UBI DBG (pid 1284): compare_lebs: first PEB 184 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 184, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 185
UBI DBG (pid 1284): process_eb: scan PEB 185
UBI DBG (pid 1284): ubi_scan_add_used: PEB 185, LEB 0:6, EC 51, sqnum 5067, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 49, sqnum 13085, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 185 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 185, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 186
UBI DBG (pid 1284): process_eb: scan PEB 186
UBI DBG (pid 1284): ubi_scan_add_used: PEB 186, LEB 0:25, EC 51, sqnum 5068, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 36, sqnum 13118, EC 76
UBI DBG (pid 1284): compare_lebs: first PEB 186 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 186, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 187
UBI DBG (pid 1284): process_eb: scan PEB 187
UBI DBG (pid 1284): ubi_scan_add_used: PEB 187, LEB 0:35, EC 51, sqnum 5069, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 3, sqnum 13096, EC 105
UBI DBG (pid 1284): compare_lebs: first PEB 187 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 187, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 188
UBI DBG (pid 1284): process_eb: scan PEB 188
UBI DBG (pid 1284): ubi_scan_add_used: PEB 188, LEB 0:27, EC 51, sqnum 5070, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 17, sqnum 13075, EC 97
UBI DBG (pid 1284): compare_lebs: first PEB 188 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 188, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 189
UBI DBG (pid 1284): process_eb: scan PEB 189
UBI DBG (pid 1284): ubi_scan_add_used: PEB 189, LEB 0:32, EC 51, sqnum 5071, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 24, sqnum 13114, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 189 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 189, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 190
UBI DBG (pid 1284): process_eb: scan PEB 190
UBI DBG (pid 1284): ubi_scan_add_used: PEB 190, LEB 0:20, EC 51, sqnum 5072, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 4, sqnum 12664, EC 84
UBI DBG (pid 1284): compare_lebs: first PEB 190 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 190, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 191
UBI DBG (pid 1284): process_eb: scan PEB 191
UBI DBG (pid 1284): ubi_scan_add_used: PEB 191, LEB 0:26, EC 51, sqnum 5073, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 6, sqnum 13109, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 191 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 191, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 192
UBI DBG (pid 1284): process_eb: scan PEB 192
UBI DBG (pid 1284): ubi_scan_add_used: PEB 192, LEB 0:18, EC 51, sqnum 5074, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 29, sqnum 12937, EC 69
UBI DBG (pid 1284): compare_lebs: first PEB 192 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 192, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 193
UBI DBG (pid 1284): process_eb: scan PEB 193
UBI DBG (pid 1284): ubi_scan_add_used: PEB 193, LEB 0:24, EC 51, sqnum 5075, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 53, sqnum 13111, EC 61
UBI DBG (pid 1284): compare_lebs: first PEB 193 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 193, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 194
UBI DBG (pid 1284): process_eb: scan PEB 194
UBI DBG (pid 1284): ubi_scan_add_used: PEB 194, LEB 0:19, EC 51, sqnum 5076, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 46, sqnum 13112, EC 64
UBI DBG (pid 1284): compare_lebs: first PEB 194 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 194, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 195
UBI DBG (pid 1284): process_eb: scan PEB 195
UBI DBG (pid 1284): ubi_scan_add_used: PEB 195, LEB 0:14, EC 51, sqnum 5077, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 43, sqnum 13117, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 195 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 195, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 196
UBI DBG (pid 1284): process_eb: scan PEB 196
UBI DBG (pid 1284): ubi_scan_add_used: PEB 196, LEB 0:3, EC 51, sqnum 5079, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 45, sqnum 13098, EC 68
UBI DBG (pid 1284): compare_lebs: first PEB 196 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 196, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 197
UBI DBG (pid 1284): process_eb: scan PEB 197
UBI DBG (pid 1284): ubi_scan_add_used: PEB 197, LEB 0:17, EC 51, sqnum 5080, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 7, sqnum 13102, EC 61
UBI DBG (pid 1284): compare_lebs: first PEB 197 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 197, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 198
UBI DBG (pid 1284): process_eb: scan PEB 198
UBI DBG (pid 1284): ubi_scan_add_used: PEB 198, LEB 0:37, EC 51, sqnum 5081, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 10, sqnum 13097, EC 128
UBI DBG (pid 1284): compare_lebs: first PEB 198 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 198, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 199
UBI DBG (pid 1284): process_eb: scan PEB 199
UBI DBG (pid 1284): ubi_scan_add_used: PEB 199, LEB 0:22, EC 51, sqnum 5082, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 19, sqnum 13119, EC 85
UBI DBG (pid 1284): compare_lebs: first PEB 199 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 199, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 200
UBI DBG (pid 1284): process_eb: scan PEB 200
UBI DBG (pid 1284): ubi_scan_add_used: PEB 200, LEB 0:36, EC 51, sqnum 5083, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 34, sqnum 13106, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 200 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 200, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 201
UBI DBG (pid 1284): process_eb: scan PEB 201
UBI DBG (pid 1284): ubi_scan_add_used: PEB 201, LEB 0:23, EC 51, sqnum 5084, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 2, sqnum 13101, EC 60
UBI DBG (pid 1284): compare_lebs: first PEB 201 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 201, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 202
UBI DBG (pid 1284): process_eb: scan PEB 202
UBI DBG (pid 1284): ubi_scan_add_used: PEB 202, LEB 0:41, EC 51, sqnum 5085, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 51, sqnum 13110, EC 57
UBI DBG (pid 1284): compare_lebs: first PEB 202 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 202, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 203
UBI DBG (pid 1284): process_eb: scan PEB 203
UBI DBG (pid 1284): ubi_scan_add_used: PEB 203, LEB 0:39, EC 51, sqnum 5086, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 0, sqnum 13113, EC 69
UBI DBG (pid 1284): compare_lebs: first PEB 203 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 203, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 204
UBI DBG (pid 1284): process_eb: scan PEB 204
UBI DBG (pid 1284): ubi_scan_add_used: PEB 204, LEB 0:33, EC 51, sqnum 5087, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 40, sqnum 13116, EC 71
UBI DBG (pid 1284): compare_lebs: first PEB 204 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 204, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 205
UBI DBG (pid 1284): process_eb: scan PEB 205
UBI DBG (pid 1284): ubi_scan_add_used: PEB 205, LEB 0:38, EC 51, sqnum 5088, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 38, sqnum 13107, EC 63
UBI DBG (pid 1284): compare_lebs: first PEB 205 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 205, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 206
UBI DBG (pid 1284): process_eb: scan PEB 206
UBI DBG (pid 1284): ubi_scan_add_used: PEB 206, LEB 0:31, EC 51, sqnum 5089, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 18, sqnum 13100, EC 58
UBI DBG (pid 1284): compare_lebs: first PEB 206 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 206, EC 51
UBI DBG (pid 1284): ubi_scan: process PEB 207
UBI DBG (pid 1284): process_eb: scan PEB 207
UBI DBG (pid 1284): ubi_scan_add_used: PEB 207, LEB 0:29, EC 51, sqnum 5090, bitflips 0
UBI DBG (pid 1284): ubi_scan_add_used: this LEB already exists: PEB 37, sqnum 13105, EC 70
UBI DBG (pid 1284): compare_lebs: first PEB 207 is newer, copy_flag is unset
UBI DBG (pid 1284): add_to_list: add to erase: PEB 207, EC 51
UBI DBG (pid 1284): ubi_scan: scanning is finished
UBI error: check_what_we_have: 1 PEBs are corrupted and preserved
Corrupted PEBs are: 39
UBI: max. sequence number:       13119
UBI DBG (pid 1284): process_lvol: check layout volume
UBI DBG (pid 1284): ubi_eba_init_scan: initialize EBA sub-system
UBI error: ubi_eba_init_scan: no enough physical eraseblocks (0, need 1)
UBI error: ubi_eba_init_scan: 1 PEBs are corrupted and not used
UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -28
ubiattach: error!: cannot attach mtd5
           error 28 (No space left on device)
UBI DBG (pid 1287): ubi_open_volume_path: open volume ubi0:homefs, mode 1
UBI DBG (pid 1287): ubi_open_volume_nm: open device 0, volume homefs, mode 1
UBIFS error (pid 1287): ubifs_get_sb: cannot open "ubi0:homefs", error -19

Kernel log ends here.

Additional limited dump of the PEB 39 (from offset 0 to 0xe0)
is included below since the EC header dump is not done in the
kernel log. We can see that the EC header's magic is ok, but
VID header's magic is zero.

My question is:
Is it possible that the reset occured while running in
nor_erase_prepare() just after clearing the VID header magic,
but before clearing the EC header magic?

If I clear the PEB 39 EC header's magic in U-Boot and then
boot Linux and try to attach the MTD device again, attaching
succeeds. Then, mounting the UBIFS partition succeeds, too.

Partial PEB 39 dump:
=> md f4500000 0xe0
f4500000: 55424923 01000000 00000000 00000067    UBI#...........g
f4500010: 00000040 00000080 753746f3 00000000    ...@....u7F.....
f4500020: 00000000 00000000 00000000 00000000    ................
f4500030: 00000000 00000000 00000000 84069610    ................
f4500040: 00000000 01010000 00000000 00000003    ................
f4500050: 00000000 00000000 00000000 00000000    ................
f4500060: 00000000 00000000 00000000 000032fa    ..............2.
f4500070: 00000000 00000000 00000000 26036a6e    ............&.jn
f4500080: 31181006 e3e5edbf 73921600 00000000    1.......s.......
f4500090: 20000000 0a000000 40040000 00000000     .......@.......
f45000a0: 31181006 8b01d70b 74921600 00000000    1.......t.......
f45000b0: 40000000 08000000 29000000 b8910200    @.......).......
f45000c0: 01000000 0000000a 00010a90 0000005b    ...............[
f45000d0: 00000001 4ba99010 c7710ba0 0000000a    ....K....q......
f45000e0: 31181006 9831db12 75921600 00000000    1....1..u.......
f45000f0: 40000000 08000000 22000000 d0fb0300    @.......".......
f4500100: 02000000 5da8bd01 00000000 0000000a    ....]...........
f4500110: 00010678 00000040 00000000 00000000    ...x...@........
f4500120: 31181006 ccc70eaa d9921600 00000000    1...............
f4500130: 40000000 08000000 1b000000 00000000    @...............
f4500140: 02000000 00000000 00000000 00000000    ................
f4500150: 00000000 00000000 00000000 00000000    ................
f4500160: 31181006 5cfd1854 58931600 00000000    1...\..TX.......
f4500170: 40000000 08000000 1f000000 00000000    @...............
f4500180: 02000000 00000000 00000000 00000000    ................
f4500190: 00000000 00000000 00000000 00000000    ................
f45001a0: 31181006 b6402983 d7931600 00000000    1....@).........
f45001b0: 40000000 08000000 17000000 00000000    @...............
f45001c0: 02000000 00000000 00000000 00000000    ................
f45001d0: 00000000 00000000 00000000 00000000    ................
f45001e0: 31181006 89f2ce34 56941600 00000000    1......4V.......
f45001f0: 40000000 08000000 11000000 00000000    @...............
f4500200: 02000000 00000000 00000000 00000000    ................
f4500210: 00000000 00000000 00000000 00000000    ................
f4500220: 31181006 830e1f10 d5941600 00000000    1...............
f4500230: 40000000 08000000 28000000 00000000    @.......(.......
f4500240: 02000000 00000000 00000000 00000000    ................
f4500250: 00000000 00000000 00000000 00000000    ................
f4500260: 31181006 17a41587 54951600 00000000    1.......T.......
f4500270: 40000000 08000000 1d000000 00000000    @...............
f4500280: 02000000 00000000 00000000 00000000    ................
f4500290: 00000000 00000000 00000000 00000000    ................
f45002a0: 31181006 411790d5 d3951600 00000000    1...A...........
f45002b0: 40000000 08000000 24000000 00000000    @.......$.......
f45002c0: 02000000 00000000 00000000 00000000    ................
f45002d0: 00000000 00000000 00000000 00000000    ................
f45002e0: 31181006 e12af83a 52961600 00000000    1....*.:R.......
f45002f0: 40000000 08000000 26000000 00000000    @.......&.......
f4500300: 02000000 00000000 00000000 00000000    ................
f4500310: 00000000 00000000 00000000 00000000    ................
f4500320: 31181006 bc2514e4 d1961600 00000000    1....%..........
f4500330: 40000000 08000000 18000000 00000000    @...............
f4500340: 02000000 00000000 00000000 00000000    ................
f4500350: 00000000 00000000 00000000 00000000    ................
f4500360: ffffffff ffffffff ffffffff ffffffff    ................
f4500370: ffffffff ffffffff ffffffff ffffffff    ................

Thanks,
Anatolij

Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNorN-0005sf-7g
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2010 15:44:46 +0000
Date: Wed, 1 Dec 2010 16:44:47 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Anatolij Gustschin <agust@denx.de>
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
Message-ID: <20101201164447.2215bc58@wker>
In-Reply-To: <20101201130534.5b95ce83@wker>
References: <20101129195014.19224240@wker>
	<20101201130534.5b95ce83@wker>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 1 Dec 2010 13:05:34 +0100
Anatolij Gustschin <agust@denx.de> wrote:
... 
> My question is:
> Is it possible that the reset occured while running in
> nor_erase_prepare() just after clearing the VID header magic,
> but before clearing the EC header magic?

yes, it is possible and it seems this is the reason for
that next issue we've observed. Adding the call to the
machine restart callback in nor_erase_prepare() just before
clearing EC header magic to simulate this hypothetical case
we see:
...
UBI DBG (pid 1287): ubi_eba_read_leb: read 160 bytes from offset 80112 of LEB 0:10, PEB 12
UBI DBG (pid 1287): ubi_close_volume: close device 0, volume 0, mode 1
nor_erase_prepare: ### RESET before clearing EC magic in peb # 177, off: 0xf6780000

and now we dump the EC and VID headers and some UBIFS
nodes of the PEB # 177:

=> md f6780000 50
f6780000: 55424923 01000000 00000000 00000034    UBI#...........4
f6780010: 00000040 00000080 753746f3 00000000    ...@....u7F.....
f6780020: 00000000 00000000 00000000 00000000    ................
f6780030: 00000000 00000000 00000000 6533c6f3    ............e3..
f6780040: 00000000 01010000 00000000 00000004    ................
f6780050: 00000000 00000000 00000000 00000000    ................
f6780060: 00000000 00000000 00000000 00003343    ..............3C
f6780070: 00000000 00000000 00000000 478a9cae    ............G...
f6780080: 31181006 f0deeea3 20b21600 00000000    1....... .......
f6780090: 20000000 0a000000 49040000 00000000     .......I.......
f67800a0: 31181006 5412d762 21b21600 00000000    1...T..b!.......
f67800b0: 40000000 08000000 1c000000 30920300    @...........0...
f67800c0: 01000000 0001c808 0001c808 00000005    ................
f67800d0: 00040000 00000001 0001cc60 0005cc60    ...........`...`
f67800e0: 31181006 2a49116c 22b21600 00000000    1...*I.l".......
f67800f0: 40000000 08000000 16000000 60230100    @...........`#..
f6780100: 02000000 00000000 bfaf7600 c0000000    ..........v.....
f6780110: 00000000 00000000 00000000 00000000    ................
f6780120: ffffffff ffffffff ffffffff ffffffff    ................
f6780130: ffffffff ffffffff ffffffff ffffffff    ................

After booting Linux and attaching the MTD device I can see
very similar things happen:
...
UBI DBG (pid 1277): ubi_scan: process PEB 177
UBI DBG (pid 1277): process_eb: scan PEB 177
UBI DBG (pid 1277): ubi_io_read_vid_hdr: bad magic number at PEB 177: 00000000 instead of 55424921
UBI error: check_corruption: PEB 177 contains corrupted VID header, and the data does not contain all 0xFF, this may be a non-UBI PEB or a severe VID header corruption which requires manual inspection
Volume identifier header dump:
	magic     00000000
	version   1
	vol_type  1
	copy_flag 0
	compat    0
	vol_id    0
	lnum      4
	data_size 0
	used_ebs  0
	data_pad  0
	sqnum     13123
	hdr_crc   478a9cae
Volume identifier header hexdump:
00000000: 00 00 00 00 01 01 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 33 43 00 00 00 00 00 00 00 00 00 00 00 00 47 8a 9c ae  ..............3C............G...
UBI DBG (pid 1277): check_corruption: hexdump of PEB 177 offset 128, length 262016
00000000: 31 18 10 06 f0 de ee a3 20 b2 16 00 00 00 00 00 20 00 00 00 0a 00 00 00 49 04 00 00 00 00 00 00  1....... ....... .......I.......
00000020: 31 18 10 06 54 12 d7 62 21 b2 16 00 00 00 00 00 40 00 00 00 08 00 00 00 1c 00 00 00 30 92 03 00  1...T..b!.......@...........0...
00000040: 01 00 00 00 00 01 c8 08 00 01 c8 08 00 00 00 05 00 04 00 00 00 00 00 01 00 01 cc 60 00 05 cc 60  ...........................`...`
00000060: 31 18 10 06 2a 49 11 6c 22 b2 16 00 00 00 00 00 40 00 00 00 08 00 00 00 16 00 00 00 60 23 01 00  1...*I.l".......@...........`#..
00000080: 02 00 00 00 00 00 00 00 bf af 76 00 c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ..........v.....................
000000a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................................
*
0003ff60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................................
UBI DBG (pid 1277): add_corrupted: add to corrupted: PEB 177, EC 52
...
UBI DBG (pid 1277): ubi_io_read_vid_hdr: no VID header found at PEB 207, only 0xFF bytes
UBI DBG (pid 1277): add_to_list: add to free: PEB 207, EC 52
UBI DBG (pid 1277): ubi_scan: scanning is finished
UBI error: check_what_we_have: 1 PEBs are corrupted and preserved
Corrupted PEBs are: 177
UBI: max. sequence number:       13124
UBI DBG (pid 1277): process_lvol: check layout volume
UBI DBG (pid 1277): ubi_eba_init_scan: initialize EBA sub-system
UBI error: ubi_eba_init_scan: no enough physical eraseblocks (0, need 1)
UBI error: ubi_eba_init_scan: 1 PEBs are corrupted and not used
UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -28
ubiattach: error!: cannot attach mtd5
           error 28 (No space left on device)
UBI DBG (pid 1280): ubi_open_volume_path: open volume ubi0:homefs, mode 1
UBI DBG (pid 1280): ubi_open_volume_nm: open device 0, volume homefs, mode 1

So, this is a problem with not atomic clearing of the magic numbers
in EC and VID header.

Anatolij

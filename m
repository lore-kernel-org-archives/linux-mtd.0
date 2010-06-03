Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OKAzy-00038L-0O
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2010 14:02:19 +0000
Received: by bwz5 with SMTP id 5so45321bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Jun 2010 07:02:16 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 3 Jun 2010 16:02:15 +0200
Message-ID: <AANLkTilGg81TGnkS2VwF6xdFCvsB_AF_8rLYVqTr-81g@mail.gmail.com>
Subject: CRC error when mounting UBIFS
From: Leo Barnes <barnes.leo@gmail.com>
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

Hello!

I am trying to create and mount an UBIFS partition and get the
following error when trying to mount it:
<7>[  397.117065] UBIFS DBG (pid 438): ubifs_start_scan: scan LEB 490:0
<7>[  397.117218] UBIFS DBG (pid 438): ubifs_scan: look at LEB 490:0
(126976 bytes left)
<7>[  397.117401] UBIFS DBG (pid 438): ubifs_scan_a_node: hit empty space
<7>[  397.117614] UBIFS DBG (pid 438): ubifs_end_scan: stop scanning
LEB 490 at offset 0
<3>[  397.119598] UBIFS error (pid 438): check_lpt_crc: invalid crc in
LPT node: crc 0 calc 90d1

This is what I have done:
1. I have compiled the kernel (2.6.32, msm-android) with paranoid UBI
checks, UBIFS debug level 3 and with UBIFS extra checks.
2. I have erased the partition with 'flash_eraseall /dev/mtd4' (I
wanted a completely clean partition so I know the fault is not with
ubiformat)
3. I have attached the partition with 'ubiattach /dev/ubi_ctrl -m 4'
4. I have created a ubi volume with 'ubivolume /dev/ubi0 -N ubivol -m'

These steps work flawlessly, but when I then try to mount the volume
with 'mount -t ubifs ubi0!ubivol /ubivol', I get the error message
shown above.

Any ideas on how to fix it? When I disable the UBIFS extra checks, I
can mount the volume, but it gets corrupted after a while. I find it
odd that I get CRC errors since the ubi-volume and the ubifs
filesystem is created by the kernel.

See below for more extensive kernel logs.
Best regards,
//Leo

'ubiattach /dev/ubi_ctrl -m 4':
UBI device number 0, total 756 LEBs (95993856 bytes, 91.5 MiB),
available 745 LEBs (94597120 bytes, 90.2 MiB), LEB size 126976 bytes
(124.0 KiB)

dmesg for 'ubiattach /dev/ubi_ctrl -m 4':
----------------------------------------
<5>[  189.954956] UBI: attaching mtd4 to ubi0
<7>[  189.955322] UBI DBG (pid 417): io_init: min_io_size      2048
<7>[  189.955932] UBI DBG (pid 417): io_init: hdrs_min_io_size 2048
<7>[  189.956268] UBI DBG (pid 417): io_init: ec_hdr_alsize    2048
<7>[  189.956878] UBI DBG (pid 417): io_init: vid_hdr_alsize   2048
<7>[  189.957244] UBI DBG (pid 417): io_init: vid_hdr_offset   2048
<7>[  189.957855] UBI DBG (pid 417): io_init: vid_hdr_aloffset 2048
<7>[  189.958190] UBI DBG (pid 417): io_init: vid_hdr_shift    0
<7>[  189.958831] UBI DBG (pid 417): io_init: leb_start        4096
<7>[  189.959167] UBI DBG (pid 417): io_init: max_erroneous    76
<5>[  189.961547] UBI: physical eraseblock size:   131072 bytes (128 KiB)
<5>[  189.961914] UBI: logical eraseblock size:    126976 bytes
<5>[  189.962860] UBI: smallest flash I/O unit:    2048
<5>[  189.963195] UBI: VID header offset:          2048 (aligned 2048)
<5>[  189.964111] UBI: data offset:                4096
<7>[  190.764221] UBI DBG (pid 417): ubi_scan: scanning is finished
<5>[  190.764556] UBI: empty MTD device detected
<5>[  190.888336] UBI: create volume table (copy #1)
<5>[  190.957275] UBI: create volume table (copy #2)
<5>[  191.038269] UBI: attached mtd4 to ubi0
<5>[  191.038604] UBI: MTD device name:            "cache"
<5>[  191.038940] UBI: MTD device size:            95 MiB
<5>[  191.039550] UBI: number of good PEBs:        756
<5>[  191.040466] UBI: number of bad PEBs:         4
<5>[  191.041076] UBI: max. allowed volumes:       128
<5>[  191.041412] UBI: wear-leveling threshold:    4096
<5>[  191.041748] UBI: number of internal volumes: 1
<5>[  191.042358] UBI: number of user volumes:     0
<5>[  191.042694] UBI: available PEBs:             745
<5>[  191.043334] UBI: total number of reserved PEBs: 11
<5>[  191.043670] UBI: number of PEBs reserved for bad PEB handling: 7
<5>[  191.044281] UBI: max/mean erase counter: 0/0
<5>[  191.044616] UBI: image sequence number: 0
<5>[  191.044952] UBI: background thread "ubi_bgt0d" started, PID 418
----------------------------------------

'ubivolume /dev/ubi0 -N ubivol -m':
Set volume size to 94597120
Volume ID 0, size 745 LEBs (94597120 bytes, 90.2 MiB), LEB size 126976
bytes (124.0 KiB), dynamic, name "ubivol", alignment 1

dmesg for 'ubivolume /dev/ubi0 -N ubivol -m':
----------------------------------------
nothing
----------------------------------------

'mount -t ubifs ubi0!ubivol /ubivol':
mount: mounting ubi0!ubivol on ubivol failed: Invalid argument

dmesg for 'mount -t ubifs ubi0!ubivol /ubivol':
----------------------------------------
<7>[  395.754272] UBIFS DBG (pid 438): ubifs_get_sb: name ubi0!ubivol,
flags 0x8000
<7>[  395.754669] UBIFS DBG (pid 438): ubifs_get_sb: opened ubi0_0
<7>[  395.759246] UBIFS DBG (pid 438): set_ltab: LEB 7 free 126976
dirty 0 to 122880 213
<7>[  395.814483] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: space_bits 14
<7>[  395.814849] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: lpt_lnum_bits 2
<7>[  395.815460] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: lpt_offs_bits 17
<7>[  395.815826] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: lpt_spc_bits 17
<7>[  395.816436] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: pcnt_bits 8
<7>[  395.817077] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: lnum_bits 10
<7>[  395.817413] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: pnode_sz 17
<7>[  395.818023] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: nnode_sz 12
<7>[  395.818359] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: ltab_sz 11
<7>[  395.819000] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: lsave_sz 323
<7>[  395.819335] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: lsave_cnt 256
<7>[  395.820037] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: lpt_hght 4
<7>[  395.820373] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: big_lpt 0
<7>[  395.820983] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: LPT root
is at 7:3860
<7>[  395.821624] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: LPT head
is at 7:4096
<7>[  395.821960] UBIFS DBG (pid 438): ubifs_create_dflt_lpt: LPT ltab
is at 7:3872
<7>[  395.822692] UBIFS DBG (pid 438): create_default_filesystem: LEB
Properties Tree created (LEBs 7-8)
<7>[  395.823547] UBIFS DBG (pid 438): ubifs_write_node: LEB 0:0,
superblock node, length 4096 (aligned 4096)
<7>[  395.879119] UBIFS DBG (pid 438): create_default_filesystem:
default superblock created at LEB 0:0
<7>[  395.879577] UBIFS DBG (pid 438): ubifs_write_node: LEB 1:0,
master node, length 512 (aligned 2048)
<7>[  395.932678] UBIFS DBG (pid 438): ubifs_write_node: LEB 2:0,
master node, length 512 (aligned 2048)
<7>[  395.985870] UBIFS DBG (pid 438): create_default_filesystem:
default master node created at LEB 1:0
<7>[  395.986572] UBIFS DBG (pid 438): ubifs_write_node: LEB 11:0,
indexing node, length 48 (aligned 2048)
<7>[  396.039764] UBIFS DBG (pid 438): create_default_filesystem:
default root indexing node created LEB 11:0
<7>[  396.040222] UBIFS DBG (pid 438): ubifs_write_node: LEB 12:0,
inode node, length 160 (aligned 2048)
<7>[  396.093170] UBIFS DBG (pid 438): create_default_filesystem: root
inode created at LEB 12:0
<7>[  396.093902] UBIFS DBG (pid 438): ubifs_write_node: LEB 3:0,
commit start node, length 32 (aligned 2048)
<5>[  396.147125] UBIFS: default file-system created
<7>[  396.147613] UBIFS DBG (pid 438): ubifs_read_node: LEB 0:0,
superblock node, length 4096
<7>[  396.150421] UBIFS DBG (pid 438): ubifs_start_scan: scan LEB 1:0
<7>[  396.150878] UBIFS DBG (pid 439): ubifs_bg_thread: background
thread "ubifs_bgt0_0" started, PID 439
<7>[  396.195709] UBIFS DBG (pid 438): ubifs_scan: look at LEB 1:0
(126976 bytes left)
<7>[  396.196350] UBIFS DBG (pid 438): ubifs_scan_a_node: scanning master node
<7>[  396.196746] UBIFS DBG (pid 438): ubifs_scan: look at LEB 1:512
(126464 bytes left)
<7>[  396.197357] UBIFS DBG (pid 438): ubifs_scan_a_node: scanning padding node
<7>[  396.197998] UBIFS DBG (pid 438): ubifs_scan_a_node: 1508 bytes
padded, offset now 2048
<7>[  396.198364] UBIFS DBG (pid 438): ubifs_scan: look at LEB 1:2048
(124928 bytes left)
<7>[  396.198974] UBIFS DBG (pid 438): ubifs_scan_a_node: hit empty space
<7>[  396.199615] UBIFS DBG (pid 438): ubifs_end_scan: stop scanning
LEB 1 at offset 2048
<7>[  396.201324] UBIFS DBG (pid 438): ubifs_start_scan: scan LEB 2:0
<7>[  396.246887] UBIFS DBG (pid 438): ubifs_scan: look at LEB 2:0
(126976 bytes left)
<7>[  396.247283] UBIFS DBG (pid 438): ubifs_scan_a_node: scanning master node
<7>[  396.247985] UBIFS DBG (pid 438): ubifs_scan: look at LEB 2:512
(126464 bytes left)
<7>[  396.248657] UBIFS DBG (pid 438): ubifs_scan_a_node: scanning padding node
<7>[  396.249023] UBIFS DBG (pid 438): ubifs_scan_a_node: 1508 bytes
padded, offset now 2048
<7>[  396.249725] UBIFS DBG (pid 438): ubifs_scan: look at LEB 2:2048
(124928 bytes left)
<7>[  396.251129] UBIFS DBG (pid 438): ubifs_scan_a_node: hit empty space
<7>[  396.251495] UBIFS DBG (pid 438): ubifs_end_scan: stop scanning
LEB 2 at offset 2048
<7>[  396.253448] UBIFS DBG (pid 438): ubifs_read_node: LEB 11:0,
indexing node, length 48
<7>[  396.254638] UBIFS DBG (pid 438): ubifs_write_node: LEB 1:2048,
master node, length 512 (aligned 2048)
<7>[  396.257598] UBIFS DBG (pid 438): ubifs_write_node: LEB 2:2048,
master node, length 512 (aligned 2048)
<7>[  396.263519] UBIFS DBG (pid 438): lpt_init_rd: space_bits 14
<7>[  396.264160] UBIFS DBG (pid 438): lpt_init_rd: lpt_lnum_bits 2
<7>[  396.264526] UBIFS DBG (pid 438): lpt_init_rd: lpt_offs_bits 17
<7>[  396.265136] UBIFS DBG (pid 438): lpt_init_rd: lpt_spc_bits 17
<7>[  396.265502] UBIFS DBG (pid 438): lpt_init_rd: pcnt_bits 8
<7>[  396.266113] UBIFS DBG (pid 438): lpt_init_rd: lnum_bits 10
<7>[  396.266448] UBIFS DBG (pid 438): lpt_init_rd: pnode_sz 17
<7>[  396.267059] UBIFS DBG (pid 438): lpt_init_rd: nnode_sz 12
<7>[  396.267395] UBIFS DBG (pid 438): lpt_init_rd: ltab_sz 11
<7>[  396.268005] UBIFS DBG (pid 438): lpt_init_rd: lsave_sz 323
<7>[  396.268341] UBIFS DBG (pid 438): lpt_init_rd: lsave_cnt 256
<7>[  396.268951] UBIFS DBG (pid 438): lpt_init_rd: lpt_hght 4
<7>[  396.269287] UBIFS DBG (pid 438): lpt_init_rd: big_lpt 0
<7>[  396.269958] UBIFS DBG (pid 438): lpt_init_rd: LPT root is at 7:3860
<7>[  396.270324] UBIFS DBG (pid 438): lpt_init_rd: LPT head is at 7:4096
<7>[  396.270935] UBIFS DBG (pid 438): lpt_init_rd: LPT ltab is at 7:3872
<7>[  396.271514] UBIFS DBG (pid 438): ubifs_read_node: LEB 11:0,
indexing node, length 48
<7>[  396.273803] UBIFS DBG (pid 438): read_znode: LEB 11:0, level 0, 1 branch
<7>[  396.275024] UBIFS DBG (pid 438): ubifs_add_lpt_dirt: LEB 7 add 12 to 213
<7>[  396.275421] UBIFS DBG (pid 438): ubifs_add_lpt_dirt: LEB 7 add 11 to 225
<7>[  396.276550] UBIFS DBG (pid 438): ubifs_add_lpt_dirt: LEB 7 add 12 to 236
<7>[  396.277374] UBIFS DBG (pid 438): ubifs_add_lpt_dirt: LEB 7 add 12 to 248
<7>[  396.278533] UBIFS DBG (pid 438): ubifs_add_lpt_dirt: LEB 7 add 12 to 260
<7>[  396.279724] UBIFS DBG (pid 438): ubifs_lpt_lookup: LEB 11, free
124928, dirty 2000, flags 34
<7>[  396.280090] UBIFS DBG (pid 438): ubifs_lpt_lookup: LEB 12, free
124928, dirty 1888, flags 3
<7>[  396.280731] UBIFS DBG (pid 438): ubifs_add_lpt_dirt: LEB 7 add 17 to 272
<7>[  396.281372] UBIFS DBG (pid 438): ubifs_lpt_lookup_dirty: LEB 11,
free 124928, dirty 2000, flags 34
<7>[  396.281738] UBIFS DBG (pid 438): ubifs_change_lp: LEB 11, free
-2147483647, dirty -2147483647, flags 50
<7>[  396.282379] UBIFS DBG (pid 438): ubifs_lpt_lookup_dirty: LEB 11,
free 124928, dirty 2000, flags 34
<7>[  396.283172] UBIFS DBG (pid 438): ubifs_replay_journal: start
replaying the journal
<7>[  396.283813] UBIFS DBG (pid 438): replay_log_leb: replay log LEB 3:0
<7>[  396.284149] UBIFS DBG (pid 438): ubifs_start_scan: scan LEB 3:0
<7>[  396.330383] UBIFS DBG (pid 438): ubifs_scan: look at LEB 3:0
(126976 bytes left)
<7>[  396.330749] UBIFS DBG (pid 438): ubifs_scan_a_node: scanning
commit start node
<7>[  396.331390] UBIFS DBG (pid 438): ubifs_scan: look at LEB 3:32
(126944 bytes left)
<7>[  396.332031] UBIFS DBG (pid 438): ubifs_scan_a_node: scanning padding node
<7>[  396.332366] UBIFS DBG (pid 438): ubifs_scan_a_node: 1988 bytes
padded, offset now 2048
<7>[  396.333007] UBIFS DBG (pid 438): ubifs_scan: look at LEB 3:2048
(124928 bytes left)
<7>[  396.333618] UBIFS DBG (pid 438): ubifs_scan_a_node: hit empty space
<7>[  396.333953] UBIFS DBG (pid 438): ubifs_end_scan: stop scanning
LEB 3 at offset 2048
<7>[  396.335845] UBIFS DBG (pid 438): replay_log_leb: commit start sqnum 7
<7>[  396.336486] UBIFS DBG (pid 438): replay_log_leb: replay log LEB 4:0
<7>[  396.336822] UBIFS DBG (pid 438): ubifs_start_scan: scan LEB 4:0
<7>[  396.337615] UBIFS DBG (pid 438): ubifs_scan: look at LEB 4:0
(126976 bytes left)
<7>[  396.337982] UBIFS DBG (pid 438): ubifs_scan_a_node: hit empty space
<7>[  396.338592] UBIFS DBG (pid 438): ubifs_end_scan: stop scanning
LEB 4 at offset 0
<7>[  396.340118] UBIFS DBG (pid 438): ubifs_replay_journal: finished,
log head LEB 3:2048, max_sqnum 7, highest_inum 64
<7>[  396.341064] UBIFS DBG (pid 438): ubifs_lpt_lookup_dirty: LEB 13,
free 126976, dirty 0, flags 4
<7>[  396.341705] UBIFS DBG (pid 438): ubifs_change_lp: LEB 13, free
126976, dirty 0, flags 20
<7>[  396.342346] UBIFS DBG (pid 438): ubifs_lpt_lookup_dirty: LEB 13,
free 126976, dirty 0, flags 4
<7>[  396.343048] UBIFS DBG (pid 438): ubifs_start_scan: scan LEB 11:0
<7>[  396.388977] UBIFS DBG (pid 438): ubifs_scan: look at LEB 11:0
(126976 bytes left)
<7>[  396.389617] UBIFS DBG (pid 438): ubifs_scan_a_node: scanning indexing node
<7>[  396.390075] UBIFS DBG (pid 438): ubifs_scan: look at LEB 11:48
(126928 bytes left)
<7>[  396.391265] UBIFS DBG (pid 438): ubifs_scan_a_node: scanning padding node
<7>[  396.391906] UBIFS DBG (pid 438): ubifs_scan_a_node: 1972 bytes
padded, offset now 2048
<7>[  396.392242] UBIFS DBG (pid 438): ubifs_scan: look at LEB 11:2048
(124928 bytes left)
<7>[  396.392883] UBIFS DBG (pid 438): ubifs_scan_a_node: hit empty space
<7>[  396.393493] UBIFS DBG (pid 438): ubifs_end_scan: stop scanning
LEB 11 at offset 2048
<7>[  396.395141] UBIFS DBG (pid 438): ubifs_start_scan: scan LEB 12:0
<7>[  396.440399] UBIFS DBG (pid 438): ubifs_scan: look at LEB 12:0
(126976 bytes left)
<7>[  396.441101] UBIFS DBG (pid 438): ubifs_scan_a_node: scanning inode node
<7>[  396.441467] UBIFS DBG (pid 438): ubifs_scan: look at LEB 12:160
(126816 bytes left)
<7>[  396.442108] UBIFS DBG (pid 438): ubifs_scan_a_node: scanning padding node
<7>[  396.442443] UBIFS DBG (pid 438): ubifs_scan_a_node: 1860 bytes
padded, offset now 2048
<7>[  396.443084] UBIFS DBG (pid 438): ubifs_scan: look at LEB 12:2048
(124928 bytes left)
<7>[  396.443695] UBIFS DBG (pid 438): ubifs_scan_a_node: hit empty space
<7>[  396.444061] UBIFS DBG (pid 438): ubifs_end_scan: stop scanning
LEB 12 at offset 2048
<7>[  396.445922] UBIFS DBG (pid 438): ubifs_lookup_level0: search key
(1, inode)
<7>[  396.446563] UBIFS DBG (pid 438): ubifs_lookup_level0: found 1, lvl 0, n 0
<7>[  396.446929] UBIFS DBG (pid 438): ubifs_start_scan: scan LEB 13:0
<7>[  396.447723] UBIFS DBG (pid 438): ubifs_scan: look at LEB 13:0
(126976 bytes left)
<7>[  396.448089] UBIFS DBG (pid 438): ubifs_scan_a_node: hit empty space
<7>[  396.448699] UBIFS DBG (pid 438): ubifs_end_scan: stop scanning
LEB 13 at offset 0
<7>[  396.450469] UBIFS DBG (pid 438): ubifs_start_scan: scan LEB 14:0
<7>[  396.451019] UBIFS DBG (pid 438): ubifs_scan: look at LEB 14:0
(126976 bytes left)
<7>[  396.453002] UBIFS DBG (pid 438): ubifs_scan_a_node: hit empty space
<7>[  396.453369] UBIFS DBG (pid 438): ubifs_end_scan: stop scanning
LEB 14 at offset 0
........ and so on ............
<7>[  397.117065] UBIFS DBG (pid 438): ubifs_start_scan: scan LEB 490:0
<7>[  397.117218] UBIFS DBG (pid 438): ubifs_scan: look at LEB 490:0
(126976 bytes left)
<7>[  397.117401] UBIFS DBG (pid 438): ubifs_scan_a_node: hit empty space
<7>[  397.117614] UBIFS DBG (pid 438): ubifs_end_scan: stop scanning
LEB 490 at offset 0
<3>[  397.119598] UBIFS error (pid 438): check_lpt_crc: invalid crc in
LPT node: crc 0 calc 90d1
<4>[  397.119903] [<c0028990>] (unwind_backtrace+0x0/0xd8) from
[<c0155be4>] (check_lpt_crc+0x8c/0xa4)
<4>[  397.120117] [<c0155be4>] (check_lpt_crc+0x8c/0xa4) from
[<c0155d04>] (unpack_pnode+0x108/0x110)
<4>[  397.120300] [<c0155d04>] (unpack_pnode+0x108/0x110) from
[<c0155ed4>] (scan_get_pnode+0x1c8/0x28c)
<4>[  397.120422] [<c0155ed4>] (scan_get_pnode+0x1c8/0x28c) from
[<c01567d8>] (ubifs_lpt_scan_nolock+0x45c/0x49c)
<4>[  397.120635] [<c01567d8>] (ubifs_lpt_scan_nolock+0x45c/0x49c)
from [<c015936c>] (dbg_check_lprops+0xa0/0x2d4)
<4>[  397.120849] [<c015936c>] (dbg_check_lprops+0xa0/0x2d4) from
[<c013a140>] (ubifs_fill_super+0xcf8/0x1dfc)
<4>[  397.121063] [<c013a140>] (ubifs_fill_super+0xcf8/0x1dfc) from
[<c013b52c>] (ubifs_get_sb+0x2e8/0x35c)
<4>[  397.121276] [<c013b52c>] (ubifs_get_sb+0x2e8/0x35c) from
[<c00b774c>] (vfs_kern_mount+0x4c/0xd0)
<4>[  397.121490] [<c00b774c>] (vfs_kern_mount+0x4c/0xd0) from
[<c00b7814>] (do_kern_mount+0x34/0xd8)
<4>[  397.121612] [<c00b7814>] (do_kern_mount+0x34/0xd8) from
[<c00cf4e8>] (do_mount+0x73c/0x7b8)
<4>[  397.121826] [<c00cf4e8>] (do_mount+0x73c/0x7b8) from
[<c00cf5e8>] (sys_mount+0x84/0xc4)
<4>[  397.122009] [<c00cf5e8>] (sys_mount+0x84/0xc4) from [<c0023f00>]
(ret_fast_syscall+0x0/0x2c)
<7>[  397.122833] UBIFS DBG (pid 439): ubifs_bg_thread: background
thread "ubifs_bgt0_0" stops
----------------------------------------

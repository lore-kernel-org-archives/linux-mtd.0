Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2O1K-0007Io-2r
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2011 13:22:44 +0000
Received: by gyd12 with SMTP id 12so2979627gyd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Mar 2011 06:22:39 -0700 (PDT)
Subject: Is the mtd-utils common
From: ll <vic7tor@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Mar 2011 21:22:31 +0800
Message-ID: <1300886551.12466.7.camel@ll-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Today I upgrade my ubuntu from 10.04 to 10.10. After the upgrade, when I
use mkfs.ubifs and ubinize to create image. It make error when I mount
the /dev/ubi0_0. The error message below. Does the ubuntu upgrade change
the version of mkfs.ubifs? The linux kernel version is 2.6.37. Could
anyone help me? 

[ 3727.837059] UBI: volume 0 ("rootfs") re-sized from 1626 to 2024 LEBs
[ 3727.837063] UBI DBG (pid 8119): uif_init: ubi0 major is 250
[ 3727.837241] UBI DBG (pid 8119): ubi_add_volume: add volume 0
[ 3727.837342] UBI: attached mtd0 to ubi0
[ 3727.837344] UBI: MTD device name:            "NAND simulator
partition 0"
[ 3727.837345] UBI: MTD device size:            256 MiB
[ 3727.837346] UBI: number of good PEBs:        2048
[ 3727.837347] UBI: number of bad PEBs:         0
[ 3727.837349] UBI: number of corrupted PEBs:   0
[ 3727.837350] UBI: max. allowed volumes:       128
[ 3727.837351] UBI: wear-leveling threshold:    4096
[ 3727.837352] UBI: number of internal volumes: 1
[ 3727.837353] UBI: number of user volumes:     1
[ 3727.837354] UBI: available PEBs:             0
[ 3727.837355] UBI: total number of reserved PEBs: 2048
[ 3727.837357] UBI: number of PEBs reserved for bad PEB handling: 20
[ 3727.837358] UBI: max/mean erase counter: 1/0
[ 3727.837359] UBI: image sequence number:  489715990
[ 3727.838040] UBI: background thread "ubi_bgt0d" started, PID 8121
[ 3753.570906] UBI DBG (pid 8312): ubi_open_volume_path: open
volume /dev/ubi0_0, mode 1
[ 3753.570912] UBI DBG (pid 8312): ubi_open_volume: open device 0,
volume 0, mode 1
[ 3753.570921] UBI DBG (pid 8312): ubi_open_volume: open device 0,
volume 0, mode 2
[ 3753.570985] UBI DBG (pid 8312): ubi_is_mapped: test LEB 0:0
[ 3753.571015] UBI DBG (pid 8312): ubi_leb_read: read 4096 bytes from
LEB 0:0:0

[ 3753.571036] UBIFS error (pid 8312): ubifs_check_node: bad CRC:
calculated 0x9ec6d29b, read 0x3a705d1d
[ 3753.571038] UBIFS error (pid 8312): ubifs_check_node: bad node at LEB
0:0
[ 3753.571040] 	magic          0x6101831
[ 3753.571041] 	crc            0x3a705d1d
[ 3753.571043] 	node_type      6 (superblock node)
[ 3753.571044] 	group_type     0 (no node group)
[ 3753.571045] 	sqnum          2316
[ 3753.571046] 	len            4096
[ 3753.571047] 	key_hash       0 (R5)
[ 3753.571048] 	key_fmt        0 (simple)
[ 3753.571049] 	flags          0x0
[ 3753.571050] 	  big_lpt      0
[ 3753.571051] 	min_io_size    2048
[ 3753.571052] 	leb_size       129024
[ 3753.571053] 	leb_cnt        25
[ 3753.571054] 	max_leb_cnt    1624
[ 3753.571055] 	max_bud_bytes  8388608
[ 3753.571056] 	log_lebs       5
[ 3753.571057] 	lpt_lebs       2
[ 3753.571058] 	orph_lebs      1
[ 3753.571059] 	jhead_cnt      1
[ 3753.571060] 	fanout         8
[ 3753.571061] 	lsave_cnt      256
[ 3753.571062] 	default_compr  1
[ 3753.571063] 	rp_size        0
[ 3753.571064] 	rp_uid         0
[ 3753.571065] 	rp_gid         0
[ 3753.571066] 	fmt_version    4
[ 3753.571067] 	time_gran      1000000000
[ 3753.571069] 	UUID           A493A596-78A1-4A6A-9371-22D7BBB8CAF1
[ 3753.571072] Pid: 8312, comm: mount Tainted: P            2.6.37 #3
[ 3753.571073] Call Trace:
[ 3753.571083]  [<fdcf49ad>] ubifs_check_node+0x1ad/0x310 [ubifs]
[ 3753.571090]  [<fdcf4bef>] ubifs_read_node+0xdf/0x3d0 [ubifs]
[ 3753.571096]  [<fdcf2a8b>] ? ubifs_read_sb_node+0x2b/0x90 [ubifs]
[ 3753.571101]  [<fdcf2ab6>] ubifs_read_sb_node+0x56/0x90 [ubifs]
[ 3753.571106]  [<fdcf2c6f>] ubifs_read_superblock+0x15f/0x1170 [ubifs]
[ 3753.571111]  [<c01f7750>] ? map_vm_area+0x30/0x50
[ 3753.571114]  [<c01f8d9d>] ? __vmalloc_area_node+0xbd/0x110
[ 3753.571121]  [<fdd21ddd>] ? ubifs_debugging_init+0x5d/0x1e0 [ubifs]
[ 3753.571126]  [<fdcf103b>] ? ubifs_fill_super+0x81b/0x1d10 [ubifs]
[ 3753.571129]  [<c01f8cdb>] ? __vmalloc_node+0x9b/0xa0
[ 3753.571134]  [<fdcf103b>] ? ubifs_fill_super+0x81b/0x1d10 [ubifs]
[ 3753.571139]  [<fdcf103b>] ? ubifs_fill_super+0x81b/0x1d10 [ubifs]
[ 3753.571141]  [<c01f8f30>] ? vmalloc+0x30/0x40
[ 3753.571146]  [<fdcf0eac>] ubifs_fill_super+0x68c/0x1d10 [ubifs]
[ 3753.571151]  [<fdcee010>] ? sb_test+0x0/0x20 [ubifs]
[ 3753.571154]  [<c02144a6>] ? sget+0x2f6/0x3a0
[ 3753.571160]  [<fdcf2616>] ubifs_mount+0xe6/0x360 [ubifs]
[ 3753.571163]  [<c03525f4>] ? ida_get_new_above+0x104/0x1a0
[ 3753.571166]  [<c0213f16>] vfs_kern_mount+0x76/0x210
[ 3753.571169]  [<c0228377>] ? get_fs_type+0x97/0xb0
[ 3753.571174]  [<fdcf2530>] ? ubifs_mount+0x0/0x360 [ubifs]
[ 3753.571176]  [<c021410e>] do_kern_mount+0x3e/0xe0
[ 3753.571179]  [<c022b113>] do_mount+0x2e3/0x6e0
[ 3753.571182]  [<c01e5c89>] ? strndup_user+0x49/0x60
[ 3753.571184]  [<c022b57b>] sys_mount+0x6b/0xa0
[ 3753.571186]  [<c01030e3>] sysenter_do_call+0x12/0x28
[ 3753.571188] UBIFS error (pid 8312): ubifs_read_node: expected node
type 6
[ 3753.580101] UBI DBG (pid 8312): ubi_close_volume: close device 0,
volume 0, mode 2
[ 3753.580109] UBI DBG (pid 8312): ubi_close_volume: close device 0,
volume 0, mode 1

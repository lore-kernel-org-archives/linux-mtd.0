Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRz8b-00007J-T9
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:54:27 +0000
Message-ID: <55D442C8.90707@cn.fujitsu.com>
Date: Wed, 19 Aug 2015 16:48:08 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <richard@nod.at>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: Re: [RFC PATCH 00/27] Introduce ubifs_dump in ubifs-utils
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: multipart/mixed; boundary="------------000504030707040705010409"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------000504030707040705010409
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2015 04:39 PM, Dongsheng Yang wrote:
> Hi Atem, Richard and Brian,
[...]
> Please help to review or test it.
> Thanx
>
> Dongsheng Yang (27):
>    mtd-utils: Restructure the mtd-utils source.
>    ubifs: pick some common definitions into ubifs_common.h
>    ubifs: move the all io related code into io.[h|c]
>    ubifs: remove the including of mkfs.ubifs.h in lpt.c
>    ubifs: cut off the dependence from compr.o to mkfs.ubifs
>    ubifs: cut off the dependence from devtable to mkfs.ubifs.h
>    ubifs: introduce ubifs-utils/include and ubifs-utils/lib
>    ubifs: move more functions into io lib
>    ubifs: introduce a new tool ubifs_dump
>    ubifs: introduce list.h
>    ubifs: copy some important data in ubifs.h from kernel to ubifs-utils
>    ubifs: copy some important functions in key.h from kernel to
>      ubifs-utils
>    ubifs: ubifs_dump: add dump_ch and dump_node functions
>    ubifs: defs.h: introduce some compatible definition for printk class
>    ubifs: io: introduce ubifs_read function to read ubi volume
>    ubifs: ubifs_dump: dump super block
>    ubifs: introduce scan for ubifs-utils
>    ubifs: add some more compatible definitions in defs.h
>    ubifs: ubifs_dump: dump master node
>    ubifs: ubifs_dump: dump log area
>    ubifs: introduce lprops lib
>    ubifs: lpt: implement functions to scan lpt
>    ubifs: ubifs_dump: dump lpt area
>    ubifs: ubifs_dump: dump index area
>    ubifs: defs.h: introduce some compatible definitions about integer
>      such as __u16
>    ubifs: introduce hexdump lib
>    ubifs: ubifs_dump: dump data in hex format

All of these patches are for mtd-utils repo.

Really sorry for the prefix, I should have added a mtd-utils in
each subject.

About the result of ubifs_dump, I attached one of it to this mail.

The ubifs is created by following commands:
[root@atest-guest mtd-utils]# mkfs.ubifs -y /dev/ubi0_0
[root@atest-guest mtd-utils]# mount /dev/ubi0_0 /mnt/ubifs
[root@atest-guest mtd-utils]# echo "UBIFS" > /mnt/ubifs/data
[root@atest-guest mtd-utils]# umount /mnt/ubifs
[root@atest-guest mtd-utils]# ubifs_dump /dev/ubi0_0 > /tmp/ubifs_dump

And you can find the
"		name 				data"
in ubifs_dump which stands for the file name in dentry node.

Also you can find:
"		data:"
"		00000000: 55 42 49 46 53 0a"
in ubifs_dump which stands for the "UBIFS" in data node.

Yang
>
>   Makefile                                           |   76 +-
>   flash_erase.c => flash-utils/flash_erase.c         |    0
>   flash_eraseall => flash-utils/flash_eraseall       |    0
>   flash_lock.c => flash-utils/flash_lock.c           |    0
>   flash_otp_dump.c => flash-utils/flash_otp_dump.c   |    0
>   flash_otp_info.c => flash-utils/flash_otp_info.c   |    0
>   flash_otp_lock.c => flash-utils/flash_otp_lock.c   |    0
>   flash_otp_write.c => flash-utils/flash_otp_write.c |    0
>   flash_unlock.c => flash-utils/flash_unlock.c       |    0
>   flashcp.c => flash-utils/flashcp.c                 |    0
>   compr.c => jffsX-utils/compr.c                     |    0
>   compr.h => jffsX-utils/compr.h                     |    0
>   compr_lzo.c => jffsX-utils/compr_lzo.c             |    0
>   compr_rtime.c => jffsX-utils/compr_rtime.c         |    0
>   compr_zlib.c => jffsX-utils/compr_zlib.c           |    0
>   device_table.txt => jffsX-utils/device_table.txt   |    0
>   jffs-dump.c => jffsX-utils/jffs-dump.c             |    0
>   jffs2dump.c => jffsX-utils/jffs2dump.c             |    0
>   jffs2reader.c => jffsX-utils/jffs2reader.c         |    0
>   mkfs.jffs2.1 => jffsX-utils/mkfs.jffs2.1           |    0
>   mkfs.jffs2.c => jffsX-utils/mkfs.jffs2.c           |    0
>   rbtree.c => jffsX-utils/rbtree.c                   |    0
>   rbtree.h => jffsX-utils/rbtree.h                   |    0
>   summary.h => jffsX-utils/summary.h                 |    0
>   sumtool.c => jffsX-utils/sumtool.c                 |    0
>   MAKEDEV => misc-utils/MAKEDEV                      |    0
>   doc_loadbios.c => misc-utils/doc_loadbios.c        |    0
>   docfdisk.c => misc-utils/docfdisk.c                |    0
>   fectest.c => misc-utils/fectest.c                  |    0
>   ftl_check.c => misc-utils/ftl_check.c              |    0
>   ftl_format.c => misc-utils/ftl_format.c            |    0
>   mcast_image.h => misc-utils/mcast_image.h          |    0
>   mtd_debug.c => misc-utils/mtd_debug.c              |    0
>   mtdpart.c => misc-utils/mtdpart.c                  |    0
>   recv_image.c => misc-utils/recv_image.c            |    0
>   serve_image.c => misc-utils/serve_image.c          |    0
>   mkfs.ubifs/defs.h                                  |   92 --
>   mkfs.ubifs/lpt.c                                   |  578 ---------
>   mkfs.ubifs/mkfs.ubifs.h                            |  150 ---
>   load_nandsim.sh => nand-utils/load_nandsim.sh      |    0
>   nanddump.c => nand-utils/nanddump.c                |    0
>   nandtest.c => nand-utils/nandtest.c                |    0
>   nandwrite.c => nand-utils/nandwrite.c              |    0
>   nftl_format.c => nand-utils/nftl_format.c          |    0
>   nftldump.c => nand-utils/nftldump.c                |    0
>   rfddump.c => nor-utils/rfddump.c                   |    0
>   rfdformat.c => nor-utils/rfdformat.c               |    0
>   {mkfs.ubifs => ubifs-utils}/COPYING                |    0
>   {mkfs.ubifs => ubifs-utils}/README                 |    0
>   {mkfs.ubifs => ubifs-utils/include}/compr.h        |    3 +-
>   {mkfs.ubifs => ubifs-utils/include}/crc16.h        |    0
>   ubifs-utils/include/defs.h                         |  215 ++++
>   ubifs-utils/include/devtable.h                     |   55 +
>   .../hashtable => ubifs-utils/include}/hashtable.h  |    0
>   .../include}/hashtable_itr.h                       |    0
>   .../include}/hashtable_private.h                   |    0
>   ubifs-utils/include/hexdump.h                      |   21 +
>   ubifs-utils/include/io.h                           |   21 +
>   {mkfs.ubifs => ubifs-utils/include}/key.h          |   76 +-
>   ubifs-utils/include/list.h                         |  484 ++++++++
>   ubifs-utils/include/lprops.h                       |    6 +
>   {mkfs.ubifs => ubifs-utils/include}/lpt.h          |    4 +
>   ubifs-utils/include/scan.h                         |    8 +
>   {mkfs.ubifs => ubifs-utils/include}/ubifs.h        |   96 +-
>   ubifs-utils/include/ubifs_common.h                 |   50 +
>   {mkfs.ubifs => ubifs-utils/lib}/compr.c            |   20 +-
>   {mkfs.ubifs => ubifs-utils/lib}/crc16.c            |    0
>   {mkfs.ubifs => ubifs-utils/lib}/devtable.c         |    7 +-
>   .../hashtable => ubifs-utils/lib}/hashtable.c      |    0
>   .../hashtable => ubifs-utils/lib}/hashtable_itr.c  |    0
>   ubifs-utils/lib/hexdump.c                          |  200 +++
>   ubifs-utils/lib/io.c                               |  152 +++
>   ubifs-utils/lib/lprops.c                           |   79 ++
>   ubifs-utils/lib/lpt.c                              | 1275 ++++++++++++++++++++
>   ubifs-utils/lib/scan.c                             |  318 +++++
>   {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/.gitignore  |    0
>   .../mkfs.ubifs}/mkfs.ubifs.c                       |  144 +--
>   ubifs-utils/mkfs.ubifs/mkfs.ubifs.h                |   54 +
>   ubifs-utils/ubifs_dump/ubifs_dump.c                | 1041 ++++++++++++++++
>   79 files changed, 4220 insertions(+), 1005 deletions(-)
>   rename flash_erase.c => flash-utils/flash_erase.c (100%)
>   rename flash_eraseall => flash-utils/flash_eraseall (100%)
>   rename flash_lock.c => flash-utils/flash_lock.c (100%)
>   rename flash_otp_dump.c => flash-utils/flash_otp_dump.c (100%)
>   rename flash_otp_info.c => flash-utils/flash_otp_info.c (100%)
>   rename flash_otp_lock.c => flash-utils/flash_otp_lock.c (100%)
>   rename flash_otp_write.c => flash-utils/flash_otp_write.c (100%)
>   rename flash_unlock.c => flash-utils/flash_unlock.c (100%)
>   rename flashcp.c => flash-utils/flashcp.c (100%)
>   rename compr.c => jffsX-utils/compr.c (100%)
>   rename compr.h => jffsX-utils/compr.h (100%)
>   rename compr_lzo.c => jffsX-utils/compr_lzo.c (100%)
>   rename compr_rtime.c => jffsX-utils/compr_rtime.c (100%)
>   rename compr_zlib.c => jffsX-utils/compr_zlib.c (100%)
>   rename device_table.txt => jffsX-utils/device_table.txt (100%)
>   rename jffs-dump.c => jffsX-utils/jffs-dump.c (100%)
>   rename jffs2dump.c => jffsX-utils/jffs2dump.c (100%)
>   rename jffs2reader.c => jffsX-utils/jffs2reader.c (100%)
>   rename mkfs.jffs2.1 => jffsX-utils/mkfs.jffs2.1 (100%)
>   rename mkfs.jffs2.c => jffsX-utils/mkfs.jffs2.c (100%)
>   rename rbtree.c => jffsX-utils/rbtree.c (100%)
>   rename rbtree.h => jffsX-utils/rbtree.h (100%)
>   rename summary.h => jffsX-utils/summary.h (100%)
>   rename sumtool.c => jffsX-utils/sumtool.c (100%)
>   rename MAKEDEV => misc-utils/MAKEDEV (100%)
>   rename doc_loadbios.c => misc-utils/doc_loadbios.c (100%)
>   rename docfdisk.c => misc-utils/docfdisk.c (100%)
>   rename fectest.c => misc-utils/fectest.c (100%)
>   rename ftl_check.c => misc-utils/ftl_check.c (100%)
>   rename ftl_format.c => misc-utils/ftl_format.c (100%)
>   rename mcast_image.h => misc-utils/mcast_image.h (100%)
>   rename mtd_debug.c => misc-utils/mtd_debug.c (100%)
>   rename mtdpart.c => misc-utils/mtdpart.c (100%)
>   rename recv_image.c => misc-utils/recv_image.c (100%)
>   rename serve_image.c => misc-utils/serve_image.c (100%)
>   delete mode 100644 mkfs.ubifs/defs.h
>   delete mode 100644 mkfs.ubifs/lpt.c
>   delete mode 100644 mkfs.ubifs/mkfs.ubifs.h
>   rename load_nandsim.sh => nand-utils/load_nandsim.sh (100%)
>   rename nanddump.c => nand-utils/nanddump.c (100%)
>   rename nandtest.c => nand-utils/nandtest.c (100%)
>   rename nandwrite.c => nand-utils/nandwrite.c (100%)
>   rename nftl_format.c => nand-utils/nftl_format.c (100%)
>   rename nftldump.c => nand-utils/nftldump.c (100%)
>   rename rfddump.c => nor-utils/rfddump.c (100%)
>   rename rfdformat.c => nor-utils/rfdformat.c (100%)
>   rename {mkfs.ubifs => ubifs-utils}/COPYING (100%)
>   rename {mkfs.ubifs => ubifs-utils}/README (100%)
>   rename {mkfs.ubifs => ubifs-utils/include}/compr.h (97%)
>   rename {mkfs.ubifs => ubifs-utils/include}/crc16.h (100%)
>   create mode 100644 ubifs-utils/include/defs.h
>   create mode 100644 ubifs-utils/include/devtable.h
>   rename {mkfs.ubifs/hashtable => ubifs-utils/include}/hashtable.h (100%)
>   rename {mkfs.ubifs/hashtable => ubifs-utils/include}/hashtable_itr.h (100%)
>   rename {mkfs.ubifs/hashtable => ubifs-utils/include}/hashtable_private.h (100%)
>   create mode 100644 ubifs-utils/include/hexdump.h
>   create mode 100644 ubifs-utils/include/io.h
>   rename {mkfs.ubifs => ubifs-utils/include}/key.h (70%)
>   create mode 100644 ubifs-utils/include/list.h
>   create mode 100644 ubifs-utils/include/lprops.h
>   rename {mkfs.ubifs => ubifs-utils/include}/lpt.h (80%)
>   create mode 100644 ubifs-utils/include/scan.h
>   rename {mkfs.ubifs => ubifs-utils/include}/ubifs.h (83%)
>   create mode 100644 ubifs-utils/include/ubifs_common.h
>   rename {mkfs.ubifs => ubifs-utils/lib}/compr.c (92%)
>   rename {mkfs.ubifs => ubifs-utils/lib}/crc16.c (100%)
>   rename {mkfs.ubifs => ubifs-utils/lib}/devtable.c (99%)
>   rename {mkfs.ubifs/hashtable => ubifs-utils/lib}/hashtable.c (100%)
>   rename {mkfs.ubifs/hashtable => ubifs-utils/lib}/hashtable_itr.c (100%)
>   create mode 100644 ubifs-utils/lib/hexdump.c
>   create mode 100644 ubifs-utils/lib/io.c
>   create mode 100644 ubifs-utils/lib/lprops.c
>   create mode 100644 ubifs-utils/lib/lpt.c
>   create mode 100644 ubifs-utils/lib/scan.c
>   rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/.gitignore (100%)
>   rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/mkfs.ubifs.c (94%)
>   create mode 100644 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
>   create mode 100644 ubifs-utils/ubifs_dump/ubifs_dump.c
>


--------------000504030707040705010409
Content-Type: text/plain; charset="UTF-8"; name="ubifs_dump"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ubifs_dump"

SUPER BLOCK: 
	Common header: 
	magic 				0x6101831
	crc 				0x6e58535a
	node_type 			6 (UBIFS_SB_NODE)
	group_type 			0 (UBIFS_NO_NODE_GROUP)
	sqnum 				1
	len 				4096
		UUID 				CCE1BBC9-2113-47F4-9164-C6218F3D0137
		key_hash 			0 (UBIFS_KEY_HASH_R5)
		key_fmt 			0 (UBIFS_SIMPLE_KEY_FMT)
		flags 				0
		big_lpt 			0
		space_fixup 			0
		min_io_size 			8
		leb_size 			130944
		leb_cnt 			16401
		max_leb_cnt 			16401
		max_bud_bytes 			8388608
		log_lebs 			4
		lpt_lebs 			3
		orph_lebs 			1
		jhead_cnt 			1
		fanout 				8
		lsave_cnt 			256
		default_compr 			1
		rp_size 			0
		rp_uid 				0
		rp_gid 				0
		fmt_version 			4
		time_gran 			1000000000

MASTER: 
	Common header: 
	magic 				0x6101831
	crc 				0xe4d981b6
	node_type 			7 (UBIFS_MST_NODE)
	group_type 			0 (UBIFS_NO_NODE_GROUP)
	sqnum 				22
	len 				512
		highest_inum 			65
		commit number 			1
		flags 				0x2
		log_lnum 			4
		root_lnum 			13
		root_offs 			48
		root_len 			108
		gc_lnum 			12
		ihead_lnum 			13
		ihead_offs 			160
		index_size 			112
		lpt_lnum 			7
		lpt_offs 			225
		nhead_lnum 			7
		nhead_offs 			240
		ltab_lnum 			7
		ltab_offs 			120
		lsave_lnum 			0
		lsave_offs 			0
		lscan_lnum 			11
		leb_cnt 			16401
		empty_lebs 			16387
		idx_lebs 			1
		total_free 			2146171240
		total_dirty 			368
		total_used 			440
		total_dead 			0
		total_dark 			69751584

LOG AREA:
	LOG LEB 4
	NODE 0 <START COMMIT>:
	Common header: 
	magic 				0x6101831
	crc 				0x12f7d960
	node_type 			10 (UBIFS_CS_NODE)
	group_type 			0 (UBIFS_NO_NODE_GROUP)
	sqnum 				16
	len 				32

	NODE 1:
	Common header: 
	magic 				0x6101831
	crc 				0x46c17203
	node_type 			8 (UBIFS_REF_NODE)
	group_type 			0 (UBIFS_NO_NODE_GROUP)
	sqnum 				17
	len 				64
		lnum 				11
		offs 				704
		jhead 				1

	NODE 2:
	Common header: 
	magic 				0x6101831
	crc 				0x4201943
	node_type 			8 (UBIFS_REF_NODE)
	group_type 			0 (UBIFS_NO_NODE_GROUP)
	sqnum 				18
	len 				64
		lnum 				14
		offs 				56
		jhead 				2

LPT AREA: 
	LPT INFO: 
	LPT root is at 7:225
	LPT head is at 7:240
	LPT ltab is at 7:120
	LPT LEB 7 free 130704 dirty 123 tgc 0 cmt 0
	LPT LEB 8 free 130944 dirty 0 tgc 0 cmt 0
	LPT LEB 9 free 130944 dirty 0 tgc 0 cmt 0

	LPROPS statistics: 
	empty_lebs 16387, idx_lebs  1
	taken_empty_lebs 0, total_free 2146171240, total_dirty 368
	total_used 440, total_dark 69751584, total_dead 0

	LPROPS TREE: 
	LEB 11      free 130240   dirty 320      used 384      free + dirty 130560   dark 0    dead 130560 nodes fit 30  flags 0x3  (free)
	LEB 13      free 130784   dirty 48       used 112      free + dirty 130832   flags 0x22 (dirty index)
	LEB 14      free 130888   dirty 0        used 56       free + dirty 130888   dark 0    dead 130888 nodes fit 30  flags 0x3  (free)

MAIN AREA: 
	INDEX AREA: 
	Common header: 
	magic 				0x6101831
	crc 				0xd098ad48
	node_type 			9 (UBIFS_IDX_NODE)
	group_type 			0 (UBIFS_NO_NODE_GROUP)
	sqnum 				19
	len 				108
		child_cnt 			4
		level 				0
		Branches:
		0: LEB 11:384 len 160 key (1, UBIFS_INO_NODE)
		1: LEB 11:160 len 61 key (1, UBIFS_DENT_NODE, 0x18a2149)
		2: LEB 11:544 len 160 key (65, UBIFS_INO_NODE)
		3: LEB 14:0 len 54 key (65, UBIFS_DATA_NODE, 0)

	Common header: 
	magic 				0x6101831
	crc 				0xeb3f7f44
	node_type 			0 (UBIFS_INO_NODE)
	group_type 			2 (UBIFS_LAST_OF_NODE_GROUP)
	sqnum 				12
	len 				160
		key 				(1, UBIFS_INO_NODE)
		creat_sqnum 			1
		size 				224
		nlink 				2
		atime 				1440006524.0
		mtime 				1440006541.0
		ctime 				1440006541.0
		uid 				0
		gid 				0
		mode 				16877
		flags 				0x1
		xattr_cnt 			0
		xattr_size 			0
		xattr_names 			0
		compr_type 			0x1
		data len 			0

	Common header: 
	magic 				0x6101831
	crc 				0x62c6adf3
	node_type 			2 (UBIFS_DENT_NODE)
	group_type 			1 (UBIFS_IN_NODE_GROUP)
	sqnum 				10
	len 				61
		key 				(1, UBIFS_DENT_NODE, 0x18a2149)
		inum 				65
		type 				0
		nlen 				4
		name 				data

	Common header: 
	magic 				0x6101831
	crc 				0x879a9588
	node_type 			0 (UBIFS_INO_NODE)
	group_type 			2 (UBIFS_LAST_OF_NODE_GROUP)
	sqnum 				13
	len 				160
		key 				(65, UBIFS_INO_NODE)
		creat_sqnum 			8
		size 				6
		nlink 				1
		atime 				1440006541.0
		mtime 				1440006541.0
		ctime 				1440006541.0
		uid 				0
		gid 				0
		mode 				33188
		flags 				0x1
		xattr_cnt 			0
		xattr_size 			0
		xattr_names 			0
		compr_type 			0x1
		data len 			0

	Common header: 
	magic 				0x6101831
	crc 				0xe96960f6
	node_type 			1 (UBIFS_DATA_NODE)
	group_type 			0 (UBIFS_NO_NODE_GROUP)
	sqnum 				15
	len 				54
		key 				(65, UBIFS_DATA_NODE, 0)
		size 				6
		compr_typ 			0
		data size 			6
		data:
		00000000: 55 42 49 46 53 0a


--------------000504030707040705010409--

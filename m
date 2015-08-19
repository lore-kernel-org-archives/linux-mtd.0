Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRz0G-0005ja-0F
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:45:50 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard@nod.at>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [RFC PATCH 00/27] Introduce ubifs_dump in ubifs-utils
Date: Wed, 19 Aug 2015 16:39:05 +0800
Message-ID: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Atem, Richard and Brian,
	This patchset introduce a userspace tool named ubifs_dump
to dump data from a ubi media.
	It will dump the areas in ubifs, such as super block,
master, log, lpt and main.
	That's helpful for us to see what exactly written in
media.
	the [1/patch] is a RESEND patch, it restructures the mtd-utils.
Please Brian help to take a look at it. thanx a lot. :)

NOTE:
	This patch set depends on a patch I sent out [ubifs: correct the size of nnode in memset]
But you can get a full code at:
https://github.com/yangdongsheng/mtd-utils.git ubifs_dump_v1

Please help to review or test it.
Thanx

Dongsheng Yang (27):
  mtd-utils: Restructure the mtd-utils source.
  ubifs: pick some common definitions into ubifs_common.h
  ubifs: move the all io related code into io.[h|c]
  ubifs: remove the including of mkfs.ubifs.h in lpt.c
  ubifs: cut off the dependence from compr.o to mkfs.ubifs
  ubifs: cut off the dependence from devtable to mkfs.ubifs.h
  ubifs: introduce ubifs-utils/include and ubifs-utils/lib
  ubifs: move more functions into io lib
  ubifs: introduce a new tool ubifs_dump
  ubifs: introduce list.h
  ubifs: copy some important data in ubifs.h from kernel to ubifs-utils
  ubifs: copy some important functions in key.h from kernel to
    ubifs-utils
  ubifs: ubifs_dump: add dump_ch and dump_node functions
  ubifs: defs.h: introduce some compatible definition for printk class
  ubifs: io: introduce ubifs_read function to read ubi volume
  ubifs: ubifs_dump: dump super block
  ubifs: introduce scan for ubifs-utils
  ubifs: add some more compatible definitions in defs.h
  ubifs: ubifs_dump: dump master node
  ubifs: ubifs_dump: dump log area
  ubifs: introduce lprops lib
  ubifs: lpt: implement functions to scan lpt
  ubifs: ubifs_dump: dump lpt area
  ubifs: ubifs_dump: dump index area
  ubifs: defs.h: introduce some compatible definitions about integer
    such as __u16
  ubifs: introduce hexdump lib
  ubifs: ubifs_dump: dump data in hex format

 Makefile                                           |   76 +-
 flash_erase.c => flash-utils/flash_erase.c         |    0
 flash_eraseall => flash-utils/flash_eraseall       |    0
 flash_lock.c => flash-utils/flash_lock.c           |    0
 flash_otp_dump.c => flash-utils/flash_otp_dump.c   |    0
 flash_otp_info.c => flash-utils/flash_otp_info.c   |    0
 flash_otp_lock.c => flash-utils/flash_otp_lock.c   |    0
 flash_otp_write.c => flash-utils/flash_otp_write.c |    0
 flash_unlock.c => flash-utils/flash_unlock.c       |    0
 flashcp.c => flash-utils/flashcp.c                 |    0
 compr.c => jffsX-utils/compr.c                     |    0
 compr.h => jffsX-utils/compr.h                     |    0
 compr_lzo.c => jffsX-utils/compr_lzo.c             |    0
 compr_rtime.c => jffsX-utils/compr_rtime.c         |    0
 compr_zlib.c => jffsX-utils/compr_zlib.c           |    0
 device_table.txt => jffsX-utils/device_table.txt   |    0
 jffs-dump.c => jffsX-utils/jffs-dump.c             |    0
 jffs2dump.c => jffsX-utils/jffs2dump.c             |    0
 jffs2reader.c => jffsX-utils/jffs2reader.c         |    0
 mkfs.jffs2.1 => jffsX-utils/mkfs.jffs2.1           |    0
 mkfs.jffs2.c => jffsX-utils/mkfs.jffs2.c           |    0
 rbtree.c => jffsX-utils/rbtree.c                   |    0
 rbtree.h => jffsX-utils/rbtree.h                   |    0
 summary.h => jffsX-utils/summary.h                 |    0
 sumtool.c => jffsX-utils/sumtool.c                 |    0
 MAKEDEV => misc-utils/MAKEDEV                      |    0
 doc_loadbios.c => misc-utils/doc_loadbios.c        |    0
 docfdisk.c => misc-utils/docfdisk.c                |    0
 fectest.c => misc-utils/fectest.c                  |    0
 ftl_check.c => misc-utils/ftl_check.c              |    0
 ftl_format.c => misc-utils/ftl_format.c            |    0
 mcast_image.h => misc-utils/mcast_image.h          |    0
 mtd_debug.c => misc-utils/mtd_debug.c              |    0
 mtdpart.c => misc-utils/mtdpart.c                  |    0
 recv_image.c => misc-utils/recv_image.c            |    0
 serve_image.c => misc-utils/serve_image.c          |    0
 mkfs.ubifs/defs.h                                  |   92 --
 mkfs.ubifs/lpt.c                                   |  578 ---------
 mkfs.ubifs/mkfs.ubifs.h                            |  150 ---
 load_nandsim.sh => nand-utils/load_nandsim.sh      |    0
 nanddump.c => nand-utils/nanddump.c                |    0
 nandtest.c => nand-utils/nandtest.c                |    0
 nandwrite.c => nand-utils/nandwrite.c              |    0
 nftl_format.c => nand-utils/nftl_format.c          |    0
 nftldump.c => nand-utils/nftldump.c                |    0
 rfddump.c => nor-utils/rfddump.c                   |    0
 rfdformat.c => nor-utils/rfdformat.c               |    0
 {mkfs.ubifs => ubifs-utils}/COPYING                |    0
 {mkfs.ubifs => ubifs-utils}/README                 |    0
 {mkfs.ubifs => ubifs-utils/include}/compr.h        |    3 +-
 {mkfs.ubifs => ubifs-utils/include}/crc16.h        |    0
 ubifs-utils/include/defs.h                         |  215 ++++
 ubifs-utils/include/devtable.h                     |   55 +
 .../hashtable => ubifs-utils/include}/hashtable.h  |    0
 .../include}/hashtable_itr.h                       |    0
 .../include}/hashtable_private.h                   |    0
 ubifs-utils/include/hexdump.h                      |   21 +
 ubifs-utils/include/io.h                           |   21 +
 {mkfs.ubifs => ubifs-utils/include}/key.h          |   76 +-
 ubifs-utils/include/list.h                         |  484 ++++++++
 ubifs-utils/include/lprops.h                       |    6 +
 {mkfs.ubifs => ubifs-utils/include}/lpt.h          |    4 +
 ubifs-utils/include/scan.h                         |    8 +
 {mkfs.ubifs => ubifs-utils/include}/ubifs.h        |   96 +-
 ubifs-utils/include/ubifs_common.h                 |   50 +
 {mkfs.ubifs => ubifs-utils/lib}/compr.c            |   20 +-
 {mkfs.ubifs => ubifs-utils/lib}/crc16.c            |    0
 {mkfs.ubifs => ubifs-utils/lib}/devtable.c         |    7 +-
 .../hashtable => ubifs-utils/lib}/hashtable.c      |    0
 .../hashtable => ubifs-utils/lib}/hashtable_itr.c  |    0
 ubifs-utils/lib/hexdump.c                          |  200 +++
 ubifs-utils/lib/io.c                               |  152 +++
 ubifs-utils/lib/lprops.c                           |   79 ++
 ubifs-utils/lib/lpt.c                              | 1275 ++++++++++++++++++++
 ubifs-utils/lib/scan.c                             |  318 +++++
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/.gitignore  |    0
 .../mkfs.ubifs}/mkfs.ubifs.c                       |  144 +--
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h                |   54 +
 ubifs-utils/ubifs_dump/ubifs_dump.c                | 1041 ++++++++++++++++
 79 files changed, 4220 insertions(+), 1005 deletions(-)
 rename flash_erase.c => flash-utils/flash_erase.c (100%)
 rename flash_eraseall => flash-utils/flash_eraseall (100%)
 rename flash_lock.c => flash-utils/flash_lock.c (100%)
 rename flash_otp_dump.c => flash-utils/flash_otp_dump.c (100%)
 rename flash_otp_info.c => flash-utils/flash_otp_info.c (100%)
 rename flash_otp_lock.c => flash-utils/flash_otp_lock.c (100%)
 rename flash_otp_write.c => flash-utils/flash_otp_write.c (100%)
 rename flash_unlock.c => flash-utils/flash_unlock.c (100%)
 rename flashcp.c => flash-utils/flashcp.c (100%)
 rename compr.c => jffsX-utils/compr.c (100%)
 rename compr.h => jffsX-utils/compr.h (100%)
 rename compr_lzo.c => jffsX-utils/compr_lzo.c (100%)
 rename compr_rtime.c => jffsX-utils/compr_rtime.c (100%)
 rename compr_zlib.c => jffsX-utils/compr_zlib.c (100%)
 rename device_table.txt => jffsX-utils/device_table.txt (100%)
 rename jffs-dump.c => jffsX-utils/jffs-dump.c (100%)
 rename jffs2dump.c => jffsX-utils/jffs2dump.c (100%)
 rename jffs2reader.c => jffsX-utils/jffs2reader.c (100%)
 rename mkfs.jffs2.1 => jffsX-utils/mkfs.jffs2.1 (100%)
 rename mkfs.jffs2.c => jffsX-utils/mkfs.jffs2.c (100%)
 rename rbtree.c => jffsX-utils/rbtree.c (100%)
 rename rbtree.h => jffsX-utils/rbtree.h (100%)
 rename summary.h => jffsX-utils/summary.h (100%)
 rename sumtool.c => jffsX-utils/sumtool.c (100%)
 rename MAKEDEV => misc-utils/MAKEDEV (100%)
 rename doc_loadbios.c => misc-utils/doc_loadbios.c (100%)
 rename docfdisk.c => misc-utils/docfdisk.c (100%)
 rename fectest.c => misc-utils/fectest.c (100%)
 rename ftl_check.c => misc-utils/ftl_check.c (100%)
 rename ftl_format.c => misc-utils/ftl_format.c (100%)
 rename mcast_image.h => misc-utils/mcast_image.h (100%)
 rename mtd_debug.c => misc-utils/mtd_debug.c (100%)
 rename mtdpart.c => misc-utils/mtdpart.c (100%)
 rename recv_image.c => misc-utils/recv_image.c (100%)
 rename serve_image.c => misc-utils/serve_image.c (100%)
 delete mode 100644 mkfs.ubifs/defs.h
 delete mode 100644 mkfs.ubifs/lpt.c
 delete mode 100644 mkfs.ubifs/mkfs.ubifs.h
 rename load_nandsim.sh => nand-utils/load_nandsim.sh (100%)
 rename nanddump.c => nand-utils/nanddump.c (100%)
 rename nandtest.c => nand-utils/nandtest.c (100%)
 rename nandwrite.c => nand-utils/nandwrite.c (100%)
 rename nftl_format.c => nand-utils/nftl_format.c (100%)
 rename nftldump.c => nand-utils/nftldump.c (100%)
 rename rfddump.c => nor-utils/rfddump.c (100%)
 rename rfdformat.c => nor-utils/rfdformat.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/COPYING (100%)
 rename {mkfs.ubifs => ubifs-utils}/README (100%)
 rename {mkfs.ubifs => ubifs-utils/include}/compr.h (97%)
 rename {mkfs.ubifs => ubifs-utils/include}/crc16.h (100%)
 create mode 100644 ubifs-utils/include/defs.h
 create mode 100644 ubifs-utils/include/devtable.h
 rename {mkfs.ubifs/hashtable => ubifs-utils/include}/hashtable.h (100%)
 rename {mkfs.ubifs/hashtable => ubifs-utils/include}/hashtable_itr.h (100%)
 rename {mkfs.ubifs/hashtable => ubifs-utils/include}/hashtable_private.h (100%)
 create mode 100644 ubifs-utils/include/hexdump.h
 create mode 100644 ubifs-utils/include/io.h
 rename {mkfs.ubifs => ubifs-utils/include}/key.h (70%)
 create mode 100644 ubifs-utils/include/list.h
 create mode 100644 ubifs-utils/include/lprops.h
 rename {mkfs.ubifs => ubifs-utils/include}/lpt.h (80%)
 create mode 100644 ubifs-utils/include/scan.h
 rename {mkfs.ubifs => ubifs-utils/include}/ubifs.h (83%)
 create mode 100644 ubifs-utils/include/ubifs_common.h
 rename {mkfs.ubifs => ubifs-utils/lib}/compr.c (92%)
 rename {mkfs.ubifs => ubifs-utils/lib}/crc16.c (100%)
 rename {mkfs.ubifs => ubifs-utils/lib}/devtable.c (99%)
 rename {mkfs.ubifs/hashtable => ubifs-utils/lib}/hashtable.c (100%)
 rename {mkfs.ubifs/hashtable => ubifs-utils/lib}/hashtable_itr.c (100%)
 create mode 100644 ubifs-utils/lib/hexdump.c
 create mode 100644 ubifs-utils/lib/io.c
 create mode 100644 ubifs-utils/lib/lprops.c
 create mode 100644 ubifs-utils/lib/lpt.c
 create mode 100644 ubifs-utils/lib/scan.c
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/.gitignore (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/mkfs.ubifs.c (94%)
 create mode 100644 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
 create mode 100644 ubifs-utils/ubifs_dump/ubifs_dump.c

-- 
1.8.4.2

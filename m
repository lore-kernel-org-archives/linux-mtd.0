Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmZtb-0002p3-7O
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 04:12:05 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <david@sigma-star.at>, <dedekind1@gmail.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 00/27] Introduce ubifs_dump in ubifs-utils
Date: Thu, 15 Oct 2015 12:04:23 +0800
Message-ID: <1444881890-4012-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Hi guys,
	This is the v2 for ubifs_dump. No big changes at all,
only addressed two problems mentioned by Richard and David.

Hi Richard,
	I am sorry you need to rebase your work. But that
would not be a problem I believe, the v2 here is almost same
with v1. 

https://github.com/yangdongsheng/mtd-utils.git ubifs_dump_v2

changelog:
	-v1:
		- fix a problem in error path pointed by David
		- correct width of data in media by Richard
Thanx
Yang


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

 MAKEDEV                                  |   41 -
 Makefile                                 |   76 +-
 compr.c                                  |  538 -------
 compr.h                                  |  119 --
 compr_lzo.c                              |  135 --
 compr_rtime.c                            |  119 --
 compr_zlib.c                             |  148 --
 device_table.txt                         |  128 --
 doc_loadbios.c                           |  150 --
 docfdisk.c                               |  318 ----
 fectest.c                                |   91 --
 flash-utils/flash_erase.c                |  295 ++++
 flash-utils/flash_eraseall               |    4 +
 flash-utils/flash_lock.c                 |    8 +
 flash-utils/flash_otp_dump.c             |   56 +
 flash-utils/flash_otp_info.c             |   65 +
 flash-utils/flash_otp_lock.c             |   72 +
 flash-utils/flash_otp_write.c            |  122 ++
 flash-utils/flash_unlock.c               |   90 ++
 flash-utils/flashcp.c                    |  389 +++++
 flash_erase.c                            |  295 ----
 flash_eraseall                           |    4 -
 flash_lock.c                             |    8 -
 flash_otp_dump.c                         |   56 -
 flash_otp_info.c                         |   65 -
 flash_otp_lock.c                         |   72 -
 flash_otp_write.c                        |  122 --
 flash_unlock.c                           |   90 --
 flashcp.c                                |  389 -----
 ftl_check.c                              |  217 ---
 ftl_format.c                             |  324 -----
 jffs-dump.c                              |  359 -----
 jffs2dump.c                              |  805 -----------
 jffs2reader.c                            |  918 ------------
 jffsX-utils/compr.c                      |  538 +++++++
 jffsX-utils/compr.h                      |  119 ++
 jffsX-utils/compr_lzo.c                  |  135 ++
 jffsX-utils/compr_rtime.c                |  119 ++
 jffsX-utils/compr_zlib.c                 |  148 ++
 jffsX-utils/device_table.txt             |  128 ++
 jffsX-utils/jffs-dump.c                  |  359 +++++
 jffsX-utils/jffs2dump.c                  |  805 +++++++++++
 jffsX-utils/jffs2reader.c                |  918 ++++++++++++
 jffsX-utils/mkfs.jffs2.1                 |  268 ++++
 jffsX-utils/mkfs.jffs2.c                 | 1805 +++++++++++++++++++++++
 jffsX-utils/rbtree.c                     |  390 +++++
 jffsX-utils/rbtree.h                     |  171 +++
 jffsX-utils/summary.h                    |  177 +++
 jffsX-utils/sumtool.c                    |  872 +++++++++++
 load_nandsim.sh                          |  127 --
 mcast_image.h                            |   54 -
 misc-utils/MAKEDEV                       |   41 +
 misc-utils/doc_loadbios.c                |  150 ++
 misc-utils/docfdisk.c                    |  318 ++++
 misc-utils/fectest.c                     |   91 ++
 misc-utils/ftl_check.c                   |  217 +++
 misc-utils/ftl_format.c                  |  324 +++++
 misc-utils/mcast_image.h                 |   54 +
 misc-utils/mtd_debug.c                   |  397 +++++
 misc-utils/mtdpart.c                     |  194 +++
 misc-utils/recv_image.c                  |  484 +++++++
 misc-utils/serve_image.c                 |  300 ++++
 mkfs.jffs2.1                             |  268 ----
 mkfs.jffs2.c                             | 1805 -----------------------
 mkfs.ubifs/.gitignore                    |    1 -
 mkfs.ubifs/COPYING                       |  340 -----
 mkfs.ubifs/README                        |    9 -
 mkfs.ubifs/compr.c                       |  219 ---
 mkfs.ubifs/compr.h                       |   46 -
 mkfs.ubifs/crc16.c                       |   56 -
 mkfs.ubifs/crc16.h                       |   27 -
 mkfs.ubifs/defs.h                        |   92 --
 mkfs.ubifs/devtable.c                    |  524 -------
 mkfs.ubifs/hashtable/hashtable.c         |  277 ----
 mkfs.ubifs/hashtable/hashtable.h         |  199 ---
 mkfs.ubifs/hashtable/hashtable_itr.c     |  176 ---
 mkfs.ubifs/hashtable/hashtable_itr.h     |  112 --
 mkfs.ubifs/hashtable/hashtable_private.h |   85 --
 mkfs.ubifs/key.h                         |  189 ---
 mkfs.ubifs/lpt.c                         |  578 --------
 mkfs.ubifs/lpt.h                         |   28 -
 mkfs.ubifs/mkfs.ubifs.c                  | 2324 ------------------------------
 mkfs.ubifs/mkfs.ubifs.h                  |  150 --
 mkfs.ubifs/ubifs.h                       |  441 ------
 mtd_debug.c                              |  397 -----
 mtdpart.c                                |  194 ---
 nand-utils/load_nandsim.sh               |  127 ++
 nand-utils/nanddump.c                    |  490 +++++++
 nand-utils/nandtest.c                    |  313 ++++
 nand-utils/nandwrite.c                   |  578 ++++++++
 nand-utils/nftl_format.c                 |  422 ++++++
 nand-utils/nftldump.c                    |  278 ++++
 nanddump.c                               |  490 -------
 nandtest.c                               |  313 ----
 nandwrite.c                              |  578 --------
 nftl_format.c                            |  422 ------
 nftldump.c                               |  278 ----
 nor-utils/rfddump.c                      |  337 +++++
 nor-utils/rfdformat.c                    |  160 ++
 rbtree.c                                 |  390 -----
 rbtree.h                                 |  171 ---
 recv_image.c                             |  484 -------
 rfddump.c                                |  337 -----
 rfdformat.c                              |  160 --
 serve_image.c                            |  300 ----
 summary.h                                |  177 ---
 sumtool.c                                |  872 -----------
 ubifs-utils/COPYING                      |  340 +++++
 ubifs-utils/README                       |    9 +
 ubifs-utils/include/compr.h              |   45 +
 ubifs-utils/include/crc16.h              |   27 +
 ubifs-utils/include/defs.h               |  215 +++
 ubifs-utils/include/devtable.h           |   55 +
 ubifs-utils/include/hashtable.h          |  199 +++
 ubifs-utils/include/hashtable_itr.h      |  112 ++
 ubifs-utils/include/hashtable_private.h  |   85 ++
 ubifs-utils/include/hexdump.h            |   21 +
 ubifs-utils/include/io.h                 |   21 +
 ubifs-utils/include/key.h                |  263 ++++
 ubifs-utils/include/list.h               |  484 +++++++
 ubifs-utils/include/lprops.h             |    6 +
 ubifs-utils/include/lpt.h                |   32 +
 ubifs-utils/include/scan.h               |    8 +
 ubifs-utils/include/ubifs.h              |  527 +++++++
 ubifs-utils/include/ubifs_common.h       |   50 +
 ubifs-utils/lib/compr.c                  |  213 +++
 ubifs-utils/lib/crc16.c                  |   56 +
 ubifs-utils/lib/devtable.c               |  525 +++++++
 ubifs-utils/lib/hashtable.c              |  277 ++++
 ubifs-utils/lib/hashtable_itr.c          |  176 +++
 ubifs-utils/lib/hexdump.c                |  200 +++
 ubifs-utils/lib/io.c                     |  152 ++
 ubifs-utils/lib/lprops.c                 |   79 +
 ubifs-utils/lib/lpt.c                    | 1275 ++++++++++++++++
 ubifs-utils/lib/scan.c                   |  318 ++++
 ubifs-utils/mkfs.ubifs/.gitignore        |    1 +
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c      | 2202 ++++++++++++++++++++++++++++
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h      |   54 +
 ubifs-utils/ubifs_dump/ubifs_dump.c      | 1038 +++++++++++++
 139 files changed, 22441 insertions(+), 19229 deletions(-)
 delete mode 100755 MAKEDEV
 delete mode 100644 compr.c
 delete mode 100644 compr.h
 delete mode 100644 compr_lzo.c
 delete mode 100644 compr_rtime.c
 delete mode 100644 compr_zlib.c
 delete mode 100644 device_table.txt
 delete mode 100644 doc_loadbios.c
 delete mode 100644 docfdisk.c
 delete mode 100644 fectest.c
 create mode 100644 flash-utils/flash_erase.c
 create mode 100755 flash-utils/flash_eraseall
 create mode 100644 flash-utils/flash_lock.c
 create mode 100644 flash-utils/flash_otp_dump.c
 create mode 100644 flash-utils/flash_otp_info.c
 create mode 100644 flash-utils/flash_otp_lock.c
 create mode 100644 flash-utils/flash_otp_write.c
 create mode 100644 flash-utils/flash_unlock.c
 create mode 100644 flash-utils/flashcp.c
 delete mode 100644 flash_erase.c
 delete mode 100755 flash_eraseall
 delete mode 100644 flash_lock.c
 delete mode 100644 flash_otp_dump.c
 delete mode 100644 flash_otp_info.c
 delete mode 100644 flash_otp_lock.c
 delete mode 100644 flash_otp_write.c
 delete mode 100644 flash_unlock.c
 delete mode 100644 flashcp.c
 delete mode 100644 ftl_check.c
 delete mode 100644 ftl_format.c
 delete mode 100644 jffs-dump.c
 delete mode 100644 jffs2dump.c
 delete mode 100644 jffs2reader.c
 create mode 100644 jffsX-utils/compr.c
 create mode 100644 jffsX-utils/compr.h
 create mode 100644 jffsX-utils/compr_lzo.c
 create mode 100644 jffsX-utils/compr_rtime.c
 create mode 100644 jffsX-utils/compr_zlib.c
 create mode 100644 jffsX-utils/device_table.txt
 create mode 100644 jffsX-utils/jffs-dump.c
 create mode 100644 jffsX-utils/jffs2dump.c
 create mode 100644 jffsX-utils/jffs2reader.c
 create mode 100644 jffsX-utils/mkfs.jffs2.1
 create mode 100644 jffsX-utils/mkfs.jffs2.c
 create mode 100644 jffsX-utils/rbtree.c
 create mode 100644 jffsX-utils/rbtree.h
 create mode 100644 jffsX-utils/summary.h
 create mode 100644 jffsX-utils/sumtool.c
 delete mode 100755 load_nandsim.sh
 delete mode 100644 mcast_image.h
 create mode 100755 misc-utils/MAKEDEV
 create mode 100644 misc-utils/doc_loadbios.c
 create mode 100644 misc-utils/docfdisk.c
 create mode 100644 misc-utils/fectest.c
 create mode 100644 misc-utils/ftl_check.c
 create mode 100644 misc-utils/ftl_format.c
 create mode 100644 misc-utils/mcast_image.h
 create mode 100644 misc-utils/mtd_debug.c
 create mode 100644 misc-utils/mtdpart.c
 create mode 100644 misc-utils/recv_image.c
 create mode 100644 misc-utils/serve_image.c
 delete mode 100644 mkfs.jffs2.1
 delete mode 100644 mkfs.jffs2.c
 delete mode 100644 mkfs.ubifs/.gitignore
 delete mode 100644 mkfs.ubifs/COPYING
 delete mode 100644 mkfs.ubifs/README
 delete mode 100644 mkfs.ubifs/compr.c
 delete mode 100644 mkfs.ubifs/compr.h
 delete mode 100644 mkfs.ubifs/crc16.c
 delete mode 100644 mkfs.ubifs/crc16.h
 delete mode 100644 mkfs.ubifs/defs.h
 delete mode 100644 mkfs.ubifs/devtable.c
 delete mode 100644 mkfs.ubifs/hashtable/hashtable.c
 delete mode 100644 mkfs.ubifs/hashtable/hashtable.h
 delete mode 100644 mkfs.ubifs/hashtable/hashtable_itr.c
 delete mode 100644 mkfs.ubifs/hashtable/hashtable_itr.h
 delete mode 100644 mkfs.ubifs/hashtable/hashtable_private.h
 delete mode 100644 mkfs.ubifs/key.h
 delete mode 100644 mkfs.ubifs/lpt.c
 delete mode 100644 mkfs.ubifs/lpt.h
 delete mode 100644 mkfs.ubifs/mkfs.ubifs.c
 delete mode 100644 mkfs.ubifs/mkfs.ubifs.h
 delete mode 100644 mkfs.ubifs/ubifs.h
 delete mode 100644 mtd_debug.c
 delete mode 100644 mtdpart.c
 create mode 100755 nand-utils/load_nandsim.sh
 create mode 100644 nand-utils/nanddump.c
 create mode 100644 nand-utils/nandtest.c
 create mode 100644 nand-utils/nandwrite.c
 create mode 100644 nand-utils/nftl_format.c
 create mode 100644 nand-utils/nftldump.c
 delete mode 100644 nanddump.c
 delete mode 100644 nandtest.c
 delete mode 100644 nandwrite.c
 delete mode 100644 nftl_format.c
 delete mode 100644 nftldump.c
 create mode 100644 nor-utils/rfddump.c
 create mode 100644 nor-utils/rfdformat.c
 delete mode 100644 rbtree.c
 delete mode 100644 rbtree.h
 delete mode 100644 recv_image.c
 delete mode 100644 rfddump.c
 delete mode 100644 rfdformat.c
 delete mode 100644 serve_image.c
 delete mode 100644 summary.h
 delete mode 100644 sumtool.c
 create mode 100644 ubifs-utils/COPYING
 create mode 100644 ubifs-utils/README
 create mode 100644 ubifs-utils/include/compr.h
 create mode 100644 ubifs-utils/include/crc16.h
 create mode 100644 ubifs-utils/include/defs.h
 create mode 100644 ubifs-utils/include/devtable.h
 create mode 100644 ubifs-utils/include/hashtable.h
 create mode 100644 ubifs-utils/include/hashtable_itr.h
 create mode 100644 ubifs-utils/include/hashtable_private.h
 create mode 100644 ubifs-utils/include/hexdump.h
 create mode 100644 ubifs-utils/include/io.h
 create mode 100644 ubifs-utils/include/key.h
 create mode 100644 ubifs-utils/include/list.h
 create mode 100644 ubifs-utils/include/lprops.h
 create mode 100644 ubifs-utils/include/lpt.h
 create mode 100644 ubifs-utils/include/scan.h
 create mode 100644 ubifs-utils/include/ubifs.h
 create mode 100644 ubifs-utils/include/ubifs_common.h
 create mode 100644 ubifs-utils/lib/compr.c
 create mode 100644 ubifs-utils/lib/crc16.c
 create mode 100644 ubifs-utils/lib/devtable.c
 create mode 100644 ubifs-utils/lib/hashtable.c
 create mode 100644 ubifs-utils/lib/hashtable_itr.c
 create mode 100644 ubifs-utils/lib/hexdump.c
 create mode 100644 ubifs-utils/lib/io.c
 create mode 100644 ubifs-utils/lib/lprops.c
 create mode 100644 ubifs-utils/lib/lpt.c
 create mode 100644 ubifs-utils/lib/scan.c
 create mode 100644 ubifs-utils/mkfs.ubifs/.gitignore
 create mode 100644 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
 create mode 100644 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
 create mode 100644 ubifs-utils/ubifs_dump/ubifs_dump.c

-- 
1.8.4.2

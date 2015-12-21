Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwAW-0000ke-63
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:50:13 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 00/38] mtd-utils: add ubifs_dump and ubifs_unpacker.
Date: Mon, 21 Dec 2015 16:41:23 +0800
Message-ID: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Hi Brian,
	I picked ubifs_unpacker from David and Richard, and applied them
in my local tree, and rebased against latest mtd-utils. Please consider
taking this patchset.

David Gstir (10):
  ubifs: fix typo in ubifs_read
  Make cli byte parsing from ubi-utils available for all tools
  ubifs: add decompression functions
  ubifs: remove ununsed ubifs context from key helpers
  ubifs: keep scan buffer in ubifs_info
  ubifs: extend master scanning code
  ubifs: add missing include to defs.h
  ubifs: Add more key helper functions
  ubifs: add emubi, a minimal UBI emulation layer
  UBIFS: introduce ubifs_unpacker tool.

Dongsheng Yang (27):
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
  gitignore: add ubifs_dump to gitignore.

Richard Weinberger (1):
  ubifs: add complete version of list.h

 .gitignore                                         |    1 +
 Makefile                                           |   21 +-
 include/common.h                                   |   90 ++
 ubi-utils/include/ubiutils-common.h                |    2 -
 ubi-utils/mtdinfo.c                                |    6 +-
 ubi-utils/ubiattach.c                              |    6 +-
 ubi-utils/ubiformat.c                              |    8 +-
 ubi-utils/ubimkvol.c                               |    6 +-
 ubi-utils/ubinfo.c                                 |   10 +-
 ubi-utils/ubinize.c                                |   10 +-
 ubi-utils/ubirsvol.c                               |    2 +-
 ubi-utils/ubiutils-common.c                        |   93 --
 ubifs-utils/COPYING                                |  340 ++++++
 ubifs-utils/README                                 |    9 +
 ubifs-utils/include/compr.h                        |   46 +
 ubifs-utils/include/crc16.h                        |   27 +
 ubifs-utils/include/defs.h                         |  216 ++++
 ubifs-utils/include/devtable.h                     |   55 +
 ubifs-utils/include/emubi.h                        |   82 ++
 ubifs-utils/include/hashtable.h                    |  199 +++
 ubifs-utils/include/hashtable_itr.h                |  112 ++
 ubifs-utils/include/hashtable_private.h            |   85 ++
 ubifs-utils/include/hexdump.h                      |   21 +
 ubifs-utils/include/io.h                           |   23 +
 ubifs-utils/include/key.h                          |  347 ++++++
 ubifs-utils/include/list.h                         |  605 ++++++++++
 ubifs-utils/include/list_sort.h                    |   11 +
 ubifs-utils/include/lprops.h                       |    6 +
 ubifs-utils/include/lpt.h                          |   32 +
 ubifs-utils/include/master.h                       |    7 +
 ubifs-utils/include/scan.h                         |    8 +
 ubifs-utils/include/ubifs.h                        |  597 +++++++++
 ubifs-utils/include/ubifs_common.h                 |   50 +
 ubifs-utils/lib/compr.c                            |  305 +++++
 ubifs-utils/lib/crc16.c                            |   56 +
 ubifs-utils/lib/devtable.c                         |  525 ++++++++
 ubifs-utils/lib/emubi.c                            |  371 ++++++
 ubifs-utils/lib/hashtable.c                        |  277 +++++
 ubifs-utils/lib/hashtable_itr.c                    |  176 +++
 ubifs-utils/lib/hexdump.c                          |  200 +++
 ubifs-utils/lib/io.c                               |  212 ++++
 ubifs-utils/lib/list_sort.c                        |  157 +++
 ubifs-utils/lib/lprops.c                           |   79 ++
 ubifs-utils/lib/lpt.c                              | 1275 ++++++++++++++++++++
 ubifs-utils/lib/master.c                           |  311 +++++
 ubifs-utils/lib/scan.c                             |  316 +++++
 ubifs-utils/mkfs.ubifs/COPYING                     |  340 ------
 ubifs-utils/mkfs.ubifs/README                      |    9 -
 ubifs-utils/mkfs.ubifs/compr.c                     |  236 ----
 ubifs-utils/mkfs.ubifs/compr.h                     |   46 -
 ubifs-utils/mkfs.ubifs/crc16.c                     |   56 -
 ubifs-utils/mkfs.ubifs/crc16.h                     |   27 -
 ubifs-utils/mkfs.ubifs/defs.h                      |   92 --
 ubifs-utils/mkfs.ubifs/devtable.c                  |  524 --------
 ubifs-utils/mkfs.ubifs/hashtable/hashtable.c       |  277 -----
 ubifs-utils/mkfs.ubifs/hashtable/hashtable.h       |  199 ---
 ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c   |  176 ---
 ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h   |  112 --
 .../mkfs.ubifs/hashtable/hashtable_private.h       |   85 --
 ubifs-utils/mkfs.ubifs/key.h                       |  207 ----
 ubifs-utils/mkfs.ubifs/lpt.c                       |  578 ---------
 ubifs-utils/mkfs.ubifs/lpt.h                       |   28 -
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c                |  210 +---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h                |  102 +-
 ubifs-utils/mkfs.ubifs/ubifs.h                     |  450 -------
 ubifs-utils/ubifs_dump/ubifs_dump.c                |  977 +++++++++++++++
 ubifs-utils/ubifs_unpack/index.c                   |  648 ++++++++++
 ubifs-utils/ubifs_unpack/replay.c                  |  865 +++++++++++++
 ubifs-utils/ubifs_unpack/ubifs_unpack.c            |  619 ++++++++++
 ubifs-utils/ubifs_unpack/ubifs_unpack.h            |  107 ++
 70 files changed, 10505 insertions(+), 3858 deletions(-)
 create mode 100644 ubifs-utils/COPYING
 create mode 100644 ubifs-utils/README
 create mode 100644 ubifs-utils/include/compr.h
 create mode 100644 ubifs-utils/include/crc16.h
 create mode 100644 ubifs-utils/include/defs.h
 create mode 100644 ubifs-utils/include/devtable.h
 create mode 100644 ubifs-utils/include/emubi.h
 create mode 100644 ubifs-utils/include/hashtable.h
 create mode 100644 ubifs-utils/include/hashtable_itr.h
 create mode 100644 ubifs-utils/include/hashtable_private.h
 create mode 100644 ubifs-utils/include/hexdump.h
 create mode 100644 ubifs-utils/include/io.h
 create mode 100644 ubifs-utils/include/key.h
 create mode 100644 ubifs-utils/include/list.h
 create mode 100644 ubifs-utils/include/list_sort.h
 create mode 100644 ubifs-utils/include/lprops.h
 create mode 100644 ubifs-utils/include/lpt.h
 create mode 100644 ubifs-utils/include/master.h
 create mode 100644 ubifs-utils/include/scan.h
 create mode 100644 ubifs-utils/include/ubifs.h
 create mode 100644 ubifs-utils/include/ubifs_common.h
 create mode 100644 ubifs-utils/lib/compr.c
 create mode 100644 ubifs-utils/lib/crc16.c
 create mode 100644 ubifs-utils/lib/devtable.c
 create mode 100644 ubifs-utils/lib/emubi.c
 create mode 100644 ubifs-utils/lib/hashtable.c
 create mode 100644 ubifs-utils/lib/hashtable_itr.c
 create mode 100644 ubifs-utils/lib/hexdump.c
 create mode 100644 ubifs-utils/lib/io.c
 create mode 100644 ubifs-utils/lib/list_sort.c
 create mode 100644 ubifs-utils/lib/lprops.c
 create mode 100644 ubifs-utils/lib/lpt.c
 create mode 100644 ubifs-utils/lib/master.c
 create mode 100644 ubifs-utils/lib/scan.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/COPYING
 delete mode 100644 ubifs-utils/mkfs.ubifs/README
 delete mode 100644 ubifs-utils/mkfs.ubifs/compr.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/compr.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/crc16.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/crc16.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/defs.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/devtable.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/hashtable/hashtable.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/hashtable/hashtable.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/key.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/lpt.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/lpt.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/ubifs.h
 create mode 100644 ubifs-utils/ubifs_dump/ubifs_dump.c
 create mode 100644 ubifs-utils/ubifs_unpack/index.c
 create mode 100644 ubifs-utils/ubifs_unpack/replay.c
 create mode 100644 ubifs-utils/ubifs_unpack/ubifs_unpack.c
 create mode 100644 ubifs-utils/ubifs_unpack/ubifs_unpack.h

-- 
1.8.4.2

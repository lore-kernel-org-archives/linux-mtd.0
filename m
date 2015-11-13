Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zx7jm-0001uN-97
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 06:21:32 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 00/27] Introduce ubifs_dump in ubifs-utils
Date: Fri, 13 Nov 2015 14:13:11 +0800
Message-ID: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Hi,
	The first one patch is in master. Then rebase the others
here and resend them.

https://github.com/yangdongsheng/mtd-utils ubifs_dump_v3

Yang

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
  gitignore: add ubifs_dump in gitignore

 .gitignore                                         |    1 +
 Makefile                                           |   16 +-
 ubifs-utils/COPYING                                |  340 ++++++
 ubifs-utils/README                                 |    9 +
 ubifs-utils/include/compr.h                        |   45 +
 ubifs-utils/include/crc16.h                        |   27 +
 ubifs-utils/include/defs.h                         |  215 ++++
 ubifs-utils/include/devtable.h                     |   55 +
 ubifs-utils/include/hashtable.h                    |  199 +++
 ubifs-utils/include/hashtable_itr.h                |  112 ++
 ubifs-utils/include/hashtable_private.h            |   85 ++
 ubifs-utils/include/hexdump.h                      |   21 +
 ubifs-utils/include/io.h                           |   21 +
 ubifs-utils/include/key.h                          |  281 +++++
 ubifs-utils/include/list.h                         |  484 ++++++++
 ubifs-utils/include/lprops.h                       |    6 +
 ubifs-utils/include/lpt.h                          |   32 +
 ubifs-utils/include/scan.h                         |    8 +
 ubifs-utils/include/ubifs.h                        |  536 ++++++++
 ubifs-utils/include/ubifs_common.h                 |   50 +
 ubifs-utils/lib/compr.c                            |  229 ++++
 ubifs-utils/lib/crc16.c                            |   56 +
 ubifs-utils/lib/devtable.c                         |  525 ++++++++
 ubifs-utils/lib/hashtable.c                        |  277 +++++
 ubifs-utils/lib/hashtable_itr.c                    |  176 +++
 ubifs-utils/lib/hexdump.c                          |  200 +++
 ubifs-utils/lib/io.c                               |  152 +++
 ubifs-utils/lib/lprops.c                           |   79 ++
 ubifs-utils/lib/lpt.c                              | 1275 ++++++++++++++++++++
 ubifs-utils/lib/scan.c                             |  318 +++++
 ubifs-utils/mkfs.ubifs/COPYING                     |  340 ------
 ubifs-utils/mkfs.ubifs/README                      |    9 -
 ubifs-utils/mkfs.ubifs/compr.c                     |  234 ----
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
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c                |  144 +--
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h                |  102 +-
 ubifs-utils/mkfs.ubifs/ubifs.h                     |  450 -------
 ubifs-utils/ubifs_dump/ubifs_dump.c                | 1038 ++++++++++++++++
 50 files changed, 6878 insertions(+), 3676 deletions(-)
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

-- 
1.8.4.2

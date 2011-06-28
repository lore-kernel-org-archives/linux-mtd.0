Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbLjp-00084M-T0
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 00:01:11 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 00/10] more mtd-utils cleanup
Date: Mon, 27 Jun 2011 17:00:28 -0700
Message-ID: <1309219229-5604-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series fixes several mtd-utils issues and takes care of a few things
on the feature-removal schedule.

v2: addressed comments about common_version_print() (patch 6)

I'm only bothering to send patch 6, since the other 9 should be identical.
I'll resend if you want...

Thanks,
Brian

Brian Norris (10):
  mtd-tests: checkfs: fix size_t related warning
  mtd-tests: io_paral: build error, "variable length strings"
  mtd-utils: remove whitespace at end of lines
  mtd-utils: update .gitignore files
  mkfs.ubifs: use common.h
  mtd-utils: add common version printing function
  mtd-utils: switch more utils to unified versioning
  mtd-utils: kill flash_info
  mtdinfo: kill -m option
  nanddump: remove unused variable

 .gitignore                               |    5 ++
 Makefile                                 |    2 +-
 device_table.txt                         |    6 +-
 feature-removal-schedule.txt             |   14 ------
 flash_info.c                             |   67 ------------------------------
 include/common.h                         |    6 +++
 include/linux/jffs2.h                    |    2 +-
 jffs2dump.c                              |    2 +-
 lib/libfec.c                             |   14 +++---
 mcast_image.h                            |    4 +-
 mkfs.jffs2.1                             |    6 +-
 mkfs.jffs2.c                             |    6 +-
 mkfs.ubifs/hashtable/hashtable.c         |   14 +++---
 mkfs.ubifs/hashtable/hashtable.h         |   30 +++++++-------
 mkfs.ubifs/hashtable/hashtable_itr.c     |   12 +++---
 mkfs.ubifs/hashtable/hashtable_itr.h     |   12 +++---
 mkfs.ubifs/hashtable/hashtable_private.h |   12 +++---
 mkfs.ubifs/mkfs.ubifs.c                  |   12 ++----
 nanddump.c                               |    3 +-
 nandtest.c                               |   16 ++++----
 rbtree.c                                 |    6 +-
 rbtree.h                                 |    4 +-
 recv_image.c                             |   24 +++++-----
 serve_image.c                            |   30 +++++++-------
 tests/checkfs/.gitignore                 |    2 +
 tests/checkfs/README                     |   26 ++++++------
 tests/checkfs/checkfs.c                  |    2 +-
 tests/fs-tests/integrity/.gitignore      |    1 +
 tests/fs-tests/simple/.gitignore         |    5 ++
 tests/fs-tests/stress/atoms/.gitignore   |   10 ++++
 tests/fs-tests/utils/.gitignore          |    2 +
 tests/jittertest/.gitignore              |    2 +
 tests/jittertest/README                  |   18 ++++----
 tests/jittertest/filljffs2.sh            |    2 +-
 tests/ubi-tests/io_paral.c               |    2 +-
 ubi-utils/dictionary.c                   |    6 +-
 ubi-utils/libiniparser.c                 |    8 ++--
 ubi-utils/mtdinfo.c                      |   30 ++++----------
 ubi-utils/ubiattach.c                    |    5 +-
 ubi-utils/ubicrc32.c                     |    5 +-
 ubi-utils/ubidetach.c                    |    5 +-
 ubi-utils/ubiformat.c                    |    5 +-
 ubi-utils/ubimkvol.c                     |    5 +-
 ubi-utils/ubinfo.c                       |    5 +-
 ubi-utils/ubinize.c                      |    5 +-
 ubi-utils/ubirename.c                    |    1 -
 ubi-utils/ubirmvol.c                     |    5 +-
 ubi-utils/ubirsvol.c                     |    5 +-
 ubi-utils/ubiupdatevol.c                 |    5 +-
 49 files changed, 199 insertions(+), 277 deletions(-)
 delete mode 100644 flash_info.c
 create mode 100644 tests/checkfs/.gitignore
 create mode 100644 tests/fs-tests/integrity/.gitignore
 create mode 100644 tests/fs-tests/simple/.gitignore
 create mode 100644 tests/fs-tests/stress/atoms/.gitignore
 create mode 100644 tests/fs-tests/utils/.gitignore
 create mode 100644 tests/jittertest/.gitignore

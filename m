Received: from mail-pa0-f41.google.com ([209.85.220.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5YWf-0006Xy-Sk
 for linux-mtd@lists.infradead.org; Sat, 03 Aug 2013 09:53:36 +0000
Received: by mail-pa0-f41.google.com with SMTP id bj1so1532313pad.14
 for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2013 02:53:04 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next v2 00/10] mtd: tests: reduce duplication among mtd tests
 modules
Date: Sat,  3 Aug 2013 18:52:06 +0900
Message-Id: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>,
 Adrian Hunter <adrian.hunter@intel.com>, Akinobu Mita <akinobu.mita@gmail.com>,
 Vikram Narayanan <vikram186@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch set reduces code duplication among mtd/tests modules by
moving common helper functions into mtd_test.c. 

* Changes from v1
- link a signle object including helper functions to the test modules,
  instead of providing a separate module.
- extend mtdtest_scan_for_bad_eraseblocks() so that it can specify any
  contiguous erase blocks.
- rename mtdtest_erase_whole_device() to mtdtest_erase_good_eraseblocks()
  and extend it so that it can specify any contiguous erase blocks.
- fix accidentally changed argument of memset() in mtd_readtest module
- convert mtd_torturetest module to use mtd_test helpers
- convert mtd_nandbiterrs module to use mtd_test helpers

Akinobu Mita (10):
  mtd: tests: introduce helper functions
  mtd: tests: rename sources in order to link a helper object
  mtd: mtd_oobtest: use mtd_test helpers
  mtd: mtd_pagetest: use mtd_test helpers
  mtd: mtd_readtest: use mtd_test helpers
  mtd: mtd_speedtest: use mtd_test helpers
  mtd: mtd_stresstest: use mtd_test helpers
  mtd: mtd_subpagetest: use mtd_test helpers
  mtd: mtd_torturetest: use mtd_test helpers
  mtd: mtd_nandbiterrs: use mtd_test helpers

 drivers/mtd/tests/Makefile          |   9 +
 drivers/mtd/tests/mtd_nandbiterrs.c | 461 -----------------------
 drivers/mtd/tests/mtd_oobtest.c     | 714 ------------------------------------
 drivers/mtd/tests/mtd_pagetest.c    | 605 ------------------------------
 drivers/mtd/tests/mtd_readtest.c    | 257 -------------
 drivers/mtd/tests/mtd_speedtest.c   | 556 ----------------------------
 drivers/mtd/tests/mtd_stresstest.c  | 321 ----------------
 drivers/mtd/tests/mtd_subpagetest.c | 504 -------------------------
 drivers/mtd/tests/mtd_test.c        | 110 ++++++
 drivers/mtd/tests/mtd_test.h        |  11 +
 drivers/mtd/tests/mtd_torturetest.c | 535 ---------------------------
 drivers/mtd/tests/nandbiterrs.c     | 434 ++++++++++++++++++++++
 drivers/mtd/tests/oobtest.c         | 646 ++++++++++++++++++++++++++++++++
 drivers/mtd/tests/pagetest.c        | 516 ++++++++++++++++++++++++++
 drivers/mtd/tests/readtest.c        | 224 +++++++++++
 drivers/mtd/tests/speedtest.c       | 448 ++++++++++++++++++++++
 drivers/mtd/tests/stresstest.c      | 259 +++++++++++++
 drivers/mtd/tests/subpagetest.c     | 435 ++++++++++++++++++++++
 drivers/mtd/tests/torturetest.c     | 483 ++++++++++++++++++++++++
 19 files changed, 3575 insertions(+), 3953 deletions(-)
 delete mode 100644 drivers/mtd/tests/mtd_nandbiterrs.c
 delete mode 100644 drivers/mtd/tests/mtd_oobtest.c
 delete mode 100644 drivers/mtd/tests/mtd_pagetest.c
 delete mode 100644 drivers/mtd/tests/mtd_readtest.c
 delete mode 100644 drivers/mtd/tests/mtd_speedtest.c
 delete mode 100644 drivers/mtd/tests/mtd_stresstest.c
 delete mode 100644 drivers/mtd/tests/mtd_subpagetest.c
 create mode 100644 drivers/mtd/tests/mtd_test.c
 create mode 100644 drivers/mtd/tests/mtd_test.h
 delete mode 100644 drivers/mtd/tests/mtd_torturetest.c
 create mode 100644 drivers/mtd/tests/nandbiterrs.c
 create mode 100644 drivers/mtd/tests/oobtest.c
 create mode 100644 drivers/mtd/tests/pagetest.c
 create mode 100644 drivers/mtd/tests/readtest.c
 create mode 100644 drivers/mtd/tests/speedtest.c
 create mode 100644 drivers/mtd/tests/stresstest.c
 create mode 100644 drivers/mtd/tests/subpagetest.c
 create mode 100644 drivers/mtd/tests/torturetest.c

Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Vikram Narayanan <vikram186@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org

-- 
1.8.3.1

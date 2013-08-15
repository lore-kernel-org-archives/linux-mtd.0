Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9y2I-0006vx-K9
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 13:56:23 +0000
Received: by mail-pa0-f41.google.com with SMTP id bj1so777574pad.28
 for <linux-mtd@lists.infradead.org>; Thu, 15 Aug 2013 06:56:00 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next 0/4] mtd: tests: reduce more code duplication and fixes
Date: Thu, 15 Aug 2013 22:55:05 +0900
Message-Id: <1376574909-7507-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Vikram Narayanan <vikram186@gmail.com>, Akinobu Mita <akinobu.mita@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
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

This patch set fixes some problems in the patch set 'mtd: tests: reduce
duplication among mtd tests modules' and reduces more duplication by
incorporating the error messages into mtdtest_read() and mtdtest_write().

Akinobu Mita (4):
  mtd: pagetest: remove always true condition
  mtd: tests: return -EIO when mtdtest_read() failed to read requested
    bytes
  mtd: tests: incorporate error message for mtdtest_read()
  mtd: tests: incorporate error message for mtdtest_write()

 drivers/mtd/tests/mtd_test.c    |  6 ++-
 drivers/mtd/tests/nandbiterrs.c |  8 +---
 drivers/mtd/tests/pagetest.c    | 84 ++++++++---------------------------------
 drivers/mtd/tests/readtest.c    |  2 -
 drivers/mtd/tests/speedtest.c   | 48 ++++-------------------
 drivers/mtd/tests/stresstest.c  | 15 ++------
 6 files changed, 33 insertions(+), 130 deletions(-)

Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Vikram Narayanan <vikram186@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org

-- 
1.8.3.1

Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V2u2V-0008FR-I2
 for linux-mtd@lists.infradead.org; Sat, 27 Jul 2013 02:15:24 +0000
Received: by mail-pa0-f45.google.com with SMTP id bg4so3865694pad.4
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2013 19:15:00 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next 0/7] mtd: tests: reduce duplication among mtd tests
 modules
Date: Sat, 27 Jul 2013 11:14:09 +0900
Message-Id: <1374891256-20248-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch set reduces code duplication among mtd/tests modules by
moving common helper functions into mtd_test module.

Akinobu Mita (7):
  mtd: tests: introduce mtd_test module
  mtd: mtd_oobtest: use mtd_test module
  mtd: mtd_pagetest: use mtd_test module
  mtd: mtd_readtest: use mtd_test module
  mtd: mtd_speedtest: use mtd_test module
  mtd: mtd_stresstest: use mtd_test module
  mtd: mtd_subpagetest: use mtd_test module

 drivers/mtd/tests/Makefile          |   1 +
 drivers/mtd/tests/mtd_oobtest.c     |  92 +++--------------
 drivers/mtd/tests/mtd_pagetest.c    | 199 ++++++++++--------------------------
 drivers/mtd/tests/mtd_readtest.c    |  51 ++-------
 drivers/mtd/tests/mtd_speedtest.c   | 180 +++++++-------------------------
 drivers/mtd/tests/mtd_stresstest.c  |  86 +++-------------
 drivers/mtd/tests/mtd_subpagetest.c |  87 ++--------------
 drivers/mtd/tests/mtd_test.c        | 117 +++++++++++++++++++++
 drivers/mtd/tests/mtd_test.h        |  11 ++
 9 files changed, 262 insertions(+), 562 deletions(-)
 create mode 100644 drivers/mtd/tests/mtd_test.c
 create mode 100644 drivers/mtd/tests/mtd_test.h

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org

-- 
1.8.3.1

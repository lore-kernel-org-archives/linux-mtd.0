Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5bcm-0007yA-II
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 12:07:29 +0000
Received: by pbbrq8 with SMTP id rq8so6170319pbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 26 Aug 2012 05:07:25 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/6] mtd: mtd_nandecctest: add more tests
Date: Sun, 26 Aug 2012 21:06:42 +0900
Message-Id: <1345982808-11440-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series adds several tests cases to mtd_nandecctest module
and includes two minor changes.

Changelog
* v2
- split one patch into smaller patches

Akinobu Mita (6):
  mtd: mtd_nandecctest: remove unnecessary srandom32() call
  mtd: mtd_nandecctest: make module_init() return an error code if test
    fails
  mtd: mtd_nandecctest: rewrite the test routine
  mtd: mtd_nandecctest: add no corruption test
  mtd: mtd_nandecctest: add single bit error correction test
  mtd: mtd_nandecctest: add double bit error detection tests

 drivers/mtd/tests/mtd_nandecctest.c | 280 +++++++++++++++++++++++++++++++-----
 1 file changed, 248 insertions(+), 32 deletions(-)

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
-- 
1.7.11.4

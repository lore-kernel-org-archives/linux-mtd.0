Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TUftU-0007dU-72
 for linux-mtd@lists.infradead.org; Sat, 03 Nov 2012 15:44:21 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so2835547pad.36
 for <linux-mtd@lists.infradead.org>; Sat, 03 Nov 2012 08:44:16 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH v2 00/11] introduce random32_get_bytes() and
 random32_get_bytes_state()
Date: Sun,  4 Nov 2012 00:43:31 +0900
Message-Id: <1351957422-23243-1-git-send-email-akinobu.mita@gmail.com>
Cc: Michel Lespinasse <walken@google.com>, Theodore Ts'o <tytso@mit.edu>,
 Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, Akinobu Mita <akinobu.mita@gmail.com>,
 linux-mtd@lists.infradead.org, devel@open-fcoe.org,
 Robert Love <robert.w.love@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Eilon Greenstein <eilong@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset introduces new functions into random32 library for
getting the requested number of pseudo-random bytes.

Before introducing these new functions into random32 library,
prandom32() and prandom32_seed() with "prandom32" prefix are
renamed to random32_state() and srandom32_state() respectively.

The purpose of this renaming is to prevent some kernel developers
from assuming that prandom32() and random32() might imply that only
prandom32() was the one using a pseudo-random number generator by
prandom32's "p", and the result may be a very embarassing security
exposure.

Changelog

* v2
- rename prandom32 to random32_state
- dropped lib/uuid.c patch
- add bnx2 and mtd_stresstest patches

Akinobu Mita (11):
  random32: rename prandom32 to random32_state
  random32: introduce random32_get_bytes() and
    random32_get_bytes_state()
  bnx2x: use random32_get_bytes()
  mtd: nandsim: use random32_get_bytes
  ubifs: use random32_get_bytes
  mtd: mtd_nandecctest: use random32_get_bytes instead of
    get_random_bytes()
  mtd: mtd_oobtest: convert to use random32_get_bytes_state()
  mtd: mtd_pagetest: convert to use random32_get_bytes_state()
  mtd: mtd_speedtest: use random32_get_bytes
  mtd: mtd_subpagetest: convert to use random32_get_bytes_state()
  mtd: mtd_stresstest: use random32_get_bytes()

 drivers/mtd/nand/nandsim.c                      |  5 +--
 drivers/mtd/tests/mtd_nandecctest.c             |  2 +-
 drivers/mtd/tests/mtd_oobtest.c                 | 49 +++++++-------------
 drivers/mtd/tests/mtd_pagetest.c                | 43 ++++++------------
 drivers/mtd/tests/mtd_speedtest.c               |  9 +---
 drivers/mtd/tests/mtd_stresstest.c              |  3 +-
 drivers/mtd/tests/mtd_subpagetest.c             | 42 +++++------------
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c |  5 +--
 drivers/scsi/fcoe/fcoe_ctlr.c                   |  4 +-
 fs/ubifs/debug.c                                |  8 ++--
 include/linux/random.h                          |  8 ++--
 lib/interval_tree_test_main.c                   |  7 +--
 lib/random32.c                                  | 60 ++++++++++++++++++++-----
 lib/rbtree_test.c                               |  6 +--
 14 files changed, 112 insertions(+), 139 deletions(-)

Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Eilon Greenstein <eilong@broadcom.com>
Cc: netdev@vger.kernel.org
Cc: Robert Love <robert.w.love@intel.com>
Cc: devel@open-fcoe.org
Cc: Michel Lespinasse <walken@google.com>

-- 
1.7.11.7

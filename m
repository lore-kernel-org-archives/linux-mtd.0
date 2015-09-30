Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh5sZ-00006F-O0
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 01:08:20 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 0/3] mtdram: check offs and len in mtdram->erase
Date: Wed, 30 Sep 2015 09:01:18 +0800
Message-ID: <1443574881-12319-1-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <20150930002958.GC143959@google.com>
References: <20150930002958.GC143959@google.com>
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
	This is V2 for mtdram: check offs and len in mtdram->erase.
I replace '%' with mtd_mod_by_eb(). In addition, I update the new
erasetest at the same time.

Changelog:
	V1:
		- replace '%' with mtd_mod_by_eb();

Dongsheng Yang (3):
  mtd: mtdram: check offs and len in mtdram->erase
  mtd: test: refactor mtdtest_erase_eraseblock to introduce a new
    mtdtest_erase function
  mtd: tests: introduce a erase test

 drivers/mtd/devices/mtdram.c  |  21 ++++++
 drivers/mtd/tests/Makefile    |   2 +
 drivers/mtd/tests/erasetest.c | 158 ++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/tests/mtd_test.c  |  44 ++++++++----
 drivers/mtd/tests/mtd_test.h  |   1 +
 5 files changed, 214 insertions(+), 12 deletions(-)
 create mode 100644 drivers/mtd/tests/erasetest.c

-- 
1.8.4.2

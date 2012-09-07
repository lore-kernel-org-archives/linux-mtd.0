Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TA1jI-0007mO-H1
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2012 16:48:32 +0000
Received: by dajq27 with SMTP id q27so1930929daj.36
 for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2012 09:48:24 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next v4 0/5] mtd: mtd_nandecctest: add more tests
Date: Sat,  8 Sep 2012 01:48:05 +0900
Message-Id: <1347036490-18258-1-git-send-email-akinobu.mita@gmail.com>
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
and tries to cover possible patterns of corruption which can be reliably
corrected or detected.

Changelog
* v4
- fix swapped two ecc arguments for __nand_correct_data()
- remove asm/byteorder include
- add comments
- update commit messages
- remove patches which are already in l2-mtd.git

* v3
- remove unnecessary include
- split into still smaller patches

* v2
- split one patch into smaller patches

Akinobu Mita (5):
  mtd: mtd_nandecctest: support injecting bit error for ecc code
  mtd: mtd_nandecctest: rewrite the test routine
  mtd: mtd_nandecctest: add no corruption test
  mtd: mtd_nandecctest: add single bit error correction test
  mtd: mtd_nandecctest: add double bit error detection tests

 drivers/mtd/tests/mtd_nandecctest.c | 249 ++++++++++++++++++++++++++++++++----
 1 file changed, 226 insertions(+), 23 deletions(-)

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
-- 
1.7.11.4

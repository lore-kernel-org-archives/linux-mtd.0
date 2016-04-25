Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auolT-0004mu-0H
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 22:13:59 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 03A4416B4333
 for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2016 00:13:36 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at
Subject: [RFC] Porting kernel MTD tests to user space
Date: Tue, 26 Apr 2016 00:13:21 +0200
Message-Id: <1461622409-14970-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David was so kind and did an initial port of Linux's MTD tests to user space.
He took most tests as-is and massaged them to work in user space using libmtd.
In the long run the goal is giving up the kernel tests as much as possible
and improve the tests present in mtd-utils.

Feedback is very welcome!

Thanks,
//richard

[PATCH 1/8] mtd-utils: Fix return status in mtd_torture test function
[PATCH 2/8] mtd-utils: Add multi-block erase function
[PATCH 3/8] mtd-utils: Add flash torture test utility
[PATCH 4/8] mtd-utils: Add flash stress test Utility
[PATCH 5/8] mtd-utils: Add flash speed test Utility
[PATCH 6/8] mtd-utils: Add nand flash bit errors test
[PATCH 7/8] mtd-utils: Add flash read test utility
[PATCH 8/8] mtd-utils: Add nand page test utility

 .gitignore                  |   6 +
 Makefile                    |   7 +-
 include/libmtd.h            |  14 ++
 lib/libmtd.c                |  28 ++-
 misc-utils/flash_readtest.c | 263 ++++++++++++++++++++
 misc-utils/flash_speed.c    | 463 +++++++++++++++++++++++++++++++++++
 misc-utils/flash_stress.c   | 276 +++++++++++++++++++++
 misc-utils/flash_torture.c  | 240 ++++++++++++++++++
 nand-utils/nandbiterrs.c    | 497 +++++++++++++++++++++++++++++++++++++
 nand-utils/nandpagetest.c   | 579 ++++++++++++++++++++++++++++++++++++++++++++
 10 files changed, 2362 insertions(+), 11 deletions(-)
